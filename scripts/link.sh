#!/usr/bin/env bash
set -e

TARGET_DIR="${1:-$HOME/.gemini/config/skills}"
UNLINK=false

if [ "$2" = "--unlink" ] || [ "$1" = "--unlink" ]; then
  UNLINK=true
  if [ "$1" = "--unlink" ]; then
    TARGET_DIR="$HOME/.gemini/config/skills"
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$(cd "$SCRIPT_DIR/../skills" && pwd)"

if [ "$UNLINK" = true ]; then
  for skill in "$SKILLS_DIR"/*; do
    if [ -d "$skill" ]; then
      name=$(basename "$skill")
      dest="$TARGET_DIR/$name"
      if [ -L "$dest" ]; then
        rm "$dest"
        echo "[-] 移除软链: $name"
      fi
    fi
  done
  echo "所有技能已解除挂载！"
  exit 0
fi

mkdir -p "$TARGET_DIR"

for skill in "$SKILLS_DIR"/*; do
  if [ -d "$skill" ]; then
    name=$(basename "$skill")
    dest="$TARGET_DIR/$name"
    if [ -e "$dest" ]; then
      echo "[*] 已存在，跳过: $name"
    else
      ln -s "$skill" "$dest"
      echo "[+] 成功挂载: $name -> $dest"
    fi
  fi
done

echo ""
echo "所有技能已就绪，保存即生效！"

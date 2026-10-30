# zog_skills

个人 AI Agent 技能仓库（Skills Repository）。

用于集中维护、编写及跨设备同步个人常用的 AI Agent 技能（Skills），无需通过 npm 等构建体系，通过 Git 原生管理与本地挂载，**改动保存即生效**。

---

## 目录结构

```text
zog_skills/
├── skills/                     # 所有技能集合
│   └── template-skill/         # 示例/模板技能
│       └── SKILL.md
├── scripts/
│   ├── link.ps1                # Windows 一键挂载（免管理员权限）
│   └── link.sh                 # macOS / Linux 一键挂载
├── .gitignore
└── README.md
```

---

## 快速上手

### 1. 克隆仓库
```bash
git clone https://github.com/<你的用户名>/zog_skills.git
cd zog_skills
```

### 2. 一键挂载到全局 Agent 配置目录

- **Windows (PowerShell)**：
  ```powershell
  .\scripts\link.ps1
  ```
  > 提示：脚本内部采用 Windows 目录联接（Junction），**普通用户权限即可运行**，无需管理员身份。

- **macOS / Linux**：
  ```bash
  chmod +x ./scripts/link.sh
  ./scripts/link.sh
  ```

执行后，仓库中的所有技能将自动挂载到 `~/.gemini/config/skills/`。

---

## 日常工作流

1. **添加新技能**：
   在 `skills/` 下新建一个文件夹（例如 `skills/my-awesome-skill/`），并在其内部创建 `SKILL.md`。
2. **挂载新技能**：
   运行一次挂载脚本（`.\scripts\link.ps1`）。
3. **即时调试**：
   直接修改 `SKILL.md`，保存后下一次与 AI 对话即刻生效，无需任何构建或重新发布步骤。
4. **多端同步**：
   ```bash
   git add .
   git commit -m "feat: add my-awesome-skill"
   git push
   ```
   其他设备只需 `git pull`，所有项目全局生效。

---

## 解除挂载

如果需要清理或解绑全局联接：
- **Windows**：`.\scripts\link.ps1 -Unlink`
- **macOS / Linux**：`./scripts/link.sh --unlink`

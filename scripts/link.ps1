param (
    [string]$TargetDir = "$HOME\.gemini\config\skills",
    [switch]$Unlink
)

$ErrorActionPreference = "Stop"
$skillsSourceDir = (Resolve-Path (Join-Path $PSScriptRoot "..\skills")).Path

if (-not (Test-Path $TargetDir)) {
    if ($Unlink) {
        Write-Host "目标目录不存在: $TargetDir" -ForegroundColor Yellow
        exit 0
    }
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    Write-Host "[+] 创建目标目录: $TargetDir" -ForegroundColor Cyan
}

$skills = Get-ChildItem -Path $skillsSourceDir -Directory

if ($skills.Count -eq 0) {
    Write-Host "[-] skills 目录下暂无任何技能文件夹" -ForegroundColor Yellow
    exit 0
}

foreach ($skill in $skills) {
    $skillName = $skill.Name
    $source = $skill.FullName
    $dest = Join-Path $TargetDir $skillName

    if ($Unlink) {
        if (Test-Path $dest) {
            # 目录联接用 rmdir 或 cmd /c rmdir 删除即可，不会误删源文件夹内容
            cmd /c "rmdir `"$dest`""
            Write-Host "[-] 移除联接: $skillName" -ForegroundColor Yellow
        }
    } else {
        if (Test-Path $dest) {
            Write-Host "[*] 已存在，跳过: $skillName" -ForegroundColor Gray
        } else {
            # 使用 cmd /c mklink /J 创建目录联接（无需管理员权限）
            $output = cmd /c "mklink /J `"$dest`" `"$source`""
            Write-Host "[+] 成功挂载: $skillName -> $dest" -ForegroundColor Green
        }
    }
}

if ($Unlink) {
    Write-Host "`n所有技能已解除挂载！" -ForegroundColor Cyan
} else {
    Write-Host "`n所有技能已就绪，保存即生效！" -ForegroundColor Cyan
}

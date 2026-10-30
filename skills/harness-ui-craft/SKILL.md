---
name: harness-ui-craft
description: >-
  Enforces a design-first, Linear-style, screenshot-verified workflow for any UI modifications in a harness, playground, or frontend project.
  Activates whenever the user asks to modify, refactor, polish, or build UI views/components within a test harness or component sandbox.
  Guarantees: (1) Pre-flight check for project UI presets (halts and requires the user to provide/generate a preset if missing), (2) UI design drafted with Linear aesthetics and typography before touching code, and (3) Visual screenshot verification of the rendered UI after modifications.
---

# Harness UI Craft Workflow

在开发基座（Harness / Sandbox / Playground）或前端项目中修改与构建界面时，必须严格执行以下工作流：

## 核心原则

1. **预设门禁（Preset First）**：风格规范严格根据当前项目的预设。若项目缺失 UI 预设，必须阻断并要求用户先生成/提供预设。
2. **先设计后编码（Design First）**：修改 UI 之前必须先产出设计方案，设计风格充分发挥模型对 **Linear 美学与排版（Linear Aesthetics & Typography）** 的理解与内建知识（精致克制、严谨对齐、高信息密度、细腻微交互）。
3. **真实截图验证（Screenshot Verification）**：修改 UI 后必须在 Harness 中实际渲染并截图，完成视觉验收闭环。

---

## 执行步骤

### 阶段 0：预设门禁检查 (Preset Gatekeeper)
- 检查当前项目是否存在 UI 预设（例如 `design.md`、`DESIGN.md`、`tokens.json`、组件库设计规范等）。
- **若不存在预设**：**阻断修改流程**，明确告知用户当前项目缺少 UI 规范预设，要求用户先提供或生成项目的 UI 预设。
- **若已存在预设**：将该预设作为本次设计的规范基准。

### 阶段 1：UI 方案设计 (Linear-Inspired Design)
- 在改动任何代码前，结合项目预设，运用模型对 **Linear 美学与排版** 的理解输出 UI 设计方案：
  - 结构层级与信息组织
  - 核心排版（Typography 阶梯与字距节奏）
  - 视觉层次与组件交互状态（Default / Hover / Active / Focus）
- 设计方案对齐后方可进入代码实现。

### 阶段 2：规范代码修改 (Implementation)
- 严格遵循设计方案进行 Harness / 前端组件的代码修改。
- 保持单一抽象层级，杜绝无意义的魔法数字，保证代码干净利落。

### 阶段 3：截图视觉验证 (Screenshot Verification)
- 启动/访问本地 Harness 服务。
- 执行自动化截图，捕获修改后的真实页面/组件视图。
- 自检渲染效果（排版节奏、视觉质感、是否符合设计与预设），并将截图呈现给用户验收。

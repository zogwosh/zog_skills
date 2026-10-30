---
name: harness-ui-craft
description: >-
  Enforces a design-first, Linear-style, screenshot-verified workflow for any UI modifications in a harness, playground, or frontend project.
  Activates whenever the user asks to modify, refactor, polish, or build UI views/components within a test harness or component sandbox.
  Guarantees: (1) Pre-flight check for project UI presets (halts and requires the user to generate a preset if missing), (2) Design specification drafted in Linear style before touching code, and (3) Visual screenshot verification of the rendered UI after modifications.
---

# Harness UI Craft Workflow

本技能规范了在开发基座（Harness / Sandbox / Playground）或前端项目中修改与构建界面的完整闭环：**预设门禁 ➔ 规范设计 ➔ 落地修改 ➔ 截图验证**。

---

## 核心铁律

1. **无预设不开工（No Preset, No Code）**：若项目未配置 UI 设计预设，严禁直接手写样式，必须先引导用户建立预设。
2. **先设计后修改（Design Before Code）**：修改 UI 之前必须先产出符合预设的 Linear 风格设计方案。
3. **闭环必须截图（Visual Verification）**：修改完成后必须通过 Harness 实际渲染并截图，完成视觉自检并向用户交付截图证据。

---

## 执行流程

### 阶段 0：预设门禁检查 (Preset Gatekeeper)

在接受任何 UI 修改指令后，**第一步必须先探测当前项目的 UI 规范预设**：

1. **扫描项目预设**：
   - 规范文档：`DESIGN.md`、`UI_GUIDE.md`、`STYLEGUIDE.md`、`.design/`、`tokens.json`
   - 工程主题配置：`tailwind.config.*`（自定义 theme/colors）、Theme Provider（如 `theme.ts`、CSS Variables 定义）
2. **分支判断**：
   - **Case A（存在预设）**：读取并解析既有预设，将该预设作为本次设计的首要依据。
   - **Case B（缺失预设）**：**立即阻断任务推进**，向用户明确说明：
     > “当前项目尚未配置 UI 规范预设。根据开发规范，无法直接进行 UI 修改。需要先为项目生成一套 UI 预设。”
     
     同时提供基于 Linear 风格的规范模板（参考 [`references/linear-preset-template.md`](file:///skills/harness-ui-craft/references/linear-preset-template.md)），协助用户在项目根目录生成 `DESIGN.md` 或对应的主题配置文件。**用户确认并生成预设后，才可继续下一阶段**。

---

### 阶段 1：Linear 风格 UI 设计规范 (Design Specification)

在动手修改任何代码前，必须基于既有预设（并参考 Linear 精致暗色/中性美学）输出一份结构化的 **UI 设计方案**：

1. **风格对齐要素 (Linear Aesthetic Check)**：
   - **层次与底色**：基于深灰/中性黑阶梯（Canvas ➔ Surface 1 ➔ Surface 2）。
   - **极细边框与微光**：`1px` 半透明边框（`border-subtle`），搭配顶部内发光高光线（Inset Glow）。
   - **紧凑排版**：Inter/System Sans，严谨字阶，收紧字距（`-0.01em`），严格的文本色阶（Primary / Secondary / Muted）。
   - **高质感微交互**：小圆角（4px-8px）、状态徽章（Pills）、键盘快捷键标签（`<kbd>`）。
2. **设计方案输出格式**：
   - **目标视图/组件范围**：说明要修改的区域与职责边界。
   - **结构层级草案**：列出父子容器结构。
   - **Token 与样式映射表**：明确背景色、边框色、字体大小与间距所使用的预设 Token。
   - **状态说明**：覆盖 Default / Hover / Active / Focus / Disabled 状态的表现。

---

### 阶段 2：规范落地修改 (Disciplined Implementation)

依据设计方案与项目预设执行代码修改，并遵守以下代码规范：

1. **单一抽象层级**：将容器布局、样式应用与交互逻辑分层组织，避免在单行或单个组件中混杂无关细节。
2. **拒绝硬编码魔法值**：所有颜色、间距、圆角必须映射到项目的 CSS Variables、Tailwind class 或主题 Token。
3. **保持局部完整性**：相关联的样式与组件结构集中维护，不产生多余的间接跳转。

---

### 阶段 3：实际渲染与截图验证 (Screenshot Verification)

代码修改完毕后，必须在 Harness 中进行实际运行与视觉抓取，形成闭环：

1. **定位与启动 Harness**：
   - 检查本地是否已有正在运行的 Harness 服务（如 Vite dev server、Storybook、Next.js 端口）。
   - 若未运行，以子任务或后台命令启动 Harness 服务，并等待其就绪。
2. **执行自动化截图**：
   - 利用项目现有的 Playwright / Puppeteer / 浏览器自动化脚本，或通过轻量脚本抓取目标页面/组件视图。
   - 将截图文件保存至项目的临时或快照目录（例如 `.harness-snapshots/` 或工作区临时路径）。
3. **视觉多模态核验清单 (Agent Visual Audit)**：
   - [ ] **信息密度与排版**：文字是否存在溢出、折行错位或截断？
   - [ ] **边框与对比度**：1px 微光边框与暗色背景阶梯是否呈现清晰的层次？
   - [ ] **预设一致性**：最终渲染画面是否与阶段 0 确认的预设和阶段 1 的设计稿完全吻合？
4. **交付展示**：
   - 在向用户汇报成果时，附带截图文件并在回答中直观展示核验结论。

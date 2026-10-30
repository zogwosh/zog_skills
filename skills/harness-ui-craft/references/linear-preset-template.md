# Linear-Style Design Preset Template (参考预设规范模板)

当目标项目未配置 UI 设计预设时，可将本模板提供给用户确认，并在项目根目录生成 `DESIGN.md`（或合并入项目现有的设计系统配置）。

---

## 1. 设计哲学 (Design Philosophy)

- **Precision & High Density**: 高信息密度但不拥挤，各元素对齐严格、间距精确。
- **Subtle Depth & Layering**: 避免浓烈阴影或过激渐变，依靠极细边框（1px）、半透明高光与微弱内发光营造层次。
- **Keyboard-First & Fast**: 突出高效、低干扰的工作流特征，包含快捷键徽章（Kbd badge）与清晰状态反馈。
- **Tactile Feedback**: 细腻微动效，极度平滑的 Hover、Active、Focus 状态切换。

---

## 2. 色彩系统 (Color Palette)

### 2.1 暗色基础色阶 (Dark Neutral - 核心基调)
| 角色 | 变量/Token 名 | 色值推荐 | 用途 |
| :--- | :--- | :--- | :--- |
| **Canvas** | `--color-bg-canvas` | `#08090a` / `#0c0d0e` | 页面最底层底色 |
| **Surface 1** | `--color-bg-surface-1` | `#121316` | 侧边栏、主工作区面板、列表行 |
| **Surface 2** | `--color-bg-surface-2` | `#1c1d22` | 卡片、弹出层、模态框、下拉菜单 |
| **Surface Hover** | `--color-bg-hover` | `rgba(255, 255, 255, 0.05)` | 悬停态半透明填充 |
| **Surface Active** | `--color-bg-active` | `rgba(255, 255, 255, 0.08)` | 激活/选中态半透明填充 |

### 2.2 边框与微光 (Borders & Glow)
| 角色 | 变量/Token 名 | 色值推荐 | 用途 |
| :--- | :--- | :--- | :--- |
| **Border Subtle** | `--color-border-subtle` | `rgba(255, 255, 255, 0.07)` | 大多数容器与分割线 |
| **Border Medium** | `--color-border-medium` | `rgba(255, 255, 255, 0.12)` | 卡片、输入框、常规按键外框 |
| **Border Focus** | `--color-border-focus` | `rgba(255, 255, 255, 0.25)` | 获得焦点或高亮状态 |
| **Highlight Line** | `--glow-top-highlight` | `inset 0 1px 0 rgba(255,255,255,0.06)` | 面板顶部的微发光高光线 |

### 2.3 文字与排版阶梯 (Typography Colors)
| 角色 | 变量/Token 名 | 色值推荐 | 用途 |
| :--- | :--- | :--- | :--- |
| **Text Primary** | `--color-text-primary` | `#f7f8f8` (96% 白) | 主标题、核心内容、选中项 |
| **Text Secondary**| `--color-text-secondary`| `#8a8f98` (次级中灰) | 说明文字、副标题、元数据 |
| **Text Muted** | `--color-text-muted` | `#5c6068` (低对比灰) | 占位符、次要图标、失效信息 |

### 2.4 点缀色与状态色 (Accents - 低饱和中高对比)
| 状态 | Token 名 | 色值推荐 |
| :--- | :--- | :--- |
| **Brand / Accent** | `--color-accent` | `#5e6ad2` (Linear 标志性电光靛蓝) |
| **Success** | `--color-status-success` | `#46a758` (沉稳青绿) |
| **Warning** | `--color-status-warning` | `#f5a623` (琥珀金) |
| **Error** | `--color-status-error` | `#e5484d` (暗调朱红) |

---

## 3. 字体与间距 (Typography & Spacing)

### 3.1 字体与字级
- **Font Family**: `Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`
- **Letter Spacing**: 略微收紧，如 `-0.011em` 到 `-0.015em`。
- **Font Sizes**:
  - `Micro / Badge`: `11px` (Line-height: 14px)
  - `Body Small`: `12px` (Line-height: 16px)
  - `Body Regular`: `13px` / `14px` (Line-height: 20px)
  - `Subheading`: `15px` / `16px` (Line-height: 22px, Weight: 500)
  - `Heading`: `18px` ~ `20px` (Line-height: 26px, Weight: 600)

### 3.2 圆角阶梯 (Border Radius)
- **Small (Badge, Kbd, Small Button)**: `4px`
- **Medium (Button, Input, Dropdown Item)**: `6px`
- **Large (Card, Modal, Popover Panel)**: `8px` ~ `10px`
- **Pill (Status Tag)**: `9999px`

### 3.3 间距阶梯 (8pt / 4pt Grid)
- `2px`, `4px`, `8px`, `12px`, `16px`, `24px`, `32px`。保持信息排布紧凑有序，拒绝大面积失焦留白。

---

## 4. 典型组件样式范式 (Component Patterns)

### 4.1 按钮 (Buttons)
- **Primary**: 深色高反差或品牌色，微弱内发光，极细边框。
- **Secondary / Ghost**: 背景透明或半透明表面（Surface 2），1px subtle border，Hover 时提亮背景透明度。
- **Shortcut Badge**: 按钮内靠右展示 `<kbd>` 快捷键标识（4px 圆角，浅色半透明背景）。

### 4.2 卡片与面板 (Cards & Panels)
- 背景采用深灰 Surface，叠加 `1px solid rgba(255,255,255,0.08)` 边框。
- 顶部可叠加微弱水平渐变条作为高光线（Subtle Top Edge Glow）。

### 4.3 状态标签 (Pills / Badges)
- 高度通常为 `20px` ~ `22px`，字体 `11px` / `12px`。
- 状态点（Dot）或小图标搭配低饱和微透明背景。

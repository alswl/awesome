# alswl 的 Awesome WM 配置

English version: [README.md](README.md)。

我个人的 [Awesome WM](https://awesomewm.org/) 配置，针对 Arch Linux 上笔记本 + 外接屏幕的日常使用场景做了调优。

## 特性

- **助记符 Tag** — 六个 tag 直接以快捷键命名（`` ` ``、`1`、`3`、`a`、`s`、`9`），各自可独立设置布局
- **Run-or-raise 启动器** — `Mod` + tag 键直接跳转到终端、Chromium、微信、GVim、IntelliJ IDEA、网易云音乐或 Nautilus，未运行时自动启动
- **Tag 级鼠标位置记忆** — 切换 tag 时保存并恢复鼠标位置，指针不会在屏幕间乱跳（[lib/switch.lua](lib/switch.lua)）
- **多屏幕支持** — 在屏幕间聚焦、移动窗口，且不做循环切换
- **状态栏组件** — CPU、内存、电池、网络、音量、键盘布局、时钟
- **JetBrains IDE 修复** — 浮动弹窗、焦点行为修正，以及 awesome 4.x 下 IDEA 窗口 bug 的规避（[rule.lua](rule.lua)、[lib/signals.lua](lib/signals.lua)）

> [!NOTE]
> 在 Arch Linux 上基于 Awesome WM v4.x 测试。

## 依赖

- [awesome](https://awesomewm.org/) v4.x
- [vicious](https://github.com/vicious-widgets/vicious) — 状态栏组件
- 可选：`xfce4-terminal`、`shutter`（截图）、`nautilus`

Arch Linux 安装：

```bash
sudo pacman -S awesome vicious
```

## 安装

将本仓库克隆为 awesome 配置目录（先备份原有配置）：

```bash
mv ~/.config/awesome ~/.config/awesome.bak
git clone https://github.com/alswl/awesome.git ~/.config/awesome
```

重新生成系统应用菜单：

```bash
xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu \
  > ~/.config/awesome/archmenu.lua
```

然后重启 awesome（`Mod + Ctrl + r`）。

## 使用

`Mod` 即 Super（Windows）键。

### Tag 与屏幕

| 快捷键 | 功能 |
| --- | --- |
| <code>Mod + `</code> / `Mod + 1` / `Mod + 3` / `Mod + a` / `Mod + s` / `Mod + 9` | 切换 tag |
| `Mod + Left` / `Mod + i` | 上一个 tag |
| `Mod + Right` / `Mod + o` | 下一个 tag |
| `Mod + Shift + Tab` / `Ctrl + Tab` | 回到上一个 tag |
| `Mod + Shift + <键>` | 查看任意屏幕上的对应 tag |
| `Mod + Ctrl + <键>` | 将当前窗口移到对应 tag |
| `Mod + l` / `Mod + h` | 聚焦下一个 / 上一个屏幕 |
| `Mod + Ctrl + l` / `Mod + Ctrl + h` | 将窗口移到下一个 / 上一个屏幕 |

### 窗口（Client）

| 快捷键 | 功能 |
| --- | --- |
| `Mod + j` / `Mod + k` | 聚焦下一个 / 上一个窗口 |
| `Mod + Shift + j` / `Mod + Shift + k` | 与下一个 / 上一个窗口交换位置 |
| `Mod + Tab` | 回到上一个窗口 |
| `Mod + u` | 跳转到紧急窗口 |
| `Mod + q` | 关闭窗口 |
| `Mod + f` | 切换全屏 |
| `Mod + Ctrl + Space` | 切换浮动 |
| `Mod + Ctrl + Return` | 设为主窗口（master） |
| `Mod + t` | 切换置顶 |
| `Mod + n` | 最小化 |
| `Mod + Ctrl + n` | 恢复最小化窗口 |
| `Mod + Shift + m` | 切换最大化 |
| `Mod + \` | 切换垂直最大化 |
| `Mod + Ctrl + m` | 宽度重置为 1200px |
| `Mod + m` | 窗口居中 |
| `Mod + 左键` / `Mod + 右键` | 移动 / 调整窗口大小 |

### 启动器与系统

| 快捷键 | 功能 |
| --- | --- |
| `Mod + w` | 主菜单 |
| `Mod + p` | Menubar |
| `Mod + r` | 运行命令提示框 |
| `Mod + x` | 运行 Lua 代码提示框 |
| `Mod + Shift + Return` | 打开终端 |
| `Mod + Ctrl + r` | 重启 awesome |
| `Ctrl + Alt + a` | 屏幕截图（shutter） |
| `Mod + =` / `Mod + -` / `Mod + BackSpace` | 音量增 / 减 / 静音切换 |
| 媒体键 | 音量控制 |

### Run-or-raise

`Mod` + 应用对应的 tag 键即可聚焦或启动：

<code>Mod + `</code> 终端 · `Mod + 1` Chromium · `Mod + 3` 微信 · `Mod + a` GVim · `Mod + s` IntelliJ IDEA · `Mod + 9` 网易云音乐 · `Mod + /` Nautilus

## 配置

个人定制都集中在各模块顶部：

- [variables.lua](variables.lua) — 终端、编辑器、modkey、网卡、布局
- [lib/wibox.lua](lib/wibox.lua) — tag 名称/布局与 run-or-raise 应用快捷键（`client_cmd_*` 表）
- [rule.lua](rule.lua) — 窗口规则与浮动窗口

## 项目结构

```
├── rc.lua           # 入口
├── variables.lua    # 终端、modkey、网卡、布局
├── menu.lua         # 主菜单、启动器、menubar
├── archmenu.lua     # 生成的 XDG 应用菜单
├── rule.lua         # 窗口规则（含 JetBrains 修复）
└── lib/
    ├── key.lua      # 全局与窗口快捷键
    ├── mouse.lua    # 鼠标绑定
    ├── wibox.lua    # 状态栏、tag、组件
    ├── signals.lua  # 窗口信号、sloppy focus、标题栏
    ├── switch.lua   # tag 级鼠标位置记忆、tag 切换
    └── *.lua        # cpu / mem / net / volume / battery 组件
```

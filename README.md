# alswl's Awesome WM Configuration

中文版本见 [README_cn.md](README_cn.md)。

My personal [Awesome WM](https://awesomewm.org/) configuration, tuned for daily driving on Arch Linux with a laptop plus external screens.

## Features

- **Mnemonic tags** — six tags named after their shortcut key (`` ` ``, `1`, `3`, `a`, `s`, `9`), each with its own layout
- **Run-or-raise launcher** — `Mod` + tag key jumps straight to terminal, Chromium, WeChat, GVim, IntelliJ IDEA, NetEase Music, or Nautilus, spawning it if it is not running
- **Per-tag mouse memory** — the pointer position is saved and restored as you switch tags, so the mouse never teleports across screens ([lib/switch.lua](lib/switch.lua))
- **Multi-screen support** — focus and move clients between screens without wrap-around cycling
- **Status bar widgets** — CPU, memory, battery, network, volume, keyboard layout, and clock
- **JetBrains IDE fixes** — floating popups, correct focus behavior, and workarounds for the IDEA window bugs on awesome 4.x ([rule.lua](rule.lua), [lib/signals.lua](lib/signals.lua))

> [!NOTE]
> Tested with Awesome WM v4.x on Arch Linux.

## Requirements

- [awesome](https://awesomewm.org/) v4.x
- [vicious](https://github.com/vicious-widgets/vicious) — widgets
- Optional: `xfce4-terminal`, `shutter` (screenshots), `nautilus`

On Arch Linux:

```bash
sudo pacman -S awesome vicious
```

## Installation

Clone this repository as your awesome config directory (back up the old one first):

```bash
mv ~/.config/awesome ~/.config/awesome.bak
git clone https://github.com/alswl/awesome.git ~/.config/awesome
```

Regenerate the application menu for your system:

```bash
xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu \
  > ~/.config/awesome/archmenu.lua
```

Then restart awesome (`Mod + Ctrl + r`).

## Usage

`Mod` is the Super (Windows) key.

### Tags & screens

| Shortcut | Action |
| --- | --- |
| <code>Mod + `</code> / `Mod + 1` / `Mod + 3` / `Mod + a` / `Mod + s` / `Mod + 9` | Switch to tag |
| `Mod + Left` / `Mod + i` | Previous tag |
| `Mod + Right` / `Mod + o` | Next tag |
| `Mod + Shift + Tab` / `Ctrl + Tab` | Back to last tag |
| `Mod + Shift + <key>` | View tag on any screen |
| `Mod + Ctrl + <key>` | Move focused client to tag |
| `Mod + l` / `Mod + h` | Focus next / previous screen |
| `Mod + Ctrl + l` / `Mod + Ctrl + h` | Move client to next / previous screen |

### Clients

| Shortcut | Action |
| --- | --- |
| `Mod + j` / `Mod + k` | Focus next / previous client |
| `Mod + Shift + j` / `Mod + Shift + k` | Swap with next / previous client |
| `Mod + Tab` | Back to last client |
| `Mod + u` | Jump to urgent client |
| `Mod + q` | Close client |
| `Mod + f` | Toggle fullscreen |
| `Mod + Ctrl + Space` | Toggle floating |
| `Mod + Ctrl + Return` | Move to master |
| `Mod + t` | Toggle keep on top |
| `Mod + n` | Minimize |
| `Mod + Ctrl + n` | Restore minimized |
| `Mod + Shift + m` | Toggle maximize |
| `Mod + \` | Toggle maximize vertically |
| `Mod + Ctrl + m` | Reset width to 1200px |
| `Mod + m` | Center client |
| `Mod + Button1` / `Mod + Button3` | Move / resize window |

### Launchers & system

| Shortcut | Action |
| --- | --- |
| `Mod + w` | Main menu |
| `Mod + p` | Menubar |
| `Mod + r` | Run prompt |
| `Mod + x` | Run Lua code prompt |
| `Mod + Shift + Return` | Open terminal |
| `Mod + Ctrl + r` | Reload awesome |
| `Ctrl + Alt + a` | Screen snapshot (shutter) |
| `Mod + =` / `Mod + -` / `Mod + BackSpace` | Volume up / down / mute |
| Media keys | Volume control |

### Run-or-raise

`Mod` + the app's tag key focuses the app or launches it:

<code>Mod + `</code> terminal · `Mod + 1` Chromium · `Mod + 3` WeChat · `Mod + a` GVim · `Mod + s` IntelliJ IDEA · `Mod + 9` NetEase Music · `Mod + /` Nautilus

## Configuration

Everything personal lives at the top of the modules:

- [variables.lua](variables.lua) — terminal, editor, modkey, network interface, layouts
- [lib/wibox.lua](lib/wibox.lua) — tag names/layouts and run-or-raise app shortcuts (`client_cmd_*` tables)
- [rule.lua](rule.lua) — client rules and floating windows

## Project layout

```
├── rc.lua           # Entry point
├── variables.lua    # Terminal, modkey, network interface, layouts
├── menu.lua         # Main menu, launcher, menubar
├── archmenu.lua     # Generated XDG application menu
├── rule.lua         # Client rules (incl. JetBrains fixes)
└── lib/
    ├── key.lua      # Global & client keybindings
    ├── mouse.lua    # Mouse bindings
    ├── wibox.lua    # Status bar, tags, widgets
    ├── signals.lua  # Client signals, sloppy focus, titlebars
    ├── switch.lua   # Per-tag mouse position memory, tag switching
    └── *.lua        # cpu / mem / net / volume / battery widgets
```

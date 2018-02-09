# alswl's Awesome WM Configuration

## Feature

*   improved tag name, use `\`123as689` or self defined tag name
*   mouse position remember for every window client # TODO
*   multi screen support # TODO
*   voluem / cpu / mem / eth widgets

Now this configuration support awesome v4.2.

## Dependency

Arch(tested):

`awesome` / `vicious`

Ubuntu(12.04):

`awesome` / `awesome-extra`

## Install


```bash
cd /your/configuration/path/
cd awesome
git clone https://github.com/alswl/awesome.git
ln -s $PWD ~/.config

# generate menu
xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu >~/.config/awesome/archmenu.lua

# restart awesome
```

## Usage

Shortcut:


*   System
    *   `Mod + Return` Open terminal
    *   `Mod + Ctrl + r ` Restart awesome
    *   `Mod + Ctrl + l` Lock Screen
    *   `Mod + r` Run command
    *   `Mod + x` Run lua
    *   `Mod + f` Fullscreen
    *   `Mod + - / Mod + = / Mod + BackSpace` Volume control
    *   `Media key` Volume control
    *   `Mod + [ / Mod + ]` Brightness control # TODO
*   Tag
    *   `Mod + i` Left tag in same screen
    *   `Mod + o` Right tag in same screen
    *   `Mod + j / Mod + k` Siwth client in current tag
    *   `Mod + Shift + Esc` Switch last used tag
    *   ``Mod +  `123qweas`` swich tag
    *   `Mod + Space` Next layout
    *   `Mod + Shift + Space` Last layout
*   Client
    *   `Mod + Shift + j / Mod + Shift + k` Move client
    *   `Mod + q` Close client
    *   `Mod + Tab` Switch last used client
    *   `Mod + Control + Space` set client Float
    *   `Mod + Control + Return` Set client to main client
    *   `Mod + Shift + n` Set client minimal
    *   `Mod + Shift + m` Set client max size
    *   `Mod + \\` Set client max height
*   Multi screen
    *   `Mod + l / Mod +h` Switch between screen  # TODO

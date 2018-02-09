# alswl's Awesome WM Configuration

##功能

*   改进过的 Tag 系统，使用 `` `123qweas``， 而不是使用 `123456789`
*   鼠标位置记忆
*   多屏幕支持卓越，自由跳转 # TODO
*   音量、CPU、内存、网络状态栏

目前支持版本是 awesome v4.2。

## 依赖

Arch（经过测试）:

`awesome` / `vicious`

Ubuntu(12.04):

`awesome` / `awesome-extra`

## 安装


```bash
cd /your/configuration/path/
cd awesome
git clone https://github.com/alswl/awesome.git
ln -s $PWD ~/.config

# generate menu
xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu >~/.config/awesome/archmenu.lua

# restart awesome
```

## 使用


快捷键：

*     系统功能
    *   `Mod + Return`
        *   打开 terminal
    *   `Mod + Ctrl + r `
        *   重启 awesome
    *   `Mod + Ctrl + l`
        *   锁屏
    *   `Mod + r`
        *   运行命令
    *   `Mod + x`
        *   运行 lua
    *   `Mod + f`
        *   全屏
    *   `Mod + - / Mod + = / Mod + BackSpace`
        *   音量控制
    *   `Media key`
        *   音量控制
    *   `Mod + [ / Mod + ]`
        *   亮度控制
*   Tag 操作
    *   `Mod + i`
        *   当前屏幕左侧 tag
    *   `Mod + o`
        *   当前屏幕右侧 tag
    *   `Mod + j / Mod + k`
        *   当前 tag 中 client 切换
    *   `Mod + Shift + Esc`
        *   最后 tag 切换（我切换了 Esc / Caps Lock）
    *   `Mod +  \`123qweas`
        *   tag 跳转
    *   `Mod + Space`
        *   下一个布局
    *   `Mod + Shift + Space`
        *   上一个布局
*   Client 操作
    *   `Mod + Shift + j / Mod + Shift + k`
        *   当前 client 在 tag 中位置移动
    *   `Mod + q`
        *   关闭当前 client
    *   `Mod + Tab`
        *   切换最近使用 Client
    *   `Mod + Control + Space`
        *   漂浮当前 client
    *   `Mod + Control + Return`
        *   当前 client 设为主 Client
    *   `Mod + n`
        *   最小化
    *   `Mod + Shift + m`
        *   最大化
    *   `Mod + \\`
        *   窗口高度最高
    *   `Mod + m`
        *   窗口居中
*   多屏操作
    *   `Mod + l / Mod +h`
        *   屏幕间切换 # TODO


English version:
[awesome/README.md at master · alswl/awesome](https://github.com/alswl/awesome/blob/master/README.md)

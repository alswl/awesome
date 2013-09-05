# alswl 的 Awesome 配置#

## 厉害的地方 ##

* 改进过的 Tag 系统，使用 ```123qweas``， 而不是使用 `123456789`
* 鼠标位置记忆
* 多屏幕支持卓越，自由跳转
* 音量、亮度快捷键

## 依赖 ##

Arch:

`awesome` / `vicious`

Ubuntu(12.04):

`awesome` / `awesome-extra`

## 用法 ##

```
git clone https://github.com/alswl/awesome.git
cp _autostart.sh autostart.sh
cp _menu.lua menu.lua
cp _rc.lua rc.lua
cp _rule.lua rule.lua
cp _variables.lua variables.lua
ln -s /your/awesome/configuration/ ~/.config
```

## 快捷键 ##

* `Mod + <-` 当前屏幕左侧 tag
* `Mod + ->` 当前屏幕右侧 tag
* `Mod + j / Mod + k` 当前 tag 中 client 切换
* `Mod + Shift + j / Mod + Shift + k` 当前 client 在 tag 中位置移动
* `Mod + Esc` 最后 tag 切换（我切换了 Esc / Caps Lock）
* `Mod + Tab` 焦点在 screen 之间移动
* `Mod + Return` 打开 terminal (tilda)
* `Mod + Control + \ ` 重启 awesome
* `Mod + l / Mod + h` 调整 client 尺寸
* `Mod + Space` 下一个布局
* `Mod + Shift + Space` 上一个布局
* `Mod + Shift + l` Lock
* `Mod + p` run command
* `Mod + x` run lua
* `Mod + f` 全屏
* `Mod + Shift + c` 关闭当前 client
* `Mod + Control + Space` 漂浮当前 client
* `Mod + Control + Return` 当前 client 设为主 Client
* `Mod + i` 当前 client 移到下一个显示器对应 Tag
* `Mod + o` 当前 client 移到下一个显示器当前 Tag
* `Mod + Shift + r` client 重绘
* `Mod + t` # TODO
* `Mod + t` # TODO
* `Mod + n` 最小化
* `Mod + m` 最大化
* `Mod + - / Mod + = / Mod + BackSpace` 音量控制
* `Mod + [ / Mod + ]` 亮度控制
* `Mod + ``123qweas` tag 跳转

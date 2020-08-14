# neovim 配置简介个人版

by [voldikss](https://github.com/voldikss)

## vim 基础

推荐文档

- https://github.com/wsdjeg/vim-galore-zh_cn

- 内置帮助（建议用到的时候再查，当成手册去看，不要啃）

## 整体结构

- [`after`](./after) 针对特定语言的语法高亮、缩进等，无需改动
- [`autoload`](./autoload) 自定义的一些功能函数等，无需改动
- [`colors`](./colors) 内置主题，无需改动
- [`core`](./core) 核心文件，包含了一系列设置和插件配置等，可以根据自己的需求改动
  - [`abbrev.vim`](./core/abbrev.vim) 设置命令缩写
  - [`autocmd.vim`](./core/autocmd.vim) 包含自动命令
  - [`basic.vim`](./core/basic.vim) 基本设置，我已经设置为正常编辑器的模式，如非必须，不需要再进行设置
  - [`command.vim`](./core/command.vim) 自定义命令
  - [`keymap.vim`](./core/keymap.vim) 自定义快捷键
  - [`plugin`](./core/plugin) 插件的安装和配置
  - [`variable.vim`](./core/variable.vim) 全局变量，不用改动
- [`coc-settings.json`](./coc-settings.json) coc 插件极其扩展的配置文件
- [`dict`](./dict) 个人补全候选词，里面的词是可以加入自动补全的
- [`filetype.vim`](./filetype.vim) 文件类型检测，无需改动
- [`init.vim`](./init.vim) 配置文件入口，可以选择是否加载或不加载某些插件
- [`tasks.ini`](./tasks.ini) 快速运行的配置文件，非特殊需要无需改动

## 依赖

- nodejs(官网下载，或者用自己电脑的包管理器安装)

- npm(官网下载，或者用自己电脑的包管理器安装)

- neovim(官网下载，或者用自己电脑的包管理器安装)

- pynvim(`pip install pynvim`)

## 插件的安装

这里采用的是安装和配置分离的方式，举例说明：

假如要安装 vim-floaterm 插件，该插件的 GitHub 地址是 https://github.com/voldikss/vim-floaterm

- 首先在 [`init.vim`](./init.vim) 中对应的部分增加一行

  ```vim
  Plug 'voldikss/vim-floaterm'
  ```

- 然后运行 `:PlugInstall`，等待下载安装完成。

- 如果采用该插件本身的默认配置，则无需再进行任何改动，直接按照其介绍进行使用。

- 如果要自己对其做一些配置

  - 在 [`./core/plugin`](./core/plugin) 目录下新建一个文件 [`vim-floaterm`](./core/plugin/vim-floaterm.vim)

  - 将自己的自定义配置写入该文件

  - 最后在 [`init.vim`](./init.vim) 中增加一行以加载自己的配置文件
    ```vim
    Load ./core/plugin/vim-floaterm.vim
    ```

插件默认安装在 `~/.cache/nvim/plugged` 目录下，也可以自己在 [init.vim](./init.vim) 中更改。

## 插件的卸载

- 在 [`init.vim`](./init.vim) 中将该插件对应的 `Plug` 和 `Load` 部分注释掉或者删掉

- （可选）运行 `:PlugClean`

## 预装的插件

配置中预装了一些插件（我个人日常使用的插件的一部分），其中有些插件，我按照我自己的使用习惯作了一些配置。

对于有些插件，我会附带上和同类其他插件的比较。

以下按照用途分别介绍，详细用法可以直接打开连接跳转到其对应的代码仓库进行查看。

### [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) + [asynctasks.vim](https://github.com/skywind3000/asynctasks.vim)

编译运行

- 这两个插件的作者是同一个人，对于这两个插件作者都写了详细的中文文档。
- 同类插件
  - https://github.com/tpope/vim-dispatch 没用过，功能比较单一

### [coc.nvim](https://github.com/neoclide/coc.nvim)

LSP

- 王者，不解释
- 提供补全，代码检查，文档等全部 LSP 体验
- 该插件的扩展性极高，因此在其基础上有很多人有开发了基于 coc 的扩展（可以直白地理解为插件的插件），组成了“coc 全家桶”
- 同类插件
  - deoplete.nvim
  - YouCompleteMe
  - neocomplete

### [indentLine](https://github.com/Yggdroot/indentLine)

缩进线

- 该插件不需要另外配置

### [LeaderF](https://github.com/Yggdroot/LeaderF)

模糊查找

- 同类插件
  - Denite 太慢
  - 个人测试，FZF 准确度不如 LeaderF
  - CtrlP 上古插件了

### [lightline.vim](https://github.com/itchyny/lightline.vim) + [lightline-bufferline](https://github.com/mengelbrecht/lightline-bufferline)

状态栏

- 同类插件 airline 太重

### [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

markdown 预览，按 `<F5>` 或者 `:MarkdownPreview`

### [vim-easymotion](https://github.com/easymotion/vim-easymotion)

快速位置跳转

### [vim-move](https://github.com/matze/vim-move)

移动整行或者整块

### [vim-mundo](https://github.com/simnalamburt/vim-mundo)

编辑历史记录，撤销树

- 同类插件
  - undotree
  - gundotree

### [vim-startify](https://github.com/mhinz/vim-startify)

启动界面

### [vim-floaterm](https://github.com/voldikss/vim-floaterm)

浮动内置终端

- 我写的

### [vim-translator](https://github.com/voldikss/vim-translator)

翻译插件

- 我写的

### [vim-surround](https://github.com/tpope/vim-surround)

环绕式增删改

- 杀手级插件，不知道该怎么介绍，建议去 GitHub 自己查看其介绍

### [vim-repeat](https://github.com/tpope/vim-repeat)

重复上一次修改

- 用 `.` 即可

### [vim-fugitive](https://github.com/tpope/vim-fugitive)

Git 操作相关

### [vista.vim](https://github.com/liuchengxu/vista.vim)

Tag 显示插件

- 同类插件
  - tagbar 上古插件了
  - taglist 上古插件了

### [vim-signature](https://github.com/kshenoy/vim-signature)

在侧边栏显示相关信息

- 该插件不需要另外配置

### [targets.vim](https://github.com/wellle/targets.vim)

扩展文本对象，很实用

### [tcomment_vim](https://github.com/tomtom/tcomment_vim)

注释插件

- 按 `gcc` 即可注释或者取消注释

### [vim-dict](https://github.com/skywind3000/vim-dict)

针对不同语言的常见的补全关键词

- 该插件不需要另外配置

### [vimcdoc](https://github.com/yianwillis/vimcdoc)

中文文档

- 该插件不需要另外配置

## 快捷键

注：Leader 键我设置成了`;`

- 窗口切换类

| 按键              | 描述                                         | 来源 |
| ----------------- | -------------------------------------------- | ---- |
| `Ctrl-W-h/j/k/l`  | 分别移动光标到当前窗口的左/下/上/右侧窗口    |      |
| `Alt-h/j/k/l`     | 分别移动光标到当前窗口的左/下/上/右侧窗口    |      |
| `Alt-上/下/左/右` | 存在分割窗口的时候，调整所在窗口的高度和宽度 |      |

- 文件切换类

| 按键        | 描述                                         | 来源 |
| ----------- | -------------------------------------------- | ---- |
| `Ctrl-h/l`  | 切换到 tab 栏左/右边的文件（buffer）         |      |
| `q`         | 关闭文件                                     |      |
| `<Leader>d` | 关闭文件（删除当前 buffer 但是保留窗口布局） |      |

- 光标移动类

| 模式 | 按键     | 描述               | 来源    |
| ---- | -------- | ------------------ | ------- |
| n    | `H`      | 跳到行首           |         |
| n    | `L`      | 跳到行尾           |         |
| n    | `M`      | 成对括号之间跳转   |         |
| n    | `gj`     | git next           | coc-git |
| n    | `gk`     | git previous       | coc-git |
| i    | `Ctrl-h` | 左                 |         |
| i    | `Ctrl-j` | 下                 |         |
| i    | `Ctrl-k` | 上                 |         |
| i    | `Ctrl-l` | 右                 |         |
| i    | `Ctrl-b` | 跳到前一个单词前面 |         |
| i    | `Ctrl-f` | 跳到后一个单词后面 |         |

- 文件编辑类

| 模式 | 按键        | 描述                         | 来源 |
| ---- | ----------- | ---------------------------- | ---- |
| n    | `u`         | 撤销                         |      |
| n    | `U`         | 重做                         |      |
| n    | `M`         | 成对括号之间跳转             |      |
| n    | `<Leader>y` | 将选中内容复制到系统剪切板   |      |
| n    | `<Leader>p` | 将系统剪切板内容插入到文本中 |      |
| n    | `<Leader>w` | 保存当前文件                 |      |
| n    | `<Leader>W` | 保存所有打开的文件           |      |
| i    | `Ctrl-d`    | 删除当前行                   |      |

- 常用插件快捷键

| 按键                          | 描述                           | 来源                  |
| ----------------------------- | ------------------------------ | --------------------- |
| `<F1>`                        | 帮助                           |                       |
| `<F2>`                        | 文件树浏览器                   | coc-explorer          |
| `<F3>`                        | 历史记录树                     | vim-mudo              |
| `<F4>`                        | 从系统文件浏览器中打开当前路径 |                       |
| `<F5>`或者 `<Leader>x`        | 快速运行                       | asyncrun & asynctasks |
| `<F6>`或者 `<Leader><Leader>` | 格式化                         | 需要配置格式化工具    |
| `<F7>`                        | 新建一个浮动终端               | vim-floaterm          |
| `<F8>`                        | 切换到前一个浮动终端           | vim-floaterm          |
| `<F9>`                        | 切换到后一个浮动终端           | vim-floaterm          |
| `<F10>`                       | 打开 tag 列表                  | vista                 |
| `<F12>`                       | 切换当前浮动终端               | vim-floaterm          |
| `<Leader>cd` 或者 `<C-j>`     | 跳转到函数定义                 | coc                   |
| `<Leader>rf`                  | 跳转到函数调用                 | coc                   |
| `<Leader>ff`                  | 模糊查找文件                   | LeaderF               |
| `<Space>f`                    | 文件跳转                       | easymotion            |
| `J`                           | 向下移动整行或整块             | vim-movee             |
| `K`                           | 向上移动整行或整块             | vim-move              |
| `<Space><Space>`              | 打开最近编辑的文件界面         | vim-startify          |
| `<Leader>w`                   | 翻译光标下单词                 | vim-startify          |

## 自动命令

不用自己再配置

- 从插入模式退出到正常模式时，当前文件会被自动保存

- 新打开一个文件时，会自动从上次离开的地方开始

- 文件 A 在外部作了改动，当从文件 B 切换到 A 时，自动更新

## 命令缩写

参见 [abbrev.vim](./core/abbrev.vim)

以 `ar` 为例，当你输入 `:ar` 然后按一次空格，它就会自动扩展为 `:AsyncRun`

其它同理

## 自定义命令

- `AutoFormat` 删除空行，删除行尾的空白字符，如果配置了格式化工具则再格式化当前文本
- `OpenFileExplorer` 打开系统文件浏览器
- `CloseNoCurrentBuffers` 关闭已经打开其它文件，只保留当前文件
- `Line` 插入分割线
- `Bline` 插入分割线
- `Cline` 插入分割线
- `RenameFile` 重命名当前文件
- `RemoveFile` 删除当前文件

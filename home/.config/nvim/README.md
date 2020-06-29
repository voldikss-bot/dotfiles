# neovim 配置简介个人版

## 整体结构

- [`after`](./after) 针对特定语言的语法高亮、缩进等，无需改动
- [`autoload`](./autoload) 自定义的一些功能函数等，无需改动
- [`colors`](./colors) 内置主题，无需改动
- [`core`](./core) 核心文件，包含了一系列设置和插件配置等，可以根据自己的需求改动
  - [`abbrev.vim`](./core/abbrev.vim) 设置命令缩写
  - [`autocmd.vim`](./core/autocmd.vim) 包含自动命令
  - [`basic.vim`](./core/basic.vim) 基本设置
  - [`command.vim`](./core/command.vim) 自定义命令
  - [`keymap.vim`](./core/keymap.vim) 自定义快捷键
  - [`plugin`](./core/plugin) 插件的安装和配置
  - [`variable.vim`](./core/variable.vim) 全局变量，不用改动
- [`coc-settings.json`](./coc-settings.json) coc 插件极其扩展的配置文件
- [`dict`](./dict) 个人补全候选词，里面的词是可以加入自动补全的
- [`filetype.vim`](./filetype.vim) 文件类型检测，无需改动
- [`init.vim`](./init.vim) 配置文件入口，可以选择是否加载或不加载某些插件
- [`tasks.ini`](./tasks.ini) 快速运行的配置文件，非特殊需要无需改动
- [`templates`](./templates) 文件模板，可以自己改
- [`UltiSnips`](./UltiSnips) Snippets，用于补全，无需改动

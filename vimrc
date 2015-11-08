set nocompatible 
filetype off                  " required


syn on                 "语法支持
set laststatus=2       "始终显示状态栏
set tabstop=2          "一个制表符的长度
set softtabstop=2      "一个制表符的长度（可以大于tabstop）
set shiftwidth=2       "一个缩进的长度
set expandtab          "使用空格替代制表符
set smarttab           "智能制表符
set autoindent         "自动缩进
set smartindent        "只能缩进
set number             "显示行号
set ruler              "显示位置指示器
set backupdir=/tmp     "设置备份文件目录
set directory=/tmp     "设置临时文件目录
set ignorecase         "检索时忽略大小写
set hls                "检索时高亮显示匹配项
"set helplang=cn        "帮助系统设置为中文
set foldmethod=syntax  "代码折叠
set guifont=Monaco:h15  " 设置字体


syntax enable
set background=dark
let g:solarized_termcolors=256

" colorscheme monokai
colorscheme solarized
" colorscheme monokai

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"Plugin 'Lokaltog/vim-powerline'
"}
"


au BufRead,BufNewFile {*.coffee}                    setl ft=coffee tabstop=2 softtabstop=2 expandtab smarttab
Plugin 'kchmck/vim-coffee-script'



Plugin 'bling/vim-airline'             "美化状态栏
if exists("airline#section#create")
let g:airline_section_a = airline#section#create(['%<', 'file', 'readonly'])
let g:airline_section_b = '' " airline#section#create_left(['mode', 'paste', 'iminsert'])
let g:airline_section_c = '' " airline#section#create(['hunks'])
let g:airline_section_gutter = airline#section#create(['%=%y%m%r[%{&ff}]'])
let g:airline_section_x = '' " airline#section#create_right(['filetype'])
" let g:airline_section_y = '%y%m%r%=[%{&ff}]' "airline#section#create_right(['ffenc'])
let g:airline_section_z = airline#section#create(['%(%l,%c%V%) %P'])
let g:airline_section_warning = '' "airline#section#create(['whitespace'])
endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =========
" 图形界面
" =========
if has('gui_running')
    " 只显示菜单
    set guioptions=mcr

    " 高亮光标所在的行
    set cursorline
    
    " 编辑器配色
    "colorscheme zenburn
    "colorscheme dusk
    "colorscheme breeze
    "colorscheme molokai
    
    set background=light "for solarized
    colorscheme solarized


    if has("win32")
        " Windows 兼容配置
        source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim 

        " f11 最大化 /vimfiles/extra/fullscreen/gvimfullscreen.dll移动到安装目录
        "nmap <f11> :call libcallnr('gvimfullscreen.dll', 'ToggleFullScreen', 0)<cr>
        "nmap <Leader><Leader> :call libcallnr('gvimfullscreen.dll', 'ToggleFullScreen', 0)<cr>

        " 自动最大化窗口
        au GUIEnter * simalt ~x

        " 给 Win32 下的 gVim 窗口设置透明度 http://www.vim.org/scripts/script.php?script_id=687
        "/vimfiles/extra/vimtweak/vimtweak.dll移动到安装目录
        " au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 250)

        " 字体配置
        "http://support.microsoft.com/kb/306527/zh-cn
        "set guifont=Droid\ Sans\ Mono:h10.5:cANSI
        "set guifontwide=YouYuan:h10.5:cGB2312

        "cygwin路径
        "set shell=d:\cygwin\bin\mintty.exe\ -

    endif

    " Under Mac
    if has("gui_macvim")
        "开启抗锯齿渲染
        set anti
        
        " MacVim 下的字体配置
        "set guifont=Courier_New:h14
        "set guifontwide=YouYuan:h14
        "set guifontwide=Microsoft\ Yahei\ Mono:h14
        "set guifontwide=YouYuan:h13
        "set guifontwide=YouYuan:h14
        "set guifont=Droid\ Sans\ Mono:h14
        "set guifontwide=Yahei_Mono:h14
        set guifont=Monaco:h14
        set guifontwide=YouYuan:h14

        " 半透明和窗口大小
        set transparency=2
        set lines=300 columns=120

        " 使用 MacVim 原生的全屏幕功能
        let s:lines=&lines
        let s:columns=&columns

        func! FullScreenEnter()
            set lines=999 columns=999
            set fu
        endf

        func! FullScreenLeave()
            let &lines=s:lines
            let &columns=s:columns
            set nofu
        endf

        func! FullScreenToggle()
            if &fullscreen
                call FullScreenLeave()
            else
                call FullScreenEnter()
            endif
        endf

        set guioptions+=e
        " Mac 下，按 \\ 切换全屏
        nmap <f11> :call FullScreenToggle()<cr>
        nmap <Leader><Leader> :call FullScreenToggle()<cr>

        " I like TCSH :^)
        set shell=/bin/tcsh

        " Set input method off
        set imdisable

        " Set QuickTemplatePath
        let g:QuickTemplatePath = $HOME.'/.vim/templates/'

        " 如果为空文件，则自动设置当前目录为桌面
        lcd ~/Desktop/
    endif

    " Under Linux/Unix etc.
    if has("unix") && !has('gui_macvim')
        set guifont=Courier\ 10\ Pitch\ 11
    endif
endif

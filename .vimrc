set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" 载入文件类型插件
"filetype plugin on
" 为特定文件类型载入相关缩进文件
"filetype indent on 
" 关掉智能补全时的预览窗口
"set completeopt=longest,menu

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '/home/username/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_always_populate_location_list = 1
nnoremap <F9> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-p> :YcmCompleter GoToImprecise<CR>
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_register_as_syntastic_checker = 1 


set number
syntax on
set ruler
set showcmd
set scrolloff=3
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%P%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2
set foldenable
set foldmethod=manual
"set nocompatible
set backspace=indent,eol,start
if version >= 603
  set helplang=cn
  set encoding=utf-8
endif
" 自动缩进
set autoindent
"set cindent
set smartindent
" 统一缩进为2
set softtabstop=2
set shiftwidth=2
set tabstop=2
" 用空格代替制表符  
set expandtab  
" 在行和段开始处使用制表符  
set smarttab

"搜索逐字符高亮 
set hlsearch
set incsearch
" 允许backspace和光标键跨越行边界  
set whichwrap+=<,>,h,l

"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

:inoremap ( <c-r>=AutoPair('(', ')')<CR>
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { <c-r>=AutoPairBig('{', '}')<CR>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ <c-r>=AutoPair('[', ']')<CR>
:inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
function! AutoPair(open, close)
  let line = getline('.')
  if col('.') > strlen(line) || line[col('.') - 1] == ' ' || line[col('.') - 1] == a:close
    return a:open.a:close."\<ESC>i"
  else
    return a:open
  endif
endf
function! AutoPairBig(open, close)
  let line = getline('.')
  if col('.') > strlen(line) || line[col('.') - 1] == ' ' || line[col('.') - 1] == a:close
    return a:open."\<CR>".a:close."\<ESC>O"
  else
    return a:open
  endif
endf
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif  
" 增强模式中的命令行自动完成操作
"set wildmenu
"set fo=cqrt
"set no error bells
"set noeb visualbell
"let mapleader=","

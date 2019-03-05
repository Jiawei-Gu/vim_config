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
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" 载入文件类型插件 and 为特定文件类型载入相关缩进文件
filetype plugin indent on    " required
" 关掉智能补全时的预览窗口
"set completeopt=longest,menu

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
"let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'
"let g:syntastic_cpp_compiler = 'g++-7'  "change the compiler to g++ to support c++11
"let g:syntastic_c_checkers = ['gcc-7']
"let g:syntastic_cpp_checkers = ['g++-7']
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_enable_diagnostic_highlighting = 0
"highlight YcmErrorSection guibg=#0000FF
let g:ycm_python_binary_path = 'python3'
let g:ycm_server_python_interpreter = 'python3'
nnoremap <F10> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-F10> :YcmShowDetailedDiagnostic<CR>
nnoremap <C-i> :YcmCompleter GoTo<CR>
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" taglist
set tags=.tags
"set tags+=~/.vim/systags
"set autochdir
map <F5> :Tlist<cr>
let Tlist_Show_One_File = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1

" nerdtree
map <F4> :NERDTree<cr>

let g:ctrlp_map = '<c-p>'     "hotkey Ctrl+p open ctrlp plugin
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = '0'       "disable work path mode

" set include folder of current project to jump into header files conveniently
"set path+=~/workspace/walle/include

set number
syntax on
set ruler
set showcmd
set scrolloff=3
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%P%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2
"set foldenable
"set foldmethod=indent
"nnoremap <C-f> :set nofoldenable<CR>
set nocompatible
set backspace=indent,eol,start
if version >= 603
  set helplang=cn
  set encoding=utf-8
endif
" 自动缩进
"set autoindent
"set cindent
set smartindent
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
set tabstop=4
" 用空格代替制表符  
set expandtab  
" 在行和段开始处使用制表符  
set smarttab

"搜索逐字符高亮 
set ignorecase smartcase
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

set tabpagemax=10
set showtabline=2

map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr> " And load session with F3

" 增强模式中的命令行自动完成操作
"set wildmenu
"set fo=cqrt
"set no error bells
"set noeb visualbell
"let mapleader=","

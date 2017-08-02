set number
syntax on
set ruler
set showcmd
set scrolloff=3
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%P%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2
set foldenable
set foldmethod=manual
set nocompatible
if version >= 603
  set helplang=cn
  set encoding=utf-8
endif
set backspace=indent,eol,start
set completeopt=longest,menu

filetype plugin indent on 
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set incsearch
set whichwrap+=<,>,h,l
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

"set wildmenu
"set fo=cqrt
""set no error bells
"set noeb visualbell
"let mapleader=","


" Type ':h[elp] {subject}' to get help on a specific subject

" Turn hybrid line numbers on
set nu rnu " set number relativenumber

" Turn syntax highlighting on.
syntax on " syntax enable

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not let cursor scroll below or above N number of lines when scrolling.
" set scrolloff=10

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Use highlighting when doing a search.
set hlsearch
nohlsearch  " 使 source .vimrc 后不出现高亮

" Search ignore case
set ignorecase

" Highlight in column 80
" set cc=80  " set colorcolumn=80

" Set <LEADER> as <SPACE> 
let mapleader=" "

call plug#begin('~/.vim/plugged')  " 括号里的路径用于指定插件的安装路径

Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

call plug#end()

" NERD Commenter
"
" https://github.com/preservim/nerdcommenter/issues/375#issuecomment-486612018
let g:NERDSpaceDelims = 1  " 在注释符号后添加一个空格
let g:NERDRemoveExtraSpaces = 1  " 取消注释时删除一个空格


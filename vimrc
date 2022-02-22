syntax on

set nu
set rnu
set hidden
set ut=60
set shortmess+=c
set autoindent
set nocompatible
set wildmenu
set hlsearch
set incsearch
set backspace=2
set tabstop=4
set shiftwidth=4
set t_Co=256
set spr

let mapleader=" "
"termmap
"can not map the esc,or the arrow will wrong
tnoremap <Leader><Leader> <C-w>w
tnoremap <Leader><CR> <CR>exit<CR>
tnoremap <Leader>p <C-w>"+
"spacemask
noremap <Leader>p :w<CR>:vert term<CR>
noremap <Leader>h <C-w>h
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>l <C-w>l
noremap <Leader><CR> :nohlsearch<CR>
"ctrlmask
noremap <C-p> mT"+p`T
noremap <C-y> mTggVG"+y`Tzz
noremap <C-c> :packadd coc.nvim<CR>
noremap <C-l> :Template<CR>

noremap H 0
noremap L $

map s <nop>
map S <nop>

" lightline
set laststatus=2
set noshowmode
let g:lightline={'colorscheme':'one'}
color snazzy

"lastplace
let g:lastplace_ignore_buftype="quickfix,nofile,help"

"template
let g:templates_no_autocmd=1

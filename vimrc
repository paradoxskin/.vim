syntax on

set nu
set rnu
set hidden
set ut=60
set shortmess+=c
set autoindent
set nocompatible

noremap <C-p> mT"+p`T
noremap <C-y> mTggVG"+y`Tzz
noremap <C-c> :packadd coc.nvim<Enter>

"color snazzy
let g:Snazzytransparent = 0

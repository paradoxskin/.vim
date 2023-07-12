syntax on
set nu
set rnu
set hidden
set ut=60
set shortmess+=c
set autoindent
set nocompatible
set wildmenu
set wildoptions+=pum
set hlsearch
set incsearch
set spr
set smartcase
set ignorecase
set noshowmode
set laststatus=2
set backspace=2
set cursorline
set ttimeoutlen=50
set fdm=syntax

let mapleader=" "
let g:netrw_fastbrowse=0

map S <nop>

"tab and space
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
inoremap <S-Tab> <C-d>

"termmap
tnoremap <Leader><Leader> <C-w>w
tnoremap <Leader>\ <CR>exit<CR>

"spacemask
noremap <expr> <Leader>M &fdm=="syntax" ? ':set fdm=manual<CR>' : ':set fdm=syntax<CR>'
noremap <Leader>p :w<CR>:vert term<CR>
noremap <Leader>h <C-w>h
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>l <C-w>l
noremap <Leader>a ggVG
noremap <Leader><CR> :nohlsearch<CR>
noremap <Leader>n :bn<CR>
noremap <Leader>N :bp<CR>
noremap <Leader>C :bd!<CR>
noremap <Leader>z :set invcursorline<CR>
noremap <Leader>2 @q
noremap <Leader>s :call Showbf(5000)<CR>
noremap <Leader>- :tabp<CR>
noremap <Leader>= :tabn<CR>
noremap <Leader>] :tabnew<CR>
noremap <Leader>[ :tabc<CR>

"ctrlmask
noremap <C-o> <nop>
nnoremap <C-p> mT"+p`T
vnoremap <C-i> "+y
nnoremap <C-y> mTggVG"+y`Tzz
vnoremap <C-y> mT"+y`Tzz

" normalmask
noremap H 0
noremap L $
noremap J 7j
noremap K 7k
noremap s :edit 
noremap <C-z> :qa!

" good looking─
set fillchars+=vert:│

" autocmd
au BufWinEnter * silent! loadview
au VimLeave,BufLeave * silent! mkview

"fcitx5
"let fcitx5state=system("fcitx5-remote")
"au InsertLeave * silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
"au InsertEnter * silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif

"ejs
au BufNewFile,BufRead *.ejs set ft=html

"plugin config
source ~/.vim/plugin.vim

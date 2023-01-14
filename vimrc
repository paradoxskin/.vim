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
set spr

let mapleader=" "

"termmap
"can not map the esc,or the arrow will wrong
tnoremap <Leader><Leader> <C-w>w
tnoremap <Leader>\ <CR>exit<CR>
"tnoremap <Leader>p <C-w>"+
"spacemask
noremap <Leader>p :w<CR>:vert term<CR>
noremap <Leader>h <C-w>h
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>l <C-w>l
noremap <Leader><CR> :nohlsearch<CR>
noremap <Leader>n :bn<CR>
noremap <Leader>N :bp<CR>
noremap <Leader>z :set invcursorline<CR>
noremap <Leader>C :bd<CR>
noremap <Leader>q qq
noremap <Leader>2 @q
noremap <Leader>s :call Showbf(5000)<CR>
noremap <Leader>- :tabp<CR>
noremap <Leader>= :tabn<CR>
noremap <Leader>] :tabnew<CR>
noremap <Leader>[ :tabc<CR>
noremap <Leader>c :colorscheme snazzy<CR>
noremap <Leader>C :hi clear<CR>

inoremap <C-\> <Esc>:call Autocopy()<CR>a

"ctrlmask
nnoremap <C-p> mT"+p`T
nnoremap <C-a> ggVG
vnoremap <C-i> "+y
nnoremap <C-y> mTggVG"+y`Tzz
"noremap <C-l> :call TempLate()<CR>
noremap H 0
noremap L $
noremap J 7j
noremap K 7k
noremap s :edit 
"map for html
noremap vo< T>vt<
noremap vo> T>vt<
noremap b <nop>
noremap <c-o> <nop>

map S <nop>
"fcitx5
let fcitx5state=system("fcitx5-remote")
" 退出插入模式时禁用输入法，并保存状态
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
" 2 表示之前状态打开了输入法，则进入插入模式时启动输入法
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif

" html map
"source $HOME/.vim/html.vim
" lightline
set laststatus=2
set noshowmode
let g:lightline={'colorscheme':'one',
		\ 'active': {
		\	'right': [['lineinfo'],
		\			  ['Bubble'],
		\			  ['fileformat','fileencoding','filetype','percent']]
		\ },
		\ 'component': {
		\ 	'Bubble': '%{g:boringBubble#Bubble}'
		\ }
      \ }
      
let g:boringBubble#len=5
let g:boringBubble#echo=0
let g:boringBubble#map="--**"
color snazzy
let g:SnazzyTransparent = 1

"lastplace
let g:lastplace_ignore_buftype="quickfix,nofile,help"

"template
let g:templates_no_autocmd=1

au BufNewFile,BufRead *.ejs set ft=html

"my function
let g:Rflag=1
function Autocopy()
	if g:Rflag==1
		let g:Rflag=0
		norm mR
	else
		let g:Rflag=1
		norm mTv`Ry`T
	endif
endfunction

function TempLate()
	if line2byte('$')==1 || line2byte('$')==-1
		execute 'Template'
	else
		call feedkeys(":Coco ") "need to write a command
	endif
endfunction

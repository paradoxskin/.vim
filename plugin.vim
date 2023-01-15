" snazzy
color snazzy

" lightline
let g:lightline={'colorscheme':'one',
		\ 'active': {
		\	'right': [['lineinfo'], ['Bubble'], ['fileformat', 'fileencoding', 'filetype']],
		\	'left': [['filename'], ['percent'], ['modified', 'readonly']]
		\ },
		\ 'component': {
		\ 	'Bubble': '%{g:boringBubble#Bubble}'
		\ }
      \ }
      
" Bubble
let g:boringBubble#len=5
let g:boringBubble#echo=0
let g:boringBubble#map="--**"
let g:SnazzyTransparent = 1

"lastplace
let g:lastplace_ignore_buftype="quickfix,nofile,help"

"mapChange
nnoremap <Leader>m :ChgMap 
source $HOME/.vim/mask.vim

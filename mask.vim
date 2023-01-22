vim9script
g:vimMap = {
	"init": [
		"nnoremap J 7j",
		"nnoremap K 7k",
		"nnoremap U K",
		"vnoremap J 7j",
		"vnoremap K 7k",
		"vnoremap U K"
	],
	"none": [
	],
	"plg": [
		"nnoremap <Leader>s :source %<CR>"
	],
	"coc": [
		"packadd coc.nvim",
		"packadd vim-snippets",
		"packadd ultisnips",
		"CocStart",
		"inoremap <expr> <C-Space> coc#refresh()",
		"inoremap <expr> <Tab> pumvisible() ? coc#pum#next(1) : \"\<Tab>\"",
		"inoremap <expr> <S-Tab> pumvisible() ? coc#pum#prev(1) : \"\<S-Tab>\"",
		"nnoremap <Leader>K :call CocActionAsync('doHover')<CR>",
		# has some bug
		"nmap <silent> <Leader>rn <Plug>(coc-rename)",
		"nmap <silent> _ <Plug>(coc-diagnostic-prev)",
		"nmap <silent> - <Plug>(coc-diagnostic-next)",
		"nmap <silent> <Leader>g <Plug>(coc-definition)",
		"nmap <Leader>tr <Plug>(coc-translator-p)",
		"vmap <Leader>tr <Plug>(coc-translator-pv)",
		#"nnoremap <Leader>s :call SwHLSame()<CR>",
		# switch the complete, let it open
		#"nnoremap <Leader>q :let b:coc_suggest_disable=1-b:coc_suggest_disable<CR>",
		# coc-explorer, don't use it in linux, i have ranger
		#"nnoremap <Leader>tt :CocCommand explorer --quit-on-open<CR>",
		#"nnoremap <Leader>tl :CocCommand explorer --position right --width 33<CR>",
		#"nnoremap <Leader>tv :CocCommand explorer --preset .vim<CR>",
		"echo '[M] COC Loaded.'",
	],
}

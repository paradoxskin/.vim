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
		"nnoremap <expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-j>\"",
		"nnoremap <expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-k>\"",
		"inoremap <expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-j>\"",
		"inoremap <expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-k>\"",
		"inoremap <expr> <C-Space> coc#refresh()",
		#"inoremap <expr> <Tab> pumvisible() ? coc#pum#next(1) : \"\<Tab>\"",
		#"inoremap <expr> [Z pumvisible() ? coc#pum#prev(1) : \"\<Tab>\"",
		"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : \"\<Tab>\"",
		"inoremap <expr> [Z coc#pum#visible() ? coc#pum#prev(1) : \"\<Tab>\"",
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
		#"echo '[M] COC Loaded.'",
	],
}

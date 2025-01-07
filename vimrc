syntax on
filetype plugin on
set nocompatible
set nu
set rnu
set hidden
set shortmess+=c
set backspace=2
set autoindent
set hlsearch
set incsearch
set smartcase
set ignorecase
set wildmenu
set wildoptions+=pum
set shiftwidth=4
set tabstop=6
set expandtab
set softtabstop=4
set spr
set ttimeoutlen=10
set signcolumn=yes
set cursorline
set laststatus=2
set statusline=%!Cleanline()
set undofile
set noshowmode
set showcmd
set sloc=statusline
set undodir=~/.vim/undo
set vop-=options
set gp=git\ grep\ -n
set list lcs=tab:\|\ ,extends:>,precedes:<
set cot=menu,preview
set jop=stack
set splitbelow
set splitright

inoremap jf <esc>
nnoremap ` :

nnoremap s :edit 
nnoremap S :cd 
nnoremap <up> <c-w>k
nnoremap <down> <c-w>j
nnoremap <right> <c-w>l
nnoremap <left> <c-w>h
nnoremap <Esc> :set invhlsearch<CR>
nnoremap <c-c> :qa!
nnoremap \\ :call InvMemory()<CR>
nnoremap \s :call JumpToNormalBuffer("bn")<CR>
nnoremap \a :call JumpToNormalBuffer("bp")<CR>
nnoremap \w :cn<CR>zz
nnoremap \q :cp<CR>zz
nnoremap <silent> \<cr> :call ToggleQuickFix()<CR>
nnoremap \] :Lex<CR>
nnoremap \[ :Lex %:p:h<CR>
nnoremap \<bs> :set invpaste<CR>
nnoremap \= :set invwrap<CR>
" use OSC52, only support yank, paste by <ctrl-shift V> in insert mode
"vnoremap <c-y> "my:call OSC52('m')<CR>
vnoremap <c-y> "+y
vnoremap <c-p> "+p
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
cnoremap <c-f1> %:p:h

colorscheme waterless

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

au BufWinLeave * if expand("%:p") != "" && InMemory(expand("%:p")) | silent mkview
au BufWinEnter * if expand("%:p") != "" && InMemory(expand("%:p")) | silent! loadview
au filetype netrw call s:netrw_config()
au filetype qf call s:quickfix_config()
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set fillchars=fold:\ 
set fillchars+=vert:│
set foldtext=Blackbox()
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:miniSnip_trigger = '<c-f1>'
let g:miniSnip_complkey = '<c-x><c-f1>'
let g:miniSnip_extends = {
    \ 'cpp': ['c'],
\}
let s:quickpeek = expand("<sfile>:p:h") . "/quickpeek"

function! Blackbox()
    let len = 55
    let text = getline(v:foldstart)
    if len <= strlen(text)
        let text = strpart(text, 0, len - 5) . ".."
    endif
    let cur = line('.')
    if v:foldstart <= cur && cur <= v:foldend
        let text = '▶ ' . text . repeat(' ', max([1, len - strlen(text)]) - 2) . '█ 󰏖 ' . (v:foldend - v:foldstart + 1) . ' '
    else
        let text = text . repeat(' ', max([1, len - strlen(text)])) . '│  ' . (v:foldend - v:foldstart + 1) . ' '
    endif
    return text
endfunction

function! Cleanline()
    if g:statusline_winid != win_getid()
        let l:hl=''
        let l:editflag=' '
    else
        let l:hl='%#Edflag#'
        if &modified
            let l:editflag='@'
        else
            let l:editflag='●'
        endif
    endif
    if InMemory(expand("%:p"))
        let l:memflag=' '
    else
        let l:memflag=''
    endif
    let l:otherstatus='%#StatusLine#%f%r %P %Y '.l:memflag.'~ %S'.'%=|'.&encoding.' %l,%c|'
    return l:hl.' '.l:editflag.' '.l:otherstatus
endfunction

function! LoadMemory()
    let s:memory_file = expand('$HOME').'/.vim/memory'
    if filereadable(s:memory_file)
        let s:memory = readfile(s:memory_file)
    else
        let s:memory = []
    endif
endfunction

function! InMemory(filename)
    return index(s:memory, a:filename) >= 0
endfunction

function! InvMemory()
    let l:filename = expand("%:p")
    if InMemory(l:filename)
        call remove(s:memory, l:filename)
    else
        call add(s:memory, l:filename)
    endif
    call writefile(s:memory, s:memory_file)
endfunction

function! PeekAdd()
    let l:path = [expand("%:p") . ":" . line(".") . ":" . substitute(input("", "note: "), "note:", "", "")]
    call writefile(l:path, s:quickpeek, "a")
endfunction

function! PeekList()
    exe "cfile " . s:quickpeek
endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-j> lsp#scroll(+1)
    nnoremap <buffer> <expr><c-k> lsp#scroll(-1)
endfunction

function! s:netrw_config()
    map <buffer> \a <nop>
    map <buffer> \s <nop>
    nmap <buffer> h -zz
    nmap <buffer> l zz<CR>
    setlocal statusline=\ ●\ %{&ft}
endfunction

function! s:quickfix_config()
    map <buffer> \a <nop>
    map <buffer> \s <nop>
    nmap <buffer> <space> <cr>zz<c-w>p
endfunction

function! OSC52(reg)
    let tmp_fn = system("mktemp")[:-2]
    let ret = writefile(split(getreg(a:reg), "\n"), tmp_fn, "b")
    if ret == 0
        exec "!cat ".tmp_fn." |osc52 && rm ".tmp_fn." || echo ".tmp_fn
        return
    endif
    echo ret
endfunction

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        if empty(getqflist())
            let new_quickfix = input("", ":grep ")
            if new_quickfix != ":grep "
                exe new_quickfix
            endif
        else
            copen
        endif
    else
        cclose
    endif
endfunction

function! JumpToNormalBuffer(command)
    let l:now_buf = bufnr('%')
    exec a:command
    while &bt != "" && bufnr('%') != l:now_buf
        exec a:command
    endwhile
endfunction

function! ReadBook(command)
    let l:content = getline(".")
    let l:begin = match(l:content, "|")
    if l:begin == -1
        return
    endif
    call system(a:command, l:content[l:begin+1:])
endfunction

call LoadMemory()

" lazybook
if executable('sd')
    au BufRead,BufNewFile *.lazybook setlocal ft=sh | nnoremap <cr> :call ReadBook("sd")<cr>
endif

" python c/c++ rust go java html js lua pico8 cmake
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '--header-insertion=never']},
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('cmake-language-server')
  au User lsp_setup call lsp#register_server({
  \ 'name': 'cmake',
  \ 'cmd': {server_info->['cmake-language-server']},
  \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'build/'))},
  \ 'whitelist': ['cmake'],
  \ 'initialization_options': {
  \   'buildDirectory': 'build',
  \ }
  \})
endif

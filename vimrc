syntax on
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
set undodir=~/.vim/undo
set vop-=options

noremap s :edit 
noremap S :cd 
nnoremap <Esc> :set invhlsearch<CR>
nnoremap <c-z> :qa!
nnoremap ,m :call InvMemory()<CR>
nnoremap \] :bn<CR>
nnoremap \[ :bp<CR>
nnoremap \\ :doautocmd User lsp_buffer_enabled<CR>
vnoremap <c-y> "+y
vnoremap <c-p> "+p
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

colorscheme waterless

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

au BufWinLeave * if expand("%:p") != "" && InMemory(expand("%:p")) | silent mkview
au BufWinEnter * if expand("%:p") != "" && InMemory(expand("%:p")) | silent! loadview
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set fillchars=fold:\ 
set fillchars+=vert:│
set foldtext=Blackbox()
let g:lsp_diagnostics_enabled = 0

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
    else
        let l:hl='%#Edflag#'
    endif
    if &modified
        let l:editflag='*'
    else
        let l:editflag='●'
    endif
    let l:otherstatus='%#StatusLine# %f%r %P %Y%= '.&encoding.' %l,%c'
    return l:hl.' '.l:editflag.l:otherstatus
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
        echo "forgot"
    else
        call add(s:memory, l:filename)
        echo "marked"
    endif
    call writefile(s:memory, s:memory_file)
endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

call LoadMemory()

" python c/c++ rust go java html js lua
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
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

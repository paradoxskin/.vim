syntax on
filetype plugin on
set nocompatible
set nu
set rnu
set hidden
set nomore
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
set tabstop=8
set expandtab
set softtabstop=4
set spr
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=10
set signcolumn=yes
set cursorline
set laststatus=2
set statusline=%!Cleanline()
set undofile
set noshowmode
set showcmd
set sloc=statusline
set directory=~/.vim/swap
set undodir=~/.vim/undo
set vop-=options
set gp=git\ grep\ -n
set list lcs=tab:\|\ ,extends:>,precedes:<
set cot=menu,preview
set jop=stack
set splitbelow
set splitright

inoremap<silent><expr> <up> i1m#Toggle()
nnoremap <space> :
vnoremap <space> :
nnoremap ` @

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
nnoremap \] :<c-r>=AutoRex()<CR><CR>
nnoremap \[ :let filename_=expand("%:t")<CR>:Ex %:p:h<CR>:call search(filename_)<CR>
nnoremap \<bs> :set invpaste<CR>
nnoremap \= :set invwrap<CR>
nnoremap \- :call ToggleHardCore()<CR>
nnoremap \/ :call MarkSearch()<CR>
nnoremap \? :call ClearMarkSearch()<CR>
nnoremap \1 :call FzfSelectBuffer()<CR>
nnoremap <f2> *N
" use OSC52, only support yank, paste by <ctrl-shift V> in insert mode
"vnoremap <c-y> "my:call OSC52('m')<CR>
vnoremap <c-y> "+y
vnoremap <c-p> "+p
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <f2> "my/\V<c-r>=SearchLines()<cr><cr>N
cnoremap <c-f1> %:p:h
snoremap <c-x> _<bs><c-x>

colorscheme waterless

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let g:netrw_banner = 0
let g:netrw_list_hide = '^\.[^a-zA-Z0-9_]\+$' . ',' .'\(^\|\s\s\)\zs\.\S\+'

augroup au_add
    au!
    au BufWinLeave * if expand("%:p") != "" && InMemory(expand("%:p")) | silent mkview
    au BufWinEnter * if expand("%:p") != "" && InMemory(expand("%:p")) | silent! loadview
    au FileType netrw call s:netrw_config()
    au FileType qf call s:quickfix_config()
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set fillchars=fold:\ 
set fillchars+=vert:│
set foldtext=Blackbox()
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_semantic_enabled = 1
let g:miniSnip_trigger = '<c-f1>'
let g:miniSnip_complkey = '<c-x><c-f1>'
let g:miniSnip_extends = {
    \ 'cpp': ['c'],
    \ 'c': ['asm'],
\}
let s:quickpeek = expand("<sfile>:p:h") . "/quickpeek"

nnoremap \m :call InvLspDocHl()<CR>
function! InvLspDocHl()
    let g:lsp_document_highlight_enabled = xor(g:lsp_document_highlight_enabled, 1)
    if g:lsp_document_highlight_enabled == 1
        call lsp#internal#document_highlight#_enable()
    else
        call lsp#internal#document_highlight#_disable()
    endif
endfunction

function! Blackbox()
    " xxx   │
    " ▶ xxx █
    " | 55 |
    let len = 55
    let text = getline(v:foldstart)
    if strdisplaywidth(text) + 3 > len
        for i in range(len, 0, -1)
            if strdisplaywidth(text[:i]."..") + 3 <= len
                let text = text[:i].".."
                break
            endif
        endfor
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
    if !exists("b:chineseMode") || !b:chineseMode
        let l:cnflag=' '
    else
        let l:cnflag='%#SpellRare# '
    endif
    let l:otherstatus='%#StatusLine#%f%r %P %Y '.l:memflag.'~ %S'.'%=|'.&encoding.' %l,%c|'
    return l:hl.' '.l:editflag.l:cnflag.l:otherstatus
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
    redraw!
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
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gt <plug>(lsp-call-hierarchy-incoming)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-j> lsp#scroll(+1)
    nnoremap <buffer> <expr><c-k> lsp#scroll(-1)
    vmap <silent> <buffer> <F20> <plug>(lsp-float-close)
    vmap <silent> <buffer> <F20> <plug>(lsp-quickpick-cancel)
    vmap <silent> <buffer> <F20> <Plug>(lsp-quickpick-move-next)
    vmap <silent> <buffer> <F20> <Plug>(lsp-quickpick-move-previous)
endfunction

function! s:netrw_config()
    setlocal rnu
    setlocal statusline=%#Keyword#\ _\ %{get(b:,'netrw_curdir','')}
    nmap <buffer> h <Plug>NetrwBrowseUpDir
    nmap <buffer> l <Plug>NetrwLocalBrowseCheck
    if !exists("b:netrw_hidden_key")
        let b:netrw_hidden_key = maparg("gh", "n")
    endif
    exec "nmap <buffer> <backspace> " . b:netrw_hidden_key
    nmap <buffer> gf :call FzfOpenFile(b:netrw_curdir)<CR>
    nmap <buffer> gh :edit $HOME<CR>
endfunction

function! AutoRex()
    if exists(":Rex")
        return "Rex"
    endif
    return "Ex"
endfunction

function! s:quickfix_config()
    map <buffer> \a <nop>
    map <buffer> \s <nop>
    map <buffer> <backspace> <cr>zz<c-w>p
    map <buffer> <left> :colder<cr>
    map <buffer> <right> :cnewer<cr>
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

function! ToggleHardCore()
    if &l:expandtab
        echo "hardcore"
        setlocal noexpandtab
        setlocal shiftwidth=8
        setlocal softtabstop=0
    else
        echo "soft"
        setlocal expandtab
        setlocal shiftwidth=4
        setlocal softtabstop=4
    endif
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

call LoadMemory()

" lazybook
augroup lazybook
    au!
    au BufRead,BufNewFile *.lazybook setf lazybook
    au FileType lazybook setlocal nowrap
    au FileType lazybook nnoremap <buffer> / /^#\?
    au FileType lazybook syntax match Comment /^#.*$/ contained
    au FileType lazybook syntax match Comment /^[^|]*$/ contained
    au FileType lazybook syntax match Comment /@[^|]*/
    au FileType lazybook syntax match Debug /^[^@|]*/ contains=Comment
    au FileType lazybook syntax match String /'[^'].*'/ contained
    au FileType lazybook syntax match String /".*"/ contained
    au FileType lazybook syntax match Keyword /|.*$/ contains=String
augroup END

function! ReadBook(command)
    let l:content = getline(".")
    " desc [@action][|argv]|stdin
    let m = matchlist(l:content, '^[^@|]*\(@\([^|]\+\)\)\?\(|\(-[^ ]\+\)\)\?|\(.*\)')
    let l:action = m[2]
    let l:arg = m[4]
    let l:stdin = m[5]
    if l:stdin == ''
        return
    endif
    let l:command = a:command
    if l:arg != ''
        let l:command .= " ".l:arg
    endif
    call system(l:command, l:stdin)
    if v:shell_error == 0 && l:action != ''
        call feedkeys(l:action)
    endif
endfunction

if executable('sd')
    au FileType lazybook nnoremap <buffer> <cr> :call ReadBook("sd")<cr>
endif

" markdown live preview
" dep: md2html live-server(nodejs)
let s:gen_path = "/tmp/vimtemp/md2html"
let s:html_css = expand("<sfile>:p:h")."/archive/style.css"
let s:md2html_script = expand("<sfile>:p:h")."/archive/md2html.sh"
function! TransMD2HTML(md_path)
    if !exists("g:vimtemp")
        call system("mkdir -p ".s:gen_path)
        call system("cp -f ".s:html_css." ".s:gen_path)
        let g:vimtemp = 1
    endif
    call system(s:md2html_script." ".a:md_path." ".s:gen_path."/index.html &")
endfunction
if executable('md2html')
    au BufWritePost *.md call TransMD2HTML(expand("%:p"))
endif

" markdown upload image
" dep: xclip/curl/magick
let s:upload_script = expand("<sfile>:p:h")."/upload.sh"
inoremap <f1> <c-r>=UploadImg()<cr>
function! UploadImg()
    let l:input = input("[img]:", " ")
    if l:input == ""
        return ""
    endif
    if l:input[0] == " "
        let l:input = l:input[1:]
    endif
    if l:input == ""
        call system("xclip -selection clipboard -t image/png -o > /tmp/vimupload.png")
        let l:input = "/tmp/vimupload.png"
    elseif l:input[:3] == "http"
        call system("curl ".l:input." |magick - png:/tmp/vimupload.png")
        let l:input = "/tmp/vimupload.png"
    endif
    return system(s:upload_script." ".l:input)[:-2]
endfunction

" fzf
function! FzfOpenFile(path)
    let l:file = system("cd ".a:path." && find . -type f |fzf --height=10%")
    redraw!
    if l:file != ""
        exec "edit ".a:path."/".l:file
    endif
endfunction

function! FzfSelectBuffer()
    let l:last = bufnr('#')
    let l:now = bufnr('%')
    let l:order = filter(range(1, bufnr('$')), 'v:val != l:now && buflisted(v:val)')
    if l:order == []
        echo "[-] no other bufs"
        return
    endif
    if l:last > 0 && index(l:order, l:last) >= 0
        call remove(l:order, index(l:order, l:last))
        call insert(l:order, l:last, 0)
    endif
    let l:buffers = map(l:order, 'v:val." ".bufname(v:val)')
    let l:command = 'echo "' . join(l:buffers, "\n") . '" | fzf --height=10%'
    let l:sel = system(command)
    redraw!
    if l:sel != ""
        let l:sel = split(l:sel)[0]
        exec "buffer ".l:sel
    endif
endfunction

" marksearch
function! MarkSearch()
    if !exists("w:match_dict")
        let w:match_dict = []
        let w:match_col = 0
    endif
    for rule in w:match_dict
        if @/ == rule[1]
            return
        endif
    endfor
    let l:id = matchadd("MarkSearchx".w:match_col, @/)
    call add(w:match_dict, [l:id, @/])
    let w:match_col = (w:match_col + 1) % 0xf
endfunction

function! ClearMarkSearch()
    if !exists("w:match_dict")
        let w:match_dict = []
        let w:match_col = 0
    endif
    let l:count = 2
    let l:choice = ['1. ALL']
    for match in w:match_dict
        call add(l:choice, (l:count.". ".match[1]))
        let l:count += 1
    endfor
    let l:input = inputlist(l:choice)
    if l:input == 0
        return
    elseif l:input == 1
        call clearmatches()
        let w:match_dict = []
    elseif (l:input - 2) < len(w:match_dict)
        call matchdelete(w:match_dict[l:input - 2][0])
        call remove(w:match_dict, (l:input - 2))
    endif
endfunction

function! s:gitDiffQf(content)
    let l:lines = split(a:content, '\n')
    let l:qflist = []
    let l:nr = 0
    let l:filename = 'gitdiff'
    for line in l:lines
        let l:normal = 1
        if line =~ '^+++ '
            let l:filename = matchlist(line, '^+++ b/\(.*\)')[1]
        elseif line =~ '^--- ' "ignore
        elseif line =~ '^@@ '
            let l:nr = matchlist(line, '^@@.*+\(.*\),.*@@')[1] - 2
        elseif line =~ '^+'
            let l:normal = 0
        elseif line =~ '^-'
            let l:nr -= 1
        endif
        let l:nr += 1
        if l:normal
            call add(l:qflist, {'text': line})
        else
            call add(l:qflist, {'filename': l:filename, 'lnum': l:nr, 'text': line})
        endif
    endfor
    return l:qflist
endfunction

" cmd_quickfix
if !exists("s:cmd_qf_handle")
    let s:cmd_qf_handle = [
    \   ['git_diff', function('s:gitDiffQf')],
    \]
endif

function! SearchLines()
    let l:buf = getreg("m")
    let l:buf = escape(l:buf, '\/')
    return substitute(l:buf, '\n', '\\n', "g")
endfunction

function! CommandQf()
    let l:cmd = input("CMD: ")
    let l:output = system(l:cmd)
    let l:idx = 0
    let l:choice = []
    for qf_handle in s:cmd_qf_handle
        let l:idx += 1
        call add(l:choice, l:idx.". ".qf_handle[0])
    endfor
    redraw!
    let l:input = inputlist(l:choice)
    if 0 < l:input && l:input <= len(s:cmd_qf_handle)
        let l:qflist = s:cmd_qf_handle[l:input - 1][1](l:output)
        call setqflist(l:qflist, "r")
        copen
    endif
endfunction

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
        \ 'cmd': {server_info->['clangd', '--header-insertion=never', '--enable-config', '--background-index=1']},
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

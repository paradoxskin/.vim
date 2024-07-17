set t_Co=256
set background=dark
nnoremap wtf :echo synIDattr(synID(line('.'), col('.'), 1), "name")<CR>

"main color
let s:a=234
let s:b=181
let s:c=65
let s:d=100
let s:e=166
let s:f=131
let s:g=178
let s:h=180
let s:i=241

let s:red=166
let s:blue=98
let s:cyan=79
let s:green=34

hi clear

"ui
hi CursorLine cterm=None
exec 'hi Folded ctermfg='.s:e.' ctermbg='.s:a
exec 'hi LineNr ctermfg='.s:b
exec 'hi CursorLineNR cterm=None ctermfg='.s:g
exec 'hi SignColumn ctermbg='.s:a
exec 'hi CursorLineSign ctermbg='.s:i
exec 'hi Edflag cterm=bold ctermfg='.s:i
exec 'hi StatusLine cterm=bold ctermfg='.s:i
exec 'hi StatusLineNC ctermfg='.s:a
exec 'hi VertSplit ctermfg='.s:a.' ctermbg='.s:i
hi Search cterm=bold,reverse ctermfg=None ctermbg=None
hi IncSearch cterm=bold,underline,reverse
hi CurSearch cterm=bold,underline
hi Visual ctermbg=None ctermfg=None cterm=reverse
exec 'hi EndOfBuffer ctermfg='.s:i
exec 'hi Pmenu cterm=bold ctermfg='.s:i.' ctermbg='.s:a
exec 'hi PmenuSbar ctermbg='.s:a
exec 'hi PmenuSel cterm=bold ctermfg='.s:c
exec 'hi PmenuThumb ctermbg='.s:i

"lang
hi clear Statement
exec 'hi Normal ctermbg='.s:a.' ctermfg='.s:b
exec 'hi Constant ctermfg='.s:g
exec 'hi Keyword cterm=bold ctermfg='.s:c
exec 'hi Number ctermfg='.s:e
exec 'hi Type cterm=bold ctermfg='.s:f
exec 'hi Identifier cterm=bold ctermfg='.s:d
exec 'hi Comment cterm=italic ctermfg='.s:h
exec 'hi PreProc ctermfg='.s:e
exec 'hi Special ctermfg='.s:f
hi link Statement Keyword
hi link Operator Keyword

"event
au ModeChanged * call ChangeEdflagColor()
let s:palette = {
    \'n':s:i,
    \'i':s:cyan,
    \'R':s:red,
    \'v':s:blue,
    \'':s:blue,
    \'V':s:blue
\}

"func
function! ChangeEdflagColor()
    exec 'hi Edflag ctermfg='.get(s:palette, mode(), s:i)
endfunction

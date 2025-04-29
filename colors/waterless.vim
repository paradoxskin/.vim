set t_Co=256
set background=dark
"nnoremap wtf :echo synIDattr(synID(line('.'), col('.'), 1), "name")<CR>

"main color
let s:black=234
let s:black2=233
let s:white=181
let s:green=65
let s:green2=100
let s:red=166
let s:red2=131
let s:yellow=178
let s:yellow2=180
let s:yellow3=94
let s:purple=98
let s:cyan=79
let s:grey=241

hi clear

"ui
hi CursorLine cterm=None
exec 'hi Folded cterm=bold ctermbg='.s:black2.' ctermfg='.s:yellow3
exec 'hi LineNr ctermfg='.s:white
exec 'hi CursorLineNR cterm=None ctermfg='.s:yellow
exec 'hi SignColumn ctermbg='.s:black
exec 'hi CursorLineSign ctermbg='.s:grey
exec 'hi Edflag cterm=bold ctermfg='.s:grey
exec 'hi StatusLine cterm=bold ctermfg='.s:grey
exec 'hi StatusLineNC ctermfg='.s:black
exec 'hi VertSplit ctermfg='.s:black.' ctermbg='.s:grey
hi Search cterm=bold,reverse ctermfg=None ctermbg=None
hi IncSearch cterm=bold,underline,reverse
hi CurSearch cterm=bold,underline
hi Visual ctermbg=None ctermfg=None cterm=reverse
exec 'hi EndOfBuffer ctermfg='.s:grey
exec 'hi Pmenu cterm=bold ctermfg='.s:grey.' ctermbg='.s:black
exec 'hi PmenuSbar ctermbg='.s:black
exec 'hi PmenuSel cterm=bold ctermfg='.s:green
exec 'hi PmenuThumb ctermbg='.s:grey
exec 'hi SpecialKey cterm=bold ctermfg='.s:grey

"lang
hi clear Statement
exec 'hi Normal ctermbg='.s:black.' ctermfg='.s:white
exec 'hi Constant ctermfg='.s:yellow
exec 'hi Keyword cterm=bold ctermfg='.s:green
exec 'hi Number ctermfg='.s:red
exec 'hi Type cterm=bold ctermfg='.s:red2
exec 'hi Identifier cterm=bold ctermfg='.s:green2
exec 'hi Comment cterm=italic ctermfg='.s:yellow2
exec 'hi PreProc ctermfg='.s:red
exec 'hi Special ctermfg='.s:red2
exec 'hi MatchParen ctermfg='.s:yellow2.' ctermbg='.s:grey
"hi MatchParen cterm=reverse ctermbg=None
hi link Statement Keyword
hi link Operator Keyword

"mark search
exec 'hi MarkSearchx0 cterm=bold ctermbg=202 ctermfg='.s:black
exec 'hi MarkSearchx1 cterm=bold ctermbg=214 ctermfg='.s:black
exec 'hi MarkSearchx2 cterm=bold ctermbg=208 ctermfg='.s:black
exec 'hi MarkSearchx3 cterm=bold ctermbg=106 ctermfg='.s:black
exec 'hi MarkSearchx4 cterm=bold ctermbg=171 ctermfg='.s:black
exec 'hi MarkSearchx5 cterm=bold ctermbg=183 ctermfg='.s:black
exec 'hi MarkSearchx6 cterm=bold ctermbg=220 ctermfg='.s:black
exec 'hi MarkSearchx7 cterm=bold ctermbg=218 ctermfg='.s:black
exec 'hi MarkSearchx8 cterm=bold ctermbg=226 ctermfg='.s:black
exec 'hi MarkSearchx9 cterm=bold ctermbg=146 ctermfg='.s:black
exec 'hi MarkSearchx10 cterm=bold ctermbg=177 ctermfg='.s:black
exec 'hi MarkSearchx11 cterm=bold ctermbg=189 ctermfg='.s:black
exec 'hi MarkSearchx12 cterm=bold ctermbg=195 ctermfg='.s:black
exec 'hi MarkSearchx13 cterm=bold ctermbg=110 ctermfg='.s:black
exec 'hi MarkSearchx14 cterm=bold ctermbg=118 ctermfg='.s:black
exec 'hi MarkSearchx15 cterm=bold ctermbg=122 ctermfg='.s:black

"syntax
let c_space_errors = 1
let c_no_curly_error = 1

"event
au ModeChanged * call ChangeEdflagColor()
let s:palette = {
    \'n':s:grey,
    \'i':s:cyan,
    \'R':s:red,
    \'v':s:purple,
    \'':s:purple,
    \'V':s:purple,
    \'s':s:red,
    \'S':s:red,
\}

"func
function! ChangeEdflagColor()
    exec 'hi Edflag ctermfg='.get(s:palette, mode(), s:grey)
endfunction

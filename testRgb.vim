vim9script

# R 
# G 
# B 

# source % to test
var R = 0
var G = 0
var B = 0

noremap <expr> l (line('.') <= 5 && line('.') >= 3) ? ":call PlusColor()<CR>" 
\ : "l"
noremap <expr> h (line('.') <= 5 && line('.') >= 3) ? ":call SulpColor()<CR>" 
\ : "h"

def Tran(xxx: number): string
	var rt = ""
	var lts = "0123456789abcdef"
	var tmp = xxx
	while tmp > 0
		rt = lts[tmp % 16] .. rt
		tmp = tmp / 16
	endwhile
	if len(rt) == 1
		rt = "0" .. rt
	elseif len(rt) == 0
		rt = "00"
	endif
	return rt
enddef

def Paint()
	exec "hi ShowTrailingWhitespace guibg=" .. "#" .. Tran(R) .. Tran(G) .. Tran(B)
	echo "#" .. Tran(R) .. Tran(G) .. Tran(B)
enddef

def g:PlusColor()
	var nowLine = line('.')
	if nowLine == 3
		R += R == 255 ? 0 : 1
	elseif nowLine == 4
		G += G == 255 ? 0 : 1
	elseif nowLine == 5
		B += B == 255 ? 0 : 1
	endif
	Paint()
enddef

def g:SulpColor()
	var nowLine = line('.')
	if nowLine == 3
		R -= R == 0 ? 0 : 1
	elseif nowLine == 4
		G -= G == 0 ? 0 : 1
	elseif nowLine == 5
		B -= B == 0 ? 0 : 1
	endif
	Paint()
enddef



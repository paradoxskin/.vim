" Vim syntax file
" Language:	Processing
" Original Author:	Szabolcs Horvát <szhorvat at gmail dot com>
" Version:	1.0.0
" Last Change:	2023-07-01

" This file was autogenerated by make_syntax.py, based on keywords.txt from
" Processing 4.2

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

runtime! syntax/java.vim
unlet b:current_syntax

syn clear javaError2
"syn match   javaError2 "\|=<"
"hi def link javaError2 Error

"syn region processingFold start="{" end="}" transparent fold

"syntax case match

"
syn keyword processingVariable	HALF_PI PI QUARTER_PI TAU TWO_PI displayHeight
syn keyword processingVariable	displayWidth focused frameCount height key
syn keyword processingVariable	keyCode length mouseButton mouseX mouseY
syn keyword processingVariable	pixelHeight pixelWidth pixels pmouseX pmouseY
syn keyword processingVariable	width

" at the moment these need to be "syn match"es so that they don't take
" precedence over processingFunRegion's start pattern:
" syn keyword processingVariable  frameRate mousePressed keyPressed
syn match   processingVariable	display "frameRate"
syn match   processingVariable	display "mousePressed"
syn match   processingVariable	display "keyPressed"

" NOTE: just to make sure that this stuff works right, make these into
" a list, one word per line, then add the stuff from the keyfile, highlight
" it all, and !sort it then !unique it, and anything that goes away, in
" keywords.txt will still be captured here for happiness with older versions
" of processing
"
" FUNCTION1 FUNCTION2 FUNCTION3 FUNCTION4
syn keyword processingFunction	contained ArrayList HashMap abs acos add addChild
syn keyword processingFunction	contained addColumn addRow alpha ambient
syn keyword processingFunction	contained ambientLight angleBetween append
syn keyword processingFunction	contained applyMatrix arc array arrayCopy asin
syn keyword processingFunction	contained atan atan2 background beginCamera
syn keyword processingFunction	contained beginContour beginDraw beginRaw
syn keyword processingFunction	contained beginRecord beginShape bezier
syn keyword processingFunction	contained bezierDetail bezierPoint bezierTangent
syn keyword processingFunction	contained bezierVertex binary blend blendColor
syn keyword processingFunction	contained blendMode blue boolean box breakShape
syn keyword processingFunction	contained brightness byte cache camera ceil char
syn keyword processingFunction	contained charAt circle clear clearRows clip
syn keyword processingFunction	contained close color colorMode concat constrain
syn keyword processingFunction	contained copy cos createFont createGraphics
syn keyword processingFunction	contained createImage createInput createOutput
syn keyword processingFunction	contained createPath createReader createShape
syn keyword processingFunction	contained createWriter cross cursor curve
syn keyword processingFunction	contained curveDetail curvePoint curveTangent
syn keyword processingFunction	contained curveTightness curveVertex day degrees
syn keyword processingFunction	contained delay directionalLight disableStyle
syn keyword processingFunction	contained displayDensity dist div dot draw
syn keyword processingFunction	contained ellipse ellipseMode emissive
syn keyword processingFunction	contained enableStyle endCamera endContour
syn keyword processingFunction	contained endDraw endRaw endRecord endShape
syn keyword processingFunction	contained equals exit exp expand fill filter
syn keyword processingFunction	contained findRow findRows float floor flush
syn keyword processingFunction	contained format frameRate fromAngle frustum
syn keyword processingFunction	contained fullScreen get getAttributeCount
syn keyword processingFunction	contained getBoolean getChild getChildCount
syn keyword processingFunction	contained getChildren getColumnCount
syn keyword processingFunction	contained getColumnTitle getColumnTitles
syn keyword processingFunction	contained getColumnType getColumnTypes getContent
syn keyword processingFunction	contained getDouble getFloat getFloatContent
syn keyword processingFunction	contained getInt getIntArray getIntContent
syn keyword processingFunction	contained getJSONArray getJSONObject getLong
syn keyword processingFunction	contained getName getParent getRow getRowCount
syn keyword processingFunction	contained getString getStringArray
syn keyword processingFunction	contained getStringColumn getVertex
syn keyword processingFunction	contained getVertexCount green hasAttribute
syn keyword processingFunction	contained hasChildren hasKey hasValue heading hex
syn keyword processingFunction	contained hint hour hue image imageMode increment
syn keyword processingFunction	contained indexOf int isNull isVisible join
syn keyword processingFunction	contained keyArray keyPressed keyReleased
syn keyword processingFunction	contained keyTyped keys launch length lerp
syn keyword processingFunction	contained lerpColor lightFalloff lightSpecular
syn keyword processingFunction	contained lights limit line list listAttributes
syn keyword processingFunction	contained listChildren loadBytes loadFont
syn keyword processingFunction	contained loadImage loadJSONArray loadJSONObject
syn keyword processingFunction	contained loadMatrix loadPixels loadShader
syn keyword processingFunction	contained loadShape loadStrings loadTable loadXML
syn keyword processingFunction	contained log loop lower mag magSq map mask match
syn keyword processingFunction	contained matchAll matchRow matchRowIterator
syn keyword processingFunction	contained matchRows max maxIndex millis min
syn keyword processingFunction	contained minIndex minute modelX modelY modelZ
syn keyword processingFunction	contained month mouseClicked mouseDragged
syn keyword processingFunction	contained mouseMoved mousePressed mouseReleased
syn keyword processingFunction	contained mouseWheel mult nf nfc nfp nfs noClip
syn keyword processingFunction	contained noCursor noFill noLights noLoop
syn keyword processingFunction	contained noSmooth noStroke noTint noise
syn keyword processingFunction	contained noiseDetail noiseSeed norm normal
syn keyword processingFunction	contained normalize ortho parse parseBoolean
syn keyword processingFunction	contained parseByte parseChar parseFloat parseInt
syn keyword processingFunction	contained parseJSONArray parseJSONObject parseXML
syn keyword processingFunction	contained perspective pixelDensity point
syn keyword processingFunction	contained pointLight pop popMatrix popStyle pow
syn keyword processingFunction	contained print printArray printCamera
syn keyword processingFunction	contained printMatrix printProjection println
syn keyword processingFunction	contained push pushMatrix pushStyle quad
syn keyword processingFunction	contained quadraticVertex radians random random2D
syn keyword processingFunction	contained random3D randomGaussian randomSeed
syn keyword processingFunction	contained readLine rect rectMode red redraw
syn keyword processingFunction	contained remove removeChild removeColumn
syn keyword processingFunction	contained removeRow removeTokens requestImage
syn keyword processingFunction	contained resetMatrix resetShader resize reverse
syn keyword processingFunction	contained rotate rotateX rotateY rotateZ round
syn keyword processingFunction	contained rows saturation save saveBytes saveFile
syn keyword processingFunction	contained saveFrame saveJSONArray saveJSONObject
syn keyword processingFunction	contained savePath saveStream saveStrings
syn keyword processingFunction	contained saveTable saveXML scale screenX screenY
syn keyword processingFunction	contained screenZ second selectFolder selectInput
syn keyword processingFunction	contained selectOutput set setBoolean setContent
syn keyword processingFunction	contained setDouble setFill setFloat setInt
syn keyword processingFunction	contained setJSONArray setJSONObject setLocation
syn keyword processingFunction	contained setLong setMag setName setResizable
syn keyword processingFunction	contained setString setStroke setTitle setVertex
syn keyword processingFunction	contained setVisible settings setup shader shape
syn keyword processingFunction	contained shapeMode shearX shearY shininess
syn keyword processingFunction	contained shorten shuffle sin size sketchFile
syn keyword processingFunction	contained sketchPath smooth sort sortKeys
syn keyword processingFunction	contained sortKeysReverse sortReverse sortValues
syn keyword processingFunction	contained sortValuesReverse specular sphere
syn keyword processingFunction	contained sphereDetail splice split splitTokens
syn keyword processingFunction	contained spotLight sq sqrt square start stop str
syn keyword processingFunction	contained stroke strokeCap strokeJoin
syn keyword processingFunction	contained strokeWeight sub subset substring tan
syn keyword processingFunction	contained text textAlign textAscent textDescent
syn keyword processingFunction	contained textFont textLeading textMode textSize
syn keyword processingFunction	contained textWidth texture textureMode
syn keyword processingFunction	contained textureWrap thread tint toLowerCase
syn keyword processingFunction	contained toString toUpperCase translate triangle
syn keyword processingFunction	contained trim unbinary unhex updatePixels upper
syn keyword processingFunction	contained valueArray values vertex year

" highlight function names only when they are followed by "("
" need to terminate match using \ze before ( to allow for
" unmatched bracket highlighting
syn match   processingFunRegion	"\K\k*\s*\ze(" contains=processingFunction

" KEYWORD1

" Some of this overlaps the Java, but some of it is unique here, so just
" letting it all stay, it doesn't really hurt anything :)
syn keyword processingType	Array ArrayList Boolean BufferedReader Byte Character
syn keyword processingType	Class Float FloatDict FloatList HashMap IntDict
syn keyword processingType	IntList Integer JSONArray JSONObject PFont PGraphics
syn keyword processingType	PImage PShader PShape PVector PrintWriter String
syn keyword processingType	StringBuffer StringBuilder StringDict StringList
syn keyword processingType	Table TableRow Thread XML boolean byte char color
syn keyword processingType	double float int long var

syn keyword processingBoolean	false true
syn keyword processingConstant	null

"XXX: All covered in Java, just keeping it here cuz it may be useful for
"historic comparison for a while
"syn keyword processingStorageClass	final static synchronized transient volatile
"syn keyword processingConditional	if else switch
"syn keyword processingControlFlow	break continue return
"syn keyword processingRepeat		while for do
"syn keyword processingLabel		case default
"syn keyword processingException		try catch throw finally
"syn keyword processingOperator		new instanceof

"syn keyword processingKeyword	abstract class
"syn keyword processingKeyword	interface native
"syn keyword processingKeyword	package private protected public
"syn keyword processingKeyword	extends implements import throws
"syn keyword processingKeyword	super this


" LITERAL2

syn keyword processingConstant	ADD ALIGN_CENTER ALIGN_LEFT ALIGN_RIGHT ALPHA
syn keyword processingConstant	ALPHA_MASK ALT AMBIENT ARC ARGB ARROW BACKSPACE
syn keyword processingConstant	BASELINE BEVEL BLEND BLUE_MASK BLUR BOTTOM BOX
syn keyword processingConstant	BURN CENTER CHATTER CHORD CLICK CLOSE CMYK CODED
syn keyword processingConstant	COMPLAINT COMPONENT COMPOSITE CONCAVE_POLYGON
syn keyword processingConstant	CONTROL CONVEX_POLYGON CORNER CORNERS CROSS
syn keyword processingConstant	CUSTOM DARKEST DEGREES DEG_TO_RAD DELETE DIAMETER
syn keyword processingConstant	DIFFERENCE DIFFUSE DILATE DIRECTIONAL DISABLED
syn keyword processingConstant	DISABLE_ACCURATE_2D DISABLE_DEPTH_MASK
syn keyword processingConstant	DISABLE_DEPTH_SORT DISABLE_DEPTH_TEST
syn keyword processingConstant	DISABLE_NATIVE_FONTS DISABLE_OPENGL_ERRORS
syn keyword processingConstant	DISABLE_PURE_STROKE DISABLE_STROKE_PERSPECTIVE
syn keyword processingConstant	DISABLE_TEXTURE_MIPMAPS DISABLE_TRANSFORM_CACHE
syn keyword processingConstant	DODGE DOWN DRAG DXF ELLIPSE ENABLE_ACCURATE_2D
syn keyword processingConstant	ENABLE_DEPTH_MASK ENABLE_DEPTH_SORT
syn keyword processingConstant	ENABLE_DEPTH_TEST ENABLE_NATIVE_FONTS
syn keyword processingConstant	ENABLE_OPENGL_ERRORS ENABLE_STROKE_PERSPECTIVE
syn keyword processingConstant	ENABLE_TEXTURE_MIPMAPS ENABLE_TRANSFORM_CACHE
syn keyword processingConstant	ENTER EPSILON ERODE ESC EXCLUSION FX2D GIF GRAY
syn keyword processingConstant	GREEN_MASK GROUP HALF HAND HARD_LIGHT HINT_COUNT
syn keyword processingConstant	HSB IMAGE INVERT JAVA2D JPEG LEFT LIGHTEST LINE
syn keyword processingConstant	LINES LINUX MACOSX MAX_FLOAT MAX_INT MIN_FLOAT
syn keyword processingConstant	MIN_INT MITER MODEL MOVE MULTIPLY NORMAL
syn keyword processingConstant	NORMALIZED NO_DEPTH_TEST NTSC ONE OPAQUE OPEN
syn keyword processingConstant	ORTHOGRAPHIC OVERLAY P2D P3D PAL PDF PERSPECTIVE
syn keyword processingConstant	PIE PIXEL_CENTER POINT POINTS POSTERIZE PRESS
syn keyword processingConstant	PROBLEM PROJECT QUAD QUADS QUAD_STRIP RADIANS
syn keyword processingConstant	RADIUS RAD_TO_DEG RECT RED_MASK REPEAT REPLACE
syn keyword processingConstant	RETURN RGB RIGHT ROUND SCREEN SECAM SHAPE SHIFT
syn keyword processingConstant	SOFT_LIGHT SPAN SPECULAR SPHERE SQUARE SUBTRACT
syn keyword processingConstant	SVG SVIDEO TAB TARGA TEXT TFF THIRD_PI THRESHOLD
syn keyword processingConstant	TIFF TOP TRIANGLE TRIANGLES TRIANGLE_FAN
syn keyword processingConstant	TRIANGLE_STRIP TUNER TWO UP WAIT WHITESPACE

"syn match   processingSpecError	display contained "\\."
"syn match   processingSpecial	display contained "\\[ntbrf'\"\\]"
"syn match   processingSpecial	display contained "\\u\x\{4}"
"syn match   processingSpecial	display contained "\\\o\{1,2}"
"syn match   processingSpecial	display contained "\\[0-3]\o\o"
"
"syn region  processingString	start=+"+ end=+"+ end='$' contains=processingSpecial,processingSpecError,@Spell
"
"syn region  processingCharacter	start="'" end="'" end="$" contains=processingSpecial,processingSpecError
"
syn keyword processingTodo	TODO FIXME XXX NOTE contained
"
"syn region  processingComment	start="/\*" end="\*/" contains=processingTodo,@Spell
"syn region  processingCommentL	start="//" end="$" contains=processingTodo,@Spell
"
"if !exists("processing_minlines")
"  let processing_minlines = 20
"endif
"exec "syn sync ccomment processingComment minlines=" . processing_minlines

"syn match   processingNumber	display "\<\d\+[lL]\=\>"
"syn match   processingNumber	display "\<0x\x\+[lL]\=\>"
"syn match   processingOctal	display "\<0\o\+[lL]\=\>" contains=processingOctalZero
"syn match   processingOctalZero	display contained "\<0"

" NOTE: Java highlight doesn't do different colors for int and float, which is
" dumb: so keep this code here :)

" The trailing L doesn't make much sense for colors but the PDE accepts it ...
syn match   processingColor	display "#\x\{6}[lL]\=\>"
" float without . or exponent
syn match   processingFloat	display "\<\d\+[fF]\>"
" no \> because it might end in a .
syn match   processingFloat	display "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=[fF]\="
" float starting with .
syn match   processingFloat	display "\.\d\+\%([eE][-+]\=\d\+\)\=[fF]\=\>"
" float with explonent
syn match   processingFloat	display "\<\d\+[eE][-+]\=\d\+"

" this leverages some features from the java syntax file... keeps the
" highlighting working properly in () and other regions
syn cluster javaTop add=processingColor,processingFloat,processingConstant,processingFunction,processingVariable

" prevent highlighting of predefined function names after a dot
syn region  processingEmpty	start="\.\ze\K" end="\>"

" Highlight unmatched brackets
"syn match   processingParErr	display ")"
"syn match   processingBraErr	display "\]"
"syn match   processingCBraErr	display "}"
"syn region  processingPar	transparent start="(" end=")" contains=TOP,processingParErr
"syn region  processingBra	transparent start="\[" end="\]" contains=TOP,processingBraErr
"syn region  processingCBra	transparent start="{" end="}" contains=TOP,processingCBraErr


"hi def link processingParErr		Error
"hi def link processingBraErr		Error
"hi def link processingCBraErr		Error

hi def link processingKeyword		Keyword
hi def link processingRepeat		Repeat
hi def link processingConditional	Conditional
hi def link processingControlFlow	Keyword
hi def link processingException		Exception
hi def link processingLabel		Label
hi def link processingFunction		Function
hi def link processingOperator		Operator
hi def link processingType		Type
hi def link processingStorageClass	StorageClass
hi def link processingConstant 		Constant
hi def link processingVariable		Constant
hi def link processingBoolean		Boolean
hi def link processingNumber		Number
hi def link processingOctal		Number
hi def link processingOctalZero		PreProc
hi def link processingColor		Number
hi def link processingFloat		Float
hi def link processingString		String
hi def link processingCharacter		Character
hi def link processingSpecial		SpecialChar
hi def link processingSpecError		Error
hi def link processingComment		Comment
hi def link processingCommentL		Comment
hi def link processingTodo		Todo

let b:current_syntax = "processing"

" vim: ts=8


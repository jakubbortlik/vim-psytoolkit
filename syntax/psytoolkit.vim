" Vim syntax file
" Filename: psytoolkit.vim
" Language: psytoolkit - psychological queries and experiments
" By: Jakub Bortlik https://github.com/jakubbortlik/
" Last Changed: 2020 Jul 30
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("b:current_syntax")
  finish
endif

syntax clear
syntax case match

" Arguments to form (Manual, section 6.1)

syntax keyword psytoolkitType bitmap text progress

" Loops and conditionals

syntax keyword psytoolkitConditional if else elsif fi
syntax keyword psytoolkitRepeat while-end while 

" Statements

syntax keyword psytoolkitStatement clear silence sound show set save delay hide readmouse increase

" Environments

syntax keyword psytoolkitDefine table part block task blockorder bitmaps sounds fonts options
syntax keyword psytoolkitPrecondit include

" Mathematical Functions (Praat Manual, Formulas, section 4)

syntax keyword psytoolkitFunction range bitmap-under-mouse expression

" Attributes of objects

syntax keyword psytoolkitAttribute MOUSE_X MOUSE_Y RT BLOCKORDER BLOCKNAME BLOCKS BLOCKORDERS TRIALCOUNT

" syntax keyword psytoolkitObject ArtWord BarkFilter CC Cepstrum Cochleagram

" Tags and Calls
"syntax keyword psytoolkitTag
syntax match psytoolkitTag "@\(_\|\a\)\+:\?"

" MAIN MENU: New -
" syntax match psytoolkitCommand "\(Record mono sound\(:\)\@=\)"

" Variables
syntax match psytoolkitVar "\$\l\w*" "&\l\w*"

" String Assignment
syntax region psytoolkitString start=+"+ skip=+\\+  end=+"+
syntax region psytoolkitString start=+'+ skip=+\\+  end=+'+

" Delimiters

syntax match psytoolkitDelim "[{}()\\]"
syntax match psytoolkitDelim "[][]"

" Operators (Praat Manual, Formulas section 2)

"syntax match psytoolkitOperator "\(<>\|[<>!-=]=\|[<>+\-*^%/]\)"
syntax match psytoolkitOperator "\([=<>+\-*^%/!]\+\)"
syntax keyword psytoolkitOperator not and or

" Numbers

syntax match psytoolkitNumber "[-+]\?\d\+"
syntax match psytoolkitNumber "[-+]\?\d*\.\d\+"

" Comments
syntax match psytoolkitComment "#.*$"

" Define the default highlighting
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have
"  highlighting yet

if version >= 508 || !exists("did_psytoolkit_syn_inits")
	if version < 508
		let did_psytoolkit_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def <args>
	endif


highlight link psytoolkitAttribute Statement
highlight link psytoolkitCommand Underlined
highlight link psytoolkitComment Comment
highlight link psytoolkitCompStat Statement
highlight link psytoolkitConditional Conditional
highlight link psytoolkitConstant Constant
highlight link psytoolkitDelim Delimiter
highlight link psytoolkitDottedStat Statement
highlight link psytoolkitDefine Define 
highlight link psytoolkitFloat Float
highlight link psytoolkitFunction Function
highlight link psytoolkitStrFunc Function
highlight link psytoolkitStrSpec Function
highlight link psytoolkitKeyword Keyword
highlight link psytoolkitRepeat Repeat
highlight link psytoolkitStatement Statement
highlight link psytoolkitObject Type
highlight link psytoolkitPreCondit PreCondit
highlight link psytoolkitString String
highlight link psytoolkitVar Identifier

highlight link psytoolkitNumber Number
highlight link psytoolkitOperator Operator
highlight link psytoolkitType Type
highlight link psytoolkitTag Tag
highlight link psytoolkitTodo Todo

	delcommand HiLink
endif

let b:current_syntax = "psy"

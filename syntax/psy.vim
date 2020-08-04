" Vim syntax file
" Filename: psy.vim
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

syntax keyword psyType bitmap text progress

" Loops and conditionals

syntax keyword psyConditional if else elsif fi
syntax keyword psyRepeat while-end while 

" Statements

syntax keyword psyStatement clear silence sound show set save delay hide readmouse increase

" Environments

syntax keyword psyDefine table part block task blockorder bitmaps sounds fonts options
syntax keyword psyPrecondit include

syntax keyword psyFunction range bitmap-under-mouse expression

" Attributes of objects

syntax keyword psyAttribute MOUSE_X MOUSE_Y RT BLOCKORDER BLOCKNAME BLOCKS BLOCKORDERS TRIALCOUNT

" syntax keyword psyObject ArtWord BarkFilter CC Cepstrum Cochleagram

" Tags and Calls
"syntax keyword psyTag
syntax match psyTag "@\(_\|\a\)\+:\?"

" MAIN MENU: New -
" syntax match psyCommand "\(Record mono sound\(:\)\@=\)"

" Variables
syntax match psyVar "\$\l\w*" "&\l\w*"

" String Assignment
syntax region psyString start=+"+ skip=+\\+  end=+"+
syntax region psyString start=+'+ skip=+\\+  end=+'+

" Delimiters

syntax match psyDelim "[{}()\\]"
syntax match psyDelim "[][]"

"syntax match psyOperator "\(<>\|[<>!-=]=\|[<>+\-*^%/]\)"
syntax match psyOperator "\([=<>+\-*^%/!]\+\)"
syntax keyword psyOperator not and or

" Numbers

syntax match psyNumber "[-+]\?\d\+"
syntax match psyNumber "[-+]\?\d*\.\d\+"

" Comments
syntax match psyComment "#.*$"

" Define the default highlighting
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have
"  highlighting yet

if version >= 508 || !exists("did_psy_syn_inits")
	if version < 508
		let did_psy_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def <args>
	endif


highlight link psyAttribute Statement
highlight link psyCommand Underlined
highlight link psyComment Comment
highlight link psyCompStat Statement
highlight link psyConditional Conditional
highlight link psyConstant Constant
highlight link psyDelim Delimiter
highlight link psyDottedStat Statement
highlight link psyDefine Define 
highlight link psyFloat Float
highlight link psyFunction Function
highlight link psyStrFunc Function
highlight link psyStrSpec Function
highlight link psyKeyword Keyword
highlight link psyRepeat Repeat
highlight link psyStatement Statement
highlight link psyObject Type
highlight link psyPreCondit PreCondit
highlight link psyString String
highlight link psyVar Identifier

highlight link psyNumber Number
highlight link psyOperator Operator
highlight link psyType Type
highlight link psyTag Tag
highlight link psyTodo Todo

	delcommand HiLink
endif

let b:current_syntax = "psy"

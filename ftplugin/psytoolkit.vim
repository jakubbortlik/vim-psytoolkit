" Vim filetype plugin
" Last Change: Aug 04, 2020
" Maintainer: Jakub Bortlík <jakub.bortlik@protonmail.com>

" Prevent duplicate loading
if exists("b:did_psyftp")
	finish
endif
let b:did_psyftp = 1

" Add matchit.vim support:
let b:match_words='\<if\>:\<fi\>,\<while\>:\<while-end\>,\<tasklist\>:\<end\>'

" Comments start with a hash
setlocal commentstring=#%s

" Set 'formatoptions' to break comment lines but not other lines,
" insert the comment leader when hitting <CR> or using "o",
" and remove a comment leader when joining lines.
setlocal fo-=t fo+=croqlj

" Format comments to be up to 80 characters long
if &tw == 0
	setlocal tw=80
endif

" Set the foldmethod
setlocal foldmethod=indent

" Vim indent file
" Language:    PsyToolkit experiment scripting syntax
"              Based on vim.vim by Bram Moolenaar
" Maintainer:  Jakub Bortlík <jakub.bortlik@protonmail.com>
" URL:         https://github.com/jakubbobrtlik/vim-psytoolkit
" Last Change: 2020 Aug 04
" Filenames:   *.psy
" License:     VIM License

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetPsytoolkitIndent()
setlocal indentkeys+==end
setlocal indentkeys+==fi,=while-end

let b:undo_indent = "setl indentkeys< indentexpr<"

" Only define the function once.
if exists("*GetPsytoolkitIndent")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

function GetPsytoolkitIndent()
  let ignorecase_save = &ignorecase
  try
    let &ignorecase = 0
    return GetPsytoolkitIndentIntern()
  finally
    let &ignorecase = ignorecase_save
  endtry
endfunc

function GetPsytoolkitIndentIntern()
  " Find a non-blank line above the current line.
  let lnum = prevnonblank(v:lnum - 1)

  " Get the current line
  let cur_text = getline(v:lnum)

  " At the start of the file use zero indent.
  if lnum == 0
    return 0
  endif
  let prev_text = getline(lnum)

  " Add a 'shiftwidth' after 'if', 'elsif', 'elif', 'else', 'for', 'while',
  " 'procedure', 'beginPause' and 'form'.
  let ind = indent(lnum)
  let i = match(prev_text, '^\s*\(if\|while\|tasklist\)\>')
  if i >= 0
	let ind += shiftwidth()
  endif

  " Subtract a 'shiftwidth' on a 'fi', 'end', 'while-end'.
  if cur_text =~ '^\s*\(end\|fi\|while-end\)'
    let ind = ind - shiftwidth()
  endif

  return ind
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo

" vim:sw=2

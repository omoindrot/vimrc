"Remap <ESC> to jk
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
" Evil
inoremap <ESC> <nop>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-expand-region
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map + <Plug>(expand_region_expand)
map = <Plug>(expand_region_shrink)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['pylint'],
\}

" Only run the linters when saving the file
let g:ale_lint_on_text_changed = 'never'
" Don't run linters when opening the file
let g:ale_lint_on_enter = 0

" Prevent auto-closing of parenthesis
let g:AutoPairs = {}

" When I don't have the right version
"let g:go_version_warning = 0

" Disable this if vim version is lower
"let g:loaded_comfortable_motion = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SuperTab (autocomplete)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

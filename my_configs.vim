"Remap <ESC> to jk
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
" Evil
inoremap <ESC> <nop>


"Remap <C-w> to <C-q> for easier window switch
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Open new split panes with cursor there
set splitbelow
set splitright

"Autocomplete
" imap <Tab> <C-P>


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
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

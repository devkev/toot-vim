" File:        toot.vim
" Description: Toot filetype detection
" Author:      Kevin Pulo <kev@pulo.com.au>
" License:     Vim license
" Website:     http://github.com/devkev/toot-vim
" Version:     0.1

" Save context {{{1
let s:save_cpo = &cpo
set cpo&vim

" General options {{{1
" Some options lose their values when window changes. They will be set every
" time this script is invocated, which is whenever a file of this type is
" created or edited.
setlocal textwidth=0
setlocal wrapmargin=0
setlocal expandtab
setlocal shiftwidth=2
setlocal wrap linebreak
setlocal showbreak=\ \ 
setlocal breakindent

" Mappings {{{1
" Mark done {{{2
nnoremap <script> <silent> <buffer> <localleader>y :call toot#mark_as_done()<CR>
vnoremap <script> <silent> <buffer> <localleader>y :call toot#mark_as_done()<CR>
nnoremap <script> <silent> <buffer> <localleader>d :call toot#mark_as_done()<CR>
vnoremap <script> <silent> <buffer> <localleader>d :call toot#mark_as_done()<CR>

" Mark won't do {{{2
nnoremap <script> <silent> <buffer> <localleader>n :call toot#mark_as_wontdo()<CR>
vnoremap <script> <silent> <buffer> <localleader>n :call toot#mark_as_wontdo()<CR>
nnoremap <script> <silent> <buffer> <localleader>x :call toot#mark_as_wontdo()<CR>
vnoremap <script> <silent> <buffer> <localleader>x :call toot#mark_as_wontdo()<CR>

" Mark todo {{{2
nnoremap <script> <silent> <buffer> <localleader>t :call toot#mark_as_todo()<CR>
vnoremap <script> <silent> <buffer> <localleader>t :call toot#mark_as_todo()<CR>
nnoremap <script> <silent> <buffer> <localleader>- :call toot#mark_as_todo()<CR>
vnoremap <script> <silent> <buffer> <localleader>- :call toot#mark_as_todo()<CR>

" Remove completed {{{2
nnoremap <script> <silent> <buffer> <localleader>D :call toot#remove_completed()<CR>

" Move line up/down {{{2
nnoremap <script> <silent> <buffer> gJ J
nnoremap <script> <silent> <buffer> gK K
nnoremap <script> <silent> <buffer> g<C-J> <C-J>
nnoremap <script> <silent> <buffer> g<C-K> <C-K>

nnoremap <script> <silent> <buffer> J :m +1<CR>
nnoremap <script> <silent> <buffer> K :m -2<CR>
nnoremap <script> <silent> <buffer> <C-J> :m /^.*:$/<CR>
nnoremap <script> <silent> <buffer> <C-K> :m -2<CR>:m ?^.*:$?<CR>

vnoremap <script> <silent> <buffer> J :m '>+1<CR>gv
vnoremap <script> <silent> <buffer> K :m '<-2<CR>gv
vnoremap <script> <silent> <buffer> <C-J> :m /^.*:$/<CR>gv
vnoremap <script> <silent> <buffer> <C-K> :m '<-2<CR>gv:m ?^.*:$?<CR>gv

" Folding {{{1
" Options {{{2
setlocal foldmethod=expr
setlocal foldexpr=s:toot_fold_level(v:lnum)
setlocal foldtext=s:toot_fold_text()

" s:toot_fold_level(lnum) {{{2
function! s:toot_fold_level(lnum)
    " The match function returns the index of the matching pattern or -1 if
    " the pattern doesn't match. In this case, we always try to match a
    " completed task from the beginning of the line so that the matching
    " function will always return -1 if the pattern doesn't match or 0 if the
    " pattern matches. Incrementing by one the value returned by the matching
    " function we will return 1 for the completed tasks (they will be at the
    " first folding level) while for the other lines 0 will be returned,
    " indicating that they do not fold.
    return match(getline(a:lnum),'^\s*\([✔✗]\|\[[xXnN]\]\)\s.\+$') + 1
endfunction

" s:toot_fold_text() {{{2
function! s:toot_fold_text()
    " The text displayed at the fold is formatted as '+- N Completed tasks'
    " where N is the number of lines folded.
    return '+' . v:folddashes . ' '
                \ . (v:foldend - v:foldstart + 1)
                \ . ' Completed tasks '
endfunction

" Restore context {{{1
let &cpo = s:save_cpo
" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et

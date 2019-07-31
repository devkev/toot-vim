" File:        toot.vim
" Description: Toot filetype detection
" Author:      Kevin Pulo <kev@pulo.com.au>
" License:     Vim license
" Website:     http://github.com/devkev/toot-vim
" Version:     0.1

" Functions {{{1
function! toot#mark_as_done()
    execute 'normal! I[x] '
endfunction

function! toot#mark_as_wontdo()
    execute 'normal! I[n] '
endfunction

function! s:append_to_file(file, lines)
    let l:lines = []

    " Place existing tasks in done.txt at the beggining of the list.
    if filereadable(a:file)
        call extend(l:lines, readfile(a:file))
    endif

    " Append new completed tasks to the list.
    call extend(l:lines, a:lines)

    " Write to file.
    call writefile(l:lines, a:file)
endfunction

function! toot#remove_completed()
    " Check if we can write to done.txt before proceeding.

    let l:target_dir = expand('%:p:h')
    let l:toot_file = expand('%:p')
    let l:done_file = substitute(substitute(l:toot_file, 'todo$', 'done', ''), 'Todo$', 'Done', '')
    if !filewritable(l:done_file) && !filewritable(l:target_dir)
        echoerr "Can't write to file 'done.txt'"
        return
    endif

    let l:completed = []
    :g/^\[xXnN\] /call add(l:completed, getline(line(".")))|d
    call s:append_to_file(l:done_file, l:completed)
endfunction

" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et

" File:        toot.vim
" Description: Toot filetype detection
" Author:      Kevin Pulo <kev@pulo.com.au>
" License:     Vim license
" Website:     http://github.com/devkev/toot-vim
" Version:     0.1

" Export Context Dictionary for unit testing {{{1
function! s:get_SID()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_')
endfunction
let s:SID = s:get_SID()
delfunction s:get_SID

function! toot#__context__()
    return { 'sid': s:SID, 'scope': s: }
endfunction

" Functions {{{1
function! s:remove_priority()
    :s/^(\w)\s\+//ge
endfunction

function! s:get_current_date()
    return strftime('%Y-%m-%d')
endfunction

function! toot#prepend_date()
    execute 'normal! I' . s:get_current_date() . ' '
endfunction

function! toot#replace_date()
    let current_line = getline('.')
    if (current_line =~ '^\(([a-zA-Z]) \)\?\d\{2,4\}-\d\{2\}-\d\{2\} ') &&
                \ exists('g:toot_existing_date') && g:toot_existing_date == 'n'
        return
    endif
    execute 's/^\(([a-zA-Z]) \)\?\(\d\{2,4\}-\d\{2\}-\d\{2\} \)\?/\1' . s:get_current_date() . ' /'
endfunction

function! toot#mark_as_done()
    call s:remove_priority()
    call toot#prepend_date()
    execute 'normal! Ix '
endfunction

function! toot#mark_all_as_done()
    :g!/^x /:call toot#mark_as_done()
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
    :g/^x /call add(l:completed, getline(line(".")))|d
    call s:append_to_file(l:done_file, l:completed)
endfunction

function! toot#sort_by_context() range
    execute a:firstline . "," . a:lastline . "sort /\\(^\\| \\)\\zs@[^[:blank:]]\\+/ r"
endfunction

function! toot#sort_by_project() range
    execute a:firstline . "," . a:lastline . "sort /\\(^\\| \\)\\zs+[^[:blank:]]\\+/ r"
endfunction

function! toot#sort_by_date() range
    let l:date_regex = "\\d\\{2,4\\}-\\d\\{2\\}-\\d\\{2\\}"
    execute a:firstline . "," . a:lastline . "sort /" . l:date_regex . "/ r"
    execute a:firstline . "," . a:lastline . "g!/" . l:date_regex . "/m" . a:lastline
endfunction

function! toot#sort_by_due_date() range
    let l:date_regex = "due:\\d\\{2,4\\}-\\d\\{2\\}-\\d\\{2\\}"
    execute a:firstline . "," . a:lastline . "sort /" . l:date_regex . "/ r"
    execute a:firstline . "," . a:lastline . "g!/" . l:date_regex . "/m" . a:lastline
endfunction

" Increment and Decrement The Priority
:set nf=octal,hex,alpha

function! toot#prioritize_increase()
    normal! 0f)h
endfunction

function! toot#prioritize_decrease()
    normal! 0f)h
endfunction

function! toot#prioritize_add(priority)
    " Need to figure out how to only do this if the first visible letter in a line is not (
    :call toot#prioritize_add_action(a:priority)
endfunction

function! toot#prioritize_add_action(priority)
    execute 's/^\(([a-zA-Z]) \)\?/(' . a:priority . ') /'
endfunction

" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1

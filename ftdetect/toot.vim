" File:        toot.vim
" Description: Toot filetype detection
" Author:      Kevin Pulo <kev@pulo.com.au>
" License:     Vim license
" Website:     http://github.com/devkev/toot-vim
" Version:     0.1

autocmd BufNewFile,BufRead [Tt]odo.txt set filetype=toot
autocmd BufNewFile,BufRead *.[Tt]odo.txt set filetype=toot
autocmd BufNewFile,BufRead [Dd]one.txt set filetype=toot
autocmd BufNewFile,BufRead *.[Dd]one.txt set filetype=toot


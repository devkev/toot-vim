" File:        toot.vim
" Description: Toot syntax settings
" Author:      Kevin Pulo <kev@pulo.com.au>
" License:     Vim license
" Website:     http://github.com/devkev/toot-vim
" Version:     0.1

if exists("b:current_syntax")
    finish
endif

syntax  match  TootDone       '^\s*\(✔\|\[[xX]\]\)\s.\+$'
syntax  match  TootWontdo     '^\s*\(✗\|\[[nN]\]\)\s.\+$'
syntax  match  TootHeading    '^[^[:space:]✔✗\[-].\+:$'

" Other priority colours might be defined by the user
highlight  default  link  TootDone       Identifier
highlight  default  link  TootWontdo     Comment
highlight  default  link  TootHeading    Statement

let b:current_syntax = "toot"

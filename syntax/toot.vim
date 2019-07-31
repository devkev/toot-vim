" File:        toot.vim
" Description: Toot syntax settings
" Author:      Kevin Pulo <kev@pulo.com.au>
" License:     Vim license
" Website:     http://github.com/devkev/toot-vim
" Version:     0.1

if exists("b:current_syntax")
    finish
endif

syntax  match  TootDone       '^[xX]\s.\+$'
syntax  match  TootPriorityA  '^([aA])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityB  '^([bB])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityC  '^([cC])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityD  '^([dD])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityE  '^([eE])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityF  '^([fF])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityG  '^([gG])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityH  '^([hH])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityI  '^([iI])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityJ  '^([jJ])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityK  '^([kK])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityL  '^([lL])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityM  '^([mM])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityN  '^([nN])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityO  '^([oO])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityP  '^([pP])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityQ  '^([qQ])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityR  '^([rR])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityS  '^([sS])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityT  '^([tT])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityU  '^([uU])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityV  '^([vV])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityW  '^([wW])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityX  '^([xX])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityY  '^([yY])\s.\+$'             contains=TootDate,TootProject,TootContext
syntax  match  TootPriorityZ  '^([zZ])\s.\+$'             contains=TootDate,TootProject,TootContext

syntax  match  TootDate       '\d\{2,4\}-\d\{2\}-\d\{2\}' contains=NONE
syntax  match  TootProject    '\(^\|\W\)+[^[:blank:]]\+'  contains=NONE
syntax  match  TootContext    '\(^\|\W\)@[^[:blank:]]\+'  contains=NONE

" Other priority colours might be defined by the user
highlight  default  link  TootDone       Comment
highlight  default  link  TootPriorityA  Constant
highlight  default  link  TootPriorityB  Statement
highlight  default  link  TootPriorityC  Identifier
highlight  default  link  TootDate       PreProc
highlight  default  link  TootProject    Special
highlight  default  link  TootContext    Special

let b:current_syntax = "toot"

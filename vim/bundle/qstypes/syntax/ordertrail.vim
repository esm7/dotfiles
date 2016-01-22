if exists("b:current_syntax")
  finish
endif

" The following is not bullet-proof and may sometimes highlight wrong line parts.
" However, more complicated implementations that include the separator in the matches
" make life harder because they contradict the 'Separator' match. It's solveable in a
" few ways (0-length matches, offsets) but all those options caused other issues that I
" didn't have time to work out...
syn match TagNumber '\d\{1,6}='
syn match Separator '[\d1]' conceal cchar=|
syn match ExecType '150=.'
syn match MsgType '35=.'
set conceallevel=1
set concealcursor=nv

hi def link TagNumber Type
hi def link MsgType Statement
hi def link ExecType Statement

let b:current_syntax = "ordertrail"

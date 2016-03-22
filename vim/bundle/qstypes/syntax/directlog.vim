if exists("b:current_syntax")
  finish
endif

syn match LogInfo '^ \. .*'
syn match LogWarning '^ \~\~ .*'
syn match LogError '^ ! .*'
syn match LogCritical '^!!!.*'

hi def link LogCritical ErrorMsg  
hi def link LogError Error
hi def link LogInfo Statement
hi def link LogWarning WarningMsg

let b:current_syntax = "directlog"

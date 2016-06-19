if exists("b:current_syntax")
  finish
endif

" We allow two line beginnings: the new one to denote Direct/Principle ("D: " or "P: ")
" or the old one without it
syn match LogInfo     '\(^[D\|P]: \)\|^ \. .*'
syn match LogWarning  '\(^[D\|P]: \)\|^ \~\~ .*'
syn match LogError    '\(^[D\|P]: \)\|^ ! .*'
syn match LogCritical '\(^[D\|P]: \)\|^!!!.*'

hi def link LogCritical ErrorMsg  
hi def link LogError Error
hi def link LogInfo Statement
hi def link LogWarning WarningMsg

let b:current_syntax = "directlog"

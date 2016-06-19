if exists("b:current_syntax")
  finish
endif

" We allow two line beginnings: the new one to denote Direct/Principle ("D: " or "P: ")
" or the old one without it
syn match LogInfo     '\(\(^[DP]: \)\|^\) \. .*'
syn match LogWarning  '\(\(^[DP]: \)\|^\) \~\~ .*'
syn match LogError    '\(\(^[DP]: \)\|^\) ! .*'
syn match LogCritical '\(\(^[DP]: \)\|^\)!!!.*'

hi def link LogCritical ErrorMsg  
hi def link LogError Error
hi def link LogInfo Statement
hi def link LogWarning WarningMsg

let b:current_syntax = "directlog"

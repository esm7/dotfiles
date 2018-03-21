if exists("b:current_syntax")
  finish
endif

syn match LogInfo     '\v^[0-9 -:,]+INFO.*'
syn match LogWarning  '\v^[0-9 -:,]+WARNING.*'
syn match LogError    '\v^[0-9 -:,]+ERROR.*'
syn match LogCritical '\v^[0-9 -:,]+CRITICAL.*'

hi def link LogCritical ErrorMsg  
hi def link LogError Error
hi def link LogWarning WarningMsg

let b:current_syntax = "genericlog"

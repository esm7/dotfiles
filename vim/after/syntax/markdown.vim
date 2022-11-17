" Don't spell-check URLs.
" Source: https://vi.stackexchange.com/questions/3990/ignore-urls-and-email-addresses-in-spell-file
" As the source says, this must be loaded *after* the syntax file of Markdown
syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell

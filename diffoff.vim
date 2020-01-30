function! GetBufferList()
	return filter(range(1,bufnr('$')), 'buflisted(v:val)')
endfunction

function! GetMatchingBuffers(pattern)
	return filter(GetBufferList(), 'bufname(v:val) =~ a:pattern')
endfunction

function! WipeMatchingBuffers(pattern)
	let l:matchList = GetMatchingBuffers(a:pattern)

	let l:count = len(l:matchList)
	if l:count < 1
		echo 'No buffers found matching pattern ' . a:pattern
		return
	endif

	if l:count == 1
		let l:suffix = ''
	else
		let l:suffix = 's'
	endif

	exec 'bw ' . join(l:matchList, ' ')
endfunction

command! Goffdiff call WipeMatchingBuffers('fugitive://')


function! docker_tools#util#echo_msg(msg) abort
	redraw
	echom "vim-docker: " . a:msg
endfunction

function! docker_tools#util#echo_error(msg) abort
	echohl errormsg
	call docker_tools#util#echo_msg(a:msg)
	echohl normal
endfunction

function! docker_tools#util#echo_warning(msg) abort
	echohl warningmsg
	call docker_tools#util#echo_msg(a:msg)
	echohl normal
endfunction

function! docker_tools#util#term_win_open(command,termname) abort
	if has('nvim')
		silent execute printf("botright %d split TERM",g:dockertools_term_size)
		call termopen(a:command)
	elseif has('terminal')
		silent execute printf("botright %d split TERM",g:dockertools_term_size)
		call term_start(a:command,{"term_finish":['open','close'][g:dockertools_term_closeonexit],"term_name":a:termname,"curwin":"1"})
	else
		call docker_tools#util#echo_error('terminal is not supported')
	endif
endfunction

function! docker_tools#util#sudo_mode() abort
	return ['','sudo '][g:dockertools_sudo_mode]
endfunction
" vim: fdm=marker:

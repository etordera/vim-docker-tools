function! s:refresh_container_list() abort
	let container_str = system(docker_tools#util#sudo_mode().g:dockertools_docker_cmd.' ps -a --format="{{.ID}} {{.Names}}"')
	let s:container_list = split(container_str)
endfunction

function! docker_tools#container#complete(ArgLead, CmdLine, CursorPos) abort
	if !exists('s:container_list')
		call s:refresh_container_list()
	endif
	return filter(s:container_list, 'v:val =~ "^'.a:ArgLead.'"')
endfunction
" vim: fdm=marker:

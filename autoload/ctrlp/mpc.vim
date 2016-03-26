if ( exists('g:loaded_ctrlp_mpc') && g:loaded_ctrlp_mpc ) || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_mpc = 1


call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#mpc#init()',
  \ 'accept': 'ctrlp#mpc#accept',
  \ 'lname': 'mpc artists',
  \ 'sname': 'mpc',
  \ 'type': 'line',
  \ 'specinput': 0,
  \ })
"
" Artist section
""""""""""""""""
  function! ctrlp#mpc#init()
    if (!exists('g:artists'))
      let com = 'mpc list artist'
      let g:artists = split(system(com), '\n')
    endif

    return g:artists
  endfunction

  function! ctrlp#mpc#accept(mode, str)
    call ctrlp#exit()

    let g:selected_artist = a:str
    call ctrlp#init(ctrlp#mpc_track#id())
  endfunction

  let s:artist_id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
  function! ctrlp#mpc#id()
    return s:artist_id
  endfunction

  function! ctrlp#mpc#clear_cache()
    if (exists('g:artists'))
      unlet g:artists
    endif
  endfunction
" vim:nofen:fdl=0:ts=2:sw=2:sts=2

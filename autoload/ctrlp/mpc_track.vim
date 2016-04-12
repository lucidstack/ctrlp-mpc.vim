scriptencoding utf-8

if ( exists('g:loaded_ctrlp_mpc_track') && g:loaded_ctrlp_mpc_track ) || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_mpc_track = 1

call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#mpc_track#init()',
  \ 'accept': 'ctrlp#mpc_track#accept',
  \ 'lname': 'mpctracks',
  \ 'sname': 'mpctracks',
  \ 'specinput': 0,
  \ 'type': 'tabs',
  \ })

" Track section
"""""""""""""""
  " thank you, ctrlpvim/ctrlp.vim/blob/master/autoload/ctrlp/tag.vim! :)
  function! s:syntax()
    if !ctrlp#nosy()
      call ctrlp#hicheck('CtrlPTabExtra', 'Comment')
      syntax match CtrlPTabExtra '\zs\t.*\ze$'
    endif
  endfunction

  function! ctrlp#mpc_track#init()
    let com = 'mpc -f "[[%artist% - ]%title%]\t%file%" search Artist ' . shellescape(g:selected_artist)
    let list = map(systemlist(com), 'substitute(v:val, "\r", "", "")')

    cal s:syntax()
    return list
  endfunction

  function! ctrlp#mpc_track#accept(mode, str)
    call ctrlp#exit()

    let track = matchstr(a:str, '\t\zs.*$')
    let add_com = 'mpc add ' . shellescape(track)
    silent call system(add_com)

    let length_com = 'mpc playlist'
    let length = len(split(system(length_com), '\n'))
    let play_com = 'mpc play ' . length
    silent call system(play_com)

    echo '♬ Playing ' . split(system('mpc status'), '\n')[0]
  endfunction

  let s:track_id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
  function! ctrlp#mpc_track#id()
    return s:track_id
  endfunction


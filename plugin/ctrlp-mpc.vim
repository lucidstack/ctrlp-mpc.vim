command! CtrlPMpc call ctrlp#init(ctrlp#mpc#id())
nnoremap <plug>(ctrlp-mpc) :<c-u>CtrlPMpc<cr>

command! CtrlPMpcClear call ctrlp#mpc#clear_cache()
nnoremap <plug>(ctrlp-mpc-clear) :<c-u>CtrlPMpcClear<cr>

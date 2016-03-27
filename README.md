# ctrlp-mpc.vim

There's nothing that breaks my concentration more than having to switch windows and find that 
[Daft Punk tune I *really* want to listen to right now](https://www.youtube.com/watch?v=zhl-Cs1-sG4),
so...why not ~~Zoidberg~~ ctrlp?

[![asciicast](https://asciinema.org/a/84bikfra6lw0jsqccb1mua6uv.png)](https://asciinema.org/a/84bikfra6lw0jsqccb1mua6uv)

## Installation

Knock yourself out and install this repo in whichever way you prefer(`Plugin 'lucidstack/ctrlp-mpc.vim'`, 
if you are on Vundle like me), then add `'mpc'` to the ctrlp extensions (in your `.vimrc`):
```
    let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir', 'tmux', 'mpc'] " <- here it is
```
and, optionally, a leader shortcut:
```
  " Sheer awesomeness
  nnoremap <Leader>m :CtrlPMpc<CR>
```

## je cache, tu caches, il cache

ctrlp-mpc.vim has a little cache in place for artists. These can be A LOT, and on my library it takes a couple
of seconds to load, so I figured I'd add a cache for it.

If you happen to add artists while vim is running, you can run `:CtrlPMpcClear` to clear the cache!

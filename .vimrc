" Visual
set encoding=utf-8
set number
set relativenumber
syntax enable
set showmode

" Search
set ignorecase " Ignore case when searching
set hlsearch " Highlight search results
" Clipboard

"use system keyboard
"set clipboard=unnamed
set clipboard+=unnamed
set mouse=r

" Bindings
command W w !sudo tee % > /dev/null " :W sudo saves files


" Python

" Kite Autocomplete status line
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2  " always display the status line

filetype indent on
filetype plugin on
autocmd FileType python set breakindentopt=shift:4

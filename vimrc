set nocompatible
" change viminfo directory
set viminfo+=n~/.vim/viminfo

" -----------------------------------------------
" Plugins

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'

" Programming
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'

" Vim-airline
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" let g:airline_theme='gruvbox'

" Color schemes
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

" -----------------------------------------------
" Visual

syntax enable
set encoding=utf-8
set number
set relativenumber
set showmode
set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set nohlsearch
set mouse=a
set cursorline
set background=dark
colorscheme gruvbox
" colorscheme solarized8_dark_low

" -----------------------------------------------
" Powerline

set rtp+=$HOME/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" -----------------------------------------------
" Search

set ignorecase
set hlsearch
nnoremap <CR> :noh<CR><CR>
let mapleader="\<Space>"

" -----------------------------------------------
" Clipboard

set clipboard+=unnamed

" Copy and paste to/from system register
vnoremap <C-c> "+y
inoremap <C-v> <C-r>+
map <C-v> "+P

" Keep clipboard on exit
if executable("xclip")
	autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+')) 
endif

" -----------------------------------------------
" LaTeX

" Auto-compile
autocmd FileType tex,latex,plaintex nnoremap <buffer> <Leader>p :w <bar> !$SCRIPTS/latex_autocompile_vim/latex_script.sh % & disown <CR><CR>

" -----------------------------------------------
" Python

" Run current file (<leader> + L to add args before execution)
autocmd FileType python,py nnoremap <buffer> <leader>l :w <bar> !python % 
autocmd FileType python,py nnoremap <buffer> <leader>p :w <bar> !python % <CR>

" Kite Autocomplete status line
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2  " always display the status line

filetype indent on
filetype plugin on
autocmd FileType python set breakindentopt=shift:4

" -----------------------------------------------
" Miscellaneous bindings

command W w !sudo tee % > /dev/null 
" :W sudo saves files
map <C-n> :NERDTreeToggle<CR>

set nocompatible " Required

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

" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
Plugin 'tomasr/molokai'

" Required, plugins available after
call vundle#end()
filetype plugin indent on

" -----------------------------------------------
" Visual
set encoding=utf-8
set number
set relativenumber
syntax enable
set showmode
set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set nohlsearch


set background=dark
" colorscheme pablo
colorscheme gruvbox
let g:airline_theme='gruvbox'


" Powerline
set rtp+=$HOME/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256





" if has('termguicolors')
"     set termguicolors
" endif
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'
" colorscheme gruvbox-material


" Search
set ignorecase " Ignore case when searching
set hlsearch " Highlight search results


" Set leader to SPACE
let mapleader="\<Space>"


"use system keyboard
"set clipboard=unnamed
set clipboard+=unnamed
set mouse=r


" -----------------------------------------------
" Bindings
command W w !sudo tee % > /dev/null 
" :W sudo saves files
map <C-n> :NERDTreeToggle<CR>

" Copy and paste to/from system register
vnoremap <C-c> "+y
map <C-v> "+P
" vnoremap <C-c "*y :let @+=@*<CR>

" LaTeX Compile
"nnoremap <C-@>
autocmd FileType tex,latex,plaintex nnoremap <buffer> <Leader>p :w <bar> !$SCRIPTS/latex_autocompile_vim/latex_script.sh % & disown <CR><CR>

" Python run current file (add <CR> to run without args)
autocmd FileType python,py nnoremap <buffer> <leader>p :w <bar> !python % 

" Python

" Kite Autocomplete status line
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2  " always display the status line

filetype indent on
filetype plugin on
autocmd FileType python set breakindentopt=shift:4


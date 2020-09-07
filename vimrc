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
" Plugin 'tpope/vim-fugitive'

" Writing
Plugin 'junegunn/goyo.vim'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'

" Vim-airline
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" let g:airline_theme='gruvbox'

" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

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
set history=1000
set autoread
set mouse=a
set scrolloff=16
set cursorline
set wrap linebreak
set background=dark
colorscheme gruvbox
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
"colorscheme solarized

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
" Tabs

set autoindent
set tabstop=4
set softtabstop=4

" indentation
set shiftwidth=4
set shiftround

" ctrl+v <tab> to insert actual \t character
set smarttab
set expandtab

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
"  Goyo

" ENTER GOYO
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q! 
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

" EXIT GOYO
function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=16
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
	  if b:quitting_bang
		  qa!
	  else
		  qa
	  endif
  endif 
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Map movement keys for wrapped lines
noremap <silent> k gk
noremap <silent> j gj
onoremap <silent> j j
onoremap <silent> k k

" Toggle Goyo
" autocmd FileType markdown,text,latex,plaintex 
nnoremap <buffer> <Leader>g :Goyo<CR>

"<bar>set cursorline!

let g:goyo_width = 106
" g:goyo_height 85
" g:goyo_linenr 0
" g:goyo_margin_top 4
" g:goyo_margin_bottom 4

" -----------------------------------------------
"  Notes
autocmd FileType markdown,md nnoremap <buffer> <Leader>s I<strike><esc>A</strike>

" -----------------------------------------------
" LaTeX

" Auto-compile
autocmd FileType xtx,latex,tex,plaintex nnoremap <buffer> <Leader>p :w <bar> !$SCRIPTS/latex_autocompile_vim/latex_script.sh % & disown <CR>

" Vimtex
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf/#src:@line@tex'
let g:vimtex_view_general_options_latemk = '--unique'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UtilSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" UtilSnips Snippets
"
" (remove backslashes before quotes)
"snippet beg \"begin{} / end{}\" bA
"\begin{$1}
    "$0
"\end{$1}
"endsnippet

" -----------------------------------------------
" Bash

autocmd FileType bash,sh nnoremap <buffer> <leader>l :w <bar> !sh % 
autocmd FileType bash,sh nnoremap <buffer> <leader>p :w <bar> !sh % <CR>

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

" command W w !sudo tee % > /dev/null 
" :W sudo saves files
map <C-n> :NERDTreeToggle<CR>

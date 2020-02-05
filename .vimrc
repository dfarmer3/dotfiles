set nocompatible              " required
filetype off                  " required


" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
set encoding=utf-8
set number
set relativenumber
set encoding=utf-8
set spell

"Always show current position
set ruler

" Height of the command bar
"set cmdheight=2

" Add a bit extra margin to the left
"set foldcolumn=1

" syntax on
syntax enable
"filetype indent on
"filetype plugin on
autocmd FileType python set breakindentopt=shift:4

set mouse=a

"use system keyboard
"set clipboard=unnamed
set clipboard=unnamedplus

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set wildmenu "visual autocomplete for command menu
set lazyredraw "redraws only when needed
set showmatch " visual autocomplete for command menu
set incsearch " search as characters are entered
set hlsearch  " highlight matches



"Folds (Compress)
set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevel=99
nnoremap <space> za    
" space open/closes folds

set foldnestmax=10      " 10 nested fold max
set foldlevelstart=10   " open most folds by default


" PYTHON SPECIFIC SETTINGS :
let g:SimpylFold_docstring_preview=1

" Python PEP 8 indentation:
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"
"" Python syntax highlighting
let python_highlight_all=1
"
"" Indentation for other File Types (Check out fftypes plugin for
"" Different .vimrc's for each filetype)
"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2




""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" Solarized Dark
set background=dark
"colorscheme solarized
colorscheme flattened_dark


" Solarized Light
"set background=light
"colorscheme solarized
"colorscheme flattened_light

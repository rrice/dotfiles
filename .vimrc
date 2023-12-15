set nocompatible


if version >= 600
syntax enable
else
syntax on
endif

" -------------------------------------------------------------------
" Visual prefrences
" -------------------------------------------------------------------

" Set background
set background=dark

set showfulltag       
set showmode

" Show matching parentheses / brackets.
set showmatch         

" Tab preferences
set smarttab
set shiftwidth=4
set tabstop=4

" Line preferences
set number
set ruler


" No bells 
set visualbell
set noerrorbells

" Set the title bar
set title

" Use a scrollable menu for filename completions.
set wildmenu 

" GUI specific visuals
if has("gui_running")
" Use GUI tabs
set guioptions+=e

" No menu bar
set guioptions-=T

" No scrollbars
set guioptions-=r
set guioptions-=L

colorscheme pablo
endif


" -------------------------------------------------------------------
" File / buffer handling
" -------------------------------------------------------------------

" Set utf-8 as the standard encoding
set encoding=utf8     

" Set the order of preference for file type.
set ffs=unix,dos,mac  

" Auto read a file when it is changed externally.
set autoread          

" No backup generated.
set nobackup

" No swap file
set noswapfile


" ------------------------------------------------------------------
" Search preferences
" ------------------------------------------------------------------

" Exclusive selection.
set selection=exclusive

"Ignore case when searching.
set ignorecase       

"Smart case handling when searching.
set smartcase         

" Incremental search.
set incsearch

map Q <Nop>

" -------------------------------------------------------------
" vim-plug 
" -------------------------------------------------------------

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting




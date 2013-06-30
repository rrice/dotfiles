set nocompatible

if version >= 600
	syntax enable
	filetype plugin on
	filetype indent on
else
	syntax on
endif
  
" -------------------------------------------------------------------
" Visual prefrences
" -------------------------------------------------------------------

" Set background
set background=dark

" Get function usage help automatically.
set showfulltag       

" Show matching parentheses / brackets.
set showmatch         

" > and < move block by 4 spaces.
set shiftwidth=4

" Default tabstop is 4 spaces
set tabstop=4

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

"Expand tabs to spaces.
set expandtab               

" Turn on auto indenting.
set autoindent        

" Keep 500 lines of command history.
set history=500       

" Show the cursor position all the time.
set ruler             

" The height of the command bar.
set cmdheight=1     

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

" ------------------------------------------------------------------
"  Custom key bindings
" ------------------------------------------------------------------




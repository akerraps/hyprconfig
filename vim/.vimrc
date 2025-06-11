" ------------------------------
" BASIC SETTINGS
" ------------------------------

set nocompatible          " Disable compatibility with old vi
set encoding=utf-8        " Use UTF-8 encoding
set number                " Show absolute line numbers
set relativenumber        " Show relative line numbers (useful for navigation)
set mouse=a               " Enable mouse support in all modes
set clipboard=unnamedplus " Use system clipboard for yank/paste

" ------------------------------
" INDENTATION
" ------------------------------

set autoindent            " Copy indentation from the previous line
set smartindent           " Smart auto-indenting for code
set tabstop=4             " A tab is displayed as 4 spaces
set shiftwidth=4          " Indentation uses 4 spaces
set expandtab             " Convert tabs to spaces

" ------------------------------
" SEARCH
" ------------------------------

set ignorecase            " Case-insensitive searching...
set smartcase             " ...unless uppercase letters are used
set incsearch             " Highlight matches while typing
set hlsearch              " Highlight all matches of the search

" ------------------------------
" APPEARANCE
" ------------------------------

syntax on                 " Enable syntax highlighting
set termguicolors         " Enable 24-bit RGB colors in terminal
set background=dark       " Set background theme to dark
colorscheme zenburn

" ------------------------------
" USABILITY
" ------------------------------

set scrolloff=8           " Keep 8 lines of context when scrolling
set wrap                  " Wrap long lines (soft wrap)
set wildmenu              " Enhanced command-line completion
set cursorline            " Highlight the current line
set showcmd               " Show incomplete commands
set showmode              " Show current mode (normal/insert/visual/etc)

" ------------------------------
" CUSTOM KEYBINDINGS
" ------------------------------

" Set space as leader key
let mapleader=" "

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Toggle NERDTree with F2
nnoremap <F2> :NERDTreeToggle<CR>

" Clear search highlights with Enter
nnoremap <CR> :nohlsearch<CR>

" ------------------------------
" FINAL SETTINGS
" ------------------------------

filetype plugin indent on   " Enable filetype-specific plugins and indentation


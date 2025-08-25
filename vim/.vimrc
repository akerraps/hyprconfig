" ------------------------------
" BASIC SETTINGS
" ------------------------------

set nocompatible          " Disable compatibility with old vi
set encoding=utf-8        " Use UTF-8 encoding
" set number                " Show absolute line numbers
" set relativenumber        " Show relative line numbers (useful for navigation)
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
colorscheme gruvbox

" ------------------------------
" USABILITY
" ------------------------------

set scrolloff=8           " Keep 8 lines of context when scrolling
set wrap                  " Wrap long lines (soft wrap)
set wildmenu              " Enhanced command-line completion
set cursorline            " Highlight the current line
set showcmd               " Show incomplete commands
set showmode              " Show current mode (normal/insert/visual/etc)
highlight Normal ctermbg=NONE guibg=NONE

" ------------------------------
" CUSTOM KEYBINDINGS
" ------------------------------

" Set space as leader key
let mapleader=" "

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Exit with Ctrl+x
nnoremap <C-x> :x<CR>
inoremap <C-x> <Esc>:x<CR>

" Quit without saving with Ctrl+q
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>

" Set relative numbers with Space → r → n
nnoremap <leader>rn :set relativenumber!<CR>

" Clear search highlights with Enter
nnoremap <CR> :nohlsearch<CR>

" ------------------------------
" Buffer management
" ------------------------------

" List buffers
nnoremap <leader>bl :ls<CR>

" Next / Previous buffer
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Delete current buffer
nnoremap <leader>bd :bdelete<CR>

" Quickly switch to last buffer
nnoremap <leader><leader> <C-^>

" ------------------------------
" FZF Integrations
" ------------------------------

" Search files (fzf)
nnoremap <C-f>     :Files<CR>
nnoremap <leader>f :Files<CR>

" Search in open buffers
nnoremap <leader>b :Buffers<CR>

" Super fast text search (requires ripgrep)
nnoremap <leader>g :Rg<CR>

" Search command history
nnoremap <leader>h :History:<CR>

" ------------------------------
" NERDTree Integrations
" ------------------------------

" Focus NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>

" Open NERDTree
nnoremap <C-n>     :NERDTree<CR>

" Toggle NERDTree
nnoremap <C-t>     :NERDTreeToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" Find current file in NERDTree
nnoremap <C-p>     :NERDTreeFind<CR>
nnoremap <leader>p :NERDTreeFind<CR>

" Move between windows (splits)
nnoremap <C-h> <C-w>h

nnoremap <C-j> <C-w>j
nnoremap <leader>j <C-w>j

nnoremap <C-k> <C-w>k
nnoremap <leader>k <C-w>k

nnoremap <C-l> <C-w>l
nnoremap <leader>l <C-w>l

" ------------------------------
" FINAL SETTINGS
" ------------------------------

filetype plugin indent on   " Enable filetype-specific plugins and indentation

call plug#begin()

    Plug 'fatih/vim-go' 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'PhilRunninger/nerdtree-buffer-ops'
    Plug 'PhilRunninger/nerdtree-visual-selection'
    Plug 'airblade/vim-rooter'

call plug#end()

" NERTree configurations
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Show hidden files
let NERDTreeShowHidden=1



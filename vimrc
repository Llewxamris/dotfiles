"Title: Vim Configuration File
" Author: Maxwell Haley
" Description: My personal configuration for Vim.
" Built using information I've learnt along the way. Special thanks to the
" following guides:
" - Doug Black's "A Good Vimrc": https://dougblack.io/words/a-good-vimrc.html
" - Jake Zimmerman's "Vim as an IDE": https://github.com/jez/vim-as-an-ide
" - Denis B's "Vim Tips & Tracks":
"       https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" - George Ornbo's Vim: You don't need NERDTree or (maybe) netrw
"       https://shapeshed.com/vim-netrw/
" This file is licensed under UNLICENSE, see UNLICENSE for more details or
" visit http://unlicense.org
"
" **Don't use anything from this file without researching what it does
" first!**

" Maintenance {{{
" Config settings that need to be set early.

" Sorry Vi, going with the big kid on the block
set nocompatible

" Modern encoding for fancy airline fonts
set encoding=utf8

" Set <leader> to the comma key
let mapleader=","

" Enable Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" }}}

" Plugins {{{
" List of pluggins managed by Vundle.vim

Plugin 'VundleVim/Vundle.vim'           " Vundle manages itself
Plugin 'tpope/vim-fugitive'             " Git integration
Plugin 'vim-airline/vim-airline'        " Airline Statusbar
Plugin 'vim-airline/vim-airline-themes' " Airline Statusbar Themes
" Plugin 'vim-syntastic/syntastic'        " Better Syntax checking
Plugin 'xolox/vim-easytags'             " Automatic tag generation
Plugin 'xolox/vim-misc'                 " Misc tools for vim-easytags
Plugin 'majutsushi/tagbar'              " Sidebar for tags
Plugin 'Raimondi/delimitMate'           " Autoclosing \"([{
Plugin 'jez/vim-superman'               " Read Manpages in Vim
Plugin 'tpope/vim-surround'             " Easially surround text
Plugin 'ctrlpvim/ctrlp.vim'             " Fuzzy finder
Plugin 'airblade/vim-gitgutter'         " Add Git glyphs
Plugin 'rakr/vim-one'
Plugin 'sheerun/vim-polyglot'           " Mass-lanuage pack
Plugin 'Shougo/neocomplete.vim'         " Vim autocomplete
Plugin 'SirVer/ultisnips'               " Snippet Engine
Plugin 'honza/vim-snippets'             " Snippets
Plugin 'dbeniamine/todo.txt-vim'        " todo.txt intergration
Plugin 'cympfh/vim-hy'                  " Support for the Hylang
Plugin 'ntpeters/vim-better-whitespace' " Show inproper whitespace
Plugin 'w0rp/ale'

" End Vundle loading
call vundle#end()

" }}}

" Colours {{{

" Enable Syntax highlighting
syntax on

" Better colours
set termguicolors

" Enable colourscheme 'OneDark'
let g:onedark_termcolors=256        " Fallback to 256 if TrueColour is not enabled.
let g:onedark_terminal_italics=1    " Enable italics for comments.
colorscheme one                 " Atom-like colourscheme.
set background=light

"}}}

" UI {{{

filetype plugin indent on               " Extention specific indenting
set cursorline                          " Highlights the current line
set showcmd                             " Show entered command
set number                              " Show line numbers
set relativenumber                      " Show line numbers relative to current line
set wildmenu                            " Visual autocompletion for Command mode
set lazyredraw                          " More efficient redrawing
set showmatch                           " Shows matching open/closing symbols
set vb                                  " Disable the bell
set modelines=1                         " Allows modelines to be enabled
set mouse=a                             " Enable mouse support
" set breakindent                         " Indent on linebreak
set showbreak="+++ "                    " Use symbols to show the indent
set synmaxcol=200                       " Syntax highlighting stops after col 200
autocmd VimResized * wincmd =           " Auto resize splits
set colorcolumn=80                      " Add a margin at 80 characters
set noshowmode                          " Don't show the mode on the bottom left
set scrolloff=3                         " Always show at least 3 lines
set backspace=indent,eol,start
set mousehide                           " Hide the mouse while typing
set hidden                              " Allow unsaved buffers
let g:neocomplete#enable_at_startup = 1 " Always enable neocomplete
runtime macros/matchit.vim

" Airline {{{
set laststatus=2                                 " Always show status line
let g:airline_detect_paste = 1                   " Detect if in Paste mode
let g:airline#extensions#tabline#enabled = 1     " Enable tabline extention
let g:airline_theme = 'one'                  " Use 'onedark' colour theme
let g:airline_powerline_fonts = 1                " Enable use of patch fonts
let g:airline#extentions#hunks#non_zero_only = 1 " No Hunks plz
" }}}

" netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
nnoremap <leader>t :Vexplore<CR>
" }}}

" Syntastic {{{
hi clear SignColumn                             " Clear SignColumn
let g:syntastic_error_symbol='✘'                " Use custom error symbol
let g:syntastic_warning_symbol = "▲"            " Use custom warning symbol
" }}}

" Easytags/Tagbar {{{
set tags=./tags                       " Tag locations
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1                         " Update tags Async
let g:easytags_dynamic_files = 2                 " Dynamically load files
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1        " Suppress warning thrown by ctags

" Toggle with <leader>b
nmap <silent> <leader>b :TagbarToggle<CR>
" }}}

" delimitMate {{{
let delimitMate_expand_cr = 1
augroup delimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType python let b:delimitMate_nesting_quotes   = ['"', "'"]
augroup END
" }}}
" }}}

" Tabs & Spaces {{{
set softtabstop=4 " How many cols used to Tab
set shiftwidth=4  " How many cols indented with reindent
set tabstop=4     " How many cols used visually to Tab
set expandtab     " Use Spaces instead of Tabs
" }}}

" Searching {{{
set incsearch   " Search as characters are entered
set hlsearch    " Highlight all matches
                " Remove search highlight with Leader + Space
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable          " Enable folding
set foldlevelstart=10   " Folds nested blocks of code
set foldnestmax=10      " Cap at 10 fold levels
set foldmethod=indent   " Fold based on indentation level
" }}}

" Movement/Editing {{{
" Disable the arrowkeys
noremap  <up> <nop>
inoremap <up> <nop>

noremap  <down> <nop>
inoremap <down> <nop>

noremap  <left> <nop>
inoremap <left> <nop>

noremap  <right> <nop>
inoremap <right> <nop>

" Move by visual line, not by actual line
nnoremap j gj
nnoremap k gk

" Highlight the last inserted text
nnoremap gV `[v`]

" Toggle Gundo undo tree
noremap <leader>u :GundoToggle<CR>

" Enable autoread and autosave
set autoread
augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END

" 0 goes to first non-blank character
map 0 ^

" }}}

" vim:foldmethod=marker:foldlevel=0

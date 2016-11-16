" This vimrc is for Vim under Windows
" Put this file in c:/Users/Me/
" This file should be saved and updated in GDrive
" Install Git, Conemu, gVim
" ***********************************************
" Install vundle to manage plugins:
" Create under c/Users/Me   vimfiles/bundle directory
" And put there your plugins including Vundle.vim
" 
" Commands like PluginUpdate you can find on internet, просто пиши команды в
" коммандной строке. 
"
" NERDTree - to start it
" 
" Translit - что бы включить транслит выйди в мод навигации и нажми Ctrl+Shift+t,
" и опять зайди в мод редактировки. 

set nocompatible
filetype off

" set Runtime path to inc Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim

"this is the call to begin the Vundle Plugin Opperation

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'einars/translit.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" TODO: tpope vim-fugitive plugin
" Plugin 'tpope/vim-fugitive'
" this plugin is from vim.org : L9

call vundle#end()

filetype plugin indent on

"General
set number			"Show line numbers
set linebreak			"Break lines at word (requires Wrap lines)
set showbreak=+++		"Wrap-broken line prefix
set textwidth=100		"Line wrap (number of cols)
set showmatch			"Highlight matching brace
set visualbell			"Use visual bell (no beeping)
 
set hlsearch			"Highlight all search results
set smartcase			"Enable smart-case search
set ignorecase			"Always case-insensitive
set incsearch			"Searches for strings incrementally
 
set autoindent			"Auto-indent new lines
set shiftwidth=4		"Number of auto-indent spaces
set smartindent			"Enable smart-indent
set smarttab			"Enable smart-tabs
set softtabstop=4		"Number of spaces per Tab
 
"Advanced
set ruler			" Show row and column ruler information
set undolevels=1000		" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
 

" Auto start nerdtree
"au VimEnter *  NERDTree

" Hotkeys mapping
nnoremap <F3> :NERDTreeToggle<CR>

" vimrc is for Vim under Windows
" Put this file in c:/Users/Me/
" This file should be saved and updated in GDrive
" Install Git, Conemu, gVim
" ***********************************************
" Install vundle to manage plugins:
" Create under c/Users/Me   vimfiles/bundle directory
" And put there your plugins including Vundle.vim

" NerdTree - F3, reveal in NerdTree - F4

" Beautify visual selection - F2

" Translit - in Normal mode Ctrl+Shift+t and change to Insert mode 

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim	" set Runtime path to inc Vundle and initialize

call vundle#begin()			" this is the call to begin the Vundle Plugin Opperation
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'einars/translit.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'tpope/vim-commentary'
Plugin 'flazz/vim-colorschemes'

"JS/React syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'isRuslan/vim-es6'

" Markdowm with live preview
Plugin 'shime/vim-livedown'

call vundle#end()

syntax enable
filetype plugin indent on

"General
"set lines=50 columns=170			        "Set window startup size
"set number							                   "Show line numbers
set linebreak						                 "Break lines at word (requires Wrap lines)
"set showbreak=+++					             "Wrap-broken line prefix
set textwidth=100					              "Line wrap (number of cols)
set showmatch						                 "Highlight matching brace
set visualbell						                "Use visual bell (no beeping)
 			
set hlsearch						                  "Highlight all search results
set smartcase						                 "Enable smart-case search
set ignorecase						                "Always case-insensitive
set incsearch						                 "Searches for strings incrementally
"set relativenumber			    "Set line number relatively 

set autoindent						                "Auto-indent new lines
set shiftwidth=4					               "Number of auto-indent spaces
set smartindent                	  	 "Enable smart-indent
set smarttab                    	   "Enable smart-tabs
set softtabstop=4               	   "Number of spaces per Tab
"set guifont=Dejavu\ Sans\ Mono:h16 	"Set font and size
set guifont=Courier:h16 

"Advanced
set ruler                       	   " Show row and column ruler information
set undolevels=1000             	   " Number of undo levels
set backspace=indent,eol,start  	   " Backspace behaviour
set background=dark   
colorscheme wombat
" colorscheme monokai
"colorscheme badwolf					            " Color scheme
"colorscheme zellner

"au VimEnter *  NERDTree			" Auto start nerdtree

" Enable mouse
set mouse=a

" Hotkeys mapping
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :NERDTreeFind<CR>
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" Breaking bad habbits
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" Auto brackets
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>

".vimrc
"map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <F2> :call RangeJsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <F2> :call RangeJsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <F2> :call RangeJsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <F2> :call RangeHtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F2> :call RangeCSSBeautify()<cr>


let NERDTreeShowHidden = 1

" Fuzzy find files config
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Default window split direction
set splitbelow
set splitright

"set encoding=cp1251
"set fileencodings=cp1251
set helplang=ru,en

" Markdowm settings
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 1

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "chrome"

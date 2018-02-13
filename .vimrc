" vimrc is for Vim under Windows
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

set rtp+=~/.vim/bundle/Vundle.vim	      "set Runtime path to inc Vundle and initialize

call vundle#begin()			                  " this is the call to begin the Vundle Plugin Opperation
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'einars/translit.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'ternjs/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'flowtype/vim-flow'

" TODO: tpope vim-fugitive plugin
" Plugin 'tpope/vim-fugitive'
" this plugin is from vim.org : L9
call vundle#end()

syntax enable
filetype plugin indent on

"General
"set lines=50 columns=170			        "Set window startup size
set number							                   "Show line numbers
set linebreak						                 "Break lines at word (requires Wrap lines)
"set showbreak=+++					             "Wrap-broken line prefix
set textwidth=100					              "Line wrap (number of cols)
set showmatch						                 "Highlight matching brace
set visualbell						                "Use visual bell (no beeping)
 			
set hlsearch						                  "Highlight all search results
set smartcase						                 "Enable smart-case search
set ignorecase						                "Always case-insensitive
set incsearch						                 "Searches for strings incrementally
 			
set autoindent						                "Auto-indent new lines
set shiftwidth=4					               "Number of auto-indent spaces
set smartindent                	  	 "Enable smart-indent
set smarttab                    	   "Enable smart-tabs
set softtabstop=4               	   "Number of spaces per Tab
set guifont=Dejavu\ Sans\ Mono:h16 	"Set font and size


"Advanced
set ruler                       	   " Show row and column ruler information
set undolevels=1000             	   " Number of undo levels
set backspace=indent,eol,start  	   " Backspace behaviour
set background=dark   
colorscheme badwolf					            " Color scheme

" Hotkeys mapping
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :NERDTreeFind<CR>
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>

".vimrc
"map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <F2> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <F2> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <F2> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <F2> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F2> :call CSSBeautify()<cr>


let NERDTreeShowHidden=1
let g:ctrlp_show_hidden = 1

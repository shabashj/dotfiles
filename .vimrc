" KEY BINDINGS
"
" Editor
" ------------------------------------
" Comment line                gcc
" Uncomment line              gc
" Beautify visual selection   F2
" Translit                    Ctrl+Shift+t
"
" NerdTree
" ------------------------------------
" Open tree                   F3
" Reveal current file in tree F4
"
" FZF magic
" ------------------------------------
" Open all files              Ctrl + p
" Open tracked by git files   Ctrl + g
" Open buffers                Ctrl + o
" Saerch pattern in directory Ctrl + f
" ------------------------------------
"
" Git commands
" ------------------------------------
" Git blame                   :Gblame
" Git blame detail            :Gblame + o
" Git status                  :Gstatus
" Git diff current file       :Gdiff


set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'einars/translit.vim'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-commentary'
Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentLine'

" Beautify code
Plug 'maksimr/vim-jsbeautify'
Plug 'sbdchd/neoformat'

"JS/React syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'isRuslan/vim-es6'

" Git
Plug 'tpope/vim-fugitive'

" Markdowm with live preview
Plug 'shime/vim-livedown'

" Fzf magic
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Intellisense engine, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()


syntax enable
filetype plugin indent on

"General
"set lines=50 columns=170		   "Set window startup size
"set linebreak				   "Break lines at word (requires Wrap lines)
"set showbreak=+++			   "Wrap-broken line prefix
"set textwidth=100			   "Line wrap (number of cols)
set nowrap
set showmatch				   "Highlight matching brace
set visualbell				   "Use visual bell (no beeping)

set hlsearch				   "Highlight all search results
set smartcase				   "Enable smart-case search
set ignorecase				   "Always case-insensitive
set incsearch				   "Searches for strings incrementally

set number				   "Show line numbers
"set relativenumber			   "Set line number relatively

set autoindent				   "Auto-indent new lines
set expandtab
set shiftwidth=2			   "Number of auto-indent spaces
set smartindent				   "Enable smart-indent
set smarttab				   "Enable smart-tabs
set softtabstop=2			   "Number of spaces per Tab
set tabstop=2			   "Number of spaces per Tab
"set guifont=Dejavu\ Sans\ Mono:h16	   "Set font and size
set guifont=Courier:h16

"Advanced
set ruler                       	   "Show row and column ruler information
set undolevels=1000             	   "Number of undo levels
set backspace=indent,eol,start  	   "Backspace behaviour
set background=dark
set clipboard=unnamedplus

" Highlihgt trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"colorscheme delek
"colorscheme wombat
"colorscheme monokai
"colorscheme badwolf
"colorscheme zellner
"colorscheme solarized

" Auto start nerdtree
"au VimEnter *  NERDTree

"Make vim less useable
" Enable mouse
set mouse=a
command! W  write

" Hotkeys mapping
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :NERDTreeFind<CR>
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
nnoremap <esc> :noh<return><esc>

" Spellcheck
" autocmd BufRead,BufNewFile *.md setlocal spell
map <F5> :setlocal spell! spelllang=en_us<CR>

" Remove trailing spaces on F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Breaking bad habbits
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" Auto brackets
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>

" New line and tab space on new line in brackets
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Pretify code
" for javascript
autocmd FileType javascript noremap <buffer>  <F2> :call RangeJsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <F2> :call RangeJsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <F2> :call RangeJsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <F2> :call RangeHtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F2> :call RangeCSSBeautify()<cr>


" let g:neoformat_try_formatprg = 1
" augroup NeoformatAutoFormat
"     autocmd!
"     autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
"                                                             \--stdin\
"                                                             \--print-width\ 80\
"                                                             \--single-quote\
"                                                             \--trailing-comma\ es5
"     autocmd BufWritePre *.js,*.jsx Neoformat
" augroup END


" NerdTree settings
let NERDTreeShowHidden = 1

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
let g:livedown_open = 0
" the port on which Livedown server will run
let g:livedown_port = 1337
" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "chrome"


hi def link jsObjectKey Label


" === FZF key bindings === "
nnoremap <silent> <C-p> :Files <CR>
nnoremap <silent> <C-g> :GFiles <CR>
nnoremap <silent> <C-o> :Buffers <CR>
nnoremap <C-f> :Rg 


" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)


" Highlight ejs syntax
au BufNewFile,BufRead *.ejs set filetype=html

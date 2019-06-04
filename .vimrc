" vimrc is for Vim under Windows
" Put this file in c:/Users/Me/
" This file should be saved and updated in GDrive
" Install Git, Conemu, gVim
" ***********************************************
" Install vundle to manage plugins:
" Create under c/Users/Me   vimfiles/bundle directory
" And put there your plugins including Vundle.vim

" NerdTree							F3, reveal in NerdTree - F4
" Beautify visual selection -					F2
" Translit							Ctrl+Shift+t  
" go to defention						\dd
" go to references						\dr
" go to implementation						\dj
" List open buffers 						;
" Browse list of files in current directory			\t
" Search current directory for occurences of given term and	\g
" Search current directory for occurences of word under cursor  \j
" Select and delete open buffers				Ctrl+o
" Git blame							:Gblame
" Git blame detail						:Gblame + o
" Git status							:Gstatus
" Git diff current file						:Gdiff

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'einars/translit.vim'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-commentary'
Plug 'flazz/vim-colorschemes'

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

" Intellisense engine, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

call plug#end()


syntax enable
filetype plugin indent on

"General
"set lines=50 columns=170		   "Set window startup size
"set number				   "Show line numbers
set linebreak				   "Break lines at word (requires Wrap lines)
"set showbreak=+++			   "Wrap-broken line prefix
set textwidth=100			   "Line wrap (number of cols)
set showmatch				   "Highlight matching brace
set visualbell				   "Use visual bell (no beeping)
 			
set hlsearch				   "Highlight all search results
set smartcase				   "Enable smart-case search
set ignorecase				   "Always case-insensitive
set incsearch				   "Searches for strings incrementally
"set relativenumber			   "Set line number relatively 

set autoindent				   "Auto-indent new lines
set shiftwidth=4			   "Number of auto-indent spaces
set smartindent				   "Enable smart-indent
set smarttab				   "Enable smart-tabs
set softtabstop=2			   "Number of spaces per Tab
"set guifont=Dejavu\ Sans\ Mono:h16	   "Set font and size
set guifont=Courier:h16 

"Advanced
set ruler                       	   "Show row and column ruler information
set undolevels=1000             	   "Number of undo levels
set backspace=indent,eol,start  	   "Backspace behaviour
set background=dark   
set clipboard=unnamedplus

colorscheme delek
"colorscheme wombat
"colorscheme monokai
"colorscheme badwolf			   
"colorscheme zellner

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

" Spellcheck
" autocmd BufRead,BufNewFile *.md setlocal spell
map <F5> :setlocal spell! spelllang=en_us<CR>


" Breaking bad habbits
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" Auto brackets
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>


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


hi def link jsObjectKey Label

" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

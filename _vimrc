" This vimrc is for Vim under Windows
" Put this file in c:/Users/Me/
" This file should be saved and updated in GDrive
" Install Git, Conemu, gVim
" ***********************************************
" Install vundle to manage plugins:
" Create under c/Users/Me   vimfiles/bundle directory
" And put there your plugins including Vundle.vim
" Commands like PluginUpdate you can find on internet, просто пиши команды в
" коммандной строке. 
" NERDTree - to start it
" Translit - что бы включить транслит выйди в мод навигации и нажми Ctrl+Shift+t, и опять зайди в мод редактировки. 


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
set number
set nowrap

nnoremap <F3> :NERDTreeToggle<CR>

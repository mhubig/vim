" ~/.vimrc
" Author: Markus Hubig <mhubig@gmail.com>
" Source: https://github.com/mhubig/vim
" 

" Vundle Stuff {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" TPope's awsome stuff
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" NerdTree and stuff
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

" Python Bundles
Bundle 'vim-scripts/pep8.git'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'msanders/snipmate.vim'

" Some spezials
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/badwolf'
" }}}

" Default Options {{{
set nocompatible
set expandtab
set copyindent
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set nobackup
set nowritebackup
set ruler
set showcmd
set visualbell
" }}}

" General Settings {{{

" Enable syntax highlighting by default
syntax on

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" REQUIRED: This makes vim invoke the matching ftplugin
" script when you open a file.
filetype plugin on

" The colorscheme to use
colorscheme badwolf 

" Uncomment the following to have Vim jump to the last position
" when reopening a file 
if has("autocmd") 
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") 
    \| exe "normal g'\"" | endif 
endif
" }}}

" Folding Settigs {{{
set foldlevelstart=0
set foldlevel=99

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=marker | endif
augroup END

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" }}}

" Backup & Swap Settigs {{{
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup 
set noswapfile 
" }}}

" vim:set ft=vim et tw=78 sw=2:

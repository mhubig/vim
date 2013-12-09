" ~/.vim/vimrc
" Author: Markus Hubig <mhubig@gmail.com>
" Source: https://github.com/mhubig/vim

" Vundle Bundles {{{
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
Bundle 'tpope/vim-markdown'

" The famose solarized color theme
Bundle 'altercation/vim-colors-solarized.git'

" NerdTree and file browsing
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'

" Usefull Python Bundles
Bundle 'nvie/vim-flake8'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'

" Latex and ConTeX Bundles
Bundle 'LaTeX-Box-Team/LaTeX-Box'

" Search with :Ack instead grep
Bundle 'mileszs/ack.vim'

" Indentitation for javascript and html
Bundle 'lukaszb/vim-web-indent'
Bundle 'mattn/emmet-vim'

" vim-airline statusline
Bundle 'bling/vim-airline'

" align at some symbol
Bundle 'vim-scripts/Align'

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" REQUIRED: This makes vim invoke the matching ftplugin
" script when you open a file.
filetype plugin on

" }}}

" {{{ Bundle settings

" Enable vim-airline
let g:airline_powerline_fonts = 1
let g:airline_enable_fugitive = 1
let g:airline_theme = 'solarized'

" Open Pydoc stuff in a vspli window
let g:pydoc_open_cmd = 'vsplit'

if has('macunix')
  let g:ackprg = 'ag --nogroup --column'
elseif has('unix')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" }}}

" Default Options {{{
set nocompatible
set hidden
set copyindent
set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nobackup
set nowritebackup
set ruler
set showcmd
set clipboard=unnamed

" Enable mouse in console vim
set mouse=a

" Disable Beeping and blinking on input errors
set noerrorbells
set visualbell
set t_vb=

" }}}

" General Settings {{{

" Enable syntax highlighting by default
syntax on
set background=light

" The colorscheme to use
set t_Co=16
colorscheme solarized

" Uncomment the following to have Vim jump to the last position
" when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Mark the eightieth column so I know when to do a linebreak!
if exists('+colorcolumn')
  set colorcolumn=80
endif

" This line will make Vim set out tab characters, trailing whitespace and
" invisible spaces visually, and additionally use the # sign at the end of
" lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" }}}

" General Key Mappings {{{

" change the mapleader from \ to ,
let mapleader=","
set pastetoggle=<F2>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

map <leader>l :Align 
nmap <leader>a :Ack 
nmap <leader>b :CommandTBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CommandT<CR>
nmap <leader>T :CommandTFlush<CR>:CommandT<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>

" }}}

" {{{ Filetype specific settings

" INFO: Put those settings into "after/ftplugin"!

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

" Source the abbreviations file {{{
source ~/.vim/abbreviations.vim
" }}}

" vim:set ft=vim et tw=78 sw=2:

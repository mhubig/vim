" ~/.vim/vimrc
" Author: Markus Hubig <mhubig@gmail.com>
" Source: https://github.com/mhubig/vim

" Vundle Bundles {{{
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" TPope's awsome stuff
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vinegar'

" The famose solarized color theme
Bundle 'altercation/vim-colors-solarized.git'

" Indentitation for javascript and html
Bundle 'lukaszb/vim-web-indent'
Bundle 'mustache/vim-mustache-handlebars'

" java stuff
Bundle 'akhaku/vim-java-unused-imports'

" vim-airline statusline
Bundle 'bling/vim-airline'

" syntax file for Docker's Dockerfile
Bundle "ekalinin/Dockerfile.vim"

" Ruby for VIM
Bundle 'vim-ruby/vim-ruby'

" ansible yaml
Bundle 'chase/vim-ansible-yaml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins;
"                     append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo;
"                     append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"                     append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" {{{ Bundle settings

" Open files in new tab from nerdtree
let g:nerdtree_tabs_open_on_gui_startup = 0
"let NERDTreeMapOpenInTab='<ENTER>'

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
set laststatus=2

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

" }}}

" {{{ Filetype specific settings

" INFO: Put those settings into "after/ftplugin"!

" }}}

" Folding Settigs {{{
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

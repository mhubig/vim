" ~/.vim/vimrc
" Author: Markus Hubig <mhubig@gmail.com>
" Source: https://github.com/mhubig/vim

" NeoBundle Setup {{{
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle.
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Shougo's mighty mojo
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin'  : 'make -f make_cygwin.mak',
\     'mac'     : 'make -f make_mac.mak',
\     'linux'   : 'make',
\     'unix'    : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler.vim'

" TPope's awsome stuff
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'

" The famose solarized color theme
NeoBundle 'altercation/vim-colors-solarized.git'

" Indentitation for javascript and html
NeoBundle 'lukaszb/vim-web-indent'
NeoBundle 'mustache/vim-mustache-handlebars'

" java stuff
NeoBundle 'akhaku/vim-java-unused-imports'

" vim-airline statusline
NeoBundle 'bling/vim-airline'

" syntax file for Docker's Dockerfile
NeoBundle "ekalinin/Dockerfile.vim"

" Ruby for VIM
NeoBundle 'vim-ruby/vim-ruby'

" ansible yaml
NeoBundle 'chase/vim-ansible-yaml'

" Rename in Vim
NeoBundle 'danro/rename.vim'

" a tagbar
NeoBundle 'majutsushi/tagbar'

" syntax checking plugin
"NeoBundle 'scrooloose/syntastic'

" Syntax highlighting for qml
NeoBundle 'crucerucalin/qml.vim'

" All of your Plugins must be added before the following line
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Put your non-Plugin stuff after this line
" }}}

" {{{ Bundle settings

" neocomplete stuff
let g:neocomplete#enable_at_startup = 1

" vimfiler settings
:let g:vimfiler_as_default_explorer = 1

" tagbar settings
let g:tagbar_map_togglefold = "<Space>"
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
let g:tagbar_singleclick = 1

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_python_checkers = ['pylint']

" Enable vim-airline
let g:airline_powerline_fonts = 1
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

" Incrase/decrase windows size.
nnoremap <silent> <C-W>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <C-W>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

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
noremap <Space> za

" show the taggbar
nmap <F8> :TagbarToggle<CR>

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

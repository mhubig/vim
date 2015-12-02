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

NeoBundle 'Shougo/vimfiler.vim'
:let g:vimfiler_as_default_explorer = 1

" The famose solarized color theme
NeoBundle 'altercation/vim-colors-solarized.git'

" vim-airline statusline
NeoBundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1

" vim-ctrlp Fuzzy file, buffer, mru, tag, etc finder
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" TPope's awesome stuff
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

" No-BS Python code folding for Vim
NeoBundle 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Using the jedi autocompletion library for VIM.
NeoBundle 'davidhalter/jedi-vim'
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-p>"
let g:jedi#rename_command = "<leader>r"

" Indentitation for javascript and html
NeoBundle 'lukaszb/vim-web-indent'
NeoBundle 'mustache/vim-mustache-handlebars'

" java stuff
NeoBundle 'akhaku/vim-java-unused-imports'

" syntax file for Docker's Dockerfile
NeoBundle "ekalinin/Dockerfile.vim"

" Ruby for VIM
NeoBundle 'vim-ruby/vim-ruby'

" ansible yaml
NeoBundle 'chase/vim-ansible-yaml'

" Rename in Vim
NeoBundle 'danro/rename.vim'

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

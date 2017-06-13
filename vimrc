" ~/.vim/vimrc
" Author: Markus Hubig <mhubig@gmail.com>
" Source: https://github.com/mhubig/vim

call plug#begin('~/.vim/plugged')

" Unite and create user interfaces
Plug 'Shougo/unite.vim'

" Powerful file explorer
Plug 'Shougo/vimfiler.vim'
:let g:vimfiler_as_default_explorer = 1

" Powerful shell
Plug 'Shougo/vimshell.vim'

" dracula color theme
Plug 'dracula/vim'

" vim lightline & bufferline
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
let g:lightline = {
      \ 'colorscheme'     : 'Dracula',
      \ 'tabline'         : {'left': [['buffers']], 'right': [['close']]},
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \ 'component_type'  : {'buffers': 'tabsel'},
      \ }

" vim-ctrlp Fuzzy file, buffer, mru, tag, etc finder
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" TPope's awesome stuff
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" No-BS Python code folding for Vim
Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Indentitation for javascript and html
Plug 'lukaszb/vim-web-indent'
Plug 'mustache/vim-mustache-handlebars'

" java stuff
Plug 'akhaku/vim-java-unused-imports'

" syntax file for Docker's Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Ruby for VIM
Plug 'vim-ruby/vim-ruby'

" Rust for Vim
Plug 'rust-lang/rust.vim'

" ansible yaml
Plug 'chase/vim-ansible-yaml'

" Rename in Vim
Plug 'danro/rename.vim'

" Syntax highlighting for qml
Plug 'crucerucalin/qml.vim'

" Add plugins to &runtimepath
call plug#end()

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
set noshowmode

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

" Uncomment the following to have Vim jump to the last position
" when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
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

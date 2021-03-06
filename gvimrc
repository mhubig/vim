" ~/.vim/gvimrc
" Author: Markus Hubig <mhubig@gmail.com>
" Source: https://github.com/mhubig/vim
"

" Some GUI options to get a clean user interface
set background=light
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=b

" Disable Beeping and blinking on input errors
set noerrorbells
set visualbell
set t_vb=

" Set the font and size depending on the OS
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let s:hostname = substitute(system('hostname -s'), '\n', '', '')
    set guifont=Source\ Code\ Pro\ for\ Powerline:h13
    if s:hostname == "bigmac"
      set columns=82
      set lines=44
    else
      set columns=100
      set lines=56
    endif
  elseif s:uname == "Linux\n"
    set guifont="Ubuntu Mono:h12"
    set columns=100
    set lines=56
  endif
endif

" vim:set ft=vim et tw=78 sw=2:

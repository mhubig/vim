" Some GUI options to get a clean user interface
set background=light
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=b
set columns=100
set lines=40

" Set the font depending on the OS
let s:uname=system("uname")
if s:uname=="Darwin\n"
    set guifont="Monaco:h12"
elseif s:uname=="Linux\n" 
    set guifont="Ubuntu Mono:h12"
endif


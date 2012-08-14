set guioptions-=lrbT
set guifont=Droid\ Sans\ Mono\ Dotted\ For\ Powerline:h16

if has("win32")
  au GUIEnter * simalt ~n
else
  set lines=999 columns=999
endif


set guifont=monofur\ for\ Powerline:h16

if has("win32")
  au GUIEnter * simalt ~n
else
  set lines=999 columns=999
endif

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>
endif

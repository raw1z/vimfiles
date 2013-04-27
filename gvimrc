:set guioptions-=T  " remove toolbar
:set guioptions-=r  " remove right-hand scroll bar
:set guioptions-=m  " remove the menu bar

if has("win32")
  au GUIEnter * simalt ~n
else
  set lines=999 columns=999
endif

if has("gui_macvim")
  " enter fullscreen
  set fu

  " use Cmd+T to toggle ctrlp.vim window
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>
endif

" load the customizations
if filereadable(expand("~/.gvimrc.custom"))
  source ~/.gvimrc.custom
endif

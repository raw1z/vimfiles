:set guioptions-=T  " remove toolbar
:set guioptions-=r  " remove right-hand scroll bar
:set guioptions-=m  " remove the menu bar

" load the customizations
if filereadable(expand($VIM_CUSTOM_DIR."/.gvimrc.custom"))
  source $VIM_CUSTOM_DIR/.gvimrc.custom
endif


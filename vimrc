if &compatible
  set nocompatible
endif

let mapleader="ç"

function! s:source(rc_file) abort "{{{
  let abspath = resolve(expand('~/.vim/rc/' . a:rc_file . '.rc.vim'))
  execute 'source' fnameescape(abspath)
endfunction "}}}

call s:source("neovim"           )
call s:source("dein"             )
call s:source("global_functions" )
call s:source("base"             )
call s:source("commands"         )

" load the customizations {{{
let $VIM_CUSTOM_DIR=$HOME
if filereadable(expand($VIM_CUSTOM_DIR."/.nvimrc.custom"))
  source $VIM_CUSTOM_DIR/.nvimrc.custom
endif
" }}}


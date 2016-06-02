if &compatible
  set nocompatible
endif

function! s:source_rc(rc_file) abort "{{{
  let abspath = resolve(expand('~/.vim/rc/' . a:rc_file . '.rc.vim'))
  execute 'source' fnameescape(abspath)
endfunction "}}}

if has('vim_starting')
  call s:source_rc('init')
endif

call s:source_rc("dein")

if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')

  syntax enable
  filetype plugin indent on
endif

if has("nvim")
  call s:source_rc("neovim")
endif

call s:source_rc("global_functions")
call s:source_rc("base"            )
call s:source_rc("commands"        )

" load the customizations {{{
let $VIM_CUSTOM_DIR=$HOME
if filereadable(expand($VIM_CUSTOM_DIR."/.nvimrc.custom"))
  source $VIM_CUSTOM_DIR/.nvimrc.custom
endif
" }}}


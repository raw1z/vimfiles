set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim'))
call dein#add('Shougo/dein.vim')

call dein#load_toml( "~/.vim/toml/plugins.toml"      , {'lazy' : 0} )
call dein#load_toml( '~/.vim/toml/lazy.toml'         , {'lazy' : 1} )
call dein#load_toml( "~/.vim/toml/colorschemes.toml" , {'lazy' : 0} )
call dein#load_toml( "~/.vim/toml/languages.toml"    , {'lazy' : 0} )

call dein#end()
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

nnoremap <silent> <space>u :call dein#update()<CR>




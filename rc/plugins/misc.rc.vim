" ack configuration
let g:ackprg="ag --nogroup --nocolor --column"

" far
let g:far#source = 'agnvim'

" vim-texobj-ruby
let g:textobj_ruby_inclusive = 0

" signify
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1
let g:signify_cursorhold_normal = 0
let g:signify_cursorhold_insert = 0

" operator-camelize.vim
map <Leader>c <Plug>(operator-camelize)
map <Leader>C <Plug>(operator-decamelize)

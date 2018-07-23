" enable changing cursor shape for neovim {{{
:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175 "}}}
" enable true color {{{
  set termguicolors
"}}}
" configure python {{{
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3' "}}}
" configure node {{{
let g:node_host_prog = "/usr/local/lib/node_modules/neovim/bin/cli.js"
" }}}
" configure terminal {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap gt <C-\><C-n>gt
tnoremap gT <C-\><C-n>gT
tnoremap gT <C-\><C-n>gT
tnoremap <leader>) ]
tnoremap <leader>( [
tnoremap <leader>! \|
tnoremap <leader>/ \
tnoremap <leader>' `
tnoremap <leader><leader>) }
tnoremap <leader><leader>( {
tnoremap <leader>n ~ " }}}


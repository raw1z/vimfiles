" enable changing cursor shape for neovim {{{
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 "}}}
" enable true color {{{
if exists("$ITERM_PROFILE")
  set termguicolors
endif
"}}}
" configure python {{{
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3' "}}}
" configure terminal {{{
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:tnoremap gt <C-\><C-n>gt
:tnoremap gT <C-\><C-n>gT "}}}

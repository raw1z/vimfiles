" TODO: split this file into several rc files

" sensible defaults {{{
set nu
set nowrap
set tabstop=2 shiftwidth=2 expandtab autoindent
set ignorecase smartcase

set ruler
set showcmd

set nobackup
set foldenable
set noswapfile
set foldmethod=marker
set foldcolumn=1
set fillchars=vert:\|
set splitright

if has("nvim")
  set wildignorecase
endif

set exrc
"}}}
" vim default keys remap {{{
map <C-L> <C-]>
inoremap kj <Esc>
cmap <C-P> <Up>
cmap <C-N> <Down>
" }}}
" ack configuration {{{
let g:ackprg="ag --nogroup --nocolor --column"
" }}}
" jump to next nearest closed fold {{{

function! s:goto_next_closed_fold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

nnoremap <silent> <leader>zj :call s:goto_next_closed_fold('j')<cr>
nnoremap <silent> <leader>zk :call s:goto_next_closed_fold('k')<cr>

" }}}
" disable search highlights {{{
nmap <silent> <leader>/ :nohl<CR>
" }}}
" define shortcuts for inserting backslash, tilde, brackets and square brackets {{{
imap <leader>) ]
imap <leader>( [
imap <leader><leader>) }
imap <leader><leader>( {
imap <leader>n ~
imap <leader>/ \
imap <leader>! \|
" }}}
" Default colorscheme {{{

function! s:set_colorscheme()
  let defaultColorscheme = "gruvbox"
  let colorschemeFilePath = globpath(&runtimepath, 'colors/'.defaultColorscheme.'.vim')
  if filereadable(colorschemeFilePath)
    set background=dark
    exe 'colorscheme '.defaultColorscheme
  endif
endfunction

call s:set_colorscheme()

" }}}
" Auto source vim rc files {{{
if has("autocmd")
  augroup ConfigChangeDetect
    autocmd BufWritePost init.vim,[_.]vimrc,[_.]exrc,exrc,vimrc,*.rc.vim,*.toml source $MYVIMRC | redraw
  augroup END
endif
" }}}
" keyboard map for editing the configuration files {{{
nmap <leader>vd :TabGo ~/.vim<CR>
nmap <leader>vv :tabnew $MYVIMRC<CR>
nmap <leader>vc :tabnew $VIM_CUSTOM_DIR/.nvimrc.custom<CR>
nmap <leader>vg :tabnew $MYGVIMRC<CR>
nmap <leader>vgc :tabnew $VIM_CUSTOM_DIR/.gvimrc.custom<CR>

if IsWindows()
  nmap <leader>ve :tabnew _exrc<CR>
else
  nmap <leader>ve :tabnew .exrc<CR>
endif
" }}}
" keyboard map for toggling wrap mode {{{
nmap <leader>W :set wrap! linebreak nolist<CR>
nmap <leader><space> :only<CR>
" }}}
" mapping to make movements operate on 1 screen line in wrap mode {{{
:map j gj
:map k gk
" }}}
" diff mode keymap {{{
function! MyDiffput(visualModeEnabled)
  if a:visualModeEnabled == 0
    exe ':diffput'
  else
    exe ":'<,'>diffput"
  endif

  exe ':diffupdate'
  call feedkeys(']c')
endfunction

function! MyDiffget(visualModeEnabled)
  if a:visualModeEnabled == 0
    exe ':diffget'
  else
    exe ":'<,'>diffget"
  endif

  exe ':diffupdate'
  call feedkeys(']c')
endfunction

function! EnableDiffKeyMaps()
  if &diff
    nmap <buffer> <leader>dj ]c
    nmap <buffer> <leader>dk [c
    nmap <buffer> J ]c
    nmap <buffer> K [c
    nmap <buffer> <silent> <leader>dp :call MyDiffput(0)<CR>
    nmap <buffer> <silent> <leader>dg :call MyDiffget(0)<CR>
    nmap <buffer> <silent> <leader>du :diffupdate<CR>
    vmap <buffer> <silent> <leader>dp :call MyDiffput(1)<CR>
    vmap <buffer> <silent> <leader>dg :call MyDiffget(1)<CR>
  endif
endfunction

augroup DiffModeMaps
  autocmd! FilterWritePre * call EnableDiffKeyMaps()
augroup END
"}}}
" easily moves between opened windows {{{
nnoremap <leader>wj <C-w><C-j>
nnoremap <leader>wk <C-w><C-k>
nnoremap <leader>wh <C-w><C-h>
nnoremap <leader>wl <C-w><C-l>
nnoremap <leader>wf <C-w>f
nnoremap <leader>wgf <C-w>gf
nnoremap <silent> <leader>wo :only<CR>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-o> :only<CR>
"}}}
" easily resize and split windows {{{
nmap <Up> <C-w>+
nmap <Down> <C-w>-
nmap <Left> <C-w><
nmap <Right> <C-w>>
nmap <leader>w+ <C-w>+
nmap <leader>w- <C-w>-
nmap <leader>w> <C-w>>
nmap <leader>w< <C-w><
nmap <leader>w= <C-w>=
nmap <leader>w<space> <C-w><C-w>
nmap <silent> <leader>wsp :sp<CR>
nmap <silent> <leader>wvs :vs<CR>
" }}}
" easy save and quit {{{
nmap <silent> <leader>s :update<CR>
nmap <silent> <leader>x :x<CR>
"}}}
" When pressing <leader>cd switch to the directory of the open buffer {{{

map <Leader>cd :cd %:p:h<CR>:pwd<CR>

" }}}
" ensure autoread when an opened file has been changed outside vim {{{
if has("autocmd")
  augroup ChangeDetect
    au FocusGained,BufEnter * :silent! !
  augroup END
endif
"}}}
" Deface support {{{
augroup filetypedetect
  au BufNewFile,BufRead *.html.erb.deface set ft=eruby
augroup END
" }}}
" SASS/SCSS better word detection {{{

autocmd BufNewFile,BufRead *.sass setl iskeyword+=#,-
autocmd BufNewFile,BufRead *.scss setl iskeyword+=#,-

"}}}


" TODO: split this file into several rc files

" sensible defaults {{{
set nu
set nowrap
set tabstop=2 shiftwidth=2 expandtab autoindent
set ignorecase smartcase

set ruler
set showcmd

set nobackup
set backupcopy=yes
set foldenable
set noswapfile
set foldmethod=manual
set foldcolumn=1
set fillchars=vert:\|
set splitright
set updatetime=100

if has("nvim")
  set wildignorecase
endif

set exrc

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

set viewoptions=cursor,folds,slash,unix
set shortmess=aoOt

" Set the title of the iterm tab
set title

set diffopt=vertical,filler

" Automatically set the indent of a new line (local to buffer)
" from railsbros-dirk
set ai

" Some files we just don't want to see here
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,tmp/*,*.so,*.swp,*.zip " general stuff
set wildignore+=*.png,*.jpg,*.gif,*.jpeg " images
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,Gemfile.lock,*/log/*,.sass-cache,*/coverage/* " Ruby related files
set wildignore+=*.pyc,*.pyo " Python
set wildignore+=*/node_modules/****************" " NodeJS

" use interactive shell
set shell=zsh\ -i

" configure mksession
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

"}}}
" vim default keys remap {{{
map <C-L> <C-]>
inoremap kj <Esc>
cnoremap kj <C-c>
cmap <C-P> <Up>
cmap <C-N> <Down>
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
imap <leader>' `

cmap <leader>) ]
cmap <leader>( [
cmap <leader><leader>) }
cmap <leader><leader>( {
cmap <leader>n ~
cmap <leader>/ \
cmap <leader>! \|
cmap <leader>' `
" }}}
" default colorscheme {{{

function! s:set_colorscheme()
  let defaultColorscheme = "base16-gruvbox-dark-pale"
  let colorschemeFilePath = globpath(&runtimepath, 'colors/'.defaultColorscheme.'.vim')
  if filereadable(colorschemeFilePath)
    set background=dark
    exe 'colorscheme '.defaultColorscheme
  endif
endfunction

call s:set_colorscheme()

" }}}
" auto source vim rc files {{{
if has("autocmd")
  augroup ConfigChangeDetect
    autocmd BufWritePost [_.]vimrc,vimrc,*.rc.vim,*.toml source $MYVIMRC | redraw
    autocmd BufWritePost [_.]exrc,exrc source %
    autocmd BufWritePost [_.]vimrc.custom source %
  augroup END
endif
" }}}
" keyboard map for editing the configuration files {{{
function! s:goto_vim_folder()
  TabGo ~/.vim
  e vimrc
endfunction
nmap <leader>vd :call <SID>goto_vim_folder()<CR>
nmap <leader>vv :tabnew $MYVIMRC<CR>
nmap <leader>vc :tabnew $VIM_CUSTOM_DIR/.vimrc.custom<CR>

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
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-o> :only<CR>
nnoremap <C-j> gT
nnoremap <C-k> gt
"}}}
" easily resize and split windows {{{
nmap <Up> <C-w>+
nmap <Down> <C-w>-
nmap <Left> <C-w><
nmap <Right> <C-w>>
nmap <leader>= <C-w>=
nmap <C-t> :tabnew<CR>
" }}}
" easy save and quit {{{
nmap <silent> <leader>s :update<CR>
nmap <silent> <leader>x :x<CR>
"}}}
" ensure autoread when an opened file has been changed outside vim {{{
if has("autocmd")
  augroup ChangeDetect
    au FocusGained,BufEnter * :silent! !
  augroup END
endif
"}}}
" display the date"{{{
function! s:display_date()
  let s:Vital = vital#of('vital')
  let s:DateTime = s:Vital.import('DateTime')
  let now = s:DateTime.now()
  echo now.format("%c")
endfunction
nnoremap <silent> <space>d :call <SID>display_date()<CR>
"}}}
" file type specific configuration"{{{
" deface support {{{
augroup filetypedetect
  au BufNewFile,BufRead *.html.erb.deface set ft=eruby
augroup END " }}}
" SASS/SCSS better word detection {{{
autocmd BufNewFile,BufRead *.sass setl iskeyword+=#,-
autocmd BufNewFile,BufRead *.scss setl iskeyword+=#,- "}}}
" ruby better keyword detection {{{
autocmd BufNewFile,BufRead *.rb setl iskeyword+=?,!,@,$
autocmd BufNewFile,BufRead *.rbx setl iskeyword+=?,!,@,$ "}}}
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType python setlocal foldmethod=indent
autocmd FileType toml syntax sync minlines=500
autocmd FileType scss set tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.exs set ft=elixir
autocmd BufNewFile,BufRead .zshrc set ft=zsh
autocmd BufNewFile,BufRead *.eex set ft=eelixir
autocmd FileType vue syntax sync fromstart
"}}}
" enter terminal pane in insert mod {{{
autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert
"}}}
" Plugins configuration"{{{
source ~/.vim/rc/plugins/easymotion.rc.vim
source ~/.vim/rc/plugins/ultisnips.rc.vim
source ~/.vim/rc/plugins/misc.rc.vim
"}}}


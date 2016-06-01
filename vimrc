let mapleader="ç"

" configure neovim {{{

if has("nvim")
  " changing cursor shape for neovim
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " enabling true color
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " python configuration {{{
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
  " }}}

  " terminal configuration {{{
  :tnoremap <Esc> <C-\><C-n>
  :tnoremap <A-h> <C-\><C-n><C-w>h
  :tnoremap <A-j> <C-\><C-n><C-w>j
  :tnoremap <A-k> <C-\><C-n><C-w>k
  :tnoremap <A-l> <C-\><C-n><C-w>l
  :tnoremap gt <C-\><C-n>gt
  :tnoremap gT <C-\><C-n>gT

  function! s:openTerminalInSplittedWindow()
    execute "new | terminal"
  endfunction
  command! Vterm call s:openTerminalInSplittedWindow()

  function! s:openTerminalInNewTab()
    execute "tabnew | terminal"
  endfunction
  command! Tterm call s:openTerminalInNewTab()
  " }}}

endif

" }}}

" dein configuration {{{
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

" update plugins {{{
nnoremap <silent> <space>u :call dein#update()<CR>
"}}}

"}}}

" detect OS {{{
let s:Vital = vital#of('vital')
let s:Prelude = s:Vital.import('Prelude')
let s:is_windows = s:Prelude.is_windows()
let s:is_mac = s:Prelude.is_mac()
"}}}

" Base configuration {{{

" sensible defaults {{{

set nu
set nowrap
set tabstop=2 shiftwidth=2 expandtab autoindent
set ignorecase smartcase

set ruler
set showcmd

set nobackup
set noswapfile
set foldmethod=marker
set foldcolumn=1
set fillchars=vert:\|
set splitright

if has("nvim")
  set wildignorecase
endif

" allow folder specific configuration
set exrc
"}}}

" vim default keys remap {{{
map <C-L> <C-]>
inoremap kj <Esc>
cmap <C-P> <Up>
cmap <C-N> <Down>
" }}}

" jump to next nearest closed fold {{{

function! NextClosedFold(dir)
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

nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

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

function! s:SetDefaultColorcheme()
  let defaultColorscheme = "gruvbox"
  let colorschemeFilePath = globpath(&runtimepath, 'colors/'.defaultColorscheme.'.vim')
  if filereadable(colorschemeFilePath)
    set background=dark
    exe 'colorscheme '.defaultColorscheme
  endif
endfunction

call s:SetDefaultColorcheme()

" }}}

" Source the vimrc/gvimrc/exrc file after saving it {{{

command! -nargs=+ Silent execute 'silent <args>' | redraw!

if has("autocmd")
  augroup ConfigChangeDetect
    autocmd! BufWritePost [_.]vimrc source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
    autocmd! BufWritePost [_.]gvimrc source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
    autocmd! BufWritePost [_.]nvimrc source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
    autocmd! BufWritePost init.vim source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
    autocmd! BufWritePost [_.]vimrc.custom source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
    autocmd! BufWritePost [_.]gvimrc.custom source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
    autocmd! BufWritePost [_.]nvimrc.custom source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
    autocmd! BufWritePost [_.]exrc source %:p | echo expand('<afile>').' reloaded' | silent AirlineRefresh
  augroup END
endif

" }}}

" keyboard map for editing the configuration files {{{
nmap <leader>vd :TabGo ~/.vim<CR>
nmap <leader>vv :tabnew $MYVIMRC<CR>
nmap <leader>vc :tabnew $VIM_CUSTOM_DIR/.nvimrc.custom<CR>
nmap <leader>vg :tabnew $MYGVIMRC<CR>
nmap <leader>vgc :tabnew $VIM_CUSTOM_DIR/.gvimrc.custom<CR>

if s:is_windows
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

"}}}

" Plugins configuration {{{

" unite"{{{
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'context.smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

if (s:is_windows)
  let g:unite_data_directory=$HOME.'/.vim/.cache/unite'
else
  let g:unite_data_directory='~/.vim/.cache/unite'
end

let g:unite_enable_start_insert=0
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''

  let g:unite_source_rec_async_command =
        \ ['ag', '--follow', '--nocolor', '--nogroup',
        \  '--hidden', '-g', '']
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -a -C4'
  let g:unite_source_grep_recursive_opt=''

  let g:unite_source_rec_async_command =
        \ ['ack', '-f', '--nofilter']
endif

function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()

nmap <space> [unite]
nnoremap [unite] <nop>

if s:is_windows
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr><c-u>
else
  if has('nvim')
    nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/neovim<cr><c-u>
  else
    nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
  endif
endif

nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]k :<C-u>Unite -no-quit -auto-preview -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> <leader><leader>r <Plug>(unite_redraw)
"}}}

" ack configuration {{{
let g:ackprg="ag --nogroup --nocolor --column"
" }}}

" tabularize configuration {{{

" call the tabularize command each time the pipe caracter is typed
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" }}}

"}}}

" Commands {{{

" cd into a directory and source given file {{{
function! ChangeDirectoryAndSource(path, filename)
  execute('lcd '.a:path)
  execute('source'.a:filename)
endfunction
command! -nargs=1 Xcd call ChangeDirectoryAndSource(<q-args>, "_exrc")
" }}}

" allow to open a folder in a new tab {{{

function! s:TabGo(path)
  execute ':tabnew ' a:path

  " set the folder as the tab's working directory
  execute ':lcd ' a:path
endfunction

command! -nargs=1 -complete=dir TabGo call s:TabGo(<q-args>)
" }}}

" command for removing file read only attribute {{{
function! g:RemoveFilesReadOnlyAttribute(files)
  if has("win32")
    let s:cmd = "silent ! attrib -R ".a:files
  else
    let s:cmd = "silent !chmod u+w ".a:files
  end

  execute s:cmd
endfunction

function! RemoveCurrentFileReadOnly()
  let filename = expand("%")
  call g:RemoveFilesReadOnlyAttribute(filename)
endfunction

" }}}

" Grep Improved {{{
fun! EscapeSearch(search)
  let s:V = vital#of("vital")
  let s:S = s:V.import("Data.String")

  let sanitizedSearch = s:S.replace(a:search, "\\<", "")
  let sanitizedSearch = s:S.replace(sanitizedSearch, "\\>", "")
  let sanitizedSearch = s:S.chomp(sanitizedSearch)
  let sanitizedSearch = s:S.trim(sanitizedSearch)
  let sanitizedSearch = s:S.replace(sanitizedSearch, " ", '\\ ')

  return sanitizedSearch
endf

function! Grep(search)
  let sanitizedSearch = EscapeSearch(a:search)
  exe "Unite -no-quit -auto-preview -buffer-name=search grep:%"
endfunction

function! GrepLastSearch()
  call Grep(@/)
endfunction

function! GrepCurrentWord()
  let @/ = expand('<cword>')
  call GrepLastSearch()
endfunction

function! GlobalGrep(search)
  exe "Unite -no-quit -auto-preview -buffer-name=search grep:."
endfunction

function! GlobalGrepLastSearch()
  call GlobalGrep(@/)
endfunction

function! GlobalGrepCurrentWord()
  let @/ = expand('<cword>')
  call GlobalGrepLastSearch()
endfunction

function! GetVisuallySelectedText()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! GrepVisuallySelectedText(isGlobal)
  let selectedText = GetVisuallySelectedText()
  let sanitizedSearch = EscapeSearch(selectedText)
  let @/ = sanitizedSearch
  if a:isGlobal == 0
    call Grep(sanitizedSearch)
  else
    call GlobalGrep(sanitizedSearch)
  endif
endfunction

command! -nargs=1 Grep :call Grep(<q-args>)
command! GrepLastSearch :call GrepLastSearch()
command! GrepCurrentWord :call GrepCurrentWord()
command! GGrepLastSearch :call GlobalGrepLastSearch()
command! GGrepCurrentWord :call GlobalGrepCurrentWord()
command! -range GrepVisualSelection :call GrepVisuallySelectedText(0)
command! -range GGrepVisualSelection :call GrepVisuallySelectedText(1)

nmap <leader>n :GrepLastSearch<CR>
nmap <leader>f :GrepCurrentWord<CR>
nmap <leader>N :GGrepLastSearch<CR>
nmap <leader>F :GGrepCurrentWord<CR>
vnorem <leader>n :GrepVisualSelection<CR>
vnorem <leader>N :GGrepVisualSelection<CR>

" }}}

" manage vim sessions {{{
function! s:SaveSession(...)
  let filename = a:1
  if strlen(filename) == 0
    if exists("g:currentSessionFile")
      let filename = g:currentSessionFile
      if strlen(filename) == 0
        let filename = "./session.vim"
      endif
    else
      let filename = "./session.vim"
    endif
  endif

  let filename = fnamemodify(filename, ":p")

  let currentTab = tabpagenr()
  tabfirst
  execute ':tabnext ' currentTab
  execute ':mksession! ' filename

  let g:currentSessionFile = filename
  echom "Saved session to path: " filename
endfunction

function! s:RestoreSession(...)
  let filename = a:1
  if strlen(filename) == 0
    let filename = "./session.vim"
  endif

  let filename = fnamemodify(filename, ":p")

  execute ':source  ' filename

  let g:currentSessionFile = filename
  echom "Restored session from path: " filename
endfunction

function! s:AutoRestoreSession()
  if argc() == 0
    let filename = "./session.vim"
    let filename = fnamemodify(filename, ":p")
    if filereadable(filename)
      echo "Restoring session..."
      call s:RestoreSession(filename)
    endif
  endif
endfunction

function! s:AutoSaveSession()
  if exists("g:currentSessionFile")
    let filename = g:currentSessionFile
    if filereadable(filename)
      call s:SaveSession(filename)
    endif
  endif
endfunction

autocmd VimEnter * nested call s:AutoRestoreSession()
autocmd VimLeavePre * call s:AutoSaveSession()

command! -nargs=? -complete=file SaveSession call s:SaveSession(<q-args>)
command! -nargs=? -complete=file RestoreSession call s:RestoreSession(<q-args>)
" }}}

" open current directory in Git Tower {{{

nmap <leader>t :silent !gittower .<CR>

"}}}

" }}}

" load the customizations {{{
let $VIM_CUSTOM_DIR=$HOME
if filereadable(expand($VIM_CUSTOM_DIR."/.nvimrc.custom"))
  source $VIM_CUSTOM_DIR/.nvimrc.custom
endif
" }}}


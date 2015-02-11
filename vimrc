" detect OS {{{
let s:is_windows = has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_macvim = has('gui_macvim')
"}}}

" NeoBundle Configuration {{{

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  if (s:is_windows)
    set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
  else
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
endif

if (s:is_windows)
  call neobundle#begin(expand('$HOME/vimfiles/bundle/'))
else
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles {{{
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'nmake -f make_msvc.mak nodebug=1',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'godlygeek/tabular'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'salsifis/vim-transpose'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'skalnik/vim-vroom'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-heroku'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-scriptease'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'vim-scripts/UltiSnips'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'JarrodCTaylor/vim-ember-cli-test-runner'
NeoBundle 'bronson/vim-trailing-whitespace'

NeoBundleLazy 'pydave/AsyncCommand'

" languages {{{
NeoBundle 'adimit/prolog.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'groenewege/vim-less'
NeoBundle 'heartsentwined/vim-emblem'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'peterhoeg/vim-tmux'
NeoBundle 'raw1z/vim-csharp'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'simpsonjulian/cypher-vim-syntax'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/VB.NET-Syntax'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'raw1z/Windows-PowerShell-Syntax-Plugin'
NeoBundle 'heartsentwined/vim-ember-script'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'vim-scripts/Vim-R-plugin'
"}}}

" Colorschemes {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jgdavey/vim-railscasts'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'nelstrom/vim-mac-classic-theme'
NeoBundle 'raw1z/vim-colorschemes'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/nuvola.vim'
NeoBundle 'wgibbs/vim-irblack'
NeoBundle 'baskerville/bubblegum'
NeoBundle 'Pychimp/vim-luna'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'vim-scripts/candy.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'goatslacker/mango.vim'
"}}}

" }}}

call neobundle#end()

filetype plugin indent on     " Required!

NeoBundleCheck

"}}}

" Unite Configuration {{{
let bundle = neobundle#get('unite.vim')
function! bundle.hooks.on_source(bundle)
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#set_profile('files', 'context.smartcase', 1)
  call unite#custom#source('line,outline','matchers','matcher_fuzzy')
endfunction

if (s:is_windows)
  let g:unite_data_directory=$HOME.'/.vim/.cache/unite'
else
  let g:unite_data_directory='~/.vim/.cache/unite'
end

let g:unite_enable_start_insert=0
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -a -C4'
  let g:unite_source_grep_recursive_opt=''
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
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
endif

nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
nnoremap <silent> [unite]i :<C-u>Unite neobundle/install<cr>

  NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':'colorscheme'}} "{{{
    nnoremap <silent> [unite]c :<C-u>Unite -auto-resize -auto-preview -buffer-name=colorschemes colorscheme<cr>
  "}}}
  NeoBundleLazy 'raw1z/unite-font', {'autoload':{'unite_sources':['font', 'font/size']}} "{{{
    nnoremap <silent> [unite]g :<C-u>Unite -auto-resize -auto-preview font<cr>
    nnoremap <silent> [unite]gs :<C-u>Unite -auto-resize -auto-preview font/size<cr>
  "}}}
  NeoBundleLazy 'raw1z/unite-projects', {'autoload':{'unite_sources':'projects'}} "{{{
    nnoremap <silent> [unite]j :<C-u>Unite -auto-resize projects<cr>
  "}}}
  NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources': ['quickfix', 'location_list']}} "{{{
    nnoremap <silent> [unite]q :<C-u>Unite -auto-resize -auto-preview quickfix<cr>
  "}}}
  NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':['tag','tag/file']}} "{{{
    nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
  "}}}
  NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}} "{{{
    nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
  "}}}
  NeoBundleLazy 'Shougo/unite-help', {'autoload':{'unite_sources':'help'}} "{{{
    nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
  "}}}
  NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen','unite_sources':['junkfile','junkfile/new']}} "{{{
    if (s:is_windows)
      let g:junkfile#directory=expand($HOME."/.vim/.cache/junk")
    else
      let g:junkfile#directory=expand("~/.vim/.cache/junk")
    end
  "}}}
" }}}

" tmuxline {{{
let g:tmuxline_powerline_separators = 0
" }}}

" airline {{{
  let g:airline_left_sep=''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_right_sep=''
" }}}

" sneak configuration {{{

nmap ff <Plug>SneakForward
xmap ff <Plug>VSneakForward
nmap FF <Plug>SneakBackward
xmap FF <Plug>VSneakBackward

" "}}}

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

" Personal Configuration {{{

" change the leader key mapping to an easier reachable one
let mapleader="ç"
let $VIM_CUSTOM_DIR=$HOME

" load all the extensions
syntax on

set nu
set ttyfast
set nowrap
set tabstop=2 shiftwidth=2 expandtab autoindent
set incsearch
set hlsearch
set ignorecase smartcase
set scrolloff=2

syntax on
set history=500
set ruler
set showcmd
set laststatus=2

set encoding=utf-8
set fileencoding=utf-8
set nobackup
set noswapfile
set foldmethod=marker

" disable search highlights
nmap <silent> <leader>/ :nohl<CR>

" keyboard shortcuts for buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" keyboard shortcuts for tab switching
nnoremap <silent> <C-TAB> :tabnext<CR>
nnoremap <silent> <C-S-TAB> :tabprevious<CR>

" keyboard shortcuts for tab switching
nnoremap <silent> <C-TAB> :tabnext<CR>
nnoremap <silent> <C-S-TAB> :tabprevious<CR>

" forces use of hklm for navigating in a document
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ctrlp configuration
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.sw[a-z]$',
      \ }

" rake.vim additions
map <leader>a :AS<CR>

" Explicitly tell vim that the terminal supports 256 colors
set t_Co=256

" tagbar configuration
nmap <F8> :TagbarToggle<CR>

" remap for macbook pro french keyboard
map <C-L> <C-]>
inoremap kj <Esc>
cmap <C-P> <Up>
cmap <C-N> <Down>

" ack configuration
let g:ackprg="ag --nogroup --nocolor --column"

" nerdtree configuration
map <leader>q :NERDTreeToggle<CR>

" autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" jump up to the commit object for the current tree by pressing C.
autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

" set easier keymaps for [, {, } and ] suitable for french keyboards
map <leader>) ]
map <leader>( [
map <leader>)) }
map <leader>(( {

" call the tabularize command each time the pipe caracter is typed
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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

" keyboard mapping for gundo
nnoremap <leader>u :GundoToggle<CR>

" Source the vimrc/gvimrc/exrc file after saving it
if has("autocmd")
  augroup ConfigChangeDetect
    autocmd! bufwritepost [_.]vimrc source $MYVIMRC
    autocmd  bufwritepost [_.]vimrc echo ".vimrc reloaded"

    autocmd! bufwritepost [_.]vimrc.custom source $MYVIMRC
    autocmd  bufwritepost [_.]vimrc.custom echo ".vimrc reloaded"

    autocmd  bufwritepost [_.]gvimrc source $MYGVIMRC
    autocmd  bufwritepost [_.]gvimrc echo ".gvimrc reloaded "

    autocmd  bufwritepost [_.]gvimrc.custom source $MYGVIMRC
    autocmd  bufwritepost [_.]gvimrc.custom echo ".gvimrc reloaded "

    autocmd  bufwritepost [_.]exrc source %:p
    autocmd  bufwritepost [_.]exrc echo "_exrc reloaded"
  augroup END
endif

" keyboard map for editing the vim/gvimrc configuration file
nmap <leader>v :split $MYVIMRC<CR>
nmap <leader>vc :split $VIM_CUSTOM_DIR/.vimrc.custom<CR>
nmap <leader>vg :split $MYGVIMRC<CR>
nmap <leader>vgc :split $VIM_CUSTOM_DIR/.gvimrc.custom<CR>
nmap <leader>ve :split _exrc<CR>

" keyboard map for toggling wrap mode
nmap <leader>W :set wrap! linebreak nolist<CR>
nmap <leader><space> :only<CR>

" mapping to make movements operate on 1 screen line in wrap mode
:map j gj
:map k gk

" keyboard map for opening the git status window
nmap <leader>g :Gstatus<CR>

" allow folder specific configuration
set exrc

" consider all the files with an extension ending with 'proj' or 'xaml' as an xml file
" use 4 spaces for vb/cs/m/swift files
augroup filetypedetect
  au BufNewFile,BufRead *.*proj set syntax=xml
  au BufNewFile,BufRead *.xaml set ft=xaml syntax=xml ts=4 sts=4 sw=4 et
  au BufNewFile,BufRead *.vb set syntax=vbnet ft=vbnet ts=4 sts=4 sw=4 et
  au BufNewFile,BufRead *.cs set ts=4 sts=4 sw=4 et
  au BufNewFile,BufRead *.m set ts=4 sts=4 sw=4 et
  au BufNewFile,BufRead *.swift set ts=4 sts=4 sw=4 et
augroup END

" allow to open a folder in a new tab
" and set it as the tab's working folder
function! s:TabGo(path)
  execute ':tabnew ' a:path
  execute ':lcd ' a:path
endfunction

command! -nargs=1 -complete=dir TabGo call s:TabGo(<q-args>)

" tag navigation keybord maps
map <leader>t g<C-]>
map <leader>tp :pop<CR>
map <leader>tb :silent !ctags --recurse<CR>

" remove read only attribute
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

nmap <leader>y  :call RemoveCurrentFileReadOnly()<CR>

" cd into a directory and source given file
function! ChangeDirectoryAndSource(path, filename)
  execute('lcd '.a:path)
  execute('NERDTreeCWD')
  execute('source'.a:filename)
endfunction
command! -nargs=1 Xcd call ChangeDirectoryAndSource(<q-args>, "_exrc")

" allow to run an extenal command an display its output in a preview window
function! s:RunCommandAndPreviewOutput(shellCommand)
  execute('pclose')
  let env = {}
  function env.get(temp_file)
    silent execute 'pedit '.a:temp_file
    wincmd P
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal syntax=none
    setlocal bufhidden=delete
    silent execute '%s/
//ge'
    execute '0'
    setlocal nomodifiable
    map <buffer> q :q<CR>
  endfunction
  call asynccommand#run(a:shellCommand, asynccommand#tab_restore(env))
endfunction

function! s:trigger(title, shellCommand)
  call s:RunCommandAndPreviewOutput(a:shellCommand)
  echo a:title
endfunction

" fast quicklist interactions {{{
function! OpenQuickListAndWrap()
  execute("copen")
  execute ("set wrap")
endfunction

nmap <leader>co :call OpenQuickListAndWrap()<CR>
nmap <leader>cq :ccl<CR>
nmap <leader>cc :cc<CR>
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
nmap <leader>wj <C-w><C-j>
nmap <leader>wk <C-w><C-k>
nmap <leader>wh <C-w><C-h>
nmap <leader>wl <C-w><C-l>
nmap <leader>wf <C-w>f
nmap <leader>wgf <C-w>gf
nmap <silent> <leader>wo :only<CR>
nmap <silent> <C-space> :only<CR>
"}}}

" easily resize and split windows {{{
nmap <leader>w+ <C-w>+
nmap <leader>w- <C-w>-
nmap <leader>w> <C-w>>
nmap <leader>w< <C-w><
nmap <leader>w= <C-w>=
nmap <space><space> <C-w><C-w>
nmap <silent> <leader>wsp :sp<CR>
nmap <silent> <leader>wvs :vs<CR>
" }}}

" easy save and quit {{{
nmap <silent> <leader>s :update<CR>
nmap <silent> <leader>x :x<CR>
"}}}

" UltiSnips configuration
let g:UltiSnipsEditSplit = "horizontal"

" load the customizations
if filereadable(expand($VIM_CUSTOM_DIR."/.vimrc.custom"))
  source $VIM_CUSTOM_DIR/.vimrc.custom
endif

" Grep {{{
function! Grep(search)
  let command = 'vimgrep /'.a:search.'/gj '.expand('%')
  execute(command)
  copen
  cc
endfunction

function! GrepLastSearch()
  call Grep(@/)
endfunction

function! GrepCurrentWord()
  let @/ = expand('<cword>')
  call GrepLastSearch()
endfunction

function! GlobalGrep(search)
  ccl
  cgete []
  let command = 'silent bufdo vimgrepadd /'.a:search.'/gj %'
  execute(command)
  copen
  cc
endfunction

function! GlobalGrepLastSearch()
  call GlobalGrep(@/)
endfunction

function! GlobalGrepCurrentWord()
  let @/ = expand('<cword>')
  call GlobalGrepLastSearch()
endfunction

command! Grep :call GrepLastSearch()
command! Grepw :call GrepCurrentWord()
command! GGrep :call GlobalGrepLastSearch()
command! GGrepw :call GlobalGrepCurrentWord()

nmap <leader>n :Grep<CR>
nmap <leader>f :Grepw<CR>
nmap <leader>N :GGrep<CR>
nmap <leader>F :GGrepw<CR>
" }}}

" XML to YAML {{{
function! s:ConfigureYamlPreviewBuffer()
  execute ':0'
  execute ':delete'
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal syntax=yaml
  setlocal bufhidden=delete
  setlocal nomodifiable
  map <buffer> q :q<CR>
endfunction

function! s:GetCurrentBufferContentAsFile()
  let xmlTempFile = tempname()
  call writefile(getline(1,'$'), xmlTempFile)
  return xmlTempFile
endfunction

function! Xml2Yaml()
  let currentBufferFile = s:GetCurrentBufferContentAsFile()
  let shellCommand = 'xml2yaml '.currentBufferFile
  vnew
  exe 'read !'.shellCommand
  call s:ConfigureYamlPreviewBuffer()
endfunction

function! Xml2YamlDiff(comparedFile)
  let currentBufferFile = s:GetCurrentBufferContentAsFile()
  let shellCommand = 'xml2yaml '.currentBufferFile
  new
  exe 'read !'.shellCommand
  call s:ConfigureYamlPreviewBuffer()
  diffthis
  only

  let shellCommand = 'xml2yaml '.a:comparedFile
  vnew
  exe 'read !'.shellCommand
  call s:ConfigureYamlPreviewBuffer()
  diffthis
  execute ('0goto')
endfunction

command! Xml2Yaml :call Xml2Yaml()
command! -nargs=1 Xml2YamlDiff call Xml2YamlDiff(<q-args>)
autocmd Syntax xml map <buffer> <leader>r :Xml2Yaml<CR>
autocmd Syntax xml map <buffer> <leader>R :Xml2YamlDiff
" }}}

"}}}

" define shortcuts for inserting backslash, tilde, brackets and square brackets {{{
imap <leader>) ]
imap <leader>( [
imap <leader><leader>) }
imap <leader><leader>( {
imap <leader>n ~
imap <leader>/ \
imap <leader>! \|
" }}}

" search visually selected text by pressing * {{{
vnorem * y/<c-r>"<cr>
" }}}

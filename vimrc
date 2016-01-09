" variables {{{

let $VIM_CUSTOM_DIR=$HOME

" detect OS {{{
let s:is_windows = has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_macvim = has('gui_macvim')
"}}}

" }}}

" neobundle configuration {{{
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.nvim/bundle/'))

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

" Utils {{{

NeoBundle 'honza/vim-snippets'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'JarrodCTaylor/vim-ember-cli-test-runner'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'ervandew/supertab'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'salsifis/vim-transpose'
NeoBundle 'scrooloose/nerdtree'
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
NeoBundle 'vim-scripts/git-flow-format'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'yssl/QFEnter'
NeoBundle 'mbbill/undotree'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/incsearch-fuzzy.vim'
NeoBundle 'haya14busa/incsearch-easymotion.vim'
NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'tyru/open-browser.vim'
NeoBundleLazy 'rafi/vim-unite-issue', {
    \  'directory': 'unite-issue',
    \  'unite_sources': [ 'issue' ],
    \  'depends': [
    \    'mattn/webapi-vim', 'tyru/open-browser.vim', 'Shougo/unite.vim'
    \  ]
    \ }

if has('nvim')
  NeoBundle 'Shougo/deoplete.nvim'
  NeoBundle 'vim-scripts/UltiSnips'
endif

NeoBundleLazy 'pydave/AsyncCommand'
" }}}

" colorschemes {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'chriskempson/base16-vim'
" }}}

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
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'maralla/vim-toml-enhance', {'depends': 'cespare/vim-toml'}
NeoBundle 'kylef/apiblueprint.vim'
NeoBundle 'lambdatoast/elm.vim'
NeoBundle 'mxw/vim-jsx'
"}}}

" }}}

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"}}}

" general configuration {{{

" Custom defaults {{{
syntax on

let mapleader="ç"

set nu
set nowrap
set tabstop=2 shiftwidth=2 expandtab autoindent
set ignorecase smartcase
set scrolloff=2

set ruler
set showcmd
set laststatus=2

set fileencoding=utf-8
set nobackup
set noswapfile
set foldmethod=marker

set autoread

if has("nvim")
  set wildignorecase
endif

" allow folder specific configuration
set exrc

" }}}

" vim default keys remap {{{
map <C-L> <C-]>
inoremap kj <Esc>
cmap <C-P> <Up>
cmap <C-N> <Down>
" }}}

" forces use of hklm for navigating in a document {{{
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
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
colorscheme gruvbox
set background=dark
" }}}

" Source the vimrc/gvimrc/exrc file after saving it {{{
if has("autocmd")
  augroup ConfigChangeDetect
    autocmd! bufwritepost init.vim source $MYVIMRC
    autocmd  bufwritepost init.vim echo "init.vim reloaded"

    autocmd! bufwritepost [_.]nvimrc source $MYVIMRC
    autocmd  bufwritepost [_.]nvimrc echo ".nvimrc reloaded"

    autocmd! bufwritepost [_.]nvimrc.custom source $MYVIMRC
    autocmd  bufwritepost [_.]nvimrc.custom echo ".nvimrc.custom reloaded"

    autocmd  bufwritepost [_.]exrc source %:p
    autocmd  bufwritepost [_.]exrc echo "_exrc reloaded"
  augroup END
endif
" }}}

" keyboard map for editing the configuration files {{{
nmap <leader>v :split $MYVIMRC<CR>
nmap <leader>vc :split $VIM_CUSTOM_DIR/.nvimrc.custom<CR>
nmap <leader>vg :split $MYGVIMRC<CR>
nmap <leader>vgc :split $VIM_CUSTOM_DIR/.gvimrc.custom<CR>
nmap <leader>ve :split _exrc<CR>
" }}}

" keyboard map for toggling wrap mode {{{
nmap <leader>W :set wrap! linebreak nolist<CR>
nmap <leader><space> :only<CR>
" }}}

" mapping to make movements operate on 1 screen line in wrap mode {{{
:map j gj
:map k gk
" }}}

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

" search visually selected text by pressing * {{{
vnorem * y/<c-r>"<cr>
" }}}

" .net development {{{

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

" }}}

" Deface support {{{
augroup filetypedetect
  au BufNewFile,BufRead *.html.erb.deface set syntax=eruby
augroup END
" }}}

" }}}

" terminal configuration {{{

if has('nvim')
  :tnoremap <Esc> <C-\><C-n>
  :tnoremap <A-h> <C-\><C-n><C-w>h
  :tnoremap <A-j> <C-\><C-n><C-w>j
  :tnoremap <A-k> <C-\><C-n><C-w>k
  :tnoremap <A-l> <C-\><C-n><C-w>l
  :tnoremap gt <C-\><C-n>gt
  :tnoremap gT <C-\><C-n>gT
endif

function! s:openTerminalInSplittedWindow()
  execute "new | terminal"
endfunction
command! Vterm call s:openTerminalInSplittedWindow()

" }}}

" python configuration {{{

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}

" plugins configuration {{{

" unite configuration {{{
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
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''

  let g:unite_source_rec_async_command =
  \ ['ag', '--nocolor', '--nogroup', '-g', '""',
  \ '--ignore', '*.jpg',
  \ '--ignore', '*.jpeg',
  \ '--ignore', '*.gif',
  \ '--ignore', '*.png',
  \ '--ignore', '*.ttf',
  \ '--ignore', '*.woff',
  \ '--ignore', '*.eot'
  \ ]
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

nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]k :<C-u>Unite -no-quit -auto-preview -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
nnoremap <silent> [unite]u :<C-u>Unite neobundle/update<cr>

  NeoBundleLazy 'Shougo/neoyank.vim', {'autoload':{'unite_sources':'history/yank'}} "{{{
    nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
  "}}}
  NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':'colorscheme'}} "{{{
    nnoremap <silent> [unite]c :<C-u>Unite -auto-resize -auto-preview -buffer-name=colorschemes colorscheme<cr>
  "}}}
  NeoBundleLazy 'raw1z/unite-font', {'autoload':{'unite_sources':['font', 'font/size']}} "{{{
    nnoremap <silent> [unite]g :<C-u>Unite -auto-resize -auto-preview font<cr>
    nnoremap <silent> [unite]gs :<C-u>Unite -auto-resize -auto-preview font/size<cr>
  "}}}
  NeoBundleLazy 'raw1z/unite-projects', {'autoload':{'unite_sources':'projects'}} "{{{
    nnoremap <silent> [unite]p :<C-u>Unite -auto-resize projects<cr>
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

" tmuxline configuration {{{
let g:tmuxline_powerline_separators = 0
" }}}

" airline configuration {{{
  let g:airline_left_sep=''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_right_sep=''
  let g:airline#extensions#branch#format = 'Git_flow_branch_format'
  let g:airline#extensions#tabline#enabled = 1
" }}}

" ctrlp configuration {{{
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v((\.(git|hg|svn))|(node_modules|_build|deps|bower_components))$',
      \ 'file': '\v\.(pyc|pyo|rbc|rbo|class|o|beam)$',
      \ }
" }}}

" rake.vim additions {{{
map <leader>a :AS<CR>
" }}}

" tagbar configuration {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" ack configuration {{{
let g:ackprg="ag --nogroup --nocolor --column"
" }}}

" nerdtree configuration {{{
map <leader>q :NERDTreeToggle<CR>
" }}}

" fugitive configuration {{{

" autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" jump up to the commit object for the current tree by pressing C.
autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

" keyboard map for opening the git status window
nmap <leader>g :Gstatus<CR>

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

" UltiSnips configuration {{{
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
" }}}

" Choowin configuration {{{
nmap <leader>@ <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
" }}}

" incsearch.vim configuration {{{

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
    \   'converters': [incsearch#config#fuzzy#converter()],
    \   'modules': [incsearch#config#easymotion#module()],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction

nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stary)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
noremap <silent><expr> <space>/ incsearch#go(<SID>config_easyfuzzymotion())
" }}}

" unite-issues configuration {{{
let g:github_token = "d75aad090ec246827bf6139971a3b6ba22bd135e"
" }}}

" deoplete {{{

let g:deoplete#enable_at_startup = 1

" }}}

" undotree {{{

nmap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 0

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" }}}

" easymotion {{{

nmap <Leader><Leader>s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

hi link EasyMotionMoveHL Search
" }}}

" openbrowser {{{

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

let g:openbrowser_default_search = "duckduckgo"

" }}}

" }}}

" Commands {{{

" cd into a directory and source given file {{{
function! ChangeDirectoryAndSource(path, filename)
  execute('lcd '.a:path)
  execute('NERDTreeCWD')
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

nmap <leader>y  :call RemoveCurrentFileReadOnly()<CR>
" }}}

" Grep Improved {{{
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

" manage vim session with support for nerdtree {{{
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
  tabdo NERDTreeClose
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

  tabdo NERDTreeClose
  execute ':source  ' filename

  let g:currentSessionFile = filename
  echom "Restored session from path: " filename
endfunction

function! s:AutoRestoreSession()
  let filename = "./session.vim"
  let filename = fnamemodify(filename, ":p")
  if filereadable(filename)
    echo "Restoring session..."
    call s:RestoreSession(filename)
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

" allow to run an extenal command an display its output in a preview window {{{

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

" }}}

" }}}

" load the customizations {{{
if filereadable(expand($VIM_CUSTOM_DIR."/.nvimrc.custom"))
  source $VIM_CUSTOM_DIR/.nvimrc.custom
endif
" }}}


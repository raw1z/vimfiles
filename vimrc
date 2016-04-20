" detect OS {{{
let s:is_windows = has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_macvim = has('gui_macvim')
"}}}

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
  " }}}

endif

" }}}

" dein configuration {{{
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim'))
call dein#add('Shougo/dein.vim')

" plugins {{{

" utils {{{
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('tpope/vim-sensible')
call dein#add('honza/vim-snippets')
call dein#add('mileszs/ack.vim')
call dein#add('bling/vim-airline')
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-projectionist')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-rake')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-rsi')
call dein#add('tpope/vim-scriptease')
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('Shougo/vimfiler.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('tyru/open-browser.vim')
call dein#add('godlygeek/tabular')
call dein#add('AndrewRadev/linediff.vim')
call dein#add('mbbill/undotree')
call dein#add('Shougo/unite.vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('kana/vim-textobj-user')
call dein#add('osyo-manga/vim-textobj-multiblock')
call dein#add('thinca/vim-textobj-between')
call dein#add('rhysd/vim-textobj-anyblock')
call dein#add('sotte/presenting.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('ervandew/supertab')

if has('nvim')
  call dein#add('SirVer/ultisnips')
  call dein#add('Shougo/deoplete.nvim')
else
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neocomplete.vim')
endif
"}}}

" colorschemes {{{
call dein#add('altercation/vim-colors-solarized')
call dein#add('morhetz/gruvbox')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('chriskempson/base16-vim')
" }}}

" languages {{{
call dein#add('sheerun/vim-polyglot')
call dein#add('adimit/prolog.vim')
call dein#add('juvenn/mustache.vim')
call dein#add('raw1z/vim-csharp')
call dein#add('simpsonjulian/cypher-vim-syntax')
call dein#add('raw1z/Windows-PowerShell-Syntax-Plugin')
call dein#add('vim-scripts/Vim-R-plugin')
call dein#add('kylef/apiblueprint.vim')
"}}}

" Unite sources {{{

call dein#add('rafi/vim-unite-issue', {
  \  'depends': [
  \    'mattn/webapi-vim', 'tyru/open-browser.vim', 'Shougo/unite.vim'
  \  ]
  \ })

call dein#add('Shougo/neoyank.vim')
  nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>

call dein#add('ujihisa/unite-colorscheme')
  nnoremap <silent> [unite]c :<C-u>Unite -auto-resize -auto-preview -buffer-name=colorschemes colorscheme<cr>

if s:is_macvim
  call dein#add('raw1z/unite-font') "{{{
  nnoremap <silent> [unite]g :<C-u>Unite -auto-resize -auto-preview font<cr>
  nnoremap <silent> [unite]gs :<C-u>Unite -auto-resize -auto-preview font/size<cr>
  "}}}
endif

call dein#add('raw1z/unite-projects')
  nnoremap <silent> [unite]p :<C-u>Unite -auto-resize projects<cr>

call dein#add('osyo-manga/unite-quickfix')
  nnoremap <silent> [unite]q :<C-u>Unite -auto-resize -auto-preview quickfix<cr>

call dein#add('tsukkee/unite-tag')
  nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>

call dein#add('Shougo/unite-outline')
  nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>

call dein#add('Shougo/unite-help')
  nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>

call dein#add('Shougo/junkfile.vim')
  if (s:is_windows)
    let g:junkfile#directory=expand($HOME."/.vim/.cache/junk")
  else
    let g:junkfile#directory=expand("~/.vim/.cache/junk")
  end

call dein#add('osyo-manga/unite-filetype')
"}}}

"}}}

call dein#end()
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" update plugins {{{
nnoremap <silent> <space>u :call dein#update()<CR>
"}}}

"}}}

" Base configuration {{{

" sensible defaults {{{

let mapleader="ç"

set nu
set nowrap
set tabstop=2 shiftwidth=2 expandtab autoindent
set ignorecase smartcase

set ruler
set showcmd

set nobackup
set noswapfile
set foldmethod=marker

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
nmap <leader>v :tabnew $MYVIMRC<CR>
nmap <leader>vc :tabnew $VIM_CUSTOM_DIR/.nvimrc.custom<CR>
nmap <leader>vg :tabnew $MYGVIMRC<CR>
nmap <leader>vgc :tabnew $VIM_CUSTOM_DIR/.gvimrc.custom<CR>
nmap <leader>ve :tabnew _exrc<CR>
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
nmap <space><space> <C-w><C-w>
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
nnoremap <silent> <leader><leader>r <Plug>(unite_redraw)
"}}}

" airline configuration {{{
  let g:airline_left_sep=''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_right_sep=''
  let g:airline#extensions#tabline#enabled = 0
" }}}

" rake.vim additions {{{
map <leader>a :AS<CR>
" }}}

" ack configuration {{{
let g:ackprg="ag --nogroup --nocolor --column"
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

" unite-issues configuration {{{
let g:github_token = "d75aad090ec246827bf6139971a3b6ba22bd135e"
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

" vim-operator-replace {{{

nmap <leader>y <Plug>(operator-replace)

" }}}

" vim-expand-region {{{

map + <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

" }}}

" vimfiler {{{

call vimfiler#custom#profile('default', 'context', {
\   'safe' : 0
\ })

let g:vimfiler_as_default_explorer=1
let g:vimfiler_time_format="%d/%m/%y %H:%M"

map <space>e :VimFiler -create<CR>
map <space>s :new <bar> VimFiler -create<CR>
map <space>v :vnew <bar> VimFiler -create<CR>

" }}}

" UltiSnips configuration {{{
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
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

function! Grep(search)
  let sanitizedSearch = escape(a:search, '-')
  echo a:search
  exe "Unite -no-quit -auto-preview -buffer-name=search -input=".sanitizedSearch." grep:%"
endfunction

function! GrepLastSearch()
  call Grep(@/)
endfunction

function! GrepCurrentWord()
  let @/ = expand('<cword>')
  call GrepLastSearch()
endfunction

function! GlobalGrep(search)
  exe "Unite -no-quit -auto-preview -buffer-name=search -input=".a:search." grep:$buffers"
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
  let s:V = vital#of("vital")
  let s:S = s:V.import("Data.String")
  let search = s:S.chomp(s:S.trim(selectedText))
  let @/ = search
  if a:isGlobal == 0
    call Grep(search)
  else
    call GlobalGrep(search)
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


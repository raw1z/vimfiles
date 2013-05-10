runtime bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible

" change the leader key mapping to an easier reachable one
let mapleader="ç"

" load all the extensions
call pathogen#infect()

syntax on
filetype plugin indent on

set nu
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

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set nobackup
set noswapfile
set autoread
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

" powerline configuration
let g:Powerline_symbols = 'fancy'

" Explicitly tell vim that the terminal supports 256 colors
set t_Co=256

" tagbar configuration
nmap <F8> :TagbarToggle<CR>

" c# specific configuration
if has("autocmd")
  filetype on
  autocmd FileType cs setlocal ts=4 sts=4 sw=4 et
endif

" remap for macbook pro french keyboard
map <C-L> <C-]>
inoremap kj <Esc>
cmap <C-P> <Up>
cmap <C-N> <Down>

" ack configuration
let g:ackprg="ack --smart-case --recurse -H --nocolor --nogroup --column --ignore-dir=node_modules"
let g:ackprg=g:ackprg." --type-add EXT=.sass,.haml,.coffee"

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
map <leader>) }
map <leader>( {
map <leader>)) ]
map <leader>(( [

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
    autocmd  bufwritepost [_.]vimrc call Pl#Load()
    autocmd  bufwritepost [_.]vimrc echo ".vimrc reloaded"

    autocmd! bufwritepost [_.]vimrc.custom source $MYVIMRC
    autocmd  bufwritepost [_.]vimrc.custom call Pl#Load()
    autocmd  bufwritepost [_.]vimrc.custom echo ".vimrc reloaded"

    autocmd  bufwritepost [_.]gvimrc source $MYGVIMRC
    autocmd  bufwritepost [_.]gvimrc call Pl#Load()
    autocmd  bufwritepost [_.]gvimrc echo ".gvimrc reloaded "

    autocmd  bufwritepost [_.]gvimrc.custom source $MYGVIMRC
    autocmd  bufwritepost [_.]gvimrc.custom call Pl#Load()
    autocmd  bufwritepost [_.]gvimrc.custom echo ".gvimrc reloaded "

    autocmd  bufwritepost [_.]exrc source %:p
    autocmd  bufwritepost [_.]exrc echo "_exrc reloaded"
  augroup END
endif

" keyboard map for editing the vim/gvimrc configuration file
nmap <leader>v :split $MYVIMRC<CR>
nmap <leader>vc :split ~/.vimrc.custom<CR>
nmap <leader>gv :split $MYGVIMRC<CR>
nmap <leader>gvc :split ~/.gvimrc.custom<CR>

" keyboard map for toggling wrap mode
nmap <leader>W :set wrap! linebreak nolist<CR>

" keyboard map for opening the git status window
nmap <leader>g :Gstatus<CR>

" allow folder specific configuration
set exrc

" on windows, consider all the files with an extension
" ending with 'proj' as an xml file
if has("win32")
  augroup filetypedetect
    au BufNewFile,BufRead *.*proj set syntax=xml
    au BufNewFile,BufRead *.vb set syntax=vbnet ft=vbnet ts=4 sts=4 sw=4 et
  augroup END
endif

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

" allow to run an extenal command an display its output in
" a preview window
function! g:RunCommandAndPreviewOutput(shellCommand)
  execute('pclose')
  let env = {}
  function env.get(temp_file)
    silent execute 'pedit '.a:temp_file
    wincmd P
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal syntax=none
    setlocal bufhidden=delete
    silent execute '%s///ge'
    execute '0'
    setlocal nomodifiable
    map <buffer> q :q<CR>
  endfunction
  call asynccommand#run(a:shellCommand, asynccommand#tab_restore(env))
endfunction

" fast quicklist interactions
function! OpenQuickListAndWrap() 
  execute("copen")
  execute ("set wrap")
endfunction

nmap <leader>co :call OpenQuickListAndWrap()<CR>
nmap <leader>cq :ccl<CR>
nmap <leader>cc :cc<CR>

" diff mode keymap
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

" easily moves between opened windows
nmap <leader>wj <C-w><C-j>
nmap <leader>wk <C-w><C-k>
nmap <leader>wh <C-w><C-h>
nmap <leader>wl <C-w><C-l>
nmap <silent> <leader>wo :only<CR>

" easily resize and split windows
nmap <leader>w+ <C-w>+
nmap <leader>w- <C-w>-
nmap <leader>w> <C-w>>
nmap <leader>w< <C-w><
nmap <leader>w= <C-w>=
nmap <space> <C-w><C-w>
nmap <silent> <leader>wsp :sp<CR>
nmap <silent> <leader>wvs :vs<CR>

" easy save and quit
nmap <silent> <leader>s :update<CR>
nmap <silent> <leader>x :x<CR>

" load the customizations
if filereadable(expand("~/.vimrc.custom"))
  source ~/.vimrc.custom
endif

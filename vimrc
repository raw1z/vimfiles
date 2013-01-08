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
set history=200
set ruler
set showcmd
set laststatus=2

syntax enable
set background=dark
colorscheme jellybeans

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set nobackup
set autoread

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
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
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
let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir=node_modules"

" nerdtree keymap
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

" Source the vimrc/gvimrc file after saving it
if has("autocmd")
  if has("win32")
    autocmd! bufwritepost _vimrc source $MYVIMRC
    autocmd  bufwritepost _vimrc call Pl#Load()
    autocmd  bufwritepost _vimrc echo "reloaded _vimrc"

    autocmd  bufwritepost _gvimrc source $MYGVIMRC
    autocmd  bufwritepost _gvimrc call Pl#Load()
    autocmd  bufwritepost _gvimrc echo "reloaded _gvimrc"
  else
    autocmd! bufwritepost .vimrc source $MYVIMRC
    autocmd  bufwritepost .vimrc call Pl#Load()
    autocmd  bufwritepost .vimrc echo "reloaded .vimrc"

    autocmd  bufwritepost .gvimrc source $MYGVIMRC
    autocmd  bufwritepost .gvimrc call Pl#Load()
    autocmd  bufwritepost .gvimrc echo "reloaded .gvimrc"
  endif
endif

" keyboard map for editing the vim/gvimrc configuration file
nmap <leader>v :split $MYVIMRC<CR>
nmap <leader>gv :split $MYGVIMRC<CR>

" keyboard map for toggling wrap mode
nmap <leader>w :set wrap! linebreak nolist<CR>

" keyboard map for opening the git status window
nmap <leader>g :Gstatus<CR>

" allow folder specific configuration
set exrc secure

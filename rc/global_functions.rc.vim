
let s:is_windows = has('win32') || has('win64')

function! g:RunCommandInTerminal(command) abort "{{{
  execute 'tabnew'
  nmap <buffer> q :q<CR>
  call termopen(a:command)
endfunction "}}}
function! g:IsWindows() abort "{{{
  return s:is_windows
endfunction "}}}
function! g:IsMac() abort "{{{
  return !s:is_windows && !has('win32unix')
      \ && (has('mac') || has('macunix') || has('gui_macvim')
      \     || (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction "}}}
function! g:RemoveFilesReadOnlyAttribute(files) abort "{{{
  if has("win32")
    let s:cmd = "silent ! attrib -R ".a:files
  else
    let s:cmd = "silent !chmod u+w ".a:files
  end

  execute s:cmd
endfunction "}}}
function! g:RemoveCurrentFileReadOnly() abort "{{{
  let filename = expand("%")
  call g:RemoveFilesReadOnlyAttribute(filename)
endfunction "}}}
function! g:AutoTabularize() abort "{{{
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction "}}}


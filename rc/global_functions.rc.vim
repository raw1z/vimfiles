let s:Vital = vital#of('vital') "{{{
let s:Prelude = s:Vital.import('Prelude') "}}}

function! g:RunCommandInTerminal(command) abort "{{{
  execute 'tabnew'
  nmap <buffer> q :q<CR>
  call termopen(a:command)
endfunction "}}}
function! g:IsWindows() abort "{{{
  return s:Prelude.is_windows()
endfunction "}}}
function! g:IsMac() abort "{{{
  return s:Prelude.is_mac()
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


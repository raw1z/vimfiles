" open terminal {{{
command! Vterm call s:open_terminal_in_vertically_splitted_window() "{{{
function! s:open_terminal_in_vertically_splitted_window()
  execute "vnew | terminal"
endfunction "}}}
command! Sterm call s:open_terminal_in_splitted_window() "{{{
function! s:open_terminal_in_splitted_window()
  execute "new | terminal"
endfunction "}}}
command! Tterm call s:open_terminal_in_new_tab() "{{{
function! s:open_terminal_in_new_tab()
  execute "tabnew | terminal"
endfunction "}}}
"}}}
" cd into a directory and source given file {{{
function! s:change_directory_and_source(path, filename)
  execute('lcd '.a:path)
  execute('source'.a:filename)
endfunction

if IsWindows()
  command! -nargs=1 Xcd call s:change_directory_and_source(<q-args>, "_exrc")
else
  command! -nargs=1 Xcd call s:change_directory_and_source(<q-args>, ".exrc")
endif
" }}}
" allow to open a folder in a new tab {{{
function! s:goto_folder_in_new_tab(path)
  execute 'tabnew ' a:path
  execute 'lcd ' a:path
  execute "VimFiler"
endfunction

command! -nargs=1 -complete=dir TabGo call s:goto_folder_in_new_tab(<q-args>)
" }}}
" Grep Improved {{{
fun! s:escape_search(search)
  let s:V = vital#of("vital")
  let s:S = s:V.import("Data.String")

  let sanitizedSearch = s:S.replace(a:search, "\\<", "")
  let sanitizedSearch = s:S.replace(sanitizedSearch, "\\>", "")
  let sanitizedSearch = s:S.chomp(sanitizedSearch)
  let sanitizedSearch = s:S.trim(sanitizedSearch)
  let sanitizedSearch = s:S.replace(sanitizedSearch, " ", '\\ ')

  return sanitizedSearch
endf

function! s:grep(search)
  let sanitizedSearch = s:escape_search(a:search)
  exe "Unite -toggle -auto-preview -buffer-name=search -input=" . sanitizedSearch . " grep:%"
endfunction

function! s:grep_last_search()
  call s:grep(@/)
endfunction

function! s:grep_current_word()
  let @/ = expand('<cword>')
  call s:grep_last_search()
endfunction

function! GlobalGrep(search)
  let sanitizedSearch = s:escape_search(a:search)
  exe "Unite -toggle -auto-preview -buffer-name=search -input=" . sanitizedSearch . " grep:."
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
  let sanitizedSearch = s:escape_search(selectedText)
  let @/ = sanitizedSearch
  if a:isGlobal == 0
    call s:grep(sanitizedSearch)
  else
    call GlobalGrep(sanitizedSearch)
  endif
endfunction

command! -nargs=1 Grep :call s:grep(<q-args>)
command! GrepLastSearch :call s:grep_last_search()
command! GrepCurrentWord :call s:grep_current_word()
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
function! s:SaveSession(...) "{{{
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
endfunction "}}}
function! s:RestoreSession(...) "{{{
  let filename = a:1
  if strlen(filename) == 0
    let filename = "./session.vim"
  endif

  let filename = fnamemodify(filename, ":p")

  execute ':source  ' filename

  let g:currentSessionFile = filename
  echom "Restored session from path: " filename
endfunction "}}}
function! s:AutoRestoreSession() "{{{
  if argc() == 0
    let filename = "./session.vim"
    let filename = fnamemodify(filename, ":p")
    if filereadable(filename)
      echo "Restoring session..."
      call s:RestoreSession(filename)
    endif
  endif
endfunction "}}}
function! s:AutoSaveSession() "{{{
  if exists("g:currentSessionFile")
    let filename = g:currentSessionFile
    if filereadable(filename)
      call s:SaveSession(filename)
    endif
  endif
endfunction "}}}

command! -nargs=? -complete=file SaveSession call s:SaveSession(<q-args>)
command! -nargs=? -complete=file RestoreSession call s:RestoreSession(<q-args>)
" }}}
" open current directory in Git Tower {{{

nmap <leader>t :silent !gittower .<CR>

"}}}
" Open current buffer file in new tab {{{
function! s:tab_this()
  let currentBuffer = bufname("%")
  execute 'hide'
  execute 'tabnew ' . currentBuffer
endfunction
command! TabThis call s:tab_this()
"}}}
" Show current folder's git history {{{
function! s:show_git_history(current_branch_only)
  if a:current_branch_only
    execute "Git log develop.. --oneline"
  else
    execute "Git log --oneline"
  endif
endfunction
command! ShowGitHistory call s:show_git_history(0)
command! ShowCurrentBranchGitHistory call s:show_git_history(1)
nmap <leader>h :silent ShowGitHistory<CR>
nmap <leader>H :silent ShowCurrentBranchGitHistory<CR>
" }}}

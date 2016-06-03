" autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" jump up to the commit object for the current tree by pressing C.
autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif


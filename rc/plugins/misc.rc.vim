" vim-elm
let g:elm_format_autosave = 1

" camelcase motion
call camelcasemotion#CreateMotionMappings('<leader>')

" neomake
autocmd! BufWritePost * Neomake


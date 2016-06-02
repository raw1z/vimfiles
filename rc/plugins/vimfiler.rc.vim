call vimfiler#custom#profile('default', 'context', {
      \   'safe' : 0
      \ })

let g:vimfiler_as_default_explorer=1
let g:vimfiler_time_format="%d/%m/%y %H:%M"

if executable('qlmanage')
  let g:vimfiler_quick_look_command = 'qlmanage -p'
endif


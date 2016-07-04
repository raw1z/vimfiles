call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
let g:deoplete#keyword_patterns.tex = '[^\w|\s][a-zA-Z_]\w*'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.python = ''
let g:deoplete#omni#functions = {}
let g:deoplete#enable_camel_case = 1
let g:deoplete#disable_auto_complete = 0

call deoplete#custom#set('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])


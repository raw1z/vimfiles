" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change matchers.
call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source(
\ 'file_rec', 'matchers', ['matcher_cpsm'])

" Change sorters.
call denite#custom#source(
\ 'file_rec', 'sorters', ['sorter_sublime'])

" use rg for file_rec command.
call denite#custom#var('file_rec', 'command',
\ ['rg', '--files', '--glob', '!.git'])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--smart-case', '--no-heading'])

" Change mappings.
call denite#custom#map('insert', '<C-j>', 'move_to_next_line')
call denite#custom#map('insert', '<C-k>', 'move_to_prev_line')


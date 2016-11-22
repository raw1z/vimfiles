" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" file_rec custom matcher
call denite#custom#source(
\ 'file_rec', 'matchers', ['matcher_cpsm'])

" use ag for file_rec command.
" call denite#custom#var('file_rec', 'command',
"       \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Ag command on grep source
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'final_opts', [])
" call denite#custom#var('grep', 'separator', [])
" call denite#custom#var('grep', 'default_opts',
"     \ ['--smart-case', '--vimgrep', '--hidden', '--skip-vcs-ignores'])


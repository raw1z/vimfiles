" Vim color file
" Converted from Textmate theme Fluidvision using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Fluidvision"

hi Cursor ctermfg=NONE ctermbg=0 cterm=NONE guifg=NONE guibg=#000000 gui=NONE
hi Visual ctermfg=NONE ctermbg=222 cterm=NONE guifg=NONE guibg=#ffd793 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=253 cterm=NONE guifg=NONE guibg=#dcdcdc gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=253 cterm=NONE guifg=NONE guibg=#dcdcdc gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=253 cterm=NONE guifg=NONE guibg=#dcdcdc gui=NONE
hi LineNr ctermfg=243 ctermbg=253 cterm=NONE guifg=#7a7a7a guibg=#dcdcdc gui=NONE
hi VertSplit ctermfg=248 ctermbg=248 cterm=NONE guifg=#adadad guibg=#adadad gui=NONE
hi MatchParen ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi StatusLine ctermfg=0 ctermbg=248 cterm=bold guifg=#000000 guibg=#adadad gui=bold
hi StatusLineNC ctermfg=0 ctermbg=248 cterm=NONE guifg=#000000 guibg=#adadad gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=222 cterm=NONE guifg=NONE guibg=#ffd793 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=146 cterm=NONE guifg=NONE guibg=#aebcd2 gui=NONE
hi Search ctermfg=NONE ctermbg=146 cterm=NONE guifg=NONE guibg=#aebcd2 gui=NONE
hi Directory ctermfg=160 ctermbg=NONE cterm=NONE guifg=#c5060b guibg=NONE gui=italic
hi Folded ctermfg=60 ctermbg=231 cterm=NONE guifg=#386f90 guibg=#f4f4f4 gui=NONE

hi Normal ctermfg=0 ctermbg=231 cterm=NONE guifg=#000000 guibg=#f4f4f4 gui=NONE
hi Boolean ctermfg=63 ctermbg=NONE cterm=NONE guifg=#585cf6 guibg=NONE gui=italic
hi Character ctermfg=160 ctermbg=NONE cterm=NONE guifg=#c5060b guibg=NONE gui=italic
hi Comment ctermfg=60 ctermbg=195 cterm=NONE guifg=#386f90 guibg=#deeefd gui=NONE
hi Conditional ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi Constant ctermfg=160 ctermbg=NONE cterm=NONE guifg=#c5060b guibg=NONE gui=italic
hi Define ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi ErrorMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi Float ctermfg=130 ctermbg=NONE cterm=bold guifg=#c34f0a guibg=NONE gui=bold
hi Function ctermfg=25 ctermbg=NONE cterm=bold guifg=#1b4b9d guibg=NONE gui=bold
hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Keyword ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi Label ctermfg=88 ctermbg=NONE cterm=NONE guifg=#840e0b guibg=NONE gui=NONE
hi NonText ctermfg=250 ctermbg=254 cterm=NONE guifg=#bfbfbf guibg=#e8e8e8 gui=NONE
hi Number ctermfg=130 ctermbg=NONE cterm=bold guifg=#c34f0a guibg=NONE gui=bold
hi Operator ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi PreProc ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi Special ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi SpecialKey ctermfg=250 ctermbg=253 cterm=NONE guifg=#bfbfbf guibg=#dcdcdc gui=NONE
hi Statement ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi StorageClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi String ctermfg=88 ctermbg=NONE cterm=NONE guifg=#840e0b guibg=NONE gui=NONE
hi Tag ctermfg=17 ctermbg=NONE cterm=bold guifg=#001d56 guibg=NONE gui=bold
hi Title ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi Todo ctermfg=60 ctermbg=195 cterm=inverse,bold guifg=#386f90 guibg=#deeefd gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi rubyFunction ctermfg=25 ctermbg=NONE cterm=bold guifg=#1b4b9d guibg=NONE gui=bold
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=160 ctermbg=NONE cterm=NONE guifg=#c5060b guibg=NONE gui=italic
hi rubyConstant ctermfg=24 ctermbg=NONE cterm=bold guifg=#2d5579 guibg=NONE gui=bold
hi rubyStringDelimiter ctermfg=88 ctermbg=NONE cterm=NONE guifg=#840e0b guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi rubyInclude ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi rubyGlobalVariable ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi rubyRegexp ctermfg=88 ctermbg=NONE cterm=NONE guifg=#840e0b guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=88 ctermbg=NONE cterm=NONE guifg=#840e0b guibg=NONE gui=NONE
hi rubyEscape ctermfg=34 ctermbg=NONE cterm=NONE guifg=#26b31a guibg=NONE gui=NONE
hi rubyControl ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi rubyClassVariable ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi rubyOperator ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi rubyException ctermfg=68 ctermbg=NONE cterm=bold guifg=#5b91e1 guibg=NONE gui=bold
hi rubyPseudoVariable ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi rubyRailsUserClass ctermfg=24 ctermbg=NONE cterm=bold guifg=#2d5579 guibg=NONE gui=bold
hi rubyRailsARAssociationMethod ctermfg=59 ctermbg=NONE cterm=bold guifg=#3c4c72 guibg=NONE gui=bold
hi rubyRailsARMethod ctermfg=59 ctermbg=NONE cterm=bold guifg=#3c4c72 guibg=NONE gui=bold
hi rubyRailsRenderMethod ctermfg=59 ctermbg=NONE cterm=bold guifg=#3c4c72 guibg=NONE gui=bold
hi rubyRailsMethod ctermfg=59 ctermbg=NONE cterm=bold guifg=#3c4c72 guibg=NONE gui=bold
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=60 ctermbg=195 cterm=NONE guifg=#386f90 guibg=#deeefd gui=NONE
hi erubyRailsMethod ctermfg=59 ctermbg=NONE cterm=bold guifg=#3c4c72 guibg=NONE gui=bold
hi htmlTag ctermfg=24 ctermbg=NONE cterm=NONE guifg=#1c3981 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=24 ctermbg=NONE cterm=NONE guifg=#1c3981 guibg=NONE gui=NONE
hi htmlTagName ctermfg=24 ctermbg=NONE cterm=NONE guifg=#1c3981 guibg=NONE gui=NONE
hi htmlArg ctermfg=24 ctermbg=NONE cterm=NONE guifg=#1c3981 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=160 ctermbg=NONE cterm=NONE guifg=#c5060b guibg=NONE gui=italic
hi javaScriptFunction ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=59 ctermbg=NONE cterm=bold guifg=#3c4c72 guibg=NONE gui=bold
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=17 ctermbg=NONE cterm=bold guifg=#001d56 guibg=NONE gui=bold
hi yamlAnchor ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi yamlAlias ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi yamlDocumentHeader ctermfg=NONE ctermbg=189 cterm=NONE guifg=NONE guibg=#d4dff4 gui=NONE
hi cssURL ctermfg=24 ctermbg=NONE cterm=NONE guifg=#20498d guibg=NONE gui=italic
hi cssFunctionName ctermfg=59 ctermbg=NONE cterm=bold guifg=#3c4c72 guibg=NONE gui=bold
hi cssColor ctermfg=160 ctermbg=NONE cterm=NONE guifg=#c5060b guibg=NONE gui=italic
hi cssPseudoClassId ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=italic
hi cssClassName ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=italic
hi cssValueLength ctermfg=130 ctermbg=NONE cterm=bold guifg=#c34f0a guibg=NONE gui=bold
hi cssCommonAttr ctermfg=64 ctermbg=NONE cterm=bold guifg=#619a1c guibg=NONE gui=bold
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
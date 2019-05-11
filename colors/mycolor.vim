" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolor"

hi Normal       ctermfg=white   ctermbg=black           guifg=white     guibg=blue
hi NonText      ctermfg=darkGray        guifg=darkGray  gui=NONE
hi SpecialKey   ctermfg=darkGray        guifg=darkGray  gui=NONE
hi Directory    ctermfg=cyan            guifg=cyan
hi LineNr       ctermfg=fg              guifg=fg
hi FoldColumn   ctermfg=fg              guifg=fg        guibg=bg
hi Title        cterm=bold              guifg=white     gui=bold
hi IncSearch    cterm=reverse           guifg=black     guibg=yellow
hi StatusLineNC cterm=reverse           guifg=green     guibg=darkBlue  gui=NONE
hi StatusLine   cterm=reverse           guifg=cyan      guibg=darkBlue  gui=bold
hi Visual       cterm=reverse           guifg=white     guibg=darkBlue
hi Folded       ctermfg=yellow  ctermbg=darkGray        guifg=gray      guibg=bg
hi Cursor       ctermfg=black   ctermbg=white           guifg=black     guibg=white
hi Search       ctermfg=black   ctermbg=yellow          guifg=black     guibg=orange
hi Todo         ctermfg=black   ctermbg=magenta         guifg=white     guibg=magenta
hi Pmenu        ctermfg=white   ctermbg=darkGray        guifg=white     guibg=darkGray
hi PmenuSel     ctermfg=white   ctermbg=magenta         guifg=white     guibg=magenta

hi Comment      ctermfg=green           guifg=fg        guibg=darkGreen
hi Special      ctermfg=magenta         guifg=magenta
hi Constant     ctermfg=magenta         guifg=magenta
hi Statement    ctermfg=yellow          guifg=yellow
hi Type         ctermfg=yellow          guifg=yellow
hi Preproc      ctermfg=red             guifg=red
hi Identifier   ctermfg=cyan            guifg=cyan
hi Label        ctermfg=yellow          guifg=yellow
hi Operator     ctermfg=yellow          guifg=orange    gui=NONE

hi WarningMsg   ctermfg=cyan            guifg=cyan      guibg=darkBlue  gui=bold
hi ModeMsg      ctermfg=yellow          guifg=yellow    gui=NONE
hi MoreMsg      ctermfg=yellow          guifg=yellow    gui=NONE
hi Error        ctermfg=fg              ctermbg=red     guifg=red       guibg=darkBlue  gui=underline
hi ErrorMsg     ctermfg=fg              ctermbg=red     guifg=orange    guibg=darkBlue
hi Underlined   ctermfg=cyan    cterm=underline         guifg=cyan      gui=underline

hi DiffChange   ctermfg=black   ctermbg=darkGreen       guifg=black     guibg=darkGreen
hi DiffText     ctermfg=black   ctermbg=lightGreen      guifg=black     guibg=olivedrab
hi DiffAdd      ctermfg=black   ctermbg=blue            guifg=black     guibg=slateblue
hi DiffDelete   ctermfg=black   ctermbg=cyan            guifg=black     guibg=coral

hi cIf0         ctermfg=gray            guifg=gray
hi SignColumn   guibg=bg

hi link         cCommentString          cComment
hi link         cComment2String         cComment
hi link         cOctalZero              Number

" hi link         diffAdded               Identifier
" hi link         diffRemoved             Special

hi rcMainObject         ctermfg=cyan    guifg=cyan
hi rcParam              ctermfg=green   guifg=lightGreen
hi rcCommonAttribute    ctermfg=yellow  guifg=orange


" vim: ts=8 sw=8 et

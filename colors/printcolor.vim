" Vim color file

set background=light
set printoptions-=syntax:n
set printoptions+=syntax:y
let g:colors_name = "printcolor"

hi Normal       guifg=black     guibg=white
hi Comment      guifg=darkGreen guibg=bg
hi Statement    guifg=blue      gui=NONE
hi Type         guifg=blue      gui=NONE
hi Label        guifg=blue      gui=NONE
hi Operator     guifg=blue      gui=NONE
hi Identifier   guifg=darkGray
hi Cursor       guifg=white     guibg=black
hi NonText      guifg=white     gui=NONE
hi SpecialKey   guifg=lightGray gui=NONE
hi Title        guifg=fg        gui=bold
hi ModeMsg      guifg=blue      gui=NONE
hi MoreMsg      guifg=blue      gui=NONE
hi ZenkakuSpace guibg=bg

" vim: ts=8 sw=8 et

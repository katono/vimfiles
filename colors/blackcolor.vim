" Vim color file

let g:colors_name = "blackcolor"

hi Normal       ctermfg=white           guifg=white     guibg=black
hi Comment      ctermfg=green           guifg=green     guibg=bg
hi Statement    gui=NONE
hi Type         gui=NONE
hi IncSearch    guifg=blue              guibg=yellow
hi Visual       cterm=reverse           guifg=gray      guibg=blue      gui=NONE
hi Folded       ctermfg=yellow  ctermbg=black           guifg=gray      guibg=bg
hi FoldColumn   ctermfg=fg              guifg=fg        guibg=bg

" vim: ts=8 sw=8 et

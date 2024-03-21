

" save options
let s:cpo_save = &cpo

set cpo&vim

" ignore other ft
if exists("b:current_syntax") &&  b:current_syntax != "hjson"
    "cleanup
    let &cpo = s:cpo_save
    unlet s:cpo_save
    finish
endif


syn match otherKey "\"KC_[0-9A-Z]\{2,\}\""

syn match numberKey "\"KC_[0-9]\{1\}\""
syn match charKey "\"KC_[A-Z]\{1}\""

syn match mouseKey "\"KC_MS_[A-Z]\+\""
syn match mouseKey "\"KC_BTN[0-9]\""
syn match mouseKey "\"KC_WH_[A-Z]\+\""

syn match QKKey "\"QK_[0-9A-Z]\+\""
syn match LayerKey "\"[_A-Z]\{2,6\}(.\+)\""
syn match debugKey "\"QK_BOOT\""
syn match debugKey  "\"DB_TOGG\""

syn match noKey "\"KC_NO\""
syn match trnsKey "\"KC_TRNS\""

hi def link debugKey Special
hi def link QKKey Special

hi numberKey ctermfg=Cyan guifg=Cyan
hi charKey ctermfg=white guifg=white
hi LayerKey ctermfg=Magenta guifg=Magenta
hi otherKey ctermfg=yellow guifg=yellow
hi mouseKey ctermfg=blue guifg=blue

hi Special ctermfg=Green guifg=Green
hi debugKey ctermfg=Green guifg=Green
hi noKey ctermfg=red guifg=red

"function! s:HighlightKeycodes()
"endfunction

"augroup keycodesque
"    au!
"    autocmd CursorMovedI <buffer> silent call s:HighlightKeycodes()
"    autocmd ColorScheme <buffer> silent call s:HighlightKeycodes()
"    autocmd BufEnter <buffer> silent call s:HighlightKeycodes()
"augroup END

let b:current_syntax = "qmkkm"

"cleanup
let &cpo = s:cpo_save
unlet s:cpo_save

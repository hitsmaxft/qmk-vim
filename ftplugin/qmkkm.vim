vim9script

#test line   [ "KC_1", "KC_3", "MT(1, KC_F1)", "KC_BSLS" ]

var qmk_keymap: dict<string>  = { KC_A: 'a',
    KC_B: 'b',
    KC_C: 'c',
    KC_D: 'd',
    KC_E: 'e',
    KC_F: 'f',
    KC_G: 'g',
    KC_H: 'h',
    KC_I: 'i',
    KC_J: 'j',
    KC_K: 'k',
    KC_L: 'l',
    KC_M: 'm',
    KC_N: 'n',
    KC_O: 'o',
    KC_P: 'p',
    KC_Q: 'q',
    KC_R: 'r',
    KC_S: 's',
    KC_T: 't',
    KC_U: 'u',
    KC_V: 'v',
    KC_W: 'w',
    KC_X: 'x',
    KC_Y: 'y',
    KC_Z: 'z',
    KC_1: '1',
    KC_2: '2',
    KC_3: '3',
    KC_4: '4',
    KC_5: '5',
    KC_6: '6',
    KC_7: '7',
    KC_8: '8',
    KC_9: '9',
    KC_0: '0',
    KC_F1: 'F1',
    KC_F2: 'F2',
    KC_F3: 'F3',
    KC_F4: 'F4',
    KC_F5: 'F5',
    KC_F6: 'F6',
    KC_F7: 'F7',
    KC_F8: 'F8',
    KC_F9: 'F9',
    KC_F10: 'F10',
    KC_F11: 'F11',
    KC_F12: 'F12',
    KC_F13: 'F13',
    KC_F14: 'F14',
    KC_F15: 'F15',
    KC_F16: 'F16',
    KC_F17: 'F17',
    KC_F18: 'F18',
    KC_F19: 'F19',
    KC_F20: 'F20',
    KC_F21: 'F21',
    KC_F22: 'F22',
    KC_F23: 'F23',
    KC_F24: 'F24',
    KC_ENT: '↩',
    KC_ESC: 'Escape',
    KC_BSPC: 'Backspace',
    KC_TAB: 'Tab',
    KC_SPC: 'Space',
    KC_MINS: '-',
    KC_EQL: '=',
    KC_LBRC: '[',
    KC_RBRC: ']',
    KC_BSLS: '\',
    KC_NUHS: '#',
    KC_SCLN: ';',
    KC_QUOT: "'",
    KC_GRV: '`',
    KC_COMM: ',',
    KC_DOT: '.',
    KC_SLSH: '/',
    KC_NUBS: '\',
    KC_TILD: '~',
    KC_EXLM: '!',
    KC_AT: '@',
    KC_HASH: '#',
    KC_DLR: '$',
    KC_PERC: '%',
    KC_CIRC: '^',
    KC_AMPR: '&',
    KC_ASTR: '*',
    KC_LPRN: '(',
    KC_RPRN: ')',
    KC_LCBR: '{',
    KC_LEFT_CURLY_BRACE: '{',
    KC_RCBR: '}',
    KC_RIGHT_CURLY_BRACE: '}',
    KC_PIPE: '|',
    KC_LCTL: 'Left Ctrl',
    KC_LSFT: 'Left Shift',
    KC_LALT: 'Alt',
    KC_LGUI: 'Gui',
    KC_TRNS: '______' }

var qmk_symbol = { KC_ENT: '↩',
            KC_ESC: 'Escape',
            KC_BSPC: 'BS',
            KC_TAB: 'T',
            KC_SPC: ' ',
            KC_MINS: '-',
            KC_EQL: '=',
            KC_LBRC: '[',
            KC_RBRC: ']',
            KC_BSLS: '\',
            KC_NUHS: '#',
            KC_SCLN: ';',
            KC_QUOT: "'",
            KC_GRV: '`',
            KC_COMM: ',',
            KC_DOT: '.',
            KC_SLSH: '/',
            KC_NUBS: '\',
            KC_TILD: '~',
            KC_EXLM: '!',
            KC_AT: '@',
            KC_HASH: '#',
            KC_DLR: '$',
            KC_PERC: '%',
            KC_CIRC: '^',
            KC_AMPR: '&',
            KC_ASTR: '*',
            KC_LPRN: '(',
            KC_RPRN: ')',
            KC_LCBR: '{',
            KC_LEFT_CURLY_BRACE: '{',
            KC_RCBR: '}',
            KC_RIGHT_CURLY_BRACE: '}',
            KC_PIPE: '|',
            KC_LCTL: 'LCtrl',
            KC_LSFT: 'LShift',
            KC_LALT: 'LAlt',
            KC_LGUI: 'LGui',
            KC_RCTL: 'RCtrl',
            KC_RSFT: 'RShift',
            KC_RALT: 'RAlt',
            KC_RGUI: 'RGui' }

def g:QMK_KCFunction(): string
    var l:curr_word = expand('<cword>')
    var l:msg = ''

    if has_key(qmk_keymap, l:curr_word)
        l:msg = 'keycode for ' .. escape(qmk_keymap[l:curr_word] , '[]')
    endif
    l:msg
enddef


def Init_num_props(col_num_tag: string): void
    var col_num_tag_type = prop_type_get(col_num_tag)

    if col_num_tag_type == {}
        hlset([{ name: col_num_tag, ctermfg: 'black', ctermbg: 'gray'}])
        prop_type_add(col_num_tag, {highlight: col_num_tag})
    endif
enddef

def InitSymbolTag(col_tag: string): void
    var col_type = prop_type_get(col_tag)

    if col_type == {}
        hlset([{ name: col_tag, ctermfg: 'lightblue', ctermbg: 'Black'}])
        prop_type_add(col_tag, {highlight: col_tag})
    endif
enddef


def g:RenderKeyMapInfo(): void

    const kc_pattern = 'KC_[_A-Z]\{3,\}'

    ##match keycode in sr
    const kc_pattern_str = '[''"]\{1\}\zs\(MT\|KC_\|QC_\|LT\)[ ,_()A-Z0-9]*\ze[''"]\{1\}'

    for row in range(1, line('$'))
        var current = getline(row)
        var cnt = 1

        prop_clear(row)

        var [keycode, starts, ends] = matchstrpos(current, kc_pattern_str, 0, cnt)

        if starts == -1
            # not keycode line
            continue 
        endif


        while starts != -1

            #echom keycode .. ' at '  .. string(current)

            var col_num_tag = "qmk_keymap_key_col_nm"

            Init_num_props(col_num_tag)

            # add col number
            prop_add(
                row, starts,
                {
                    text: string(cnt) .. " ",
                    type: col_num_tag 
                }
            )

            if has_key(qmk_symbol, keycode)
                var col_tag = "inline_kc_" .. keycode

                var col_type = prop_type_get(col_tag)

                if col_type == {}
                    hlset([{ name: col_tag, ctermfg: 'lightblue', ctermbg: 'Black'}])
                    prop_type_add(col_tag, {highlight: col_tag})

                endif

                prop_add(
                    row, starts + len(keycode) + 1,
                    {
                        text: " " .. qmk_symbol[keycode],
                        type: col_tag 
                    }
                )
            endif

            cnt += 1

            [keycode, starts, ends] = matchstrpos(current, kc_pattern_str, 0, cnt)

        endwhile
    endfor
enddef

augroup QMKKeyMapAuto
    au!
    au FileReadPost keymap.json setlocal filetype=hjson.qmkkm
    au BufEnter keymap.json :call RenderKeyMapInfo()
    au BufRead keymap.json :call RenderKeyMapInfo()
    au BufWritePost keymap.json :call RenderKeyMapInfo()
    au FileType qmkkm :call RenderKeyMapInfo()
augroup END


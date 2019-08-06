" vim:fdm=indent
" ========================================================================
" Description: autoload/autofix.vim
" Author: voldikss
" GitHub: https://github.com/voldikss/vim-autofix-me
" ========================================================================

" NormalMapForEnter: <CR>
function! autofix#normalMapForCR() abort
    if &filetype ==# 'quickfix'
        return "\<CR>"
    else
        let line = trim(getline('.'))
        if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
            if line != ''
                \ && index(['#', '/'], line[0]) < 0
                \ && index([';', '{','[', '(', '\'], line[-1:]) < 0
                    return "A;"
            else
                return ""
            endif
        elseif index(['json', 'jsonc'], &filetype) >=0
            if line != ''
                \ && index(['#', '/'], line[0]) < 0
                \ && index([',', '{','['], line[-1:]) < 0
                return "A,"
            else
                return ""
            endif
        else
            return "" " prevent entering to the next line
        endif
    endif
endfunction

" InsertMapForEnter: <CR>
function! autofix#insertMapForCR() abort
    let line = getline('.') " can not use trim
    if pumvisible()
        return "\<C-y>"
    elseif index([')', ']', '}'], strcharpart(line, getpos('.')[2]-1, 1)) >= 0
        return "\<CR>\<Esc>O"
    elseif strcharpart(line, getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction

" InsertMapForSemicolonEnter: ;<CR>
function! autofix#insertMapForSemicolonCR() abort
    let line = trim(getline('.'))
    if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
        if line != '' && line[-1:] != ';' && index(['#', '/'], line[0]) < 0
            return "\<End>;\<CR>"
        else
            return "\<Esc>o"
        endif
    elseif index(['json', 'jsonc'], &filetype) >=0
        if line != ''
            \ && index(['#', '/'], line[0]) < 0
            \ && index([',', '{','['], line[-1:]) < 0
            return "\<End>,\<CR>"
        else
            return "\<Esc>o"
        endif
    else
        return "\<Esc>o"
    endif
endfunction

" InsertMapForSemicolonP: ;p
function! autofix#insertMapForSemicolonP() abort
    if &filetype == 'python'
        let line = trim(getline('.'))
        if line != '' && line[-1:] != ':'
            return "\<End>:\<CR>"
        else
            return ""
        endif
    else
        return "\<End>\<Space>{}\<Left>\<CR>\<Esc>O"
    endif
endfunction

" InsertMapForDoubleSemicolon: ;;
function! autofix#insertMapForDoubleSemicolon() abort
    let line = trim(getline('.'))
    if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss'], &filetype) >= 0
        if line != '' && line[-1:] != ';' && index(['#', '/'], line[0]) < 0
            return "\<End>;"
        else
            return ""
        endif
    elseif &filetype == 'python'
        if trim(line) != '' && line[-1:] != ':'
            return "\<End>:"
        else
            return ""
        endif
    elseif index(['json', 'jsonc'], &filetype)
        if trim(line) != '' && line[-1:] != ','
            return "\<End>,"
        else
            return ""
        endif
    else
        return ""
    endif
endfunction

" MapForBackspace: <BS>
function! autofix#insertMapForBS() abort
    if col('.') == 1
        if line('.')  != 1
            return  "\<ESC>kA\<Del>"
        else
            return ""
        endif
    else
        let line = getline('.')         " 此处不能用 trim()
        let paren = strcharpart(line, getpos('.')[2]-2, 2)
        if index(['()', '[]', '{}', '<>', '%%', '$$', '**', '""', "''", '~~', '``'], paren) >=0
            return "\<Left>\<Del>\<Del>"
        else
            return "\<Left>\<Del>"
        endif
    endif
endfunction

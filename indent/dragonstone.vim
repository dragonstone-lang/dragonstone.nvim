" Vim indent plugin
" Language:     Dragonstone
" Maintainer:   Vallereya
" URL:          https://github.com/dragonstone-lang/dragonstone.nvim

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

setlocal autoindent
setlocal indentexpr=GetDragonstoneIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=else,=elsif,=when,=rescue,=ensure

if exists("*GetDragonstoneIndent")
    finish
endif

function! GetDragonstoneIndent()
    let lnum = prevnonblank(v:lnum - 1)

    if lnum == 0
        return 0
    endif

    let ind = indent(lnum)
    let line = getline(lnum)
    let cline = getline(v:lnum)

    if line =~# '\<\(module\|mod\|class\|cls\|struct\|enum\|def\|fun\|if\|unless\|case\|select\|while\|until\|for\|begin\|do\|macro\|abstract\|abs\)\>.*$'
        let ind += shiftwidth()
    endif

    if line =~# '[[{(]\s*$'
        let ind += shiftwidth()
    endif

    if line =~# '@\[\s*$'
        let ind += shiftwidth()
    endif

    if cline =~# '^\s*\(end\|}\|]\|)\)\>'
        let ind -= shiftwidth()
    endif

    if cline =~# '^\s*\(else\|elsif\|elseif\|when\|rescue\|ensure\)\>'
        let ind -= shiftwidth()
    endif

    if cline =~# '^\s*\]'
        let ind -= shiftwidth()
    endif

    return ind
endfunction

let b:undo_indent = "setlocal expandtab< shiftwidth< softtabstop< tabstop<"
    \ . "| setlocal autoindent< indentexpr< indentkeys<"

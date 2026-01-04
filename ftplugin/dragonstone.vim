" Vim filetype plugin
" Language:     Dragonstone
" Maintainer:   Vallereya
" URL:          https://github.com/dragonstone-lang/dragonstone.nvim

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal commentstring=#\ %s
setlocal comments=:#

setlocal comments+=s:#[,mb:\ ,ex:]#

setlocal formatoptions-=t formatoptions+=croql

if exists("loaded_matchit")
    let b:match_words =
        \ '\<\%(if\|unless\|case\|while\|until\|for\|fun\|class\|module\|struct\|enum\|begin\|macro\)\>=\@!' .
        \ ':' .
        \ '\<\%(else\|elsif\|when\|rescue\|ensure\)\>:' .
        \ '\<end\>'
endif

setlocal foldmethod=indent
setlocal foldlevel=99

setlocal include=^\\s*\\(use\\\|from\\)\\s\\+
setlocal includeexpr=substitute(v:fname,'::','/','g')
setlocal suffixesadd=.ds

let b:undo_ftplugin = "setlocal commentstring< comments< formatoptions<"
    \ . "| setlocal foldmethod< foldlevel<"
    \ . "| setlocal include< includeexpr< suffixesadd<"

if exists("loaded_matchit")
    let b:undo_ftplugin .= "| unlet! b:match_words"
endif

let &cpo = s:cpo_save
unlet s:cpo_save

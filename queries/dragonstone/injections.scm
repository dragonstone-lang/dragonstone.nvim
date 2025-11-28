; String interpolations contain Dragonstone code
((interpolation) @injection.content
 (#set! injection.language "dragonstone"))

; Heredocs with language hints
((heredoc_body) @injection.content
 (#match? @injection.content "^<<-?HTML")
 (#set! injection.language "html"))

((heredoc_body) @injection.content
 (#match? @injection.content "^<<-?SQL")
 (#set! injection.language "sql"))

((heredoc_body) @injection.content
 (#match? @injection.content "^<<-?CSS")
 (#set! injection.language "css"))

((heredoc_body) @injection.content
 (#match? @injection.content "^<<-?(JS|JAVASCRIPT)")
 (#set! injection.language "javascript"))

((heredoc_body) @injection.content
 (#match? @injection.content "^<<-?(SH|SHELL)")
 (#set! injection.language "bash"))

((heredoc_body) @injection.content
 (#match? @injection.content "^<<-?RUBY")
 (#set! injection.language "ruby"))

; Regex literals
((regex_literal) @injection.content
 (#set! injection.language "regex"))

; Comments
((comment) @injection.content
 (#set! injection.language "comment"))

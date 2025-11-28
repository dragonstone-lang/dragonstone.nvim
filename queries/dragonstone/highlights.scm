; Keywords
[
  "fun"
  "con"
  "class"
  "struct"
  "module"
  "enum"
  "union"
  "annotation"
  "if"
  "else"
  "elsif"
  "unless"
  "case"
  "when"
  "while"
  "until"
  "for"
  "begin"
  "end"
  "rescue"
  "ensure"
  "then"
  "macro"
] @keyword

[
  "abstract"
  "alias"
  "asm"
  "break"
  "extend"
  "include"
  "next"
  "of"
  "private"
  "protected"
  "return"
  "select"
  "super"
  "with"
  "yield"
  "in"
] @keyword.control

; Special keywords
[
  "pointerof"
  "typeof"
  "sizeof"
  "instance_sizeof"
  "offsetof"
] @keyword.operator

; Constants
[
  "nil"
  "true"
  "false"
] @constant.builtin

[
  "__DIR__"
  "__FILE__"
  "__LINE__"
  "__END_LINE__"
] @constant.builtin

; Self
"self" @variable.builtin

; Types
[
  "str"
  "int"
  "bool"
  "char"
  "float"
] @type.builtin

; Comments
(comment) @comment
(block_comment) @comment.block

; Strings
(string_literal) @string
(string_interpolation) @string.special

; Characters
(char_literal) @character

; Numbers
(integer_literal) @number
(float_literal) @float

; Symbols
(symbol_literal) @symbol

; Functions
(function_definition
  name: (identifier) @function)

(call_expression
  function: (identifier) @function.call)

; Macros
(macro_definition
  name: (identifier) @function.macro)

; Classes and Modules
(class_definition
  name: (constant) @type)

(struct_definition
  name: (constant) @type)

(module_definition
  name: (constant) @type)

(enum_definition
  name: (constant) @type)

; Constants (uppercase identifiers)
(constant) @constant

; Variables
(instance_variable) @variable.member
(class_variable) @variable.member
(global_variable) @variable.builtin

; Parameters
(parameter (identifier) @parameter)

; Operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "<=>"
  "&&"
  "||"
  "!"
  "&"
  "|"
  "^"
  "~"
  "<<"
  ">>"
  "=~"
  "!~"
  "=>"
  "->"
] @operator

; Assignment
"=" @operator

; Punctuation
[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  ":"
  "::"
  "."
  ","
  ";"
] @punctuation.delimiter

; Interpolation
"#{" @punctuation.special
(interpolation) @none

; Macro delimiters
[
  "{%"
  "%}"
  "{{"
  "}}"
] @punctuation.special

; Method calls
(call_expression
  receiver: (identifier) @variable
  "." @punctuation.delimiter
  method: (identifier) @method)

; Built-in functions
((identifier) @function.builtin
 (#match? @function.builtin "^(abort|at_exit|caller|exit|gets|loop|main|p|pp|print|printf|puts|raise|rand|read_line|sleep|spawn|sprintf|system|debugger|record)$"))

; Type annotations
(type_annotation
  type: (_) @type)

; Errors
(ERROR) @error

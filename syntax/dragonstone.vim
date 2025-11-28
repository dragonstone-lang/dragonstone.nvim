if exists("b:current_syntax")
    finish
endif

" Keywords - Control flow
syn keyword dragonstoneKeywordControl fun con begin case class else elsif end ensure enum for if macro module rescue struct then union unless until when while
syn keyword dragonstonePrimaryControl abstract alias asm break extend in include next of private protected return select super with yield

" Spec keywords
syn keyword dragonstoneSpec describe context it expect_raises

" Constants
syn keyword dragonstoneConstant nil true false
syn keyword dragonstoneConstant __DIR__ __FILE__ __LINE__ __END_LINE__

" Built-in types
syn keyword dragonstoneType str int bool char float

" Keywords
syn keyword dragonstoneSelf self
syn keyword dragonstoneSpecialMethod pointerof typeof sizeof instance_sizeof offsetof previous_def forall out uninitialized

" Kernel functions
syn keyword dragonstoneKernel abort at_exit caller exit gets loop main p pp print printf puts raise rand read_line sleep spawn sprintf system debugger record
syn keyword dragontoneMacro class_getter class_property getter property setter def_clone def_equals def_equals_and_hash def_hash delegate forward_missing_to

" Comments
syn match dragonstoneComment "#[^\[].*$"
syn region dragonstoneBlockComment start="#\[" end="\]#" contains=dragonstoneBlockComment

" Numbers
syn match dragonstoneInteger "\<\d\+\([ui]\(8\|16\|32\|64\|128\)\)\?\>"
syn match dragonstoneInteger "\<0x[a-fA-F0-9_]\+\([ui]\(8\|16\|32\|64\|128\)\)\?\>"
syn match dragonstoneInteger "\<0o[0-7_]\+\([ui]\(8\|16\|32\|64\|128\)\)\?\>"
syn match dragonstoneInteger "\<0b[01_]\+\([ui]\(8\|16\|32\|64\|128\)\)\?\>"
syn match dragonstoneFloat "\<\d\+\.\d\+\([eE][+-]\?\d\+\)\?\(f32\|f64\)\?\>"
syn match dragonstoneFloat "\<\d\+\([eE][+-]\?\d\+\)\(f32\|f64\)\?\>"

" Strings
syn region dragonstoneString start=+"+ end=+"+ skip=+\\\\\|\\\"+ contains=dragonstoneInterpolation,dragonstoneEscape
syn region dragontoneSingleString start=+'+ end=+'+ skip=+\\\\\|\\'+ 
syn region dragonstoneSymbol start=+:'+ end=+'+ skip=+\\\\\|\\'+ 
syn region dragonstoneSymbolInterp start=+:"+ end=+"+ contains=dragonstoneInterpolation,dragonstoneEscape

" String interpolation
syn region dragonstoneInterpolation matchgroup=dragonstoneInterpolationDelimiter start="#{" end="}" contained contains=TOP

" Escape sequences
syn match dragonstoneEscape "\\[0-7]\{1,3\}\|\\x[0-9a-fA-F]\{2\}\|\\u[0-9a-fA-F]\{4\}\|\\u{[0-9a-fA-F ]\+}\|\\." contained

" Variables
syn match dragonstoneInstanceVar "@[a-zA-Z_][a-zA-Z0-9_]*[?!=]\?"
syn match dragonstoneClassVar "@@[a-zA-Z_][a-zA-Z0-9_]*[?!=]\?"
syn match dragonstoneGlobalVar "\$[a-zA-Z_][a-zA-Z0-9_]*"
syn match dragontoneFreshVar "%[a-zA-Z_][a-zA-Z0-9_]*"

" Constants and Classes
syn match dragonstoneClass "\<[A-Z][a-zA-Z0-9_]*\>"
syn match dragonstoneConstantName "\<[_A-Z][_A-Z0-9]*\>"

" Symbols
syn match dragonstoneSymbol ":\@<!:[a-zA-Z_][a-zA-Z0-9_]*[?!=]\?"
syn match dragonstoneSymbol "[a-zA-Z_][a-zA-Z0-9_]*[?!]\?:\ze[^:]"

" Operators
syn match dragonstoneOperator "[-+*/%<>=!&|^~]"
syn match dragonstoneOperator "&&\|||\|<<\|>>\|<=>\|<<=\|>>=\|===\|!="
syn match dragonstoneOperator "=>"
syn match dragonstoneOperator "->"

" Macro operators
syn match dragontoneMacroOp "{%\|%}\|{{\|}}"

" Functions
syn match dragonstoneFunction "\<\(fun\|con\)\s\+\zs[a-zA-Z_][a-zA-Z0-9_]*[?!=]\?"

" Linking to highlight groups
hi def link dragonstoneKeywordControl Keyword
hi def link dragontonePrimaryControl Keyword
hi def link dragonstoneSpec Keyword
hi def link dragonstoneConstant Constant
hi def link dragonstoneType Type
hi def link dragontoneSelf Constant
hi def link dragonstoneSpecialMethod Keyword
hi def link dragonstoneKernel Function
hi def link dragontoneMacro Function
hi def link dragonstoneComment Comment
hi def link dragonstoneBlockComment Comment
hi def link dragonstoneInteger Number
hi def link dragonstoneFloat Float
hi def link dragonstoneString String
hi def link dragontoneSingleString String
hi def link dragonstoneSymbol Constant
hi def link dragonstoneSymbolInterp Constant
hi def link dragonstoneInterpolationDelimiter Delimiter
hi def link dragonstoneEscape SpecialChar
hi def link dragonstoneInstanceVar Identifier
hi def link dragonstoneClassVar Identifier
hi def link dragonstoneGlobalVar Identifier
hi def link dragontoneFreshVar Identifier
hi def link dragonstoneClass Type
hi def link dragonstoneConstantName Constant
hi def link dragonstoneOperator Operator
hi def link dragontoneMacroOp Special
hi def link dragonstoneFunction Function

let b:current_syntax = "dragonstone"

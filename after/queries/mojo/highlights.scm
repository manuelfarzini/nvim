(attribute attribute: (identifier) @property)
(type (identifier) @type)

; Function calls

(decorator) @decorator
(decorator
  (identifier) @decorator)

(call
  function: (attribute attribute: (identifier) @function.method))
(call
  function: (identifier) @function)

; Function definitions

(function_definition
  name: (identifier) @function)

; Identifier naming conventions

((identifier) @type
 (#match? @type "^[A-Z][A-Za-z0-9_]*$")
 (#set! priority 100))

((identifier) @type
 (#any-of? @type "c_int" "c_uint" "c_long" "c_ulong" "c_float" "c_double")
 (#set! priority 101))

((identifier) @constant
  (#match? @constant "^_*[A-Z][A-Z0-9_]*$")
  (#not-any-of? @constant
    "U8" "U16" "U32" "U64"
    "I8" "I16" "I32" "I64"
    "S8" "S16" "S32" "S64"
    "F32" "F64" "SIMD")
  (#set! priority 101))

((argument_convention) @keyword
 (#set! priority 100))

; Builtin functions

((call
  function: (identifier) @function.builtin)
 (#match?
   @function.builtin
   "^(abs|all|always_inline|any|ascii|bin|bool|breakpoint|bytearray|bytes|callable|chr|classmethod|compile|complex|constrained|delattr|dict|dir|divmod|enumerate|eval|exec|filter|float|format|frozenset|getattr|globals|hasattr|hash|help|hex|id|input|int|isinstance|issubclass|iter|len|list|locals|map|max|memoryview|min|next|object|oct|open|ord|pow|print|property|range|repr|reversed|round|set|setattr|slice|sorted|staticmethod|str|sum|super|tuple|type|unroll|vars|zip|__mlir_attr|__mlir_op|__mlir_type|__import__)$"))

; Literals

[
  (none)
  (true)
  (false)
] @constant.builtin

[
  (integer)
  (float)
] @number

(comment) @comment
(string) @string
(escape_sequence) @escape

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(interpolation
  "{" @punctuation.special
  "}" @punctuation.special) @embedded

[
  "-"
  "-="
  "!="
  "*"
  "**"
  "**="
  "*="
  "/"
  "//"
  "//="
  "/="
  "&"
  "%"
  "%="
  "^"
  "+"
  "->"
  "+="
  "<"
  "<<"
  "<="
  "<>"
  "="
  ":="
  "=="
  ">"
  ">="
  ">>"
  "|"
  "~"
  "and"
  "in"
  "is"
  "not"
  "or"
  "is not"
  "not in"
  "!"
] @operator

[
  "as"
  "comptime"
  "assert"
  "async"
  "await"
  "borrowed"
  "break"
  "capturing"
  "class"
  "continue"
  "def"
  "del"
  "deinit"
  "elif"
  "else"
  "escaping"
  "except"
  "exec"
  "finally"
  "fn"
  "for"
  "from"
  "global"
  "if"
  "import"
  "inout"
  "lambda"
  "nonlocal"
  "owned"
  "out"
  "pass"
  "print"
  "raise"
  "raises"
  "ref"
  "return"
  "struct"
  "trait"
  "try"
  "var"
  "while"
  "with"
  "yield"
  "match"
  "case"
  "where"
] @keyword

(mlir_type "!" @punctuation.special (#set! "priority" 110))
(mlir_type ">" @punctuation.special (#set! "priority" 110))
(mlir_type "<" @punctuation.special (#set! "priority" 110))
(mlir_type "->" @punctuation.special (#set! "priority" 110))
(mlir_type "(" @punctuation.special (#set! "priority" 110))
(mlir_type ")" @punctuation.special (#set! "priority" 110))
(mlir_type "." @punctuation.special (#set! "priority" 110))
(mlir_type ":" @punctuation.special (#set! "priority" 110))
(mlir_type "+" @punctuation.special (#set! "priority" 110))
(mlir_type "-" @punctuation.special (#set! "priority" 110))
(mlir_type "*" @punctuation.special (#set! "priority" 110))
(mlir_type "," @punctuation (#set! "priority" 110))
(mlir_type) @type
; (argument_convention) @keyword

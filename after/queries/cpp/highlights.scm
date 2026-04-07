;; extends

;---------------------------------------------------------------
; Include paths

; angled
(preproc_include
  path: (system_lib_string) @include.path)

; quotes
(preproc_include
  path: (string_literal) @include.path)

;---------------------------------------------------------------
; Enhance priority over semantic tokens

((storage_class_specifier) @keyword.func
  (#set! priority 128))

((type_qualifier) @qualifier
  (#set! "priority" 128))

(alias_declaration
  name: (type_identifier) @type
  (#set! "priority" 128))


;---------------------------------------------------------------
; Highlight custom tokens as keywords/qualifiers

;-- Qualifiers

((auto) @type
  (#set! "priority" 128))

((type_identifier) @qualifier
  (#any-of? @qualifier
    "cast"
    "cexpr"
    "ceval"
    "implicit"
    "persist"
    "predicate"
    "proc"
    "EnableIf"
    "PlainT"
    "Requires"
    "elemIn"
    "decT"
  )
  (#set! "priority" 128))

((identifier) @qualifier
  (#any-of? @qualifier
    "cexpr"
    "ceval"
    "cast"
    "glob"
    "persist"
    "predicate"
    "proc"
    "decT"
    "sizeIn"
  )
  (#set! "priority" 128))

((field_identifier) @qualifier
  (#any-of? @qualifier
    "cexpr"
  )
  (#set! "priority" 128))

((namespace_identifier) @qualifier
  (#any-of? @qualifier
    "cexpr"
  )
  (#set! "priority" 128))

;-- Keywords

((identifier) @keyword.func
  (#any-of? @keyword.func
    "extern"
    "glob"
    "intern"
    "onedef"
    "where"
  )
  (#set! "priority" 128))

((type_identifier) @keyword.func
  (#any-of? @keyword.func
    "extern"
    "glob"
    "intern"
    "onedef"
    "where"
  )
  (#set! "priority" 128))

((type_qualifier) @keyword.func
  (#any-of? @keyword.func
    "extern"
    "intern"
    "onedef"
  )
  (#set! "priority" 128))

;-- Noexce

((identifier) @keyword.noexce
  (#any-of? @keyword.noexce
    "noexce"
  )
  (#set! "priority" 128))

;-- Constants

((identifier) @constant
  (#any-of? @constant
    "null"
    "nil"
    "none"
  )
  (#set! "priority" 128))

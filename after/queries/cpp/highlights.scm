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

((storage_class_specifier) @keyword
  (#set! priority 128))

; ((type_qualifier) @qualifier
;   (#set! "priority" 128))

; (alias_declaration
;   name: (type_identifier) @type
;   (#set! "priority" 128))

((auto) @type
  (#set! "priority" 128))

;-- Qualifiers

((type_identifier) @qualifier
  (#any-of? @qualifier
    "cast"
    "implicit"
    "predicate"
    "proc"
    "PlainT"
  )
  (#set! "priority" 128))

((identifier) @qualifier
  (#any-of? @qualifier
    "cast"
    "predicate"
    "proc"
  )
  (#set! "priority" 128))

;-- Keywords

((field_identifier) @keyword
  (#any-of? @keyword
   "cexpr"
  )
  (#set! "priority" 128))


((identifier) @keyword
  (#any-of? @keyword
    "cexpr"
    "ceval"
    "consfn"
    "declt"
    "glob"
    "intern"
    "noexce"
    "onedef"
    "where"
    "req"
  )
  (#set! "priority" 128))

((type_identifier) @keyword
  (#any-of? @keyword
    "cexpr"
    "declt"
    "glob"
    "intern"
    "onedef"
    "persist"
    "where"
    "Requires"
  )
  (#set! "priority" 128))

((type_qualifier) @keyword
  (#any-of? @keyword
    "intern"
    "onedef"
  )
  (#set! "priority" 128))

;-- Constants

((identifier) @constant.special
  (#any-of? @constant.special
    "null"
    "nil"
    "none"
  )
  (#set! "priority" 128))

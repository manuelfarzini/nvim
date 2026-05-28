;; extends

; Include paths

(preproc_include
  path: (system_lib_string) @include.path)

(preproc_include
  path: (string_literal) @include.path)

; Enhance priority over semantic tokens

((storage_class_specifier) @keyword
  (#set! priority 128))

((auto) @type
  (#set! "priority" 128))

; Qualifiers

((field_identifier) @qualifier
  (#any-of? @qualifier
   "predicate"
  )
  (#set! "priority" 128))

((type_identifier) @qualifier
  (#any-of? @qualifier
    "cast"
    "implicit"
    "predicate" 
    "PlainT"
  )
  (#set! "priority" 128))

((identifier) @qualifier
  (#any-of? @qualifier
    "cast"
    "predicate" 
  )
  (#set! "priority" 128))

; Keywords

((field_identifier) @keyword
  (#any-of? @keyword
   "cons"
   "glob"
   "noexce"
  )
  (#set! "priority" 128))


((identifier) @keyword
  (#any-of? @keyword
    "cons"
    "comp"
    "declt"
    "fn"
    "glob"
    "priv"
    "noexce"
    "onedef"
    "req"
    "where"
  )
  (#set! "priority" 128))

((type_identifier) @keyword
  (#any-of? @keyword
    "cons"
    "comp"
    "declt"
    "fn"
    "glob"
    "priv"
    "onedef"
    "persist"
    "where"
    "Requires"
  )
  (#set! "priority" 128))

((type_qualifier) @keyword
  (#any-of? @keyword
    "priv"
    "onedef"
  )
  (#set! "priority" 128))

; Constants

((identifier) @constant.special
  (#any-of? @constant.special
    "null"
    "nil"
    "none"
  )
  (#set! "priority" 128))

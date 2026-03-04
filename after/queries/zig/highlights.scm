; extends

(_
  (_) @type
  (#match? @type "^_*[A-Z][a-zA-Z]*[a-z][a-zA-Z]*$")
)
(_
  (_) @type
  (#match? @type "^[A-Z][a-z]*$")
)

; (_
;   (call_expression
;     function: (field_expression
;       object: (identifier)
;       member: (identifier) @type
;       (#match? @type "^_*[A-Z][a-zA-Z]*[a-z][a-zA-Z]*$"))
;   )
; )
;
; (_
;   (error_union_type
;     error: (field_expression
;       object: (identifier)
;       member: (identifier) @type
;       (#match? @type "^_*[A-Z][a-zA-Z]*[a-z][a-zA-Z]*$"))
;   )
; )


(((comment) @_jsdoc_comment
  (#match? @_jsdoc_comment "(?s)^/[*][*][^*].*[*]/$")) @content
  (#set! "language" "jsdoc"))

(((comment) @reference
  (#match? @reference "^///\\s+<reference\\s+types=\"\\S+\"\\s*/>\\s*$")) @content
  (#set! "language" "html"))

((regex) @content
  (#set! "language" "regex"))

(call_expression
  function: (identifier) @_name (#eq? @_name "css")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "css"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "html")
  arguments: (template_string) @content
                              (#set! "language" "html")
)

(call_expression
  function: (identifier) @_name (#eq? @_name "js")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "javascript"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "json")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "json"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "sql")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "sql"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "ts")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "typescript"))
)

(call_expression
  function: (identifier) @_name (#match? @_name "^ya?ml$")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "yaml"))
)

(call_expression
  function: (identifier) @_name (#match? @_name "^g(raph)?ql$")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "graphql"))
)

(call_expression
  function: (identifier) @_name (#match? @_name "^g(raph)?ql$")
  arguments: (arguments (template_string (string_fragment) @content
                              (#set! "language" "graphql")))
)

(call_expression
  function: (identifier) @_name (#match? @_name "^styled(\\.\\w+)?$")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "css"))
)

((comment) @_css_comment
  (#match? @_css_comment "/[*]+\\s*(css|style)\\s*[*]+/")
  (template_string (string_fragment) @content
    (#set! "language" "css")))

((comment) @_html_comment
  (#match? @_html_comment "/[*]+\\s*html\\s*[*]+/")
  (template_string (string_fragment) @content
    (#set! "language" "html")))

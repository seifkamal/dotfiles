; extends

(jsx_self_closing_element
  name: (_
    object: (identifier) @tag.parent
    property: (_) @tag.child))

(jsx_opening_element
  name: (_
    object: (identifier) @tag.parent
    property: (_) @tag.child))

(jsx_closing_element
  name: (_
    object: (identifier) @tag.parent
    property: (_) @tag.child))

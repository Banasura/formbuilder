Formbuilder.registerField 'paragraph',

  order: 5

  view: """
    <textarea class='rf-size-<%= rf.get(Formbuilder.options.mappings.SIZE) %>'></textarea>
  """

  edit: """
    <%= Formbuilder.templates['edit/min_max_length']() %>
  """

  addButton: """
    <%= Formbuilder.options.dict.PARAGRAPH %>
  """

  defaultAttributes: (attrs) ->
    attrs.field_options.size = 'small'
    attrs

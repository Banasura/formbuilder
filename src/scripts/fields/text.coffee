Formbuilder.registerField 'text',

  order: 0

  view: """
    <input type='text' class='rf-size-<%= rf.get(Formbuilder.options.mappings.SIZE) %>' />
  """

  edit: """
    <%= Formbuilder.templates['edit/min_max_length']() %>
  """

  addButton: """
    <%= Formbuilder.options.dict.TEXT %>
  """

  defaultAttributes: (attrs) ->
    attrs.field_options.size = 'small'
    attrs

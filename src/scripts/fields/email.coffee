Formbuilder.registerField 'email',

  order: 40

  view: """
    <input type='text' class='rf-size-<%= rf.get(Formbuilder.options.mappings.SIZE) %>' />
  """

  edit: ""

  addButton: """
    <%= Formbuilder.options.dict.EMAIL %>
  """

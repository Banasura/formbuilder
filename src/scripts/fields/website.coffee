Formbuilder.registerField 'website',

  order: 35

  view: """
    <input type='text' placeholder='http://' />
  """

  edit: """
  """

  addButton: """
    <%= Formbuilder.options.dict.WEBSITE %>
  """

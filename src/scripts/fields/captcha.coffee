Formbuilder.registerField 'captcha',

  order: 99

  noCheckboxes: true

  view: ""

  edit: ""

  addButton: """
    <%= Formbuilder.options.dict.CAPTCHA %>
  """

  defaultAttributes: (attrs) ->
    attrs

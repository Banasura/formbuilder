Formbuilder.registerField 'reset',

  order: 0

  type: "button"

  view: """
    <input type="reset" value="<% if (label = rf.get(Formbuilder.options.mappings.LABEL)) { %><%= label %><% } %>">
  """

  edit: """
  """

  addButton: """
    <%= Formbuilder.options.dict.RESET %>
  """

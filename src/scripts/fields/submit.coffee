Formbuilder.registerField 'submit',

  order: 0

  type: "button"

  view: """
    <input type="submit" value="<% if (label = rf.get(Formbuilder.options.mappings.LABEL)) { %><%= label %><% } %>">
  """

  edit: """
  """

  addButton: """
    <%= Formbuilder.options.dict.SUBMIT %>
  """

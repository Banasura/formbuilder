Formbuilder.registerField 'section_break',

  order: 0

  type: 'non_input'

  view: """
    <label class='section-name'><%= rf.get(Formbuilder.options.mappings.LABEL) %></label>
    <p><%= rf.get(Formbuilder.options.mappings.DESCRIPTION) %></p>
  """

  edit: """
    <div class='fb-edit-section-header'>Label</div>
    <input type='text' data-rv-input='model.<%= Formbuilder.options.mappings.LABEL %>' />
    <textarea data-rv-input='model.<%= Formbuilder.options.mappings.DESCRIPTION %>'
      placeholder='#{Formbuilder.options.dict.ADD_A_LONGER_DESCRIPTION_TO_THIS_FIELD}'></textarea>
  """

  addButton: """
    <%= Formbuilder.options.dict.SECTION_BREAK %>
  """

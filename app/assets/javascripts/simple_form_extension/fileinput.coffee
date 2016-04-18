class ExistingFileField
  constructor: (@$field) ->
    @$existingFile = @$field.find('[data-toggle="existing-file"]')
    @$removeButton = @$field.find('[data-dismiss="existing-file"]')
    @$removeInput = @$removeButton.find('input')

    @$removeButtonIcon = @$removeButton.find('i')
    @originalClass = @$removeButtonIcon.attr('class')
    @removedClass = @$removeButtonIcon.attr('data-removed-class')

    @$removeButton.on('click', $.proxy(@removeButtonClicked, this))

  removeButtonClicked: ->
    if @$removeInput.val()
      @unsetRemoved()
    else
      @setRemoved()

  setRemoved: ->
    @$removeInput.val('1')
    @$existingFile.hide(0)
    @$removeButtonIcon.attr(class: @removedClass)

  unsetRemoved: ->
    @$removeInput.removeAttr('value')
    @$existingFile.show(0)
    @$removeButtonIcon.attr(class: @originalClass)

$.simpleForm.onDomReady ($document) ->
  # Plugin initialization delegated to body, so we do not need to run the
  # initialization process when the body has not changed
  return unless $document.is('body')

  $('body').on 'click', '[data-dismiss="existing-file"]', (e) ->
    $button = $(e.currentTarget)
    $field = $button.closest('[data-provides="existing-file"]')

    unless $field.data('simple-form:existing-file')
      data = new ExistingFileField($field)
      data.removeButtonClicked()
      $field.data('simple-form:existing-file', data)

class Spinbox
  constructor: (@$el) ->
    @$el.spinbox(max: Number.POSITIVE_INFINITY)


$.fn.simpleFormSpinbox = ->
  @each (i, el) ->
    $input = $(el)
    return if $input.data('simple-form:spinbox')
    instance = new Spinbox($input)
    $input.data('simple-form:spinbox', instance)

$.simpleForm.onDomReady ($document) ->
  $spinbox = $document.find('.spinbox')
  return unless $spinbox.length
  $spinbox.simpleFormSpinbox()


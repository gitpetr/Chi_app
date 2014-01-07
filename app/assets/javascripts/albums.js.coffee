# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  if gon? and gon.controller is "albums"
    toggleLabels = (this_elem) ->
      animation_speed = 385

      if this_elem.find('p.label-preview-big').text().length > gon.small_preview_size               # Checking that full description is BIGGER then a small one.
        this_elem.find('p.label-preview-small').toggle( animation_speed )
        this_elem.find('p.label-preview-big').toggle( animation_speed )

    if gon.action is "index"
      $(document).on "mouseenter", ".album-with-label", ->
        toggleLabels $(this)

      $(document).on "mouseleave", ".album-with-label", ->
        toggleLabels $(this)

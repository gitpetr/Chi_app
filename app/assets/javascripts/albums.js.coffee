# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # ------- Global variables. -------
  root = exports ? this
  root.animation_speed = 385

  # ------- Methods -------
  $(document).on "mouseenter", ".imageWithLabel", ->
    toggleLabels $(this)

  $(document).on "mouseleave", ".imageWithLabel", ->
    toggleLabels $(this)

  # Show and hide description on mouse events.
  toggleLabels = (this_elem) ->
    if this_elem.find('p.label-preview-big').text().length > gon.small_preview_size                 # Checking that full description is BIGGER then a small one.
      this_elem.find('p.label-preview-small').toggle( root.animation_speed )
      this_elem.find('p.label-preview-big').toggle( root.animation_speed )
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Show and hide description on mouse events.
  $(document).on "mouseenter", ".imageLabel", ->
    $(this).find('p.label-preview-small').toggle()
    $(this).find('p.label-preview-big').toggle()

  $(document).on "mouseleave", ".imageLabel", ->
    $(this).find('p.label-preview-small').toggle()
    $(this).find('p.label-preview-big').toggle()
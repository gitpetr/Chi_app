# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# jQuery ->
#   @toggle_div = (id) ->
#     document.getElementById( id ).toggle
#     # alert(id)

# Show modal window with carousel when mouse clicked the image.
$(document).on 'click', '.photo-Link', ->
  photoId = $(this).data 'id'                       # Get photo id from data attribute.
  photoInGalleryId = "gallery-" + photoId           # Here we find div wich contains the clicked image.

  document.getElementById( photoInGalleryId ).className = "item active"   # Set image as active so carousel will show it properly.
  $('#modal-window-slideshow').modal 'show'
  $('.myCarousel').carousel 'pause'
  return true

# This code works when user clicks the "close" button. We seek all classes wich are not inactive and change them to good state.
$(document).on "click", ".close", ->
  $('.myCarousel').carousel 'pause'
  div = document.getElementById "div-carousel-items"

  for i in [0...div.childNodes.length]
    if div.childNodes[i].tagName is 'DIV' and div.childNodes[i].className isnt "item"
      div.childNodes[i].className = "item"
  return true

# This is a fix so carousel wouldn't work in background and it wouldn't raise strange bugs.
$(document).on 'mouseleave', '.carousel', ->
  $(this).carousel 'pause'


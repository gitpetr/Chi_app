# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  if gon? and gon.controller == "photos"
    # Hide button and links on images.
    hideElements = (slideshowBtn) ->
      $( slideshowBtn ).hide()
      $('img.photo').css('cursor', 'default')
      window.showSlideshow = false
      return true

    # Hiding slideshow's stuff if window is too small.
    hideSlideshowElementsOnLoad = () ->
      window.minSizeToShowSlideshow = 900

      if $(window).width() < window.minSizeToShowSlideshow
        hideElements( '#photo-Link' )
      else
        window.showSlideshow = true
      return true

    # Remove button to show slideshow and set global param (window.showSlideshow) to show/now show slideshow.
    $(window).on 'resize', ->
      minSizeToShowSlideshow = 900
      slideshowBtn = '#photo-Link'

      if $(window).width() >= minSizeToShowSlideshow
        if $( slideshowBtn ).is(":hidden")                                                            # If button is hidden.
          $( slideshowBtn ).show()                                                                    # Show it.
          $('img.photo').css('cursor', 'pointer')                                                     # Set cursor to pointer.
          window.showSlideshow = true                                                                 # Set in global variable that we can show slideshow.
      else
        hideElements( slideshowBtn )
      return true

    # Show modal window (checking the id) with carousel when mouse clicked the image.
    $(document).on 'click', '#photo-Link', ->
      if window.showSlideshow
        photoId = $(this).data 'id'                                                                   # Get photo id from data attribute.
        photoInGalleryId = "gallery-" + photoId                                                       # Here we find div wich contains the clicked image.

        document.getElementById( photoInGalleryId ).className = "item active"                         # Set image as active so carousel will show it properly.
        $('#modal-window-slideshow').modal 'show'
        $('.myCarousel').carousel( {interval: false} )                                                # Setting no interval to prevent cycling.
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

    # Show other slide if left or right arrows pressed up.
    # I use keyup because it works in Chrome and Safari too.
    $(document).keyup (event)->
      RIGHT_ARROW = 39; LEFT_ARROW = 37

      # If event is not undefined and modal window with slideshow is visible.
      if typeof event != 'undefined' and $('#modal-window-slideshow').is(':visible')
        if event.keyCode == RIGHT_ARROW
          $('a.carousel-control.right').trigger('click')                                              # Find and click link to show next slide.
          $('.myCarousel').carousel 'pause'
        if event.keyCode == LEFT_ARROW
          $('a.carousel-control.left').trigger('click')                                               # Find and click prev link.
          $('.myCarousel').carousel 'pause'
      return true

    hideSlideshowElementsOnLoad()


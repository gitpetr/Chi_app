# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Changing width of containers with google map when window loaded.
  $(window).load ->
    resize_google_map_container()

  # Changing width of containers with google map if user changes size of window.
  $(window).resize ->
    resize_google_map_container()

  # Main function to resize containers.
  resize_google_map_container=() ->
    size = $(window).width()
    max_size_of_view = 970
    min_size_of_view = 400
    # Here i set constansts for strange subnormal behavior of google frame.
    # In this diapason we should set bigger size to see window.
    subnormal_wind_size_min = 745
    subnormal_wind_size_max = 1045


    if size > subnormal_wind_size_min and size < subnormal_wind_size_max
      new_size = size - 150
    else
      new_size = size - 60

    if size < max_size_of_view and size > min_size_of_view
      $('.map_container').css('width', new_size)
      $('.gmaps4rails_map').css('width', new_size)


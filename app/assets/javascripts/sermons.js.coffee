# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	showDatepicker = () ->
		$( '#sermon_recorded_date' ).datepicker({
	      dateFormat:"dd.mm.yy"
	    },
	    $.datepicker.regional['ru']
	  )

	initAudioPlayer = () ->
    $( "#jquery_jplayer_1" ).jPlayer({
      ready: (event) ->
        $(this).jPlayer("setMedia", {
            mp3: gon.record_path,
        })
      swfPath: "/assets/Jplayer-2-4-0.swf",
      supplied: "mp3"
    })

  # Hiding controls AFTER page load to make sure that we hide all nessesary elements, including volume bar.
  $(window).on 'load', ->
    sizeToRemoveControls = 1220
    sizeToShowControls = 780
    window_width = $(window).width()

    if window_width <= sizeToRemoveControls and window_width > sizeToShowControls
      $('#jp-controls-to-hide').hide()
      $('.jp-progress').hide()
      $('.jp-volume-bar').hide()
    return true

  # Hiding controls if page is too small to show them.
  $(window).on 'resize', ->
    sizeToRemoveControls = 1220
    sizeToShowControls = 780
    window_width = $(window).width()

    if window_width <= sizeToRemoveControls and window_width > sizeToShowControls
      $('#jp-controls-to-hide').hide()
      $('.jp-progress').hide()
      $('.jp-volume-bar').hide()
    else
      if $('#jp-controls-to-hide').is(":hidden")                                                    # If this div is hidden, then other controls are hidden, too.
        $('#jp-controls-to-hide').show()
        $('.jp-progress').show()
        $('.jp-volume-bar').show()
    return true

	showDatepicker()
	initAudioPlayer()




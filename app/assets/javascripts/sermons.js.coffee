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

  isCollisionOfControlWithPlayer = (control) ->
    audioPlayerRightSide = root.audioPlayerWindow.offset().left + root.audioPlayerWindow.width()
    controlRightSide     = control.offset().left + control.width()

    return controlRightSide > audioPlayerRightSide

  controlsManipulator = () ->
    controls = [ root.maxVolumeBtn, root.volumeBar, root.muteVolumeBtn, root.progressBar ]

    for control in controls
      # Hide via "visibility" because in that case jquery can find offset of hidden element.
      if isCollisionOfControlWithPlayer( control )
        control.css( { "visibility":"hidden" } )
      else
        control.css( { "visibility":"visible" } )

    return true

  # Hiding controls AFTER page load to make sure that we hide all nessesary elements, including volume bar.
  $(window).on 'load', ->
    controlsManipulator()
    return true

  # Hiding controls if page is too small to show them.
  $(window).on 'resize', ->
    controlsManipulator()
    return true

  # Global vars.
  root = exports ? this
  root.audioPlayerWindow = $('.jp-type-single')
  root.maxVolumeBtn      = $('.jp-volume-max')
  root.volumeBar         = $('.jp-volume-bar')
  root.muteVolumeBtn     = $('.jp-mute')
  root.progressBar       = $('.jp-progress')

  # Functions.
	showDatepicker()
	initAudioPlayer()





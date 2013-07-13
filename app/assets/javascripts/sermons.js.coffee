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
              mp3: "http://jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3",
              oga: "http://jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg"
          })
        swfPath: "http://jplayer.org/latest/js",
        supplied: "mp3, oga"
    })


	showDatepicker()
	initAudioPlayer()




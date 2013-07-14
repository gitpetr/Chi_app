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
            mp3: "/uploads/sermon/record/4/01_River_Of_Tuoni.mp3",
        })
      swfPath: "/assets/Jplayer-2-4-0.swf",
      supplied: "mp3"
    })


	showDatepicker()
	initAudioPlayer()




# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Evaluate scripts only for pages of specific controller.
  if gon? and gon.controller is "sermons"
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
      audioPlayerWindow = $('.jp-type-single')

      audioPlayerRightSide = audioPlayerWindow.offset().left + audioPlayerWindow.width()
      controlRightSide     = control.offset().left + control.width()

      return controlRightSide > audioPlayerRightSide

    controlsManipulator = () ->
      maxVolumeBtn      = $('.jp-volume-max')
      volumeBar         = $('.jp-volume-bar')
      muteVolumeBtn     = $('.jp-mute')
      progressBar       = $('.jp-progress')
      controls = [ maxVolumeBtn, volumeBar, muteVolumeBtn, progressBar ]

      for control in controls
        # Hide via "visibility" because in that case jquery can find offset of hidden element.
        if isCollisionOfControlWithPlayer( control )
          control.css( { "visibility":"hidden" } )
        else
          control.css( { "visibility":"visible" } )
      return true

    if gon.action is "new"
      showDatepicker()

    if gon.action is "edit"
      showDatepicker()

    if gon.action is "show"
      initAudioPlayer()

      # Hiding controls AFTER page load.
      $(window).on 'load', ->
        controlsManipulator()
        return true

      # Hiding/showing controls one by one.
      $(window).on 'resize', ->
        controlsManipulator()
        return true

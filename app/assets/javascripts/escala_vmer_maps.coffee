# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#maps_calendar').fullCalendar
		header: {
			left:   'title'
			center: 'month,agendaWeek,agendaDay'
			right:  'today prev,next'
		}
		lang: 'pt'
		events: 'escala_vmer_maps.json'
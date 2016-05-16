# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#schedules_calendar').fullCalendar
		header: {
			left:   'title'
			center: 'month,agendaWeek,agendaDay'
			right:  'today prev,next'
		},
		lang: 'pt'
		editable: true
		droppable: true
		eventReceive: (event) ->
			$.ajax
				data: inicio_turno: event.start.format()
				type: 'post'
				dataType: 'json'
				url: '/vmer/escala_vmer_schedules.json'
				success: (response) ->
					console.log 'response'
				error: (response) ->
					console.log 'response'
		events: 'escala_vmer_schedules.json'

		eventClick: (event, jsEvent, view) ->
			$('#modalTitle').html(event.title)
			$('#modalBody').html(event.description)
			$('#modalFooter').html('<a id="eventUrl" target="_self" class="btn btn-info">Mais detalhes</a><button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>')
			$('#eventUrl').attr('href',event.url)
			$('#modal').modal()
			return false

		eventRender: (event, element, view ) ->
			return ['all', event.utilizador].indexOf($('#group_selector').val()) >= 0

	$('#group_selector').on 'change', ->
		$('#schedules_calendar').fullCalendar('rerenderEvents')
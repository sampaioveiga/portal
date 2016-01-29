# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('#observations_calendar').fullCalendar
		header: {
			left:   'title',
			center: 'month,agendaWeek,agendaDay',
			right:  'today prev,next',
		},
		lang: 'pt',
		events: 'hig_maos_observations.json',

		eventClick: (event, jsEvent, view) ->
			$('#modalTitle').html(event.title)
			$('#modalBody').html(event.description)
			$('#modalFooter').html('<a id="eventUrl" target="_self" class="btn btn-info">Mais detalhes</a><button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>')
			$('#eventUrl').attr('href',event.url)
			$('#modal').modal()
			return false

	$('#goto_date').on 'click', ->
		window.location.replace("http://localhost:4567/hig_maos_stats?date=" + $('#date_year').val() + '-' + $('#date_month').val() + '-' + 1)
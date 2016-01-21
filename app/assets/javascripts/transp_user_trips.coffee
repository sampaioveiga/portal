# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('#user_trips_calendar').fullCalendar
		header: {
			left:   'title',
			center: 'month,agendaWeek,agendaDay',
			right:  'today prev,next',
		},
		lang: 'pt',
		events: 'transp_user_trips.json',

		eventClick: (event, jsEvent, view) ->
			$('#modalTitle').html(event.title);
			$('#modalBody').html(event.description);
			$('#modalFooter').html('<a id="eventUrl" target="_self" class="btn btn-primary">Mais detalhes</a><button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>');
			$('#eventUrl').attr('href',event.url);
			$('#modal').modal();
			return false;
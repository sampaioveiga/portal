# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#transp_materials_calendar').fullCalendar
		header: {
			left:   'title',
			center: 'month,agendaWeek,agendaDay',
			right:  'today prev,next',
		},
		lang: 'pt',
		events: 'transp_materials.json',

		eventClick: (event, jsEvent, view) ->
			$('#modalTitle').html(event.title)
			$('#modalBody').html(event.description)
			$('#modalFooter').html('<a id="eventUrl" target="_self" class="btn btn-info">Mais detalhes</a><button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>')
			$('#eventUrl').attr('href',event.url)
			$('#modal').modal()
			return false

		eventRender: (event, element, view) ->
			return['all', event.aprovacao].indexOf($('#aprovacao_selector').val()) >= 0

	$('#aprovacao_selector').on 'change', ->
		$('#transp_materials_calendar').fullCalendar('rerenderEvents')

	$('#transp_material_emergente_input').on 'click', ->
		alert 'A nível emergente pode acarretar custos à ULSNE.\n O uso indevido desta opção levará à responsabilização do requisitante'
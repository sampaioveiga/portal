# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#new_patient_catheter').on "click", ->
		$('#modalTitle').html('Registar novo cateter')
		$('#modalBody').append('<%= j render("new_catheters") %>')
		$('#modal').modal()
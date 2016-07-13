# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	# b1_q3 3
	$('#uci_tiss_value_b1_q3_2').on 'click', ->
		$('#uci_tiss_value_b1_q4_0').button('toggle')

	# b1_q4 4
	$('#uci_tiss_value_b1_q4_3').on 'click', ->
		$('#uci_tiss_value_b1_q3_0').button('toggle')

	# b2_q1 8
	$('#uci_tiss_value_b2_q1_5').on 'click', ->
		$('#uci_tiss_value_b2_q2_0').button('toggle')

	# b2_q2 9
	$('#uci_tiss_value_b2_q2_2').on 'click', ->
		$('#uci_tiss_value_b2_q1_0').button('toggle')

	# b3_q1 12
	$('#uci_tiss_value_b3_q1_3').on 'click', ->
		$('#uci_tiss_value_b3_q2_0').button('toggle')

	# b3_q2 13
	$('#uci_tiss_value_b3_q2_4').on 'click', ->
		$('#uci_tiss_value_b3_q1_0').button('toggle')

	# b7_q1 26
	$('#uci_tiss_value_b7_q1_3').on 'click', ->
		$('#uci_tiss_value_b7_q2_0').button('toggle')

	# b7_q2 27
	$('#uci_tiss_value_b7_q2_5').on 'click', ->
		$('#uci_tiss_value_b7_q1_0').button('toggle')
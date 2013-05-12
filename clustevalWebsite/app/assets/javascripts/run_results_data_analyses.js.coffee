# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	jQuery -> 
		$('#runResultsDataAnalyses').dataTable
			sPaginationType: "full_numbers"
			bJQueryUI: true
			bRetrieve: true
			bDestroy: true
$(document).ready ->
	jQuery -> 
		$('.display').dataTable
			sPaginationType: "full_numbers"
			bJQueryUI: true
			bSort: false
			bPaginate: false
			bFilter: false
			bInfo: false
			bRetrieve: true
			bDestroy: true


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	jQuery -> 
		$('#dataConfigs').dataTable
			sPaginationType: "full_numbers"
			bJQueryUI: true		
			bRetrieve: true
			bDestroy: true	
$(document).ready ->
	jQuery -> 
		$('#dataConfig').dataTable
			bJQueryUI: true
			bSort: false
			bPaginate: false
			bFilter: false
			bInfo: false
			bRetrieve: true
			bDestroy: true
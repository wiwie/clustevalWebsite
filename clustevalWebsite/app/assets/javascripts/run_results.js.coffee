# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery -> 
	$('#runResults').dataTable
		bAutoWidth: false
		sPaginationType: "full_numbers"
		bJQueryUI: true
		bRetrieve: true
		bDestroy: true
		aaSorting: [[0, "desc"]]
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#statistics').dataTable
		sPaginationType: "full_numbers"
		bJQueryUI: true
		bRetrieve: true
		bDestroy: true

ellipsis = (text, n) ->
  if text.length > n
    text.substring(0, n) + "..."
  else
    text

jQuery ->
	$('.clustEvalContentInner :checkbox').each ->
  		$(this).button()
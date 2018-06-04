function loading(){
	$(document).ajaxSend(function(event, request, settings) {
		  $('#loading-indicator').show();
		});
}

function loadingStop(){
	$(document).ajaxComplete(function(event, request, settings) {
		  $('#loading-indicator').hide();
		});
}

$( document ).ready( loadingStop );
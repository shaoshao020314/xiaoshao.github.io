$(function() {
	var quoteArr = [];

	var index = Math.floor((Math.random() * quoteArr.length));

	$('#motd').html(index);

});
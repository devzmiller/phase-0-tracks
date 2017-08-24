$(document).ready(function() {

	$("#red").on("click", function() {
		$(".space").css("background-color", "red");
	});

	$("#blue").on("click", function() {
		$(".space").css("background-color", "blue");
	});

	$("#purple").on("click", function() {
		$(".space").css("background-color", "purple");
	});

	$("#hide").on("click", function() {
		$(".space").toggle();
	});

	$("#fade").on("click", function() {
		$(".space").fadeToggle(800);
	});

	$("#text").on("click", function() {
		$(".space").html("New text here!");
	});b

	// This was an attempt to make this DRYer, but it turned out to be more complicated than expected.
	// function red() {
	// 	$(".space").css("background-color", "red");
	// }

	// function blue() {
	// 	$(".space").css("background-color", "blue");
	// }

	// $(".button").on("mouseenter", function() {
	// 	var buttonID = $(this).attr("id");
	// 	$('#'+buttonID).on("click", buttonID);
	// })
});
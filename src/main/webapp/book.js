"use strict";

function initBook() {
	let request = $.get("http://localhost:8080/JBooks/main/db/getBook/" + new URL(window.location.href).searchParams.get("isbn"));
	request.done(function(response, textStatus, jqXHR) {
		let json = request.responseJSON;
		$("#coverIMG").attr("src", "" + link.replace("ISBN", json.ISBN));
		$("#title").text(json.title);
		$("#author").text(json.author);
		$("#synopsis").text(json.synopsis);
	});

}

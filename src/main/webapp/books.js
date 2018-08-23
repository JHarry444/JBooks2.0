"use strict";

function getBooks() {
	let request = $.get("http://localhost:8080/JBooks/main/db/getBooks/" + new URL(window.location.href).searchParams.get("title"));
	request.done(function(response, textStatus, jqXHR) {
		let jsonArray = request.responseJSON;
		jsonArray.forEach(book => {
			let element = document.createElement("img");
			element.setAttribute("src", `http://covers.openlibrary.org/b/isbn/${book.ISBN}-M.jpg`)
			document.getElementsByTagName("body")[0].appendChild(element);
		});
//		$("#coverIMG").attr("src", "" + link.replace("ISBN", json.ISBN));
//		$("#title").text(json.title);
//		$("#author").text(json.author);
//		$("#synopsis").text(json.synopsis);
	});

}

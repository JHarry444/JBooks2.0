"use strict";

function getBooks() {
	let request = $.get("http://localhost:8080/JBooks/main/db/getBooks/" + new URL(window.location.href).searchParams.get("title"));
	request.done(function(response, textStatus, jqXHR) {
		let jsonArray = request.responseJSON;
		if (jsonArray.length < 1) {
			let element = document.createElement("p");
			element.innerHTML = "No results found."
			document.getElementsByTagName("body")[0].appendChild(element);
		} else {
			jsonArray.forEach(book => {
				let element = document.createElement("img");
				element.setAttribute("src", `http://covers.openlibrary.org/b/isbn/${book.ISBN}-M.jpg`)
				document.getElementsByTagName("body")[0].appendChild(element);
				element.setAttribute("onClick", `getBook('${book.ISBN}');`)
				element.style.cursor ="pointer";
			});
		}
	});
}

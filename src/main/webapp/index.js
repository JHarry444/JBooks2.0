"use strict";

var signedIn = sessionStorage.userName;

var link = "http://covers.openlibrary.org/b/isbn/ISBN-L.jpg"

function initHeader() {
	if (signedIn && $("#account").length === 0) {
		$("#user").attr("href", `account.html?userName=${signedIn}`);
		$("#user").text(signedIn);
	}
	document.getElementById("search").addEventListener("keyup",
			function(event) {
				event.preventDefault();
				if (event.keyCode === 13) {
					findBooks(this.value);
				}
			});
}

function getBook(isbn) {
	document.location.href = "book.html?isbn=" + isbn;
}

function findBooks(title) {
	document.location.href = "books.html?title=" + title;
}

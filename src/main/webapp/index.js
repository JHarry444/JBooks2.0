"use strict";

var signedIn = sessionStorage.userName;

var link = "http://covers.openlibrary.org/b/isbn/ISBN-L.jpg"

function initHeader() {
	if (signedIn) {
		$("#user").attr("href", "account.html");
		$("#user").text(signedIn);
	}
}

function getBook(isbn) {
	document.location.href = "book.html?isbn=" + isbn;
}

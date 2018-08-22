"use strict";

var signedIn = sessionStorage.userName;

function initHeader() {
	if (signedIn) {
		$("#user").attr("href", "account.html");
		$("#user").text(signedIn);
	}
}
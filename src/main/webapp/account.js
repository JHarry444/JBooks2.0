"use strict";

function signOut() {
	sessionStorage.removeItem("userName");
}

function getUser() {
	let request = $.get("http://localhost:8080/JBooks/main/db/getUser/"
			+ new URL(window.location.href).searchParams.get("userName"));
	request.done(function(response, textStatus, jqXHR) {
		let json = request.responseJSON;
		$("#newUsername")[0].value = json.username;
		$("#newHouseNumber")[0].value = json.address.houseName;
		$("#newPostCode")[0].value = json.address.postcode.postCode;
		$("#newStreet")[0].value = json.address.postcode.street;
		$("#newCity")[0].value = json.address.postcode.city;
		$("#newCountry")[0].value = json.address.postcode.country;
		$("#newEmail")[0].value = json.email;
		$("#newContactNumber")[0].value = json.contactNumber;
		$("#newFirstName")[0].value = json.firstName;
		$("#newLastName")[0].value = json.lastName;
		$("#newDOB")[0].value = json.birthDate;
	});
}
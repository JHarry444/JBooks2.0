"use strict";

let request;

$("#login").submit(
		function(event) {
			event.preventDefault();
			if (request) {
				request.abort();
			}
			let $form = $(this);
			var inputs = $form.find("input");
			var serializedData = $form.serialize();
			inputs.prop("disabled", true);
			request = $.ajax({
				url : "http://localhost:8080/JBooks/main/db/login",
				type : "post",
				data : serializedData
			});
			request.done(function(response, textStatus, jqXHR) {
				console.log("Hooray, it worked!");
				sessionStorage.setItem("userName", inputs[0].value);
				document.location.href = "index.html"
			});
			request.fail(function(jqXHR, textStatus, errorThrown) {
				console.error("The following error occurred: " + textStatus,
						errorThrown);
			});
			request.always(function() {
				inputs.prop("disabled", false);
			});
		});

$("#create").submit(
		function(event) {
			event.preventDefault();
			if (request) {
				request.abort();
			}
			let $form = $(this);
			var inputs = $form.find("input");
			var serializedData = $form.serialize();
			inputs.prop("disabled", true);
			request = $.ajax({
				url : "http://localhost:8080/JBooks/main/db/createUser",
				type : "post",
				data : serializedData
			});
			request.done(function(response, textStatus, jqXHR) {
				console.log("Hooray, it worked!");
				sessionStorage.setItem("userName", inputs[0].value);
				document.location.href = "index.html"
			});
			request.fail(function(jqXHR, textStatus, errorThrown) {
				console.error("The following error occurred: " + textStatus,
						errorThrown);
			});
			request.always(function() {
				inputs.prop("disabled", false);
			});
		});
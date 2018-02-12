window.onload = init;
function init(str) {
	  var httpRequest;
	  document.getElementById("submit").onclick = makeRequest;

	  function makeRequest() {
	  	var formElement = document.querySelector("form");
		httpRequest = new XMLHttpRequest();

		if (!httpRequest) {
		  alert('Giving up :( Cannot create an XMLHTTP instance');
		  return false;
		}
		httpRequest.onreadystatechange = alertContents;
		httpRequest.open('POST', 'practice2.php');
		httpRequest.send(new FormData(formElement));
	  }

	  function alertContents() {
		if (httpRequest.readyState === XMLHttpRequest.DONE) {
		  if (httpRequest.status === 200) {
			document.getElementById("replace").innerHTML = httpRequest.responseText;
		  } else {
			alert('There was a problem with the request.');
		  }
		}
	  }
	}

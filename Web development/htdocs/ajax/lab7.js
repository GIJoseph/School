window.onload = init;
function init() {
	  var httpRequest;
	  document.getElementById("aButton").onclick = makeRequest;

	  function makeRequest() {
		httpRequest = new XMLHttpRequest();

		if (!httpRequest) {
		  alert('Giving up :( Cannot create an XMLHTTP instance');
		  return false;
		}
		httpRequest.onreadystatechange = alertContents;
		httpRequest.open('GET', 'lab7.txt');
		httpRequest.send();
	  }

	  function alertContents() {
		if (httpRequest.readyState === XMLHttpRequest.DONE) {
		  if (httpRequest.status === 200) {
			document.getElementById("emptyDiv").innerHTML = httpRequest.responseText;
		  } else {
			alert('There was a problem with the request.');
		  }
		}
	  }
	}

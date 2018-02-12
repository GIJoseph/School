document.write(Date());
function saygoodbye(){
	var textfield = document.getElementById("stuff");
	var button = document.getElementById("button");
	button.innerHTML = textfield.value;
}
var time = null;
window.onload = magic;
function timer(){
	var timerbutton = document.getElementById("timerbutton");
	if (time == null){
		time = setInterval(incrementby1, 1000);
		timerbutton.innerHTML = "Stop Timer";
	}
	else{
		clearInterval(time);
		time = null;
		timerbutton.innerHTML = "Start Timer";
	}
}

var x = 0;
function incrementby1(){
	var currenttime = document.getElementById("timernumber");
	x += 1;
	currenttime.innerHTML = x;
}

var isblue = false;
function changetextcolor(){
	var button = document.getElementById("changecolor");
	if (isblue){
		button.className = "highlightred";
		alert("Button text color has been changed to red");
		isblue = false;
	}
	else{
		button.className = "highlightblue";
		alert("Button text color has been changed to blue");
		isblue = true;
	}
}

function countdownfunction(){
	var num = prompt("Select a number to countdown from");
	var text = "";
	for (var i = num; i > 0; i--){
		text += i + " ";
		alert(i);
	}
	
	document.getElementById("countdown").innerHTML = text;
}
var backgroundIsRed = false;
function changebackground(){
	if(!backgroundIsRed){
		document.body.style.backgroundColor = "red";
		backgroundIsRed = true;
	}
	else{
		document.body.style.backgroundColor = "green";
		backgroundIsRed = false;
	}
}
function magic(){
	setInterval(changebackground, 3000);
	changetextcolor();
	timer();
}

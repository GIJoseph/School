var timer = null;  // stores ID of interval timer

function delayMsg2() {
  if (timer == null) {
    timer = setInterval(rudy, 1000);
  } else {
    clearInterval(timer);
    timer = null;
  }
}

function rudy() {   // called each time the timer goes off
  document.getElementById("output").innerHTML += " Rudy!";
}
function promptalert(){
	x = prompt("what");
	alert(x);
}
function magic(){
	delayMsg2();
	promptalert();
}
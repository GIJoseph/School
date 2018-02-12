var timer = null;
var picArray1 = ["oneballpictures/oneball.png", "oneballpictures/oneball1.png", "oneballpictures/oneball2.png", "oneballpictures/oneball3.png", "oneballpictures/oneball4.png", "oneballpictures/oneball5.png", "oneballpictures/oneball6.png", "oneballpictures/oneball7.png"];
var picArray2 = ["twoballpictures/twoball.png", "twoballpictures/twoball1.png", "twoballpictures/twoball2.png", "twoballpictures/twoball3.png", "twoballpictures/twoball4.png", "twoballpictures/twoball5.png", "twoballpictures/twoball6.png", "twoballpictures/twoball7.png", "twoballpictures/twoball8.png", "twoballpictures/twoball9.png"];
var picArray3 = ["threeballpictures/threeball.png", "threeballpictures/threeball1.png", "threeballpictures/threeball2.png", "threeballpictures/threeball3.png", "threeballpictures/threeball4.png", "threeballpictures/threeball5.png", "threeballpictures/threeball6.png", "threeballpictures/threeball7.png", "threeballpictures/threeball8.png", "threeballpictures/threeball9.png", "threeballpictures/threeball10.png", "threeballpictures/threeball11.png", "threeballpictures/threeball12.png", "threeballpictures/threeball13.png"];

var index = -1;
function pictures1(){
	index += 1;
	if(index >= picArray1.length){
		index = 0;
	}
	document.getElementById("picture1").src = picArray1[index];
}
function pictures2(){
	index += 1;
	if(index >= picArray2.length){
		index = 0;
	}
	document.getElementById("picture2").src = picArray2[index];
}
function pictures3(){
	index += 1;
	if(index >= picArray3.length){
		index = 0;
	}
	document.getElementById("picture3").src = picArray3[index];
}

function timing1(){
	timer = setInterval(pictures1, 1000);
}
function timing2(){
	timer = setInterval(pictures2, 1000);
}
function timing3(){
	timer = setInterval(pictures3, 1000);
}

function whenloaded(){
	$( "#accordion" ).accordion();
	var something = document.getElementById("picture1");
	if(something != null){
		timing1();
	}
	something = document.getElementById("picture2");
	if(something != null){
		timing2();
	}
	something = document.getElementById("picture3");
	if(something != null){
		timing3();
	}
}
window.onload = whenloaded;

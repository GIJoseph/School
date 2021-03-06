<?php
	if(isset($_POST["save"])){
		file_put_contents("threeballprogress.txt", "");
		foreach($_POST["list"] as $num){
			file_put_contents("threeballprogress.txt", $num."\n", FILE_APPEND);
		}
			
	}
	$progress = file("threeballprogress.txt");
	
	
	$file = file("threeball.txt");
	$i = 0;
	$title = array();
	$description = array();
	while($i < count($file)){
		$title[] = $file[$i];
		$description[] = $file[$i + 1];
		$i = $i + 2;
	}
	
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../capstone.css">
		<title> Three Balls </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="../capstone.js" type="text/javascript"></script>
	</head>
	<body>
		<header>
			<a href="../index.html"><img src="../howtojugglelogo.png" alt="juggling logo"></a>
		</header>
		<nav>
			<ul>
				<li><a href="../index.html">Explanation</a></li>
				<li><a href="../oneball/oneball.php">One Ball</a></li>
				<li><a href="../twoball/twoball.php">Two Balls</a></li>
				<li><a href="../threeball/threeball.php" id="selectedlink">Three Balls</a></li>
				<li><a href="../special/special.php">Special</a></li>
			</ul>
			<hr>
		</nav>
		<main>
			<form action="threeball.php" method="post">
				<div id="accordion">
<?php
					foreach($title as $i => $temp){
						print '<h3>'.$temp.'</h3>';
						print '<p>'.$description[$i].'<br> What have you gotten so far? ';
						print '<select name="list[]">';
							print '<option value="0" ';
								if(isset($progress[$i]) && $progress[$i] == 0){print 'selected';}
								print ' >Not Accomplished</option>';
							print '<option value="1" ';
								if(isset($progress[$i]) && $progress[$i] == 1){print 'selected';}
								print '>10 in a Row</option>';
							print '<option value="2" ';
								if(isset($progress[$i]) && $progress[$i] == 2){print 'selected';}
								print '>25 in a Row</option>';
							print '<option value="3" ';
								if(isset($progress[$i]) && $progress[$i] == 3){print 'selected';}
								print '>50 in a Row</option>';
						print '</select>';
						print '</p>';
					}
?>			
				</div>
				<div id="saveDiv">
					<input type="submit" name="save" value="Save" id="saveButton">
				</div>
			</form>	
			<div id="pictureDiv">
				<img src="threeballpictures/threeball.png" alt="stick person" id="picture3">
			</div>	
		</main>
		<footer>
			<hr>
			<p>All rights are reserved to Joseph Goergen and Sacred Heart School in Adams MN</p>
		</footer>
	</body>
</html>
<?php
	session_start();
	$count = 0;
	$_SESSION["something"] = "testing";
	$services_file = file("fishcreek/services.txt");
	$services_title = array();
	$i = 0;
	while ($i < count($services_file)){
		$services_title[] = $services_file[$i];
		$i = $i + 2;
	}
	?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="fishcreek/fishcreek.css">
		<title> Homework 3 </title>
	</head>
	<body>
		<form action="fishcreek/confirmation.php" method="post" style="text-align: center;">
			<p>
				Which  services would you like to include?
			</p>
			<ul style="list-style-type: none;">
			<?php
				foreach($services_title as $i=>$title_name){
					print '<li><input type="checkbox" checked="checked" name="option'. $i .'">'. $title_name .'</li>';
				}
			?>
			</ul>
			<p>What is your username?</p>
			<input type="textfield" name="username">
			<p>What is your email address?</p>
			<input type="textfield" name="email"><br><br>
			
			<select>
				<option value="first">first</option>
				<option value="second">second</option>
				<option value="third">third</option>
				<option value="fourth">fourth</option>
			</select>
			
			<input type="submit">
		</form>
	</body>
</html>
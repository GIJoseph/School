<?php
	session_start();
	$services_file = file("services.txt");
	$services_title = array();
	$description = array();
	$selection = array();
	$username = "Your";
	$_SESSION['count'] = 0;
	
	
	$i = 0;
	while ($i < count($services_file)){
		$services_title[] = $services_file[$i];
		$description[] = $services_file[$i + 1];
		$i = $i + 2;
	};
	
	foreach($services_title as $i => $title)
	{
		if(isset($_POST["option".$i])){
			$selection[] = $_POST["option".$i];
			$_SESSION['count'] = $_SESSION['count'] + 1;
		}
		else{
			$selection[] = "off";
		}
	}
	
	$_SESSION['selection'] = $selection;
	$_SESSION['services_title'] = $services_title;
	$_SESSION['description'] = $description;
	if($_POST['username'] != ""){
		$_SESSION['username'] = $_POST['username'];
		$username = $_SESSION['username'] . "'s";
	}
	$_SESSION['email'] = $_POST['email'];
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="fishcreek.css">
		<title> Confirmation </title>
	</head>
	<body style="text-align: center;">
		<h1><?php print $username; ?> Fishcreek website has been created</h1>
		<a href="services.php"> Here is the link to your fishcreek website</a>
		<h3> <?php print $_SESSION['email']; ?></h3>
	</body>
</html>
<?php
	$person = $_POST["person"];
	//$pic = $_FILES["pic"];
	if (is_uploaded_file($_FILES["pic"]["tmp_name"])) {
 		move_uploaded_file($_FILES["pic"]["tmp_name"], "uploadedpic.jpg");
  		print "Saved uploaded file as uploadedpic.jpg\n";
	} else {
  		print "Error: required file not uploaded";
	}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> uploadExample </title>
	</head>
	<body>
		<h2>
			Thanks, 
		<?php
			print $person;
		?>
			Looking Good!
		</h2>
		<img src="uploadedpic.jpg">
	</body>
</html>
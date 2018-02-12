<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> Test3 </title>
	</head>
	<body>
		<?php
		$lines = file("foo.txt");
			foreach ($lines as $line){
				print $line . "<br>";
			}
		?>
	</body>
</html>
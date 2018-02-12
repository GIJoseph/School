<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> Test2 </title>
	</head>
	<body>
		<?php
			$num = $_GET["num"];
		?>
		<?php for ($i = 1; $i <= $num; $i++) { ?>
			<h<?= $i ?>> This is a level <?= $i ?> heading. </h<?= $i ?>>
		<?php } ?>
	</body>
</html>
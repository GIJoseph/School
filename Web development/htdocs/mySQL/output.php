<?php
	$db = new PDO("mysql:dbname=imdb_small;host=localhost", "root");
	$rows = $db->query("SELECT * FROM actors WHERE last_name LIKE 'Del%'");
	?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> Title </title>
	</head>
	<body>
	<ul>
<?php
	foreach($rows as $row){
?>
		<li> First name: <?= $row["first_name"] ?></li>
       <li>Last name:  <?= $row["last_name"]  ?> </li>
       <?php } ?>
    </ul>
	</body>
</html>
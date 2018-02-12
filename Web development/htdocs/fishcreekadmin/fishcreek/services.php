<?php
	session_start();
	$services_title = $_SESSION['services_title'];
	$selection = $_SESSION['selection'];
	$description = $_SESSION['description'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Fish Creek Animal Hospital Services</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="fishcreek.css">
</head>
<body>
  <div id="wrapper">
	<header>
		<h1>Fish Creek Animal Hospital - Services</h1>
	</header>
	<nav>
		<a href="index.html">Home</a> &nbsp;
		<a href="services.php">Services</a> &nbsp;
		<a href="askvet.html">Ask the Vet</a> &nbsp;
		<a href="contact.html">Contact</a>
	</nav>
	<main>
		<p>
			Basic <?php print $_SESSION['count']; ?> services
		</p>
		<ul>
		<?php
			foreach($services_title as $i => $title){
				if($selection[$i] == 'on'){
					print '<li><span class="category">'. $title . '</span><br>' . $description[$i] . '</li>';
				}
			}
		?>
		</ul>
	</main>
	<hr>
	<footer>
		1-800-555-5555<br>
		1242 Grassy Lane<br>
		Fish Creek, WI 55534<br>
		<?php
			print '<a href="mailto:'.$_SESSION['email'].'">'.$_SESSION['email'].'</a>';
		?>
	</footer>
  </div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Akoma Ntoso subschema Generator</title>
		<link rel="stylesheet" type="text/css" href="../../aknssg.css" />
	</head>
	<body>
		<div id="portal-top"></div>
		<div id="main-container">
			<div id="portal-divisor"></div>
			
			<h1>Akoma Ntoso Subschema Generator</h1>
<?php
gen_path_variables($rand, $schema_name);

if ($status == 'success') {
	$url_pieces = array("..", "..", "archive", $rand, $archive_name);
	$url = join('/', $url_pieces);
?>
			<p class="content">The requested schema
			<?php echo $schema_name ?>
			has been successfully generated.</p>

			<p class="content"><a href="<?php echo $url ?>">Please
			download <?php echo $archive_name ?></a>.</p>
<?php
} else {
?>
			<p class="content">An error occurred during the
			generation of <?php echo $schema_name ?>.</a>

			<p class="content">Please report the following
			error codes to <a href="mailto:admin@parliaments.info"
			>fabio@cs.unibo.it</a>.</p>

			<dl>
				<dt>session:</dt>
				<dd><?php echo $rand ?></dd>
				<dt>name:</dt>
				<dd><?php echo $schema_name ?></dd>
			</dl>
<?php
}
?>

			<p class="content">Return to the <a href="../../aknssg.html">Akoma
			Ntoso subschema generator homepage</a>.</p>

		</div>
	</body>
</html>

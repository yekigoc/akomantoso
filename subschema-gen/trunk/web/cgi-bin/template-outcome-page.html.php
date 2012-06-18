<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>AKOMA NTOSO subschema Generator</title>
		<link type="text/css" rel="stylesheet" href="../../css/boilerplate.css"/>				
		<link rel="stylesheet" type="text/css" href="../../aknssg.css" />
	</head>
	<body>
		<div id="header">
			<div id="portaltop">
				<img src="../../images/akoma-banner-2.png" border="0" alt="akoma ntoso banner" usemap="#map" />
				<map name="map" id="map">
					<area shape="rect" alt="go to akoman ntoso home page" coords="11,4,192,106" href="http://www.akomantoso.org" />
					<area shape="rect" coords="841,9,956,52" alt="Africa i-Parliaments website" href="http://www.parliaments.info" />
					<area shape="rect" coords="840,70,957,115" alt="Bungeni - Parliamentary Information System" href="http://www.bungeni.org" />                
				</map>    		
			</div>
			<span class="related-sites">
				<a class="menu-external" title="external link to www.akomantoso.org" href="http://www.akomantoso.org/">akoma ntoso</a> | 
				<a class="menu-external" title="Schema releases" href="http://examples.akomantoso.org/schema-releases.html">schema releases</a> |                 
				<a class="menu-external" title="An assortment of Akoma Ntoso legislative documents." href="http://examples.akomantoso.org/index.html">akoma ntoso examples</a> |                    
				<a class="menu-external" title="Alphabetical listing of all Akoma Ntoso elements." href="http://examples.akomantoso.org/alphabetical.html">alphabetical listing</a> | 
				<a class="menu-external" title="Schema categories of all Akoma Ntoso elements" href="http://examples.akomantoso.org/categorical.html">schema categories</a> | 
				<a class="this" title="Used to generate Subschema for Akoma Ntoso documents" href="http://generator.akomantoso.org">subschema generator</a>				
			</span>          
		</div>
		<div id="main-container">
			
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

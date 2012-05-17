<?php

require 'helper-functions.php';

$rand = sane_value($_GET['rand']);
$schema_name = sane_value($_GET['schemaname']);

gen_path_variables($rand, $schema_name);

header("Content-type: application/zip");
header("Content-Disposition: attachment; filename=\"$schema_name.zip\"");
header("Content-Length: ". filesize($zip_path));
readfile($zip_path);

?>

<?php

require 'helper-functions.php';

$status = sane_value($_GET['status']);
$rand = sane_value($_GET['rand']);
$schema_name = sane_value($_GET['schemaname']);

require 'template-outcome-page.html.php';

?>

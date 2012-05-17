<?php

require 'helper-functions.php';

$exec_output = array();
$exec_error_code = 0;

$gen_cmd = $root_dir_path . "/scripts/generate";
$gen_cmd .= " html";

exec($gen_cmd, $exec_output, $exec_error_code);

if ($exec_error_code != 0) {
	header("Content-type: text/plain");

	echo "ret = " . $exec_error_code . "\n";
	$msg = join("\n", $exec_output);
	echo $msg .  "\n";
	die("Error while generating aknssg.html");
}

$html_path = $root_dir_path . "/html/aknssg.html";

chmod($html_path, 0660);

header("Content-Length: ". filesize($html_path));
readfile($html_path);

?>

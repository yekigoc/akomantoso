<?php

include 'aknssg-conf.php';
if (empty($root_dir_path)) {
	exit("Please set the `root_dir_path` variable");
}

function sane_value($value) {
	# accept only alphanumeric chars, underscore and hyphen
	$unsafe_chars = '/[^\w\-]/';
	return preg_replace($unsafe_chars, '_', $value);
}

function gen_path_variables($rand, $schema_name) {
	$GLOBALS["tmp_base_dir_path"] = $GLOBALS["root_dir_path"] . "/../tmp/aknssg-$rand";
	$GLOBALS["tmp_dir_path"] = $GLOBALS["tmp_base_dir_path"] . "/$schema_name";

	$GLOBALS["archive_name"] = $schema_name . ".zip";
	$GLOBALS["zip_path"] = $GLOBALS["tmp_dir_path"] . "/" . $GLOBALS["archive_name"];
}

?>

<?php

require 'helper-functions.php';

function non_null_elems($a) {
	return array_values(array_filter($a));
}

function selected_modules($modules) {
	if (empty($modules)) {
		$modules = array();
	}
	
	$modules = array_map("sane_value", $modules);
	
	$selected_modules = join(' ', $modules);
	
	return $selected_modules;
}

$raw_modules_js = trim($_GET['selection']);
$modules_js = non_null_elems(explode(' ', $raw_modules_js));
$modules_html = $_GET['modules'];
$schema_name = sane_value($_GET['filename']);


if (!empty($modules_js)) {
	$requested_modules = selected_modules($modules_js);
} else {
	$requested_modules = selected_modules($modules_html);
}


$rand = mt_rand(10000, 99999);

gen_path_variables($rand, $schema_name);

$gen_cmd = $root_dir_path . "/scripts/generate";
$gen_cmd .= " subschema";
$gen_cmd .= " tmp-dir-path=$tmp_dir_path schema-name=$schema_name";
$gen_cmd .= " -p outside='$requested_modules'";

$success = false;
$exec_output = array();
$exec_error_code = 0;

exec("mkdir -p '$tmp_dir_path'", $exec_output, $exec_error_code);
if ($exec_error_code == 0) {
	exec($gen_cmd, $exec_output, $exec_error_code);
	if ($exec_error_code == 0) {
		$success = true;
	}
}

if (!file_exists($zip_path)) {
	$success = false;
}

if ($success) {
	$url_pieces = array(".", "download", $rand, $schema_name);
} else {
	$url_pieces = array(".", "error", $rand, $schema_name);
}

$url = join('/', $url_pieces);

header("HTTP/1.1 307 Temporary Redirect");
header("Location: $url");

?>

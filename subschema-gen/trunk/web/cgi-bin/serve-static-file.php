<?php

require 'helper-functions.php';

function assert_acceptable_name($file_name) {
	if (!preg_match("~^[[:alnum:]/-]+(\.[[:alnum:]-]+)+$~", $file_name)) {
		header('HTTP/1.1 404 Not Found');
		die("wrong file name $file_name");
	}
}

function assert_existing_file($file_name) {
	if (!file_exists($file_name)) {
		header('HTTP/1.1 404 Not Found');
		die("unknown file $file_name");
	}
}

function info_for_file($file_name) {
	$path_info = pathinfo($file_name);
	$extension = $path_info['extension'];
	switch ($extension) {
	case "js":
		$info = array('type' => 'application/javascript');
		break;
	case "css":
		$info = array('type' => 'text/css');
		break;
	}

	return $info;
}

$file_name = $_GET['filename'];
assert_acceptable_name($file_name);

$file_path = $GLOBALS["root_dir_path"] . "/html/" . $file_name;
assert_existing_file($file_path);

$file_info = info_for_file($file_name);

header("Content-type: " . $file_info['type']);
header("Content-Length: " . filesize($file_path));
readfile($file_path);

?>

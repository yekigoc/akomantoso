<?php
error_reporting(-1);
/*
 * This is to force-download window instead of rendering the XML 
 * on browser and then saving it.
 */
require('config.php');

$file = $_GET['file'];

if ($file == 'all') {
    
    $xml = simplexml_load_file($examples_catalog) or die ("Unable to load XML file!");
    
    $filesListXml = $xml->xpath('//file');
    
    if (!empty($filesListXml)) {
        $filesList = array();
        foreach ($filesListXml as $fileXml) {
          
            $files_to_zip[] = "../doc/".(string)$fileXml->attributes()->name;
            
        }
    }
    $examples_name = 'akomantoso-examples';
    //if true, good; if false, zip creation failed
    $result = create_zip($files_to_zip,$examples_name);
    chmod($examples_name.'.zip',0755);
    
    // We'll be outputting a XML
    header('Content-type: application/octet-stream');
    header("Pragma: no-cache");
    // It will be given this name
    header('Content-Disposition: attachment; filename="'.$examples_name.'.zip"');
    // The XML source
    readfile($examples_name.'.zip');

} else {
    // We'll be outputting a XML
    header('Content-type: text/xml');
    header("Pragma: no-cache");
    // It will be given this name
    header('Content-Disposition: attachment; filename="'.$file.'.zip"');
    // The XML source
    readfile('../doc/'.$file.'.zip');
}

/* 
 * creates a compressed zip file 
 * http://davidwalsh.name/create-zip-php
 */
function create_zip($files = array(),$destination = '', $overwrite = true) {
    //if the zip file already exists and overwrite is false, return false
    if(file_exists($destination.'.zip') && !$overwrite) { return false; }
    //vars
    $valid_files = array();
    //if files were passed in...
    if(is_array($files)) {
        //cycle through each file
        foreach($files as $file) {
        //make sure the file exists
        if(file_exists($file)) {
                $valid_files[] = $file;
            }
        }
    }
    //if we have good files...
    if(count($valid_files)) {
        //create the archive
        $zip = new ZipArchive();
        if($zip->open($destination.'.zip',$overwrite ? ZIPARCHIVE::OVERWRITE : ZIPARCHIVE::CREATE) !== true) {
          return false;
        }
        //add the files
        foreach($valid_files as $file) {
          $zip->addFile($file,$destination."/".basename($file));
        }
        //debug
        //echo 'The zip archive contains ',$zip->numFiles,' files with a status of ',$zip->status;
        
        //close the zip -- done!
        $zip->close();
        
        //check to make sure the file exists
        return file_exists($destination.'.zip');
    } else {
        return false;
    }
}
?>
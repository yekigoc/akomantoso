<?php
	/*
		@author Anthony Oduor (aowino@gmail.com)
    */
	$doc_name = $_GET['doc_name'];
	
	require('config.php');

	$xml = simplexml_load_file($examples_catalog) or die ("Unable to load XML file!");;

    $nodes = $xml->xpath(sprintf('/examples/file[@name="%s"]', $doc_name.".xml"));
    if (!empty($nodes[0]->desc))
        echo $nodes[0]->desc;
    else
        echo "no notes for this document";
		
    /*foreach($xml->file as $item)
    {
        if($item->name == $doc_name.".xml")
            echo "<p>Item Desc: " . $item->desc . "</p>";
        else
            echo "no notes for this document";
    }*/
?>
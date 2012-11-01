<?php

/*
 * Akoma Ntoso Documentation
 *
 * @file search.php
 * @date 2012/11/01
 * @author aowino@googlemail.com
 * (C) Copyright 2012 Bungeni
 *
 * Searches Akoma Ntoso example documents with the given element
 */
 
require('config.php');

$find_element = $_GET['el_documentation'];

$xml = simplexml_load_file($examples_catalog) or die ("Unable to load XML file!");

$filesListXml = $xml->xpath('//file');

if (!empty($filesListXml)) {
    $filesList = array();
    
    $doc = new DOMDocument;
    $doc->formatOutput = true;
    $doc->preserveWhiteSpace = false;  
    
    foreach ($filesListXml as $fileXml) {
      
        $docName = $fileXml->attributes()->name;
        
        $doc->load('../doc/'.$docName);        
        $elements = $doc->getElementsByTagName($find_element);
        
        if ($elements->length == 0) {
            continue;
        }  
        echo "<div class='title-link-wrapper'><a class='title-link menu-external' ref='".$docName."' href='#'>".$docName."</a></div>";
        $data = array();
        foreach ($elements as $node) {
        
            if(!empty($node)) {           
                $aNode = $doc->saveXML($node);
                echo get_document($aNode);
            }
            
            /*
                // For debugging
                
                foreach($node->childNodes as $child) {
                    $data[] = array($child->nodeName => $child->nodeValue);
                    //print_r($data);
                    echo $doc->saveXML($node);
                }
            */            
        }  
        echo "<hr />";        
    }
}

//transform the given node with AKN xslt
function get_document($aNode)
{
	//get the directory in which the documents are contained from the config.php file
	global $xml_dir, $html_dir, $xslt, $html_xslt;

	//create the xslt
	$xp = new XsltProcessor();
	
	// create a DOM document and load the XSL stylesheet
  	$xsl = new DomDocument;
  	$xsl->load($xslt);
  
  	// import the XSL styelsheet into the XSLT process
  	$xp->importStylesheet($xsl);
	
	//open the xml document
	$xml = new DomDocument;
    $xml->loadXML($aNode);
				
	//transform	
	if ($html = $xp->transformToXML($xml)) 
	{
		$return = str_replace('<?xml version="1.0"?>'. "\n","",$html);
		$return = str_replace('<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">' . "\n","",$return);
    	$return = str_replace("\n","",$return);
    	$return = str_replace("\n ","",$return);
		return str_replace("\t","",$return); 
	} 
	else 
	{
    	trigger_error('XSL transformation failed.', E_USER_ERROR);
  	} 	
} 	
?>
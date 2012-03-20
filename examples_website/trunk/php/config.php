<?php
	//the directory in wich the XML documents are stored
	$xml_dir = '/var/www/html/doc';

	//the directory in wich the HMTL documents are stored
	$html_dir = '/var/www/html/doc_html';
	
	//the xslt to apply to the XML files
	$xslt = '/var/www/html/xslt/XMLPrettyPrint.xsl';

	//the documentation xml
	//$documentation = '/home/lucac/documentation/sidebyside/html/documentation/ANDocumentation.xml';
	$documentation = $html_dir ; //'/var/www/html/documentation/HTMLDocs/';
	
	//the xslt to apply to the documentation
	//$doc_xslt = '/home/lucac/documentation/sidebyside/html/xslt/ANDocToXhtml.xsl';
	$doc_xslt = '/var/www/html/xslt/extract.xsl';

	//the xslt to transform the document into html
	$html_xslt = '/var/www/html/xslt/AknToHtml.xsl';
	
	//a file with all example documents and their notes
	$examples_catalog = '/var/www/html/doc/examples.xml';
	
	//a file with all akoma ntoso releases
	$releases_catalog = '/var/www/html/doc/releases.xml';	
?>

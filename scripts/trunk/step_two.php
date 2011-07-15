#!/usr/bin/php
<?php
    if ($argc != 2){
        exit('Usage : step_two input_file. Writes files to docs directory in current directory');
    }
    $input = $argv[1];
	$output = $argv[2];
	if (file_exists($input)) {
	    $dom = new DOMDocument;
        $dom->preserveWhiteSpace = true;
        $dom->resolveExternals = true;
        $dom->loadHTMLFile($input);
        $xpath = new DOMXpath($dom);
	}
	else
	{
	    exit('Failed to open input file');
	}
    print("\nGenerating documentation....\n");
	print("Please wait, this will take a while\n");
	$divs = $xpath->query('//div[@class="componentTitle"]');
	foreach ($divs as $div){
	    $html = '<html><head><link rel="stylesheet" href="docHtml.css" type="text/css" /></head><body>';
	    $table = $div->nextSibling->nextSibling;
	    $xml = $table->ownerDocument->saveXML($table);
	    $html .= $xml;
	    $html .= "</body></html>";
	    $type = trim($div->firstChild->nodeValue);
	    $elementName = $div->firstChild->nextSibling->nodeValue;
	    if ( $type === "Element")
	    {
	        $filename = $elementName."E.html";
	    }
	    else if ($type === "Element Group")
	    {
	        $filename = $elementName."EG.html";
	    }
	    else if ($type === "Attribute")
	    {
	        $filename = "";
	    }
	    else if ($type === "Attribute Group")
	    {
	        $filename = $elementName."AG.html";
	    }
	    else if ($type === "Complex Type")
	    {
	        $filename = $elementName."CT.html";
	    }
	    else if ($type === "Simple Type")
	    {
	        $filename = $elementName."ST.html";
	    }
	    else
	    {
	        $filename = "";
	    }
	    if ($filename != "")
	    {
	        $fp = fopen('docs/'.$filename, 'w+');
	        fwrite($fp, $html);
	    }
	}
	echo "Finished \n";
?>

#!/usr/bin/php
<?php
    if ($argc != 4){
        exit('Usage : step_one.php input_file output_file csv_output');
    }
	$input = $argv[1];
	$output = $argv[2];
	$csv_output = $argv[3];
	if (file_exists($input)) {
	    $dom = new DOMDocument;
        $dom->preserveWhiteSpace = true;
        $dom->resolveExternals = true;
        $dom->loadHTMLFile($input);
        $xpath = new DOMXpath($dom);
	}
	else
	{
	    exit('Could not open input file');
	}
	print("\nFixing links....\n");
	print("Please wait, this will take a while\n");
	$divs = $xpath->query('//div[@class="componentTitle"]');
	$fp = fopen($csv_output, 'w+');
	foreach ($divs as $div){
	    $anchor = $div->previousSibling;
	    $id = $anchor->getAttribute("id");
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
	    $map[$id] = $filename;
	    if ( $type != "Attribute")
	    {
	        $csv = $elementName.",".$filename.",".$type."s\n";
	        fwrite($fp, $csv);
	    }
	}	
	$mapElements = $dom->getElementsByTagName( "area" );
	foreach ($mapElements as $mapElement)
	{
	    $link = $mapElement->getAttribute("href");
	    if (($link != "")  && ($link != "#INDEX")){
	        $pieces = explode("#", $link);
	        $anchorlink = $pieces[1];
	        $reallink = $map[$anchorlink];
	        $mapElement->setAttribute('href',$reallink);
	    }
	}
	$aElements = $dom->getElementsByTagName( "a" );
	foreach ($aElements as $aElement)
	{
	    $link = $aElement->getAttribute("href");
	    if (($link != "")  && ($link != "#INDEX")){
	        $pieces = explode("#", $link);
	        $anchorlink = $pieces[1];
	        $reallink = $map[$anchorlink];
	        $aElement->setAttribute('href',$reallink);
	        $aElement->removeAttribute("onclick");
	        $aElement->removeAttribute("target");
	        $aElement->removeAttribute("title");
	    }
	}
	$dom->save($output);
	echo "Finished \n";
?>

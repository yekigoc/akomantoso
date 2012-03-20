<?php
    function get_data($url)
    {
        $ch = curl_init();
        $timeout = 100;
        $userAgent = 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)';
        curl_setopt($ch, CURLOPT_USERAGENT, $userAgent);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT,$timeout);
        curl_setopt($ch, CURLOPT_HEADER, false);
        $data = curl_exec($ch);
        curl_close($ch);
      
        if (!$data) {
            $info .= "<br />cURL error number:" .curl_errno($ch);
            $info .= "<br />cURL error:" . curl_error($ch);
            return $info;
        }
        $dom = new DOMDocument();
        $dom->loadHTMLFile($data);
    
        $xpath = new DOMXPath($dom);        
      
        return $data;
    }
    
    echo $returned_content = get_data('http://code.google.com/p/akomantoso/source/diff?spec=svn133&old=133&r=137&format=side&path=%2Frelease%2Ftrunk%2Fschemas%2Fakomantoso10.xsd');
    //echo $returned_content = get_data('http://localhost/html/index.html');
    
    //preg_match("'<div id=\"maincontainer\" class=\"rounded-eigh\" style=\"background-color:white;\">(.*?)</div>'si", $returned_content, $match);
    //2 preg_match("'<div id=\"maincol\">(.*?)</div>'si", $returned_content, $match);
    //2 print_r($match);
   
    //$elements = $returned_content->query("*/div[@id='maincol']");
    //$elements = $returned_content->query("*/div[@id='maincontainer']");
    
    /*if (!is_null($elements)) {
      foreach ($elements as $element) {
        echo "<". $element->nodeName. ">";
    
        $nodes = $element->childNodes;
        foreach ($nodes as $node) {
            echo "<". $node->nodeName. ">";
                echo $node->nodeValue. "\n";
            echo "</". $node->nodeName. ">";
        }
        echo "</". $element->nodeName. ">";
      }
    }*/   
?>
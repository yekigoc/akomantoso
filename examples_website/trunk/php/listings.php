<?php
	/*
		@author Anthony Oduor (aowino@gmail.com)
    */
	require('config.php');

	global $documentation, $doc_xslt, $html_dir;
 	
	$result = "";
	$optionsA = Array();
	if ($handle = @opendir($html_dir)) 
    {
    	//loop on the xml directory while it contains files
		while (false !== ($file = readdir( $handle ))) 
		{
			if ($file != ".." && $file != "." && $file != ".DS_Store") 
		  	{
				array_push($optionsA, basename($file,".html"));
			}
		}
	}
	
    function get_data($no,$opt)
    {
        global $releases_catalog;
    	
    	$xml = simplexml_load_file($releases_catalog) or die ("Unable to load releases.xml file!");;
    
        $nodes = $xml->xpath(sprintf('/releases/release[@number="%d"]', $no));
        
        if (!empty($nodes[0]->diff) || !empty($nodes[0]->source)) {
        
            if($opt == 'diff')
                $url =$nodes[0]->diff;
            elseif($opt == 'src')
                $url =$nodes[0]->source;
            else
                return "No Sourcelink or Diff for this release";
                
            if(empty($nodes[0]->diff) && $opt == 'diff')
                return "No diff available for this release";
                
            //$url = 'http://code.google.com/p/akomantoso/source/diff?spec=svn133&old=133&r=137&format=side&path=%2Frelease%2Ftrunk%2Fschemas%2Fakomantoso10.xsd';
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
                //uncomment 2 lines below to get debug info for cURL
                //$info .= "<br />cURL error number:" .curl_errno($ch);
                //$info .= "<br />cURL error:" . curl_error($ch);
               return $info;
            }
            $dom = new DOMDocument();
            $dom->loadHTMLFile($data);
            
            $xpath = new DOMXPath($dom);
            
            //http://wintermute.com.au/bits/2005-09/php-relative-absolute-links/
            return preg_replace('#(href|src)="([^:"]*)("|(?:(?:%20|\s|\+)[^"]*"))#','$1="http://code.google.com$2$3',$data);
        }
        else {
            return "No diff link for this release";    
        }
    }	
	
    function startsWith($haystack, $needle)
    {
        $length = strlen($needle);
        return (substr($haystack, 0, $length) === $needle);
    }
    
    function endsWith($haystack, $needle)
    {
        $length = strlen($needle);
        $start  = $length * -1; //negative
        return (substr($haystack, $start) === $needle);
    }	
	
	function alphabetical_listing() {
	
        global $result, $optionsA;
        $cates = array("AG","E","EG","CT","ST");
	   
        foreach (range('a', 'z') as $char) {
            $result .= '<pre class="c">
                <span class="alphabet-titles">'.$char.'</span>
                <span class="expander" onclick="collapse(\''.$char.'\',this)">[ + ]</span>
                    <br/>
                    </pre><span style="display:none;" id="'.$char.'">
                <ul class="listblock">';    
                sort($optionsA);
                foreach ($optionsA as $o)
                    {     
                        $ele = str_replace($cates,"",$o);
                        if(startsWith(strtolower($o),$char)):
                            $result .= '<li><a href="#'.$o.'" name="'.$o.'" onclick="return false;">'.$ele.'</a></li>';
                        else:
                            continue;
                   		endif;
                    }               		       
            $result .= '</ul>
                   		</span>'; 
        }
    	return $result;
    }
    
	function categorical_listing() {
	
        global $result, $optionsA;
	   
        $cates = array("AG" => "Attribute Group",
                        "E" => "Element",
                        "EG" => "Element Group",
                        "CT" => "Complex Type",
                        "ST" => "Simple Type");
        
        foreach ($cates as $key => $value) {
            $result .= '<pre class="c">
                <span class="expander" onclick="collapse(\''.$key.'\',this)">[ + ]</span>
                    <span class="category-titles">'.$value.'</span><br/>
                    </pre><span style="display:none;" id="'.$key.'">
                <ul class="listblock">';    
                natcasesort($optionsA);
                foreach ($optionsA as $o)
                    {
                        $ele = substr($o,0,-strlen($key));
                        if(endsWith($o,$key)):
                            $result .= '<li><a href="#'.$o.'" name="'.$o.'" onclick="return false;">'.$ele.'</a></li>';
                        else:
                            continue;
                   		endif;
                    }               		       
            $result .= '</ul>
                   		</span>'; 
        }
    	return $result;
    } 
    
    function releases_listing() {
    
        global $result, $optionsA, $releases_catalog;
    	
    	$xml = simplexml_load_file($releases_catalog) or die ("Unable to load releases.xml file!");;
    
        $result .= "<ul>";
        /*$nodes = $xml->xpath(sprintf('/releases/file[@name="%s"]', $doc_name.".xml"));
        if (!empty($nodes[0]->desc))
            echo $nodes[0]->desc;
        else
            echo "no notes for this document";
    		*/
        foreach($xml->release as $item)
        {
            $name = 'number';
            $result .= "<li><a name='".$item->attributes()->$name."' href='#r".$item->attributes()->$name."'>" . $item->title . "</a></li>";
        }
        $result .= "</ul>";
        
        return $result;
    }
    
    function releases_notes($no) {
    
        global $result, $optionsA, $releases_catalog;
    	
    	$xml = simplexml_load_file($releases_catalog) or die ("Unable to load releases.xml file!");;
    
        $nodes = $xml->xpath(sprintf('/releases/release[@number="%d"]', $no));
        
        if (!empty($nodes[0]->notes))
            return $nodes[0]->notes;
        else
            return "no notes for this release";
    }    
    
    if($_GET['type']=='alphabetical') {
        echo alphabetical_listing();
    }
    elseif($_GET['type']=='categorical') {
        echo categorical_listing();
    }
    elseif($_GET['type']=='releases') {
        if($_GET['no'])
            echo releases_notes($_GET['no']);
        else
            echo releases_listing();
    }
    elseif($_GET['type']=='retrievediff') {
        echo $returned_content = get_data($_GET['no'],'diff');
    }
    elseif($_GET['type']=='retrievesource') {
        echo $returned_content = get_data($_GET['no'],'src');
    }    
?>
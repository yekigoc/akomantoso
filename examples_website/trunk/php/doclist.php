<?php
	/*
		Copyright (c) 2008, Luca Cervone (cervoneluca@gmail.com)

		All rights reserved.

		Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

		Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		Neither the name of the University of Bologna nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

		THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
		IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.	
	*/
	require('config.php');
		
	//get all the documents contained in the directory that contains the xml documents
	function get_doc_list()
	{
		//get the directory in which the documents are contained from the config.php file
		global $xml_dir, $html_dir, $examples_catalog;
 		$att = 'name';
		//create the string that contains all the documents names (inside <option> element)
		$result = '<option value="doc_select">Select a Document</option>';
		
    	$xml = simplexml_load_file($examples_catalog) or die ("Unable to load XML file!");
        foreach($xml->file as $item)
        {
            $text = str_replace("_"," ",$item->attributes()->$att);
            $result .= "<option value='".substr($item->attributes()->$att,0,-4)."'>".$text."</option>";
        }
        return $result;
        
		/*$optionsA = Array();
		if ($handle = @opendir($xml_dir)) 
    	{
    		//loop on the xml directory while it contains files
			while (false !== ($file = readdir( $handle ))) 
			{
				if ($file != ".." && $file != "." && $file != ".DS_Store") 
			  	{	
					array_push($optionsA, basename($file,".xml"));
				}
			}
		}	
		
		sort($optionsA);
		foreach ($optionsA as $o)
		{
		    $text = str_replace("_"," ",$o);
			$result .= '<option value="' .
						$o.
						'">' .
						$text .
						'</option>';
		}
		return $result;
		*/
	}
?>
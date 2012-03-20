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

	//get the document in the requested version
	function get_document($aDocName,$aVersion)
	{
		//get the directory in which the documents are contained from the config.php file
		global $xml_dir, $html_dir, $xslt, $html_xslt;

		//get the html version
		if($aVersion == 'html')
		{
		    //echo $xml_dir."<br/>".$html_dir."<br/>".$xslt."<br/>".$html_xslt;
			//create the xslt
			$xp = new XsltProcessor();
			
			// create a DOM document and load the XSL stylesheet
		  	$xsl = new DomDocument;
		  	$xsl->load($html_xslt);
		  
		  	// import the XSL styelsheet into the XSLT process
		  	$xp->importStylesheet($xsl);
			
			//open the xml document
			$xml = new DomDocument;
			$xml->load($xml_dir  . '/' . $aDocName . '.xml');
			
			//transform	
			if ($html = $xp->transformToXML($xml)) 
			{
		    	return str_replace('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">','',$html);
				//return $html;
			} 
			else 
			{
		    	trigger_error('XSL transformation failed.', E_USER_ERROR);
		  	} 	
		}
		//get the xml version
		else if ($aVersion == 'xml')
		{
			//create the xslt
			$xp = new XsltProcessor();
			
			// create a DOM document and load the XSL stylesheet
		  	$xsl = new DomDocument;
		  	$xsl->load($xslt);
		  
		  	// import the XSL styelsheet into the XSLT process
		  	$xp->importStylesheet($xsl);
			
			//open the xml document
			$xml = new DomDocument;
			$xml->load($xml_dir  . '/' . $aDocName . '.xml');
						
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
	}
	
?>
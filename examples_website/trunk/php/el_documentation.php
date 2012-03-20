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
	
	/**
	 * Return the documentation of the element extracted from the ANDocumentation.xml
	 * and translated to HTML
	 * @return the documentation of the element formatted as HTML
	 * @param $anElementName Object the name of the element for which the documentation is needed 
	 * @param $type Object the type of the documentation to retrieve 
	 */
	function get_element_documentation($anElementName,$type)
	{
		global $documentation, $doc_xslt;
			
		//create the xslt
		$xp = new XsltProcessor();
			
		// create a DOM document and load the XSL stylesheet
		$xsl = new DomDocument;
		$xsl->load($doc_xslt);
		  
		// import the XSL styelsheet into the XSLT process
		$xp->importStylesheet($xsl);
			
		//open the xml document
		$xml = new DomDocument;
		$xml->load($documentation . '/' . $anElementName . "E.html");
		
		//set the parameter
		//$xp->setParameter('', array('element' => $anElementName, 'type' => $type));
			
		//transform	
		if ($html = $xp->transformToXML($xml)) 
		{
			return $html; 
		} 
		else 
		{
		 	trigger_error('XSL transformation failed.', E_USER_ERROR);
		} 	
	}
	
	/* handles element click within the #tec_doc pane
	*
	*  param anElementName - name of any element on AN document
	* param type - It's always 'technical'...
	*/
	function get_element_tech_documentation($anElementName,$type)
	{
		global $documentation, $doc_xslt;
		//create the xslt
		$xp = new XsltProcessor();
		//echo $documentation . $anElementName . '.html';exit;	
		// create a DOM document and load the XSL stylesheet
		$xsl = new DomDocument;
		$xsl->load($doc_xslt);
		  
		// import the XSL styelsheet into the XSLT process
		$xp->importStylesheet($xsl);
			
		//open the xml document
		$xml = new DomDocument;
		$xml->load($documentation . '/' . $anElementName . ".html");
		
		//set the parameter
		//$xp->setParameter('', array('element' => $anElementName, 'type' => $type));
			
		//transform	
		if ($html = $xp->transformToXML($xml)) 
		{
			return $html; 
		} 
		else 
		{
		 	trigger_error('XSL transformation failed.', E_USER_ERROR);
		} 	
	}	
?>
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
/**
 * This function initialize the app getting the list of the documents stored into the 
 * XML documents directory
 */
function initialize()
{
	//fill the doc list into the select
	document.getElementById("doc_menu").innerHTML = ''  + get_doc_list() + '';
}

/**
 * Get the XML version and the HMTL version of the given document
 * @param {Object} aSelect the select in which the document choice is made
 */
function getDocument(aSelect)
{
	//if the document name is the menu header returns
	if (aSelect.value == 'doc_select')
		return;
	//otherwise get the HMTL and the XML version of the document and fill them into the index HTML
	else
	{

		//start the ajax loader
		miniLoaderHtml('on');

		//start the ajax loader
		loader('on',"xml_doc");

		//start the ajax loader
		loader('on',"html_doc");

		//the XML version
		var xml_doc = retrieveXMLDocument(aSelect.value,'xml_doc');
		
		//the HTML version
		var html_doc = retrieveHTMLDocument(aSelect.value,'html_doc');
		
		//the description notes for that document
		var desc_notes = getNotes(aSelect.value,'doc-notes');			
	}
}

function getNotes(aDocName,aDiv)
{
	try
	{
		var http_request = null;
	
		// Here starts the ajax request
		if (window.XMLHttpRequest) 
		{ 
			// Mozilla, Safari,...
       		http_request = new XMLHttpRequest();
       
      	 	if (http_request.overrideMimeType) 
      		{
				http_request.overrideMimeType('text/xml');
       		}
     	} 
     	else if (window.ActiveXObject) 
     	{ 
			// IE
      		try 
      		{
           		http_request = new ActiveXObject("Msxml2.XMLHTTP");
       		} 
       		catch(e) 
       		{
           		try 
           		{
            		http_request = new ActiveXObject("Microsoft.XMLHTTP");
            	} 
            	catch(e) 
            	{
            	}
        	}
     	}

     	if (!http_request) 
     	{
        	//alert('SideBySide.php error: [error with httprequest]');
     	}
     	
     	
     	//get the configurations object
     	var Config = new Configurations();
     	
     	//when the documentation arrives call the fucntion that fill it into the properly div
     	http_request.onreadystatechange = function()
     	{ 
            fillDocumentHTML(aDiv,http_request);
     	};

		//make the syncronus request
		http_request.open('GET',Config.phpDoclist + '?doc_name=' + aDocName + '&version=html' ,true);
     	
     	//set the request headers
		//http_request.setRequestHeader("Accept-Charset", "UTF-8")
     	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
     	
     	//sends no parameters
     	http_request.send(null);
     	return http_request.responseText;


  	}
  	catch(err)
  	{
		//alert('get_doc_list() error: [' + err +']');
  	}
}

/**
 * Retrieve the documentation of the requested element and fill in in the right column
 * @param anElementName the name of the element for which the documentation is needed
 * @param aButton the element clicked in the XML 
 * @return void
 */
function getElementDocumentation(anElementName,anElement)
{
	//set the background color of all the element of html_doc to transparent
	var htmlElements = document.getElementById("html_doc").getElementsByTagName("*");
	
	//de-highlight incase...
	//document.getElementById("html_doc").style.opacity = '1.0';
	
	//true if an HMTL Representation was found
	var htmlCheck = false;

	for (var y=0; y < htmlElements.length; y++)
	{
		//if the element is a node element
		if (htmlElements[y].nodeType == 1) 
		{
			//set the background to transparent
			htmlElements[y].style.backgroundColor = 'transparent';
			// if the element has the same xp attribute of the wanted element  
			if (htmlElements[y].getAttribute("xp") == anElement.getAttribute("xp")) 
			{
				//set the background color to yellow
				htmlElements[y].style.backgroundColor = 'yellow';
				//scroll the div that contains the hmtl representation to the wanted element
				switchTab("html_doc");
				document.getElementById('html_doc').scrollTop = htmlElements[y].offsetTop - 90;
				//html representation founded
				htmlCheck = true;
			}
			//alert(htmlElements[y].getAttribute("xp") + "||||" + anElement.getAttribute("xp"));
		}
	}
	//leave the 'head notes' bg as it was/ they were
	$(".notes-title").css('background-color', '#ededed');
	
	//assert the default title as this may change below or from previous click
	document.getElementById("html").innerHTML = '<div class="loader">HTML representation</div>';	
		
	//if an HTML representation was not found switch to the technical documentaiton
	if(!htmlCheck)
	{
		//change HTML title as reason not to show it as usual default
		document.getElementById("html").innerHTML = '<div class="loader">no HTML representation</div>';	
		
		switchTab("tec_doc");	
	}

	//start the ajax loader
	//loader('on',"sem_doc");

	//start the ajax loader
	//miniLoaderSem('on');

	//get the element documentation 
	//retrieveElementDocumentation(anElementName,"sem_doc")

	//start the ajax loader
	loader('on',"tec_doc");

	//start the ajax loader
	miniLoaderTec('on');

	//get the element documentation 
	retrieveElementDocumentationTec(anElementName,"tec_doc")

}

/**
 * Used to open a document on double click 
 */
function goTo(aLink){
	if (aLink.substring(0, 1) != '#') {
		window.open('http://akn.web.cs.unibo.it' + aLink, '_blank');
	}
	else
	{ 
		var newLocation = '';
		if (document.location.href.split('#').lenght == 0) 
		{
			newLocation = document.location + aLink;
		}
		else 
		{
			newLocation = document.location.href.split('#')[0] + aLink;
		}
		document.location = newLocation;
	}
}

/**
 * Start and Stop the ajax loader
 * @param aSwitch on to start the loader, off to stop it
 * @return void
 */
function loader(aSwitch,position)
{
	//is is on append the loader
	if(aSwitch == 'on')
	{
		//get the right column
		var rightColumn = document.getElementById(position);
		
     	//get the configurations object
     	var Config = new Configurations();

     	//create the loader
		var loader = '<div id="loader"><img src="' + Config.loaderLocation + '"/></div>';
		
		//append the loader to the column
		rightColumn.innerHTML = loader;
	}
	else
	{
		//get the right column
		var rightColumn = document.getElementById(position);

		//remove the loader
		rightColumn.removeChild(document.getElementById("loader"));
	}
}

function miniLoaderOutline(aSwitch)
{
	//is is on append the loader
	if(aSwitch == 'on')
	{
		//get the right column
		var rightColumn = document.getElementById("doc_select");
		
     	//get the configurations object
     	var Config = new Configurations();

     	//create the loader
		var loader = document.createElement("div")
		loader.className = "loader";
		loader.id = "outline_loader"
		var loaderImg = document.createElement("img");
		loaderImg.setAttribute("src",Config.miniLoaderLocation);
		loader.appendChild(loaderImg);
		rightColumn.appendChild(loader);
	}
	else
	{
		//get the right column
		var rightColumn = document.getElementById("doc_select");
		
		//remove the loader
		rightColumn.removeChild(document.getElementById("outline_loader"));
	}
	
}

function miniLoaderHtml(aSwitch)
{
	//is is on append the loader
	if(aSwitch == 'on')
	{
		//get the right column
		var rightColumn = document.getElementById("html");
		
     	//get the configurations object
     	var Config = new Configurations();

     	//create the loader
		var loader = '<div class="loader">HTML representation <img src="' + Config.miniLoaderLocation + '"/></div>';
		
		//append the loader to the column
		rightColumn.innerHTML = loader;
	}
	else
	{
		//get the right column
		var rightColumn = document.getElementById("html");
		
     	//get the configurations object
     	var Config = new Configurations();
		
		//append the loader to the column
		rightColumn.innerHTML = "HTML representation";
	}
}

function miniLoaderSem(aSwitch)
{
	//is is on append the loader
	if(aSwitch == 'on')
	{
		//get the right column
		var rightColumn = document.getElementById("sem");
		
     	//get the configurations object
     	var Config = new Configurations();

     	//create the loader
		var loader = '<div class="loader">semantical documentation <img src="' + Config.miniLoaderLocation + '"/></div>';
		
		//append the loader to the column
		rightColumn.innerHTML = loader;
	}
	else
	{
		//get the right column
		var rightColumn = document.getElementById("sem");
		
     	//get the configurations object
     	var Config = new Configurations();
		
		//append the loader to the column
		rightColumn.innerHTML = "semantical documentation";
	}
}

function miniLoaderTec(aSwitch)
{
	//is is on append the loader
	if(aSwitch == 'on')
	{
	    
		//get the right column
		var rightColumn = document.getElementById("tec");
		
     	//get the configurations object
     	var Config = new Configurations();

     	//create the loader
		var loader = '<div class="loader">technical documentation <img src="' + Config.miniLoaderLocation + '"/></div>';
		
		//append the loader to the column
		rightColumn.innerHTML = loader;
	}
	else
	{
	    
		//get the right column
		var rightColumn = document.getElementById("tec");
		
     	//get the configurations object
     	var Config = new Configurations();
		
		//append the loader to the column
		rightColumn.innerHTML = "technical documentation";
		
	    //clear HTML tab contents
	    //document.getElementById("html_doc").style.display = "none";
	    //document.getElementById("html_doc").innerHTML = "no HTML representation for this element"; 		
	}
}

/**
 * Used to collapse or expand the XML fragment with the given id
 * @param anId the id that must be collapsed/expanded
 * @param aButton the button that dispatch the collapse/expand of the fragment
 * @return void
 */
function collapse(anId,aButton)
{
	//alert(aButton.parentNode.nextSibling.nodeName)
	//the current displaying mode of the fragment
	var elementToCollapse = aButton.parentNode.nextSibling;
	var currentDisplay = elementToCollapse.style.display;

	//if the fragment is expanded collapse it
	if (currentDisplay =='inline' || currentDisplay == '')
	{
	    //console.log(aButton.parentNode.nextSibling);
		elementToCollapse.style.display = 'none';
		aButton.innerHTML = '[ + ] ';
	}
	//else expand the fragment
	else 
	{
		elementToCollapse.style.display = 'inline';
		aButton.innerHTML = '[ -&nbsp; ] ';
	}
}

/**
 * open all the elements
 */
function collapseAll()
{
	//get all the elements in the XML div
	var xmlElements = document.getElementById("xml_doc").getElementsByTagName("span");
	
	//for each element if it has the properly outline level show it 
	for (var i = 0; i < xmlElements.length; i++) 
	{
		if (xmlElements[i].innerHTML == '[ -&nbsp; ] ')
			xmlElements[i].innerHTML = '[ + ] ';
		if (xmlElements[i].style.display == 'inline')
			xmlElements[i].style.display = 'none';
	}
}

/**
 * open all the elements
 */
function expandAll()
{
	console.log(xmlElements.length);
	//get all the elements in the XML div
	var xmlElements = document.getElementById("xml_doc").getElementsByTagName("span");
	
	//for each element if it has the properly outline level show it 
	for (var i = 0; i < xmlElements.length; i++) 
	{
		if (xmlElements[i].innerHTML == '[ + ] ')
			xmlElements[i].innerHTML = '[ -&nbsp; ] ';
		if (xmlElements[i].style.display == 'none')
			xmlElements[i].style.display = 'inline';
	}
}

/**
 * Expands all the parents of a given element
 */
function expandParents(anElement)
{
	var xmlElements = document.getElementById("xml_doc").getElementsByTagName("span");
	
	//for each element if it has the properly outline level show it 
	for (var i = 0; i < xmlElements.length; i++) 
	{
		if(inArray(xmlElements[i].getElementsByTagName("span"),anElement))
		{
			xmlElements[i].style.display = 'inline';
			xmlElements[i].previousSibling.firstChild.innerHTML = '[ -&nbsp; ] '; 
		}
	}
}


/**
 * Used to collapse all the element that are not in the given outline level
 */
function outline(aLevel)
{
    /* EXPAND ALL SECTION */
	   //get all the elements in the XML div
	var xmlElements = document.getElementById("xml_doc").getElementsByTagName("span");
	
	   //for each element if it has the properly outline level show it 
	for (var i = 0; i < xmlElements.length; i++) 
	{
		if (xmlElements[i].innerHTML == '[ + ] ')
			xmlElements[i].innerHTML = '[ -&nbsp; ] ';
		if (xmlElements[i].style.display == 'none')
			xmlElements[i].style.display = 'inline';
	}		
    /* EXPAND ALL SECTION */
    
	//if the outline is all return
	if (aLevel == 'all') 
	{
		//switch off the loader
		document.getElementById("loader_div").style.display = 'none';
		document.getElementById("xml_doc").style.display = 'block';
		return;
	}
	//get all the elements in the XML div
	var xmlElements = document.getElementById("xml_doc").getElementsByTagName("span");
    //console.clear();
	//for each element if it has the properly outline level show it 
	for (var i = 0; i <xmlElements.length; i++)
	{
		if(xmlElements[i].getAttribute("id") == null)
			continue;
		if((xmlElements[i].getAttribute("id").split("@")[0].split("/").length - 2) < aLevel) {
			/*if(xmlElements[i].style.display == 'none' && xmlElements[i].previousSibling != null)
				collapse(xmlElements[i].id, xmlElements[i].previousSibling);*/
				continue;
	    }
		else if (xmlElements[i].previousSibling != null) {
				collapse(xmlElements[i].id, xmlElements[i].previousSibling);
				//console.log(xmlElements[i].previousSibling);
				//console.log(xmlElements[i].getAttribute("id").split("@")[0].split("/").length +" > "+ aLevel);
		      }
	}
	
	//switch off the loader
	document.getElementById("loader_div").style.display = 'none';
	document.getElementById("xml_doc").style.display = 'block';
}

function switchTab(aTab)
{
	if(aTab == "html_doc")
	{
		document.getElementById(aTab).style.display = "block";
		//document.getElementById("sem_doc").style.display = "none";
		document.getElementById("tec_doc").style.display = "none";
		document.getElementById("html").className = "selected";
		//document.getElementById("sem").className = "nselected";
		document.getElementById("tec").className = "nselected";
	}
	if(aTab == "sem_doc")
	{
		document.getElementById(aTab).style.display = "block";
		document.getElementById("html_doc").style.display = "none";
		document.getElementById("tec_doc").style.display = "none";
		//document.getElementById("sem").className = "selected";
		document.getElementById("html").className = "nselected";
		document.getElementById("tec").className = "nselected";
	}
	if(aTab == "tec_doc")
	{
		document.getElementById(aTab).style.display = "block";
		//document.getElementById("sem_doc").style.display = "none";
		document.getElementById("html_doc").style.display = "none";
		
		//document.getElementById("html_doc").style.opacity = '0.15';
		
		document.getElementById("tec").className = "selected";
		//document.getElementById("sem").className = "nselected";
		document.getElementById("html").className = "nselected";
	}
}

/** PRIVATE METHODS **/
function get_doc_list()
{
	try
	{
		var http_request = null;
	
		// Here starts the ajax request
		if (window.XMLHttpRequest) 
		{ 
			// Mozilla, Safari,...
       		http_request = new XMLHttpRequest();
       
      	 	if (http_request.overrideMimeType) 
      		{
				http_request.overrideMimeType('text/xml');
       		}
     	} 
     	else if (window.ActiveXObject) 
     	{ 
			// IE
      		try 
      		{
           		http_request = new ActiveXObject("Msxml2.XMLHTTP");
       		} 
       		catch(e) 
       		{
           		try 
           		{
            		http_request = new ActiveXObject("Microsoft.XMLHTTP");
            	} 
            	catch(e) 
            	{
            	}
        	}
     	}

     	if (!http_request) 
     	{
        	alert('SideBySide.php error: [error with httprequest]');
     	}
     	
     	//get the configurations object
     	var Config = new Configurations();
     	 	
		//make the syncronus request
		http_request.open('GET',Config.phpEngineLocation + '?doc_list=true',false);
     	
     	//set the request headers
		//http_request.setRequestHeader("Accept-Charset", "UTF-8")
     	//http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
     	
     	//sends no parameters
     	http_request.send(null);
		return http_request.responseText;


  	}
  	catch(err)
  	{
		alert('get_doc_list() error: [' + err +']');
  	}

}

function retrieveElementDocumentation(anElementName,aDiv)
{
	try
	{
		var http_request = null;
	
		// Here starts the ajax request
		if (window.XMLHttpRequest) 
		{ 
			// Mozilla, Safari,...
       		http_request = new XMLHttpRequest();
       
      	 	if (http_request.overrideMimeType) 
      		{
				http_request.overrideMimeType('text/xml');
       		}
     	} 
     	else if (window.ActiveXObject) 
     	{ 
			// IE
      		try 
      		{
           		http_request = new ActiveXObject("Msxml2.XMLHTTP");
       		} 
       		catch(e) 
       		{
           		try 
           		{
            		http_request = new ActiveXObject("Microsoft.XMLHTTP");
            	} 
            	catch(e) 
            	{
            	}
        	}
     	}

     	if (!http_request) 
     	{
        	//alert('SideBySide.php error: [error with httprequest]');
     	}
     	
     	//get the configurations object
     	var Config = new Configurations();
     	
     	//when the documentation arrives call the fucntion that fill it into the properly div
     	http_request.onreadystatechange = function()
     	{ 
     		fillDocumentationSem(aDiv,http_request); 
     	};
        
     	//make the syncronus request
		http_request.open('GET',Config.phpEngineLocation + '?el_documentation=' + anElementName + '&type=semantical' ,true);
     	
     	//set the request headers
		//http_request.setRequestHeader("Accept-Charset", "UTF-8")
     	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
     	
     	//sends no parameters
     	http_request.send(null);
     	return http_request.responseText;


  	}
  	catch(err)
  	{
		//alert('retrieveElementDocumentation error: [' + err +']');
  	}

	
}

function retrieveElementDocumentationTec(anElementName,aDiv)
{
	try
	{
		var http_request = null;
	
		// Here starts the ajax request
		if (window.XMLHttpRequest) 
		{ 
			// Mozilla, Safari,...
       		http_request = new XMLHttpRequest();
       
      	 	if (http_request.overrideMimeType) 
      		{
				http_request.overrideMimeType('text/xml');
       		}
     	} 
     	else if (window.ActiveXObject) 
     	{ 
			// IE
      		try 
      		{
           		http_request = new ActiveXObject("Msxml2.XMLHTTP");
       		} 
       		catch(e) 
       		{
           		try 
           		{
            		http_request = new ActiveXObject("Microsoft.XMLHTTP");
            	} 
            	catch(e) 
            	{
            	}
        	}
     	}

     	if (!http_request) 
     	{
        	//alert('SideBySide.php error: [error with httprequest]');
     	}
     	
     	//get the configurations object
     	var Config = new Configurations();
     	
     	//when the documentation arrives call the fucntion that fill it into the properly div
     	http_request.onreadystatechange = function()
     	{ 
     		fillDocumentationTec(aDiv,http_request); 
     	};
        
     	//make the syncronus request
		http_request.open('GET',Config.phpEngineLocation + '?el_documentation=' + anElementName + '&type=technical' ,true);
     	
     	//set the request headers
		//http_request.setRequestHeader("Accept-Charset", "UTF-8")
     	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');  	
     	
     	//sends no parameters
     	http_request.send(null);
     	return http_request.responseText;
  	}
  	catch(err)
  	{
		//alert('retrieveElementDocumentation error: [' + err +']');
  	}

	
}

function fillDocumentationSem(aDiv,httpRequest)
{
    if (httpRequest.readyState == 4) 
    {
        if (httpRequest.status == 200) 
        {
        	//insert the documentation in the given div
        	document.getElementById(aDiv).innerHTML = httpRequest.responseText;
        	
        	//start the ajax loader
        	miniLoaderSem('off');

        } 
        else 
        {
            alert('There was a problem while trying yo retrieve the documentation.');            
        }
    }

}

function fillDocumentationTec(aDiv,httpRequest)
{
    if (httpRequest.readyState == 4) 
    {
        if (httpRequest.status == 200) 
        {
        	//insert the documentation in the given div
        	document.getElementById(aDiv).innerHTML = httpRequest.responseText;
        	
        	//start the ajax loader
        	miniLoaderTec('off');

        } 
        else 
        {
            alert('There was a problem while trying yo retrieve the documentation.');            
        }
    }

}

function retrieveHTMLDocument(aDocName,aDiv)
{
	try
	{
		var http_request = null;
	
		// Here starts the ajax request
		if (window.XMLHttpRequest) 
		{ 
			// Mozilla, Safari,...
       		http_request = new XMLHttpRequest();
       
      	 	if (http_request.overrideMimeType) 
      		{
				http_request.overrideMimeType('text/xml');
       		}
     	} 
     	else if (window.ActiveXObject) 
     	{ 
			// IE
      		try 
      		{
           		http_request = new ActiveXObject("Msxml2.XMLHTTP");
       		} 
       		catch(e) 
       		{
           		try 
           		{
            		http_request = new ActiveXObject("Microsoft.XMLHTTP");
            	} 
            	catch(e) 
            	{
            	}
        	}
     	}

     	if (!http_request) 
     	{
        	//alert('SideBySide.php error: [error with httprequest]');
     	}
     	
     	
     	//get the configurations object
     	var Config = new Configurations();
     	
     	//when the documentation arrives call the fucntion that fill it into the properly div
     	http_request.onreadystatechange = function()
     	{ 
            fillDocumentHTML(aDiv,http_request);
            tallestHeight = $("#html_doc").height();
            if(tallestHeight > 550) {
                //document.getElementById("html_doc").style.height = tallestHeight+"px";
                //document.getElementById("RightPane").style.height = tallestHeight+100+"px";
                //document.getElementById("maincontainer").style.height = tallestHeight+100+"px";
                //alert(tallestHeight+"px !important");
                //$("#html_doc").css("height", tallestHeight+50+"px !important").trigger("resize");
                //$("#RightPane").css("height", tallestHeight+100+"px !important").trigger("resize");
                //$("#maincontainer").css("height", tallestHeight+100+"px !important").trigger("resize");
            }
            tallestHeight=0;
     	};

		//make the syncronus request
		http_request.open('GET',Config.phpEngineLocation + '?doc_name=' + aDocName + '&version=html' ,true);
     	
     	//set the request headers
		//http_request.setRequestHeader("Accept-Charset", "UTF-8")
     	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
     	
     	//sends no parameters
     	http_request.send(null);
     	return http_request.responseText;


  	}
  	catch(err)
  	{
		//alert('get_doc_list() error: [' + err +']');
  	}
}

function retrieveXMLDocument(aDocName,aDiv)
{
	try
	{
		var http_request = null;
	
		// Here starts the ajax request
		if (window.XMLHttpRequest) 
		{ 
			// Mozilla, Safari,...
       		http_request = new XMLHttpRequest();
       
      	 	if (http_request.overrideMimeType) 
      		{
				http_request.overrideMimeType('text/xml');
       		}
     	} 
     	else if (window.ActiveXObject) 
     	{ 
			// IE
      		try 
      		{
           		http_request = new ActiveXObject("Msxml2.XMLHTTP");
       		} 
       		catch(e) 
       		{
           		try 
           		{
            		http_request = new ActiveXObject("Microsoft.XMLHTTP");
            	} 
            	catch(e) 
            	{
            	}
        	}
     	}

     	if (!http_request) 
     	{
        	//alert('SideBySide.php error: [error with httprequest]');
     	}
     	
     	
     	//get the configurations object
     	var Config = new Configurations();
     	
     	//when the documentation arrives call the fucntion that fill it into the properly div
     	http_request.onreadystatechange = function()
     	{ 
     		fillDocumentXML(aDiv,http_request, aDocName);
     	};

		//make the syncronus request
		http_request.open('GET',Config.phpEngineLocation + '?doc_name=' + aDocName + '&version=xml' ,true);
     	
     	//set the request headers
		//http_request.setRequestHeader("Accept-Charset", "UTF-8")
     	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
     	
     	//sends no parameters
     	http_request.send(null);
     	return http_request.responseText;


  	}
  	catch(err)
  	{
		//alert('get_doc_list() error: [' + err +']');
  	}
}

function fillDocumentHTML(aDiv,httpRequest)
{
    if (httpRequest.readyState == 4) 
    {
        if (httpRequest.status == 200) 
        {
        	//insert the documentation in the given div
        	document.getElementById(aDiv).innerHTML = httpRequest.responseText;
        	//start the ajax loader
    		miniLoaderHtml('off');
			
			//set the onclik events to the HTML fragments
			var htmlElements = document.getElementById(aDiv).getElementsByTagName("*");
			for(var k = 0; k <htmlElements.length; k++)
			{
				htmlElements[k].style.cursor = 'pointer';
				/*htmlElements[k].onmouseover = function(e)
				{
					//set the background coloro of the selected element to yellow
					this.style.backgroundColor = 'cyan';
						
					//stop the propagation of the event
					if (e.stopPropagation) 
						e.stopPropagation(); // DOM Level 2
					else 
						e.cancelBubble = true; //IE 
				}
					
				htmlElements[k].onmouseout = function(e)
				{
					//set the background coloro of the selected element to yellow
					this.style.backgroundColor = 'transparent';
						
					//stop the propagation of the event
					if (e.stopPropagation) 
						e.stopPropagation(); // DOM Level 2
					else 
						e.cancelBubble = true; //IE 
				}*/
					
				htmlElements[k].onclick = function(e)
				{
				    //alert("Ola"); //We here
					//cross browser stuff
					if(!e) var e=window.event;
					//get all the elments contained in the HTML
					var els = document.getElementById("html_doc").getElementsByTagName("*");
					//for each element set the background color to transparent
					for (var y = 0; y < els.length; y++) 
					{
						els[y].style.backgroundColor='transparent';
					}
					//leave the 'head notes' bg as it was/ they were
			        $(".notes-title").css('background-color', '#ededed');
					
					//set the background coloro of the selected element to yellow
					this.style.backgroundColor = 'yellow';
					//remove the overlay if its there
					//document.getElementById("html_doc").style.opacity = '1.0';
					
					//stop the propagation of the event
					if (e.stopPropagation) 
						e.stopPropagation(); // DOM Level 2
					else {
						e.returnValue = false;
						e.cancelBubble = true; //IE 
					}
					//get the XML Elements
					var xels = document.getElementById("xml_doc").getElementsByTagName("span");
                	
                	//for each element if it has the properly outline level show it 
                	for (var i = 0; i < xels.length; i++) 
                	{
                		if (xels[i].innerHTML == '[ - ] ')
                			xels[i].innerHTML = '[ + ] ';
                		if (xels[i].style.display == 'inline')
                			xels[i].style.display = 'none';
                	}
					//for each elemnts check if it has the same xp element to the clicked HMTL element
					
					for (var z = 0; z < xels.length; z++) 
					{
					   	//alert('Grunt');
						if(xels[z].className == 'codename clicked')
						{
							xels[z].className = 'codename';
						}
					}
					for (var z = 0; z < xels.length; z++) 
					{
						if(xels[z].getAttribute("id") != null && xels[z].getAttribute('id').split('@s')[0] == this.getAttribute("xp"))
						{
							//expand all the parents
							xels[z].parentNode.nextSibling.style.display = 'inline';
							xels[z].previousSibling.innerHTML = '[ - ] '; 
							expandParents(xels[z]);
							//scroll the div that contains the XML representation to the wanted element
							document.getElementById('xml_doc').scrollTop = xels[z].offsetTop - 200;
							xels[z].className = "codename clicked";
							document.getElementById(xels[z].getAttribute('id').split('@s')[0] + "@e").className = "codename clicked";
							//start the ajax loader
							//loader('on',"sem_doc");
						
							//start the ajax loader
							//miniLoaderSem('on');
						
							//get the element documentation 
							//retrieveElementDocumentation(xels[z].getAttribute("name"),"sem_doc")
						
							//start the ajax loader
							loader('on',"tec_doc");
						
							//start the ajax loader
							miniLoaderTec('on');
						
							//get the element documentation 
							retrieveElementDocumentationTec(xels[z].getAttribute("name"),"tec_doc")
						}
					}
				}
			}
        } 
        else 
        {
            alert('There was a problem while trying yo retrieve the documentation.');            
        }
    }

}

function fillDocumentXML(aDiv,httpRequest, DocName)
{
    if (httpRequest.readyState == 4) 
    {
        if (httpRequest.status == 200) 
        {	
        	//insert the documentation in the given div
        	document.getElementById(aDiv).innerHTML = httpRequest.responseText;
			//set the onmouse over and onclick functions to the element
        	var xmlElements = document.getElementById("xml_doc").getElementsByTagName("*");
        	for (var i=0; i < xmlElements.length; i++)
        	{
        		//if is note an element with class codename continue
        		if(xmlElements[i].className != 'codename')
        		{
					continue;
        		}
        		else
        		{
					if(xmlElements[i].id == null || xmlElements[i].id == '')
					{
						xmlElements[i].style.marginLeft = "19px";
					}
        			if(xmlElements[i].innerHTML.substring(0,5) == "&lt;/")
					{
						xmlElements[i].style.marginLeft = "19px";
					}
					//call the get element documentation function
        			xmlElements[i].onclick = function()
					{
						//if is already clicked return
						if(this.className == 'codename clicked')
							return;
						//get the XML Elements
						var xels = document.getElementById("xml_doc").getElementsByTagName("span");
						//for each elemnts check if it has the same xp element to the clicked HMTL element
						for (var z = 0; z < xels.length; z++) 
						{
							if(xels[z].className == 'codename clicked')
							{
								xels[z].className = 'codename';
							}
						}

                        var eleName = this.getAttribute("name");
                        // if its a note/notes or descendant of note. We may have <p/> tags inside
                        if(eleName.indexOf("note")!=-1 || $('note '+eleName+'').length == 1)
                        {
                            $(".cls_notes").show('fast');
                        }
                        else {
                            $(".cls_notes").hide();
                        }

                        /*
                    	//clicking on the 'head notes' has a toggle effect
                        if(eleName.indexOf("note")!=-1) {
                            $(".cls_notes").toggle();
                        });
                        */

						getElementDocumentation(this.getAttribute("name").toString(),this);
						if (this.getAttribute("id") != null) 
						{
							//get the id of the elment discovering if it is start or end element
							var id_variant = this.getAttribute("id").split("@");
							if (id_variant[1] == "s") 
							{
								this.className = 'codename clicked';
								document.getElementById(id_variant[0] + "@e").className = 'codename clicked'
							}
							if (id_variant[1] == "e") 
							{
								this.className = 'codename clicked';
								document.getElementById(id_variant[0] + "@s").className = 'codename clicked'
							}
						}
	        			//else set the event only to the opening tag
    					else
    					{
        					this.className='codename clicked'; 
    					}
        			}
        			xmlElements[i].onmouseover = function()
        			{
        				//if is not an empty element syncronize the close tag 
    					if (this.id != null && this.id != '' && this.className != "codename clicked")
    					{
							//get the id of the elment discovering if it is start or end element
    						var id_variant = this.getAttribute("id").split("@");
	        				if(id_variant[1] == "s")
	        				{
	        					this.className='codename over'; 
	        					document.getElementById(id_variant[0] + "@e").className='codename over'
	        				}
	        				if(id_variant[1] == "e")
	        				{
	        					this.className='codename over'; 
	        					document.getElementById(id_variant[0] + "@s").className='codename over'
	        				}
	        				//set the xp attribute to this element
	        				this.setAttribute("xp",id_variant[0]);
	        			}
    					//else set the event only to the opening tag
    					else if(this.className != "codename clicked")
    					{
        					this.className='codename over'; 
    					}
        			}
        			xmlElements[i].onmouseout = function()
        			{
        				//if is not an empty element syncronize the close tag 
    					if (this.id != null && this.id != '' && this.className != "codename clicked")
    					{
	        				//get the id of the elment discovering if it is start or end element
	        				var id_variant = this.getAttribute("id").split("@");
	        				if(id_variant[1] == "s")
	        				{
	        					this.className='codename'; 
	        					document.getElementById(id_variant[0] + "@e").className='codename'
	        				}
	        				if(id_variant[1] == "e")
	        				{
	        					this.className='codename'; 
	        					document.getElementById(id_variant[0] + "@s").className='codename'
	        				}
	        				//set the xp attribute to this element
	        				this.setAttribute("xp",id_variant[0]);
    					}
    					//else set the event only to the opening tag
    					else if(this.className != "codename clicked")
    					{
        					this.className='codename'; 
    					}
    				}
        		}
        	}		
			//create the outline level select if it is not aready present
			if (document.getElementById("oSelect") == null) 
			{
				//create the label
				var oLabel = document.createElement("label");
				oLabel.appendChild(document.createTextNode("akomantoso XML Representaton Level:"));
				oLabel.className = 'io_label_1';
				//create the select
				var oSelect = document.createElement("span");
				oSelect.innerHTML = '<select id="oSelect"><option value="all" selected="selected">all</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option></select>'
				//set the onchage function to the select
				oSelect.firstChild.onchange = function()
				{			
					document.getElementById("loader_div").style.display = 'block';
					document.getElementById("xml_doc").style.display = 'none';
					var tim = setTimeout("outline('" + document.getElementById("oSelect").value + "')", 500)
					//switch on the loader
					//miniLoaderOutline('on');
	
				}
				//append the outline label to the top tab
				document.getElementById("doc_select").appendChild(oLabel);
				//append the outline select to the top tab
				document.getElementById("doc_select").appendChild(oSelect);
				//set the outline to level 4
				document.getElementById("oSelect").options[4].selected = 'selected';
				outline("4");
                var oDownloadTxt = document.createElement("span");
                oDownloadTxt.setAttribute("id","download_txt");                
                oDownloadTxt.appendChild(document.createTextNode(" download"));	 
                document.getElementById("doc_select").appendChild(oDownloadTxt);				
                var oDownload = document.createElement("a");
                oDownload.setAttribute("id","download_f");
                oDownload.setAttribute("href","#");
                oDownload.setAttribute("title","download this example");
	            document.getElementById("doc_select").appendChild(oDownload);
			}
			else
			{
				//set the outline to level 4
				document.getElementById("oSelect").options[4].selected = 'selected';
				outline("4");			
			}      
     		// set download path
		    document.getElementById("download_f").setAttribute("href","doc/" + DocName + ".xml");			
        } 
        else 
        {
            alert('There was a problem while trying yo retrieve the documentation.');            
        }
    }
}

function inArray(anArray,value)
{
	var i;
	for (i=0; i < anArray.length; i++) 
	{
		//use === to check for Matches. ie., identical (===),	
		if (anArray[i] == value) 
		{
			return true;
		}
	}
	return false;
};

<?php
	/*
		Copyright (c) 2007, Luca Cervone and Fabio Vitali, University of Bologna

		All rights reserved.

		Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

		Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		Neither the name of the University of Bologna nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

		THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
		IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.	
	*/
	//serror_reporting(0);
	print 
"<html>
	<head>
	<title>AKOMA NTOSO URI RESOLVER</title>
	<script type=\"text/javascript\">
		function check()
		{
			if(!confirm(\"Are you sure you want to replace the current configuration with a local setup (all provided Akoma Ntoso URIs will be resolved into a script internal to the resolver, exploding all the pieces of the provided URI)?\"))
				return false;
		}
	</script>
	<STYLE type=\"text/css\">
       	body { 
       		background-color: #CD1006; 
			font-size:10pt;
       	}
       	div#portal-top{
       		background-image: url('http://akn.web.cs.unibo.it/resolver/img/akoma_banner.jpg'); 
       		margin-left:auto;
       		margin-right:auto;
       		width:800px;
       		height:100px;

       	}
       	div#portal-divisor{
       		background-image: url('http://akn.web.cs.unibo.it/resolver/img/image-header.png'); 
       		margin-left:auto;
       		margin-right:auto;
       		width:800px;
       		height:25px;

       	}
       	div#main-container{
       		width:800px;
       		margin-left:auto;
       		margin-right:auto;
			background-color:#ffffff;
       	}
		h1{
			
			text-align:center;
			color:#DC0808;
			font-size:160%;
			font-family:\"Lucida Grande\",Verdana,Lucida,Helvetica,Arial,sans-serif
		}
		p.content{
			margin-left:25px;
			margin-right:25px;
			line-height:1.5em;
			font-family:Arial,Geneva,Helvetica,Helv,sans-serif;
			text-align:justify;
		}
		p.copyright{
			margin-left:25px;
			margin-right:25px;
			text-align:center;
			font-size:10pt;
			color:#7C7C7C;
			margin-top:50px;
			padding-bottom:10px;
		}
		tr{
			font-family:Arial,Geneva,Helvetica,Helv,sans-serif;
			line-height:1.5em;
			text-align:justify;
			font-size:10pt;
		}
		td.bottom{
			padding-bottom:30px;
		}
		th{
			background:#CDC197 none repeat scroll 0%;
			height:1.8em;
			line-height:1.5em;
			font-size:94%;
			padding-top:0.1em;
			text-align:center;
		}
		td.right{
			font-size:10pt;
			margin-top:30px;
		}
		table{
			border: 1px solid #CDC197;
			margin-left:25px;
			margin-right:25px;
			font-size:11pt;
			width:750px;
		}
		a{
			color:#CD1006;
			line-height:1.5em;
			font-size:94%;
		}
    	</STYLE>
    	<title>Akoma Ntoso URI Resolver Configuration</title>
    	<meta name=\"description\" content=\"This site supplies the Akoma Ntoso Uri Resolver. Questo sito fornisce il risolutore di Uri di Akoma Ntoso\">
    	<meta name=\"keywords\" content=\"akoma,ntoso,akomantoso,university,bologna,fabio,vitali,luca,cervone,uri,resolver,risolutore,uri,url,technology,neutral,representations,parliamentary,documents,e-parliament,pan,african,uris,naming,convention\">
    </head>	
    <body>
    <div id=\"portal-top\"></div>
    <div id=\"main-container\"><div id=\"portal-divisor\"></div>";
  
	echo "<h1>Akoma Ntoso URI Resolver Configuration </h1>";
	echo "<p class=\"content\">This resolver generates the URL of a query request to a generic document management system given a URI according to the Akoma Ntoso Naming Convention. You can download the resolver <a class=\"dlink\" href=\"http://akn.web.cs.unibo.it/resolver/Resolver.zip\">here</a>.</p>" ;
	echo '<p class="content">
			The syntax of Akoma Ntoso URI can be found in the official documentation of the <a href="http://www.akomantoso.org/08-naming-convention">Akoma Ntoso Naming Convention (version 1.0 of 1st February 2007).</a>
		   </p>';
	
	if(!isset($_POST['worklevel']) &&
	   !isset($_POST['worklevel']) &&
	   !isset($_POST['worklevel']) &&
	   !isset($_POST['worklevel']) &&
	   !isset($_POST['worklevel']) &&
	   !isset($_POST['worklevel']))
	{
		$file = "default.values";
		$h = fopen($file, "r");
		$c = fread($h, filesize($file));
		
		$values = explode("\n",$c);

		echo '<p class="content">
		   		Please insert the URL corresponding to the FRBR level of choice. 
		   	  </p>';
		
		$wld = explode(" ",$values[0]);
    	echo '<form action="" method="POST"><table><tr><th>Work Level Resolution</th></tr>
    			<tr>
    				<td width=\"100px\">
    					For WORK items, use <tt>$country</tt> for the country placeholder, <tt>$type</tt> for the document type placeholder, <tt>$date</tt> for the date placeholder, <tt>$number</tt> for the number placeholder. Do not use the "$" character for anything but placeholders. 
    				</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" name="worklevel" type="text" value="' . $wld[0] .'" />
    				</td>
    			</tr>
    			<tr>
    				<td align="right" class="bottom">';
    			if ($wld[1] == "[L]")
    			{
    				echo '
						<input type="radio" name="workredirectype" value="[L]" checked="checked"/>Deliver</input>
						<input type="radio" name="workredirectype" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
    				echo '
						<input type="radio" name="workredirectype" value="[L]" />Deliver</input>
						<input type="radio" name="workredirectype" value="[L,R]" checked="checked"/><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    	
		$eld = explode(" ",$values[1]);
    	echo '<tr><th>Expression Level Resolution</th></tr>
    			<tr>
    				<td width=\"100px\">
						For expression items, you can also use <tt>$version</tt> and <tt>$language</tt> for version identifier and language identifier respectively.
    				</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" type="text" name="expressionlevel" value="' . $eld[0] . '" />
    				</td>
    			</tr>
    	 		<tr>
    				<td align="right" class="bottom">';
    			if ($eld[1] == "[L]")
    			{
					echo '
						<input type="radio" name="expressionredirectype" value="[L]" checked="checked"/>Deliver</input>
						<input type="radio" name="expressionredirectype" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
					echo '
						<input type="radio" name="expressionredirectype" value="[L]" />Deliver</input>
						<input type="radio" name="expressionredirectype" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
	
		$ecld = explode(" ",$values[2]);
    	echo '<tr><th>Expression Components Level Resolution</th></tr>
    			<tr>
    				<td width=\"100px\">
						For expression components, you can also specify the slash separated list of components using the <tt>$components</tt> placeholder
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" type="text" name="expressioncomponentslevel" value="' . $ecld[0] .'" />
    				</td>
    			</tr>    	
    			<tr>
    				<td align="right" class="bottom">';
    			if ($ecld[1] == "[L]")
    			{
    				echo '
						<input  name="expressioncomponentsredirectype" type="radio" value="[L]" checked="checked"/>Deliver</input>
						<input  name="expressioncomponentsredirectype" type="radio" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
    				echo '
						<input  name="expressioncomponentsredirectype" type="radio" value="[L]" />Deliver</input>
						<input  name="expressioncomponentsredirectype" type="radio" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}

		$mld = explode(" ",$values[3]);
    	echo '<tr><th>Manifestation Level Resolution</th></tr>
    			<tr>
    				<td width=\"100px\">
						For manifestations, you can also specify the data format using the <tt>$format</tt> placeholder
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" type="text" name="manifestationlevel" value="' .$mld[0]. '" />
    				</td>
    			</tr>
    	 		<tr>
    				<td align="right" class="bottom">';
    			if ($mld[1] == "[L]")
    			{
    				echo'
						<input type="radio" name="manifestationlevelredirecttype" value="[L]" checked="checked"/>Deliver</input>
						<input type="radio" name="manifestationlevelredirecttype" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
    				echo'
						<input type="radio" name="manifestationlevelredirecttype" value="[L]" />Deliver</input>
						<input type="radio" name="manifestationlevelredirecttype" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}

		
		$mcld = explode(" ",$values[4]);
    	echo '<tr><th>Manifestation Components Level Resolution</th></tr>
    			<tr>
    				<td width=\"100px\">
						For manifestation components, you can also specify the local file name with the <tt>$file</tt> placeholder
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" type="text" name="manifestationcomponentslevel" value="' . $mcld[0] . '" />
    				</td>
    			</tr>
       			<tr>
    				<td align="right" class="bottom">';
    			if ($mcld[1] == "[L]")
    			{
    				echo '		
						<input name="manifestationcomponentslevelredirecttype" type="radio" value="[L]" checked="checked"/>Deliver</input>
						<input name="manifestationcomponentslevelredirecttype" type="radio" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
    				echo '		
						<input name="manifestationcomponentslevelredirecttype" type="radio" value="[L]" />Deliver</input>
						<input name="manifestationcomponentslevelredirecttype" type="radio" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
       			}
	
		$old = explode(" ",$values[5]);
    	echo '<tr><th>Ontology Level Resolution</th></tr>
    			<tr>
    				<td width=\"100px\">
						For ontology instances, use the placeholders <tt>$tlc</tt>, <tt>$classes</tt> and <tt>$id</tt> for, respectively, the Top Level Class, the slash separated list of subclasses and the final ID of the instance
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" name="ontologylevel" type="text" value="' . $old[0] . '" />
    				</td>
    			</tr>
      			<tr>
    				<td align="right" class="bottom">';
    			if ($old[1] == "[L]")
    			{
    				echo '
						<input name="ontologylevelredirecttype" type="radio" value="[L]" checked="checked"/>Deliver</input>
						<input name="ontologylevelredirecttype" type="radio" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
    				echo '
						<input name="ontologylevelredirecttype" type="radio" value="[L]" />Deliver</input>
						<input name="ontologylevelredirecttype" type="radio" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}

		$eld = explode(" ",$values[6]);
    	echo '<tr><th>Default/Error Page <span style="color:red">(required field)</span></th></tr>
    			<tr>
    				<td width=\"100px\">
						The URL of the  HTML page/server script which the resolver redirects to in case of unsuccessful resolution. The URL must be written with absolute syntax (http://...) both if it is an internal or an external link
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" name="errorlevel" type="text" value="' . $eld[0] . '" />
    				</td>
    			</tr>
      			<tr>
    				<td align="right" class="bottom">';
    			if ($eld[1] == "[L]")
    			{
    				echo '
						<input name="errorlevelredirecttype" type="radio" value="[L]" checked="checked"/>Deliver</input>
						<input name="errorlevelredirecttype" type="radio" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
    				echo '
						<input name="errorlevelredirecttype" type="radio" value="[L]" />Deliver</input>
						<input name="errorlevelredirecttype" type="radio" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}

    	echo '<tr><th>Location of Configuration File <span style="color:red">(required field)</span></th></tr>
    			<tr>
    				<td width=\"100px\">
						The path of the directory where the configuration file is saved. Make sure that this directory can be written by all.
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" name="rootlevel" type="text" value="' .$values[7]. '" />
    				</td>
    			</tr>';
    			
    	echo '<tr>
    			<td align="center" height="100" valign="bottom">
					<input type="submit" value="Save and Use" />
					<input type="reset" value="Abandon" />
    			</td>
    		  </tr>';    	
		print "</form>";
		print '<tr>
    			<td align="right" valign="bottom">
					<form action="localconfig.php" onsubmit="return check()">
						<input type="submit" value="Local Configuration" />
					</form>
    			</td>
    		  </tr></table>';
		
	}
	else
	{
		//open the configurator
		$filename = "resolver.conf";
		$handle = fopen($filename, "r");
		$contents = fread($handle, filesize($filename));
		fclose($handle);
		
		$newdef = "";
		
		if ($_POST['worklevel'] != "")
		{
			//resolve worklevel
			$worklevel = $_POST['worklevel'];
			$worklevel = str_replace('$country','$1',$worklevel); 
			$worklevel = str_replace('$type','$2',$worklevel); 
			$worklevel = str_replace('$date','$3',$worklevel); 		
			$worklevel = str_replace('$number','$4',$worklevel); 
			$worklevel = $worklevel . " " . $_POST['workredirectype'];
			$contents = str_replace('%workscript%',$worklevel,$contents);
			
			$newdef = $newdef . $_POST['worklevel'] . " " . $_POST['workredirectype'] ."\n";
		}
		else
		{
			$contents = str_replace('%workscript%',$_POST['errorlevel'],$contents);
			$newdef = $newdef . "\n";
		}

		if ($_POST['expressionlevel'] != "")
		{
			//resolve expression level
			$exprlevel = $_POST['expressionlevel'];
			$exprlevel = str_replace('$country','$1',$exprlevel); 
			$exprlevel = str_replace('$type','$2',$exprlevel); 
			$exprlevel = str_replace('$date','$3',$exprlevel); 		
			$exprlevel = str_replace('$number','$4',$exprlevel); 
			$exprlevel = str_replace('$language','$5',$exprlevel); 
			$exprlevel = str_replace('$version','$6',$exprlevel); 
			$exprlevel = $exprlevel . " " . $_POST['expressionredirectype'];
			$contents = str_replace('%expressionscriptn%',$exprlevel,$contents);

			$exprleveln = $_POST['expressionlevel'];
			$exprleveln = str_replace('$country','$1',$exprleveln); 
			$exprleveln = str_replace('$type','$2',$exprleveln); 
			$exprleveln = str_replace('$date','$3',$exprleveln); 		
			$exprleveln = str_replace('$language','$4',$exprleveln); 
			$exprleveln = str_replace('$version','$5',$exprleveln); 
			$exprleveln = str_replace('$number','$7',$exprleveln); 
			$exprleveln = $exprleveln . " " . $_POST['expressionredirectype'];
			$contents = str_replace('%expressionscript%',$exprleveln,$contents);

			$exprlevelne = $_POST['expressionlevel'];
			$exprlevelne = str_replace('$country','$1',$exprlevelne); 
			$exprlevelne = str_replace('$type','$2',$exprlevelne); 
			$exprlevelne = str_replace('$date','$3',$exprlevelne); 		
			$exprlevelne = str_replace('$number','$4',$exprlevelne); 
			$exprlevelne = str_replace('$language','$5',$exprlevelne); 
			$exprlevelne = str_replace('$version','$6',$exprlevelne); 
			$exprlevelne = $exprlevelne . " " . $_POST['expressionredirectype'];
			$contents = str_replace('%expressionscriptne%',$exprlevelne,$contents);

			$exprlevelnev = $_POST['expressionlevel'];
			$exprlevelnev = str_replace('$country','$1',$exprlevelnev); 
			$exprlevelnev = str_replace('$type','$2',$exprlevelnev); 
			$exprlevelnev = str_replace('$date','$3',$exprlevelnev); 		
			$exprlevelnev = str_replace('$language','$4',$exprlevelnev); 
			$exprlevelnev = str_replace('$version','$5',$exprlevelnev); 
			$exprlevelnev = str_replace('$number','$7',$exprlevelnev); 
			$exprlevelnev = $exprlevelnev . " " . $_POST['expressionredirectype'];
			$contents = str_replace('%expressionscriptnev%',$exprlevelnev,$contents);
		
			$newdef = $newdef . $_POST['expressionlevel'] . " " . $_POST['expressionredirectype'] . "\n";

		}
		else
		{
			$contents = str_replace('%expressionscript%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%expressionscriptn%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%expressionscriptne%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%expressionscriptnev%',$_POST['errorlevel'],$contents);

			$newdef = $newdef . "\n";
		}
		
		if($_POST['expressioncomponentslevel'] != "")
		{
			//resolve expression components level
			$exprlevelc = $_POST['expressioncomponentslevel'];
			$exprlevelc = str_replace('$country','$1',$exprlevelc); 
			$exprlevelc = str_replace('$type','$2',$exprlevelc); 
			$exprlevelc = str_replace('$date','$3',$exprlevelc); 		
			$exprlevelc = str_replace('$number','$4',$exprlevelc); 
			$exprlevelc = str_replace('$language','$5',$exprlevelc); 
			$exprlevelc = str_replace('$version','$6',$exprlevelc);
			$exprlevelc = str_replace('$components','$7',$exprlevelc);
			$exprlevelc = $exprlevelc . " " . $_POST['expressioncomponentsredirectype'];
			$contents = str_replace('%expressioncomponentsscriptn%',$exprlevelc,$contents);
			
			$exprlevelcn = $_POST['expressioncomponentslevel'];
			$exprlevelcn = str_replace('$country','$1',$exprlevelcn); 
			$exprlevelcn = str_replace('$type','$2',$exprlevelcn); 
			$exprlevelcn = str_replace('$date','$3',$exprlevelcn); 		
			$exprlevelcn = str_replace('$language','$4',$exprlevelcn); 
			$exprlevelcn = str_replace('$version','$5',$exprlevelcn);
			$exprlevelcn = str_replace('$components','$6',$exprlevelcn);
			$exprlevelcn = str_replace('$number','$7',$exprlevelcn); 
			$exprlevelcn = $exprlevelcn . " " . $_POST['expressioncomponentsredirectype'];
			$contents = str_replace('%expressioncomponentsscript%',$exprlevelcn,$contents);

			$exprlevelcne = $_POST['expressioncomponentslevel'];
			$exprlevelcne = str_replace('$country','$1',$exprlevelcne); 
			$exprlevelcne = str_replace('$type','$2',$exprlevelcne); 
			$exprlevelcne = str_replace('$date','$3',$exprlevelcne); 		
			$exprlevelcne = str_replace('$number','$4',$exprlevelcne); 
			$exprlevelcne = str_replace('$language','$5',$exprlevelcne); 
			$exprlevelcne = str_replace('$components','$6',$exprlevelcne); 
			$exprlevelcne = str_replace('$version','$8',$exprlevelcne); 
			$exprlevelcne = $exprlevelcne . " " . $_POST['expressionredirectype'];
			$contents = str_replace('%expressioncomponentsscriptne%',$exprlevelcne,$contents);

			$exprlevelcnev = $_POST['expressioncomponentslevel'];
			$exprlevelcnev = str_replace('$country','$1',$exprlevelcnev); 
			$exprlevelcnev = str_replace('$type','$2',$exprlevelcnev); 
			$exprlevelcnev = str_replace('$date','$3',$exprlevelcnev); 		
			$exprlevelcnev = str_replace('$language','$4',$exprlevelcnev); 
			$exprlevelcnev = str_replace('$components','$5',$exprlevelcnev); 
			$exprlevelcnev = str_replace('$version','$6',$exprlevelcnev); 
			$exprlevelcnev = str_replace('$number','$7',$exprlevelcnev); 
			$exprlevelcnev = $exprlevelcnev . " " . $_POST['expressionredirectype'];
			$contents = str_replace('%expressioncomponentsscriptnev%',$exprlevelcnev,$contents);
		
			$newdef = $newdef . $_POST['expressioncomponentslevel'] . " " . $_POST['expressionredirectype'] . "\n";
		
		}
		else
		{
			$contents = str_replace('%expressioncomponentsscript%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%expressioncomponentsscriptn%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%expressioncomponentsscriptna%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%expressioncomponentsscriptnav%',$_POST['errorlevel'],$contents);
		
			$newdef = $newdef . "\n";
		}
		
		if($_POST['manifestationlevel'] != "")
		{
			//manifestation level
			$manifestationlevel = $_POST['manifestationlevel'];
			$manifestationlevel = str_replace('$country','$1',$manifestationlevel); 
			$manifestationlevel = str_replace('$type','$2',$manifestationlevel); 
			$manifestationlevel = str_replace('$date','$3',$manifestationlevel); 		
			$manifestationlevel = str_replace('$number','$4',$manifestationlevel); 
			$manifestationlevel = str_replace('$language','$5',$manifestationlevel); 
			$manifestationlevel = str_replace('$version','$6',$manifestationlevel);
			$manifestationlevel = str_replace('$format','$7',$manifestationlevel);
			$manifestationlevel = $manifestationlevel . " " . $_POST['manifestationlevelredirecttype'];
			$contents = str_replace('%manifestationscriptn%',$manifestationlevel,$contents);

			$manifestationleveln = $_POST['manifestationlevel'];
			$manifestationleveln = str_replace('$country','$1',$manifestationleveln); 
			$manifestationleveln = str_replace('$type','$2',$manifestationleveln); 
			$manifestationleveln = str_replace('$date','$3',$manifestationleveln); 		
			$manifestationleveln = str_replace('$number','$9',$manifestationleveln); 
			$manifestationleveln = str_replace('$language','$4',$manifestationleveln); 
			$manifestationleveln = str_replace('$version','$5',$manifestationleveln);
			$manifestationleveln = str_replace('$format','$6',$manifestationleveln);
			$manifestationleveln = $manifestationleveln . " " . $_POST['manifestationlevelredirecttype'];
			$contents = str_replace('%manifestationscript%',$manifestationleveln,$contents);

			//manifestation level
			$manifestationlevelna = $_POST['manifestationlevel'];
			$manifestationlevelna = str_replace('$country','$1',$manifestationlevelna); 
			$manifestationlevelna = str_replace('$type','$2',$manifestationlevelna); 
			$manifestationlevelna = str_replace('$date','$3',$manifestationlevelna); 		
			$manifestationlevelna = str_replace('$number','$4',$manifestationlevelna); 
			$manifestationlevelna = str_replace('$language','$5',$manifestationlevelna); 
			$manifestationlevelna = str_replace('$version','$8',$manifestationlevelna);
			$manifestationlevelna = str_replace('$format','$6',$manifestationlevelna);
			$manifestationlevelna = $manifestationlevelna . " " . $_POST['manifestationlevelredirecttype'];
			$contents = str_replace('%manifestationscriptna%',$manifestationlevelna,$contents);

			$manifestationlevelnav = $_POST['manifestationlevel'];
			$manifestationlevelnav = str_replace('$country','$1',$manifestationlevelnav); 
			$manifestationlevelnav = str_replace('$type','$2',$manifestationlevelnav); 
			$manifestationlevelnav = str_replace('$date','$3',$manifestationlevelnav); 		
			$manifestationlevelnav = str_replace('$number','$9',$manifestationlevelnav); 
			$manifestationlevelnav = str_replace('$language','$4',$manifestationlevelnav); 
			$manifestationlevelnav = str_replace('$version','$8',$manifestationlevelnav);
			$manifestationlevelnav = str_replace('$format','$5',$manifestationlevelnav);
			$manifestationlevelnav = $manifestationlevelnav . " " . $_POST['manifestationlevelredirecttype'];
			$contents = str_replace('%manifestationscriptnav%',$manifestationlevelnav,$contents);
		
			$newdef = $newdef . $_POST['manifestationlevel'] . " " . $_POST['manifestationlevelredirecttype'] . "\n";
		}
		else
		{
			$contents = str_replace('%manifestationscript%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%manifestationscriptn%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%manifestationscriptna%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%manifestationscriptnav%',$_POST['errorlevel'],$contents);

			$newdef = $newdef . "\n";
		}

		if($_POST['manifestationcomponentslevel'] != "")
		{
			//manifestation components level
			$manifestationclevel = $_POST['manifestationcomponentslevel'];
			$manifestationclevel = str_replace('$country','$1',$manifestationclevel); 
			$manifestationclevel = str_replace('$type','$2',$manifestationclevel); 
			$manifestationclevel = str_replace('$date','$3',$manifestationclevel); 		
			$manifestationclevel = str_replace('$number','$4',$manifestationclevel); 
			$manifestationclevel = str_replace('$language','$5',$manifestationclevel); 
			$manifestationclevel = str_replace('$version','$6',$manifestationclevel);
			$manifestationclevel = str_replace('$format','$7',$manifestationclevel);
			$manifestationclevel = str_replace('$file','$8',$manifestationclevel);
			$manifestationclevel = $manifestationclevel . " " . $_POST['manifestationcomponentslevelredirecttype'];
			$contents = str_replace('%manifestationcomponentsscriptn%',$manifestationclevel,$contents);

			$manifestationcnleveln = $_POST['manifestationcomponentslevel'];
			$manifestationcnleveln = str_replace('$country','$1',$manifestationcnleveln); 
			$manifestationcnleveln = str_replace('$type','$2',$manifestationcnleveln); 
			$manifestationcnleveln = str_replace('$date','$3',$manifestationcnleveln); 		
			$manifestationcnleveln = str_replace('$language','$4',$manifestationcnleveln); 
			$manifestationcnleveln = str_replace('$version','$5',$manifestationcnleveln);
			$manifestationcnleveln = str_replace('$format','$6',$manifestationcnleveln);
			$manifestationcnleveln = str_replace('$file','$7',$manifestationcnleveln);
			$manifestationcnleveln = $manifestationcnleveln . " " . $_POST['manifestationcomponentslevelredirecttype'];
			$contents = str_replace('%manifestationcomponentsscript%',$manifestationcnleveln,$contents);

			//manifestation components level
			$manifestationclevelna = $_POST['manifestationcomponentslevel'];
			$manifestationclevelna = str_replace('$country','$1',$manifestationclevelna); 
			$manifestationclevelna = str_replace('$type','$2',$manifestationclevelna); 
			$manifestationclevelna = str_replace('$date','$3',$manifestationclevelna); 		
			$manifestationclevelna = str_replace('$number','$4',$manifestationclevelna); 
			$manifestationclevelna = str_replace('$language','$5',$manifestationclevelna); 
			$manifestationclevelna = str_replace('$version','$6',$manifestationclevelna);
			$manifestationclevelna = str_replace('$format','$7',$manifestationclevelna);
			$manifestationclevelna = str_replace('$file','$8',$manifestationclevelna);
			$manifestationclevelna = $manifestationclevelna . " " . $_POST['manifestationcomponentslevelredirecttype'];
			$contents = str_replace('%manifestationcomponentsscriptn%',$manifestationclevelna,$contents);

			$manifestationcnlevelnav = $_POST['manifestationcomponentslevel'];
			$manifestationcnlevelnav = str_replace('$country','$1',$manifestationcnlevelnav); 
			$manifestationcnlevelnav = str_replace('$type','$2',$manifestationcnlevelnav); 
			$manifestationcnlevelnav = str_replace('$date','$3',$manifestationcnlevelnav); 		
			$manifestationcnlevelnav = str_replace('$language','$4',$manifestationcnlevelnav); 
			$manifestationcnlevelnav = str_replace('$version','$5',$manifestationcnlevelnav);
			$manifestationcnlevelnav = str_replace('$format','$6',$manifestationcnlevelnav);
			$manifestationcnlevelnav = str_replace('$file','$7',$manifestationcnlevelnav);
			$manifestationcnlevelnav = $manifestationcnlevelnav . " " . $_POST['manifestationcomponentslevelredirecttype'];
			$contents = str_replace('%manifestationcomponentsscript%',$manifestationcnlevelnav,$contents);
		
			$newdef = $newdef . $_POST['manifestationcomponentslevel'] . " " . $_POST['manifestationcomponentslevelredirecttype'] . "\n";
		}	
		else
		{
			$contents = str_replace('%manifestationcomponentsscript%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%manifestationcomponentsscriptn%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%manifestationcomponentsscriptna%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%manifestationcomponentsscriptnav%',$_POST['errorlevel'],$contents);

			$newdef = $newdef . "\n";
		}
		
		if($_POST['ontologylevel'] != "")
		{
			$ontologylevels = $_POST['ontologylevel'];
			$ontologylevels = str_replace('$tlc','$2',$ontologylevels); 
			$ontologylevels = str_replace('$id','$3',$ontologylevels); 
			$ontologylevels = str_replace('$classes','$4',$ontologylevels); 		
			$ontologylevels = $ontologylevels . " " . $_POST['ontologylevelredirecttype'];
			$contents = str_replace('%ontologyscriptss%',$ontologylevels,$contents);

			$ontologylevel = $_POST['ontologylevel'];
			$ontologylevel = str_replace('$tlc','$2',$ontologylevel); 
			$ontologylevel = str_replace('$id','$3',$ontologylevel); 
			$ontologylevel = str_replace('$classes','$4',$ontologylevel); 		
			$ontologylevel = $ontologylevel . " " . $_POST['ontologylevelredirecttype'];
			$contents = str_replace('%ontologyscripts%',$ontologylevel,$contents);

			$newdef = $newdef . $_POST['ontologylevel'] . " " . $_POST['ontologylevelredirecttype'] . "\n";
		}
		else
		{
			$contents = str_replace('%ontologyscriptss%',$_POST['errorlevel'],$contents);
			$contents = str_replace('%ontologyscripts%',$_POST['errorlevel'],$contents);

			$newdef = $newdef . "\n";
		}
		
		$errorlevel = $_POST['errorlevel'];
		$errorlevel = $errorlevel . " " . $_POST['errorlevelredirecttype'];
		$contents = str_replace('%errorscript%',$errorlevel,$contents);
		
		$writehandle = fopen($_POST['rootlevel'] . ".htaccess",'w+');
		fwrite($writehandle, $contents);
		
		$newdef = $newdef . $_POST['errorlevel'] . " " . $_POST['errorlevelredirecttype'] . "\n";
		$newdef = $newdef . $_POST['rootlevel'] . "\n";
		$defhandle = fopen("default.values",'w+');
		fwrite($defhandle, $newdef);

	}
	print "<p class=\"copyright\">The present release of the Akoma Ntoso URI resolver, version 1.2 of 22 July 2007, was written by Luca Cervone and Fabio Vitali of the University of Bologna (contact: <a href=\"mailto:fabio@cs.unibo.it\">fabio@cs.unibo.it</a>) and it is released under the <a href=\"http://akn.web.cs.unibo.it/resolver/licence.html\">new BSD licence</A> . The Akoma Ntoso URI Resolver is a configuration file for any Apache installation and is available as an open source application. You can download the application <a href=\"http://akn.web.cs.unibo.it/resolver/Resolver.zip\">here</a>.</p>
	</div>
	</body>";
?>
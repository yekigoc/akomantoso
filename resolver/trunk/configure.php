<?php
	/*
		Copyright (c) 2008, Luca Cervone and Fabio Vitali, University of Bologna

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
	echo "<p class=\"content\">This resolver generates the URL of a query request to a generic document management system given a URI according to the Akoma Ntoso Naming Convention. You can download the resolver <a class=\"dlink\" href=\"http://akn.web.cs.unibo.it/resolver/Resolver13.zip\">here</a>.</p>" ;
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
    					For WORK items, use <tt>$country</tt> for the country placeholder, <tt>$type</tt> for the document type placeholder, <tt>$date</tt> for the date placeholder, <tt>$number</tt> for the number placeholder and <tt>$components</tt> for the components placeholder. Do not use the "$" character for anything but placeholders. 
    					In each level it is possible to use the $uritype placeholder usefull to know the type of the URI that you are trying to resolve.
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
						For expression items, you can also use <tt>$version</tt> and <tt>$language</tt> for version identifier and language identifier respectively. You can also use <tt>$forkingdate</tt> for the forking date placeholder.
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

		$eld = explode(" ",$values[2]);
    	echo '<tr><th>Expression Level Resolution (with forking)</th></tr>
    			<tr>
    				<td width=\"100px\">
						For expression items, you can also use <tt>$version</tt> and <tt>$language</tt> for version identifier and language identifier respectively. You can also use <tt>$forkingdate</tt> for the forking date placeholder.
    				</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" type="text" name="expressionlevelf" value="' . $eld[0] . '" />
    				</td>
    			</tr>
    	 		<tr>
    				<td align="right" class="bottom">';
    			if ($eld[1] == "[L]")
    			{
					echo '
						<input type="radio" name="fexpressionredirectype" value="[L]" checked="checked"/>Deliver</input>
						<input type="radio" name="fexpressionredirectype" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
					echo '
						<input type="radio" name="fexpressionredirectype" value="[L]" />Deliver</input>
						<input type="radio" name="fexpressionredirectype" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
	
		$mld = explode(" ",$values[3]);
    	echo '<tr><th>Manifestation Level Resolution</th></tr>
    			<tr>
    				<td width=\"100px\">
						For manifestations, you can also specify the data format using the <tt>$format</tt>  placeholder. You can also use <tt>$localfilename</tt> for the local file name placeholder.
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

 		$mldf = explode(" ",$values[4]);
   		echo '<tr><th>Manifestation Level Resolution (with forking)</th></tr>
    			<tr>
    				<td width=\"100px\">
						For manifestations with forking you can use <tt>$forkingdate</tt> for the forking date placeholder.
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" type="text" name="manifestationlevelf" value="' .$mldf[0]. '" />
    				</td>
    			</tr>
    	 		<tr>
    				<td align="right" class="bottom">';
    			if ($mldf[1] == "[L]")
    			{
    				echo'
						<input type="radio" name="fmanifestationlevelredirecttype" value="[L]" checked="checked"/>Deliver</input>
						<input type="radio" name="fmanifestationlevelredirecttype" value="[L,R]" /><span style="margin-right:20px">Redirect</span></input>
    				</td>
    			</tr>';
    			}
    			else
    			{
    				echo'
						<input type="radio" name="fmanifestationlevelredirecttype" value="[L]" />Deliver</input>
						<input type="radio" name="fmanifestationlevelredirecttype" value="[L,R]" checked="checked" /><span style="margin-right:20px">Redirect</span></input>
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
    	echo '<tr><th>Excluded Directories</th></tr>
    			<tr>
    				<td width=\"100px\">
						Please insert a comma separated list of directories that must be excluded from the resolution. Only characters are allowed for directory names. Leave blank for none.
					</td>
    			</tr>
    			<tr>
    				<td width=\"100px\" align="center">
						<input size="90" name="exd" type="text" value="' .$values[8]. '" />
    				</td>
    			</tr>';

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
			$worklevel = str_replace('$uritype','$1',$worklevel); 
			$worklevel = str_replace('$country','$2',$worklevel); 
			$worklevel = str_replace('$type','$3',$worklevel); 
			$worklevel = str_replace('$date','$4',$worklevel); 		
			$worklevel = str_replace('$number','$5',$worklevel); 
			$worklevel = str_replace('$components','$6',$worklevel); 
			$worklevel = $worklevel . " " . $_POST['workredirectype'];
			$contents = str_replace('%W%',$worklevel,$contents);
			
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
			$exprlevel = str_replace('$uritype','$1',$exprlevel); 
			$exprlevel = str_replace('$country','$2',$exprlevel); 
			$exprlevel = str_replace('$type','$3',$exprlevel); 
			$exprlevel = str_replace('$date','$4',$exprlevel); 		
			$exprlevel = str_replace('$number','$5',$exprlevel); 
			$exprlevel = str_replace('$language','$6',$exprlevel); 
			$exprlevel = str_replace('$version','$7',$exprlevel); 
			$exprlevel = str_replace('$components','$8',$exprlevel); 
			$exprlevel = $exprlevel . " " . $_POST['expressionredirectype'];
			$contents = str_replace('%E%',$exprlevel,$contents);
			$newdef = $newdef . $_POST['expressionlevel'] . " " . $_POST['expressionredirectype'] . "\n";

		}
		else
		{
			$contents = str_replace('%E%',$_POST['errorlevel'],$contents);
			$newdef = $newdef . "\n";
		}

		if ($_POST['expressionlevelf'] != "")
		{
		
			//resolve expression level
			$exprlevel = $_POST['expressionlevelf'];
			$exprlevel = str_replace('$uritype','$1',$exprlevel); 
			$exprlevel = str_replace('$country','$2',$exprlevel); 
			$exprlevel = str_replace('$type','$3',$exprlevel); 
			$exprlevel = str_replace('$date','$4',$exprlevel); 		
			$exprlevel = str_replace('$number','$5',$exprlevel); 
			$exprlevel = str_replace('$language','$6',$exprlevel); 
			$exprlevel = str_replace('$version','$7',$exprlevel); 
			$exprlevel = str_replace('$forkingdate','$8',$exprlevel); 
			$exprlevel = str_replace('$components','$9',$exprlevel); 
			$exprlevel = $exprlevel . " " . $_POST['fexpressionredirectype'];
			$contents = str_replace('%EF%',$exprlevel,$contents);
		
			$newdef = $newdef . $_POST['expressionlevelf'] . " " . $_POST['fexpressionredirectype'] . "\n";

		}
		else
		{
			$contents = str_replace('%FE%',$_POST['errorlevel'],$contents);
			$newdef = $newdef . "\n";
		}
		
	
		if($_POST['manifestationlevel'] != "")
		{
			//manifestation level
			$manifestationlevel = $_POST['manifestationlevel'];
			$manifestationlevel = str_replace('$uritype','$1',$manifestationlevel); 
			$manifestationlevel = str_replace('$country','$2',$manifestationlevel); 
			$manifestationlevel = str_replace('$type','$3',$manifestationlevel); 
			$manifestationlevel = str_replace('$date','$4',$manifestationlevel); 		
			$manifestationlevel = str_replace('$number','$5',$manifestationlevel); 
			$manifestationlevel = str_replace('$language','$6',$manifestationlevel); 
			$manifestationlevel = str_replace('$version','$7',$manifestationlevel);
			$manifestationlevel = str_replace('$components','$8',$manifestationlevel);
			$manifestationlevel = str_replace('$format','$9',$manifestationlevel);
			$manifestationlevel = str_replace('$localfilename','%5',$manifestationlevel);
			$manifestationlevel = $manifestationlevel . " " . $_POST['manifestationlevelredirecttype'];
			$contents = str_replace('%M%',$manifestationlevel,$contents);

			$manifestationlevelma = $_POST['manifestationlevel'];
			$manifestationlevelma = str_replace('$uritype','$1',$manifestationlevelma); 
			$manifestationlevelma = str_replace('$country','$2',$manifestationlevelma); 
			$manifestationlevelma = str_replace('$type','$3',$manifestationlevelma); 
			$manifestationlevelma = str_replace('$date','$4',$manifestationlevelma); 		
			$manifestationlevelma = str_replace('$number','$5',$manifestationlevelma); 
			$manifestationlevelma = str_replace('$language','$6',$manifestationlevelma); 
			$manifestationlevelma = str_replace('$version','$7',$manifestationlevelma);
			$manifestationlevelma = str_replace('$format','$8',$manifestationlevelma);
			$manifestationlevelma = str_replace('$localfilename','$9',$manifestationlevelma);
			$manifestationlevelma = str_replace('$components','%4',$manifestationlevelma);
			$manifestationlevelma = $manifestationlevelma . " " . $_POST['manifestationlevelredirecttype'];
			$contents = str_replace('%MA%',$manifestationlevelma,$contents);
		
			$newdef = $newdef . $_POST['manifestationlevel'] . " " . $_POST['manifestationlevelredirecttype'] . "\n";
		}
		else
		{
			$contents = str_replace('%M%',$_POST['errorlevel'],$contents);

			$newdef = $newdef . "\n";
		}

		if($_POST['manifestationlevelf'] != "")
		{
			//manifestation level
			$manifestationlevel = $_POST['manifestationlevelf'];
			$manifestationlevel = str_replace('$uritype','$1',$manifestationlevel); 
			$manifestationlevel = str_replace('$country','$2',$manifestationlevel); 
			$manifestationlevel = str_replace('$type','$3',$manifestationlevel); 
			$manifestationlevel = str_replace('$date','$4',$manifestationlevel); 		
			$manifestationlevel = str_replace('$number','$5',$manifestationlevel); 
			$manifestationlevel = str_replace('$language','$6',$manifestationlevel); 
			$manifestationlevel = str_replace('$version','$7',$manifestationlevel);
			$manifestationlevel = str_replace('$forkingdate','$8',$manifestationlevel);
			$manifestationlevel = str_replace('$components','$9',$manifestationlevel);
			$manifestationlevel = str_replace('$format','%4',$manifestationlevel);
			$manifestationlevel = str_replace('$localfilename','%5',$manifestationlevel);
			$manifestationlevel = $manifestationlevel . " " . $_POST['fmanifestationlevelredirecttype'];
			$contents = str_replace('%MF%',$manifestationlevel,$contents);

			$manifestationlevelmaf = $_POST['manifestationlevelf'];
			$manifestationlevelmaf = str_replace('$uritype','$1',$manifestationlevelmaf); 
			$manifestationlevelmaf = str_replace('$country','$2',$manifestationlevelmaf); 
			$manifestationlevelmaf = str_replace('$type','$3',$manifestationlevelmaf); 
			$manifestationlevelmaf = str_replace('$date','$4',$manifestationlevelmaf); 		
			$manifestationlevelmaf = str_replace('$number','$5',$manifestationlevelmaf); 
			$manifestationlevelmaf = str_replace('$language','$6',$manifestationlevelmaf); 
			$manifestationlevelmaf = str_replace('$version','$7',$manifestationlevelmaf);
			$manifestationlevelmaf = str_replace('$forkingdate','$8',$manifestationlevelmaf);
			$manifestationlevelmaf = str_replace('$format','$9',$manifestationlevelmaf);
			$manifestationlevelmaf = str_replace('$localfilename','%3',$manifestationlevelmaf);
			$manifestationlevelmaf = str_replace('$components','%4',$manifestationlevelmaf);
			$manifestationlevelmaf = $manifestationlevelmaf . " " . $_POST['fmanifestationlevelredirecttype'];
			$contents = str_replace('%MAF%',$manifestationlevelmaf,$contents);
		
			$newdef = $newdef . $_POST['manifestationlevelf'] . " " . $_POST['fmanifestationlevelredirecttype'] . "\n";
		}
		else
		{
			$contents = str_replace('%MF%',$_POST['errorlevel'],$contents);

			$newdef = $newdef . "\n";
		}

		if($_POST['ontologylevel'] != "")
		{
			$ontologylevels = $_POST['ontologylevel'];
			$ontologylevels = str_replace('$uritype','$1',$ontologylevels); 
			$ontologylevels = str_replace('$tlc','$2',$ontologylevels); 
			$ontologylevels = str_replace('$id','$3',$ontologylevels); 
			$ontologylevels = str_replace('$subclasses','$4',$ontologylevels); 		
			$ontologylevels = $ontologylevels . " " . $_POST['ontologylevelredirecttype'];
			$contents = str_replace('%O%',$ontologylevels,$contents);

			$newdef = $newdef . $_POST['ontologylevel'] . " " . $_POST['ontologylevelredirecttype'] . "\n";
		}
		else
		{
			$contents = str_replace('%O%',$_POST['errorlevel'],$contents);
			$newdef = $newdef . "\n";
		}
		
		$errorlevel = $_POST['errorlevel'];
		$errorlevel = $errorlevel . " " . $_POST['errorlevelredirecttype'];
		$newdef = $newdef . $_POST['errorlevel'] . " " . $_POST['errorlevelredirecttype'] . "\n";
		$newdef = $newdef . $_POST['rootlevel'] . "\n";
		if (($_POST['exd']) != "")
		{
			$excludeddirstring = "";
			$exds = split(",",$_POST['exd']);
			foreach ($exds as $es)
			{
				if ($es != "")
				{
					$excludeddirstring .= "RewriteCond %{REQUEST_URI} !^/" . $es . "(.*)$\n";
				}
			}
			$contents = str_replace('%EXD%',$excludeddirstring,$contents);

			$newdef = $newdef . $_POST['exd'] . "\n";
		}
		else
		{
			$contents = str_replace('%EXD%',"",$contents);

			$newdef = $newdef . $_POST['exd'] . "\n";
		}
		$contents = str_replace('%ER%',$errorlevel,$contents);
		
		$writehandle = fopen($_POST['rootlevel'] . ".htaccess",'w+');
		fwrite($writehandle, $contents);
		
		$defhandle = fopen("default.values",'w+');
		fwrite($defhandle, $newdef);

	}
	print "<p class=\"copyright\">The present release of the Akoma Ntoso URI resolver, version 1.3 of 9 March 2008, was written by Luca Cervone and Fabio Vitali of the University of Bologna (contact: <a href=\"mailto:fabio@cs.unibo.it\">fabio@cs.unibo.it</a>) and it is released under the <a href=\"http://akn.web.cs.unibo.it/resolver/licence.html\">new BSD licence</A> . The Akoma Ntoso URI Resolver is a configuration file for any Apache installation and is available as an open source application. You can download the application <a href=\"http://akn.web.cs.unibo.it/resolver/Resolver13.zip\">here</a>.</p>
	</div>
	</body>";
?>
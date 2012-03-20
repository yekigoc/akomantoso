<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:akn="http://www.akomantoso.org/1.0"
                version="1.0">
      
<!--
	Copyright (c) 2008, Luca Cervone (cervoneluca@gmail.com)

	All rights reserved.

	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

	Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
	Neither the name of the University of Bologna nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
	IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.	
-->
    <xsl:output method="xml"/>
    
    <xsl:template match="/">
        <div class="xmlcode"> 
            <xsl:apply-templates />
        </div> 
    </xsl:template>
    
        
    <xsl:template match="*">
        <xsl:choose>
            <xsl:when test="count(node())=0">
            	<pre class="c">
	            	<span class="codename" name="{name(.)}">			
			     		<xsl:attribute name="xp">
			    			<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			     		</xsl:attribute>            		
			        	<xsl:text>&lt;</xsl:text>
		                <xsl:value-of select="name(.)" />
		        	    <xsl:apply-templates select="@*" />
		            	<xsl:text>/&gt;</xsl:text>
				    </span>
		        </pre>
            </xsl:when>
            <xsl:otherwise>
           		<xsl:variable name="myid" select="generate-id()" />
				<xsl:variable name="xp">
       				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
 				</xsl:variable>
			    <pre class="c">
					 <span class="expander" onclick="collapse('{$myid}',this)">[ - ] </span>    
                		<span id="{concat($xp,'@s')}" name="{name(.)}" class="codename">
                    		 <xsl:text>&lt;</xsl:text>
                			<xsl:value-of select="name(.)" />
                		<xsl:apply-templates select="@*" />
                		<xsl:text>&gt;</xsl:text>
                	</span>
                </pre>
				<span>
		        	<ul>
		        		<li>
		        			<xsl:apply-templates />
						</li>
					</ul>
		    		<pre class="c">	
							<span id="{concat($xp,'@e')}" name="{name(.)}" class="codename">
	              				<xsl:text>&lt;/</xsl:text>
	                    		<xsl:value-of select="name(.)" />
								<xsl:text>&gt;</xsl:text>
                			</span>
					</pre>
				</span>
			</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="@*">
        <xsl:text> </xsl:text>
        <span class="codeattname"><xsl:value-of select="name(.)" /><xsl:text>=</xsl:text></span>
        <span class="codeattvalue">"<xsl:value-of select="."/>"</span>
    </xsl:template>
    
</xsl:stylesheet>

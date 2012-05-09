<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:akn="http://www.akomantoso.org/2.0" exclude-result-prefixes="akn" version="2.0">
    <xsl:output indent="yes" method="html"/>
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

    <xsl:template match="/">
        
    <xsl:apply-templates/></xsl:template>

    <xsl:template match="akn:*">
        <xsl:apply-templates/>
    	<xsl:apply-templates select="div"/>
    </xsl:template>

    <xsl:template match="text()">
       <xsl:value-of select="normalize-space(.)"/>
    </xsl:template> 

	<xsl:template match="*[@class='sup']">
		<sup>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:apply-templates/>
        </sup>
		
	</xsl:template>

	<xsl:template match="akn:akomaNtoso">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">main_container akomantoso</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:act">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">act_container act</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:bill">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">bill_container bill</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:doc">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">doc_container doc</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:report">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">report_container report</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:debateRecord">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">debaterecord_container debaterecord</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:judgement">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">judgment_container judgment</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:preface">
		<div>
 			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">preface_container preface</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:preamble">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">preamble_container preamble</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:conclusions">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">conclusion_container conclusions</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:header">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">header_container header</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:attachments">
		<xsl:variable name="xpval">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
		</xsl:variable>
		<div class="attachments">
			<xsl:attribute name="xp">
				<xsl:value-of select="$xpval"/>
    			<!--	<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>-->
			</xsl:attribute>			
            ATTACHMENTS:
			<ul>
    			<xsl:attribute name="xp">
					<xsl:value-of select="$xpval"/>
    				<!--	<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>-->
				</xsl:attribute>			
            	<xsl:attribute name="class">attachments_container attachments</xsl:attribute>
 	    		<xsl:apply-templates />
       		</ul>
		</div>	
	</xsl:template>

	<xsl:template match="akn:attachment">
		    <xsl:variable name="xpvalo">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:variable>
		<li>
			<xsl:attribute name="xp">
				<xsl:value-of select="$xpvalo"/>
    			<!--	<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>-->
			</xsl:attribute>			
			<a>
				<xsl:attribute name="xp">
					<xsl:value-of select="$xpvalo"/>
    				<!--	<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>-->
				</xsl:attribute>			
				<xsl:attribute name="class">attachment attachment</xsl:attribute>
				<xsl:attribute name="target">_blank</xsl:attribute>
				<xsl:if test="@href">
					<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
				</xsl:if>
            	<xsl:value-of select="@showAs"/>
	        </a>
		</li>
	</xsl:template>

	<xsl:template match="akn:body">
		<xsl:if test="count(//akn:sidenote) = 0">
			<div class="bodyWithoutSidenotes">
				<xsl:attribute name="xp">
					<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
				</xsl:attribute>			
	            <xsl:apply-templates/>
	        </div>
		</xsl:if>		
		<xsl:if test="count(//akn:sidenote) > 0">
			<div class="bodyWithSidenotes">
				<xsl:attribute name="xp">
					<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
				</xsl:attribute>			
	    		<xsl:apply-templates/>
	        </div>
		</xsl:if>		
	</xsl:template>

	<xsl:template match="akn:debate">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">debate_container debate</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:mainContent">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">maincontent_container maincontent</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:judgementBody">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">judgmentBody_container judgmentBody</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:section">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy section</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:part">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy part</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:paragraph">
		<ol class="numera-para">
			<!--find the members of the list, assuming one item per member-->
			<xsl:for-each select="node()">
				<xsl:if test="node()">
					<li>
						<xsl:attribute name="xp">
							<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
						</xsl:attribute>			
						<xsl:attribute name="class">hierarchy paragraph</xsl:attribute>
						<xsl:if test="@id">
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
						</xsl:if>
						
						<xsl:apply-templates select="."/>
					</li>					
				</xsl:if>
			</xsl:for-each>
		</ol>		
		<!--div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy paragraph</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div-->
		
	</xsl:template>

	<xsl:template match="akn:chapter">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy chapter</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:title">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy title</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:book">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy book</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:tome">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy tome</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:article">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy article</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:clause">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy clause</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:subsection">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy subsection</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:subpart">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy subpart</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:subparagraph">
		<div>
			<ul class="unordereds">
				<!--find the members of the list, assuming one item per member-->
				<xsl:for-each select="node()">
					<xsl:if test="node()">
						<li>
							<xsl:attribute name="xp">
								<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
							</xsl:attribute>			
							<xsl:attribute name="class">hierarchy subparagraph</xsl:attribute>
							<xsl:if test="@id">
								<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
							</xsl:if>
							
							<xsl:apply-templates select="." />
						</li>					
					</xsl:if>
				</xsl:for-each>
			</ul>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:subchapter">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy subchapter</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:subtitle">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy subtitle</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:subclause">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy subclause</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:content">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">heirarchy_content</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>
	
	<xsl:template match="akn:entity">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>	
	
	<xsl:template match="akn:listIntroduction">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>	
	
	<xsl:template match="akn:blockList">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>	
	
	<xsl:template match="akn:affectedDocument">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>
	
	<xsl:template match="akn:amendmentBody">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>		
	
	<xsl:template match="akn:amendmentHeading">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>
	
	<xsl:template match="akn:amendmentContent">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>
	
	<xsl:template match="akn:amendmentJustification">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>	
	
	<xsl:template match="akn:amendmentReference">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>
	
	<xsl:template match="akn:point">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
	</xsl:template>	
	
	<xsl:template match="akn:interstitial">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>	
	
	<xsl:template match="akn:collectionContent">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>		
	
	<xsl:template match="akn:documentCollection">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>		
	
	<xsl:template match="akn:paragraph">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>	
	
	<xsl:template match="akn:caption">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">heirarchy_content</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>	

	<xsl:template match="akn:num">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy_num num</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:heading">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy_heading heading <xsl:value-of select="@class"/></xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:subheading">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy_subheading subheading</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:sidenote">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy_sidenote sidenote</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>


	<xsl:template match="akn:from">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speec_from from</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:administrationOfOath">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy AdministrationOfOath</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:declarationOfVote">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy DeclarationOfVote</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:communication">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy Communication</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:petitions">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy Petitions</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:papers">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy Papers</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:noticesOfMotion">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy NoticesOfMotion</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:questions">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy Questions</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:address">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy Address</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:proceduralMotions">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy ProceduralMotions</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:pointOfOrder">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy PointOfOrder</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:subdivision">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech_hierarchy subdivision</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:speech">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech speech</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:question">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech question</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:answer">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech answer</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:other">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech other</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:scene">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">speech comment</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:list">
		<ol>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy list</xsl:attribute>
 
            <xsl:apply-templates/>
        </ol>
		
	</xsl:template>

	<xsl:template match="akn:introduction">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">judgment_part introduction</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:background">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">judgment_part background</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:motivation">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">judgment_part motivation</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:decision">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">judgment_part decision</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:tblock">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">generic_block tblock</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<!--xsl:template match="akn:item">
		<li>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">hierarchy item</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </li>
		
	</xsl:template-->
	
	<xsl:template match="akn:item">
		<xsl:choose>
			<xsl:when test="contains(akn:num/text(), '1.')">
				<ol class="numeration">
					<xsl:attribute name="xp">
						<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
					</xsl:attribute>					
					<!--find the members of the list, assuming one item per member-->
					<xsl:for-each select="node()">
						<xsl:if test="node()">
							<li>
								<xsl:attribute name="xp">
									<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
								</xsl:attribute>			
								<xsl:attribute name="class">hierarchy item</xsl:attribute>
								<xsl:if test="@id">
									<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
								</xsl:if>								
								<xsl:apply-templates select="."/>
							</li>					
						</xsl:if>
					</xsl:for-each>
				</ol>
			</xsl:when>
			<xsl:otherwise>
				<ul class="unordereds">
					<xsl:attribute name="xp">
						<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
					</xsl:attribute>					
					<!--find the members of the list, assuming one item per member-->
					<xsl:for-each select="node()">
						<xsl:if test="node()">
							<li>
								<xsl:attribute name="xp">
									<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
								</xsl:attribute>			
								<xsl:attribute name="class">hierarchy item</xsl:attribute>
								<xsl:if test="@id">
									<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
								</xsl:if>								
								<xsl:apply-templates select="."/>
							</li>					
						</xsl:if>
					</xsl:for-each>
				</ul>
			</xsl:otherwise>
		</xsl:choose>		
		<!--start the list-->
		<!--ul class="unordereds">
			<xsl:for-each select="node()">
				<xsl:if test="node()">
					<li>
						<xsl:apply-templates select="."/>
					</li>					
				</xsl:if>
			</xsl:for-each>
		</ul-->
	</xsl:template>	

	<xsl:template match="akn:toc">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">toc</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:tocItem">
		<p>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">tocitem</xsl:attribute>
			<xsl:if test="@href">
				<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </p>
		
	</xsl:template>

	<xsl:template match="akn:docType">
		<xsl:text> </xsl:text>
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta ActType</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="akn:docTitle">
		<xsl:text> </xsl:text>
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta ActTitle</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="akn:docNumber">
		<xsl:text> </xsl:text>
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta ActNumber</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="akn:docProponent">
		<xsl:text> </xsl:text>
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta ActProponent</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="akn:docDate">
		<xsl:text> </xsl:text>
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta ActDate</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="akn:docPurpose">
		<xsl:text> </xsl:text>
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta ActPurpose</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="akn:judgementType">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta judgmentType</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:judgementTitle">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta judgmentTitle</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:judgementNumber">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta judgmentNumber</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:courtType">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta courtType</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:neutralCitation">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta neutralCitation</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:party">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta party</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:judge">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta judge</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:judgementDate">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">inline_meta judgmentDate</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:mref">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">reference_container mref</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:ref">
		<xsl:text> </xsl:text>
		<a>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">ref</xsl:attribute>
            <xsl:attribute name="ondblclick">
		<!--		<xsl:if test="@href">
						<xsl:if test="substring(@href,1,1) = '#'">
							<xsl:attribute name="href">
								<xsl:value-of select="@href"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="substring(@href,1,1) != '#'">
							<xsl:attribute name="href">
								<xsl:value-of select="concat('http://akn.web.cs.unibo.it',@href)"/>
							</xsl:attribute>
							<xsl:attribute name="target">_blank</xsl:attribute>
						</xsl:if>
						</xsl:if> -->
            	goTo('<xsl:value-of select="@href"/>');
            </xsl:attribute>			
			<xsl:apply-templates/>
        </a>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="akn:rref">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">reference_container rref</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:mod">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">modification</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:mmod">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">modification_container mmod</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:rmod">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">modification_container rmod</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:quotedText">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">quoted quotedText</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:quotedStructure">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">quoted quotedStructure</xsl:attribute>
 
            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:def">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">def</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:ins">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">ins</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:del">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">del</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:omissis">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">omissis</xsl:attribute>
 
		(...)	
        </span>
		
	</xsl:template>

	<xsl:template match="akn:noteRef">
		<!--<a>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">ref noteref</xsl:attribute>
			<xsl:if test="@href">
				<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </a>-->
		
	</xsl:template>

	<xsl:template match="akn:recordedTime">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">recorderedTime</xsl:attribute>
 
            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:eol">
		<br>
            <xsl:attribute name="class">eol</xsl:attribute>
 			<xsl:apply-templates/>
        </br>
	</xsl:template>

	<xsl:template match="akn:eop">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:hcontainer">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">generic_hierarchy hcontainer</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:container">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">generic_container container</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:block">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">generic_block block</xsl:attribute>
			<xsl:if test="@name">
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:inline">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">generic_inline inline </xsl:attribute>
			<xsl:if test="@name">
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:marker">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">generic_marker marker</xsl:attribute>
			<xsl:if test="@name">
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:foreign">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">foreign_elements foreign</xsl:attribute>
			<xsl:if test="@name">
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:div">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_container div</xsl:attribute>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </div>
		
	</xsl:template>

	<xsl:template match="akn:p">
		<p>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_paragraph p <xsl:value-of select="@class"/></xsl:attribute>
 
            <xsl:apply-templates/>
        </p>
		
	</xsl:template>

	<xsl:template match="akn:li">
		<li>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_list_item li</xsl:attribute>
 
            <xsl:apply-templates/>
        </li>
		
	</xsl:template>

	<xsl:template match="akn:span">
		<span>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_inline span <xsl:value-of select="@class"/></xsl:attribute>
			<xsl:if test="@name">
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </span>
		
	</xsl:template>

	<xsl:template match="akn:b">
		<b>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_bold b</xsl:attribute>
			<xsl:apply-templates/>
        </b>&#160;
	</xsl:template>

	<xsl:template match="akn:i">
		<i>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_italic i</xsl:attribute>
 
            <xsl:apply-templates/>
        </i>
		
	</xsl:template>

	<xsl:template match="akn:a">
		<a>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_anchor a</xsl:attribute>
			<xsl:if test="@href">
				<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </a>
		
	</xsl:template>

	<xsl:template match="akn:img">
		<img>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_img img</xsl:attribute>
			<xsl:if test="@src">
				<xsl:attribute name="src"><xsl:value-of select="concat('../images/',translate(@src,'/','_'))"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </img>
		
	</xsl:template>

	<xsl:template match="akn:ul">
		<ul>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_unordered_list ul</xsl:attribute>
 
            <xsl:apply-templates/>
        </ul>
		
	</xsl:template>

	<xsl:template match="akn:ol">
		<ol>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_ordered_list ol</xsl:attribute>
 
            <xsl:apply-templates/>
        </ol>
		
	</xsl:template>

	<xsl:template match="akn:table">
		<table>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_table table</xsl:attribute>
			<xsl:if test="@border">
				<xsl:attribute name="border"><xsl:value-of select="@border"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@cellspacing">
				<xsl:attribute name="cellspacing"><xsl:value-of select="@cellspacing"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@cellpadding">
				<xsl:attribute name="cellpadding"><xsl:value-of select="@cellpadding"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </table>
		
	</xsl:template>

	<xsl:template match="akn:tr">
		<tr>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_table_row tr</xsl:attribute>
 
            <xsl:apply-templates/>
        </tr>
		
	</xsl:template>

	<xsl:template match="akn:th">
		<th>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_table_heading_column th</xsl:attribute>
			<xsl:if test="@colspan">
				<xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@rowspan">
				<xsl:attribute name="rowspan"><xsl:value-of select="@rowspan"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </th>
		
	</xsl:template>

	<xsl:template match="akn:td">
		<td>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
            <xsl:attribute name="class">html_table_column td</xsl:attribute>
			<xsl:if test="@colspan">
				<xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@rowspan">
				<xsl:attribute name="rowspan"><xsl:value-of select="@rowspan"/></xsl:attribute>
			</xsl:if>

            <xsl:apply-templates/>
        </td>
		
	</xsl:template>

	<xsl:template match="akn:meta">
		<div id="layer-meta">
			<xsl:attribute name="style">background-color: transparent !important;</xsl:attribute>
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>

	<xsl:template match="akn:identification">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:FRBRWork">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:FRBRExpression">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:FRBRManifestation">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:FRBRItem">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:this">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:uri">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:alias">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:date">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:author">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:components">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:component">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:preservation">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:publication">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:classification">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:keyword">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:lifecycle">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:event">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:workflow">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:action">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:analysis">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:activeModifications">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:passiveModifications">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:textualMod">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:meaningMod">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:scopeMod">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:forceMod">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:efficacyMod">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:legalSystemMod">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:source">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:destination">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:force">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:efficacy">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:application">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:duration">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:condition">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:old">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:new">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:domain">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:references">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:original">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:passiveRef">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:activeRef">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:jurisprudence">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:hasAttachment">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:attachmentOf">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCPerson">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCOrganization">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCConcept">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCObject">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCEvent">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCPlace">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCProcess">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCRole">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCTerm">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:TLCReference">
		<xsl:apply-templates/>
		
	</xsl:template>

	<xsl:template match="akn:notes">
		<div>		
			<div>		
				<xsl:attribute name="xp">
					<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
				</xsl:attribute>				
				<xsl:attribute name="class">rounded-eigh notes-title</xsl:attribute>	
				<xsl:attribute name="id">head_id</xsl:attribute>				
				head notes <xsl:value-of select="@source"/>
			</div>
			<div id="layer_notes" style="display:none;">
				<xsl:attribute name="xp">
					<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
				</xsl:attribute>
				<xsl:attribute name="class">cls_notes</xsl:attribute>				
				<xsl:apply-templates/>
			</div>
		</div>
		
	</xsl:template>

	<xsl:template match="akn:note">
		<div>
			<xsl:attribute name="xp">
				<xsl:for-each select="ancestor-or-self::node()"><xsl:value-of select="concat(name(),count(preceding::*))" />/</xsl:for-each>
			</xsl:attribute>			
			<xsl:attribute name="class">note_container note</xsl:attribute>
			
			<xsl:apply-templates/>
		</div>
		
	</xsl:template>

	<xsl:template match="akn:proprietary">
		<xsl:apply-templates/>
		
	</xsl:template>


</xsl:stylesheet>
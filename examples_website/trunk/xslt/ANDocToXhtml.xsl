<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ANdoc="http://www.akomantoso.org/doc/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="1.0">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
    <xsl:param name="element" />
    <xsl:param name="type" />
    
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
        <xsl:apply-templates select="//ANdoc:elementDoc[@name=$element]" />
    </xsl:template>

    <xsl:template match="ANdoc:technical">
		<xsl:param name="doctype" />
		<xsl:if test="$type='technical'">
	       <!-- <h2 id="{../@id}">
	            Technical Documentation 
	        </h2> -->
	        <div class="technical">
	            <xsl:apply-templates />
	        </div>
		</xsl:if>
    </xsl:template>
    
    <xsl:template name="oxygendoc">
        <xsl:param name="oxygen_fragments" />
        <xsl:apply-templates select="$oxygen_fragments" mode="oxygen_fragments" />
    </xsl:template>
    
    <xsl:template match="xhtml:*" mode="oxygen_fragments">
        <xsl:element name="{local-name(.)}">
            <xsl:for-each select="@*">
                <xsl:attribute name="{name(.)}">
                    <xsl:choose>
                        <xsl:when test="name(.) = 'href'">
                            <xsl:variable name="attvalue" select="." />
                            <xsl:variable name="attribute_element_type" select="substring-before(substring-after($attvalue, '_'), '_')" />
                            <xsl:variable name="attribute_element_name" select="substring-before(substring-after(substring-after($attvalue, '_'), '_'), '.')" />
                            <xsl:choose>
                                <xsl:when test="$attribute_element_type = 'element'">
                                    <xsl:value-of select="concat(document('ANDocumentation.xml')//ANdoc:elementDoc[@name=$attribute_element_name]/@id, '.html')"></xsl:value-of>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat(document('ANDocumentation.xml')//*[@name=$attribute_element_name]/@id, '.html')"></xsl:value-of>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="." />
                        </xsl:otherwise>   
                    </xsl:choose>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates mode="oxygen_fragments"/>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="ANdoc:semantical">
	 	<xsl:if test="$type='semantical'">
	        <xsl:choose>
	            <xsl:when test="not(.//*/text())">
	            </xsl:when>
	            <xsl:otherwise>
	            <!--    <h2 id="{@id}">
	                    Semantical Documentation
	                </h2> -->
	                <div class="semantical">
	                    <xsl:apply-templates />
	                </div>
	            </xsl:otherwise>
	        </xsl:choose>
		</xsl:if>
	</xsl:template>
    
    <xsl:template match="ANdoc:simpleTypeDoc">
        <h1 id="{@id}"><xsl:value-of select="@name" /> - Symple Type </h1>
        <xsl:choose>
            <xsl:when test="@name = 'status' or @name='Version'">
                <xsl:apply-templates>
                    <xsl:with-param name="doctype">none</xsl:with-param>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates>
                    <xsl:with-param name="doctype">type</xsl:with-param>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
        
      </xsl:template>
    
    <xsl:template match="ANdoc:complexTypeDoc">
        <h1 id="{@id}"><xsl:value-of select="@name" /> - Complex Type</h1>
        <xsl:choose>
            <xsl:when test="@name = 'quotedStructure' or @name='li'">
                <xsl:apply-templates>
                    <xsl:with-param name="doctype">none</xsl:with-param>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates>
                    <xsl:with-param name="doctype">type</xsl:with-param>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
       
       </xsl:template>

    <xsl:template match="ANdoc:elementDoc">
        <h1 id="{@id}"><xsl:value-of select="@name" /></h1>
        <xsl:apply-templates>
            <xsl:with-param name="doctype">element</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="ANdoc:attributeDoc">
        <h1 id="{@id}"><xsl:value-of select="@name" /> - Attribute</h1>
        <xsl:apply-templates>
            <xsl:with-param name="doctype">none</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="ANdoc:elmGroupDoc">
        <h1 id="{@id}"><xsl:value-of select="@name" /> - Element Group</h1>
        <xsl:apply-templates>
            <xsl:with-param name="doctype">group</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="ANdoc:attGroupDoc">
        <h1 id="{@id}"><xsl:value-of select="@name" /> - Attribute Group</h1>
        <xsl:apply-templates>
            <xsl:with-param name="doctype">attributeGroup</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="ANdoc:patterns">
        <xsl:if test="not(name(../../.) = 'ANdoc:elementDoc')">
            <h3>Pattern</h3>
            <xsl:for-each select="ANdoc:pattern">
                <xsl:variable name="patternName" select="@value" />
                <xsl:copy-of select="//ANdoc:glossaryDef[@id=$patternName]" />
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

   
    <xsl:template match="ANdoc:description">
        <h3>Description</h3>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="ANdoc:context">
        <h3>Context</h3>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="ANdoc:validExample">
<!--        <h3>Valid Examples</h3>
        <xsl:apply-templates /> -->
    </xsl:template>

    <xsl:template match="ANdoc:invalidExample">
<!--        <h3>Invalid Example</h3>
        <xsl:apply-templates /> -->
    </xsl:template> 

    <xsl:template match="ANdoc:downstreamBehavior">
        <h3>Downstream Behavior</h3>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="ANdoc:role">
        <h3>Role</h3>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="ANdoc:purpose">
        <h3>Purpose</h3>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="ANdoc:usecase">
        <h3>Use case</h3>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="ANdoc:correctExample">
        <h3>Correct Example</h3>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="ANdoc:incorrectExample">
        <h3>Incorrect Example</h3>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="xhtml:div[@class='sample box' or @class='schemaComponent box']">
        <h3>Oxygen Documentation</h3>
        <div class="oxygendoc">
        </div>    
    </xsl:template>
    
    <xsl:template match="ANdoc:references">
        <xsl:if test="ancestor::ANdoc:complexTypeDoc">
            <h3>Used by</h3>
        </xsl:if>
        <xsl:if test="ancestor::ANdoc:simpleTypeDoc">
            <h3>Used by</h3>
        </xsl:if>
        <xsl:if test="ancestor::ANdoc:elementDoc">
            <h3>See also</h3>
        </xsl:if>
        <xsl:if test="ancestor::ANdoc:attributeDoc">
            <h3>See also</h3>
        </xsl:if>
        <xsl:if test="ancestor::ANdoc:elmGroupDoc">
            <h3>Components</h3>
        </xsl:if>
        <xsl:if test="ancestor::ANdoc:attGroupDoc">
            <h3>Components</h3>
        </xsl:if>
        <ul>
            <xsl:for-each select="ANdoc:internal_reference">
                <xsl:sort select="@href" data-type="text" order="ascending" />
                <xsl:variable name="ref" select="@href" />
                <li>
                    <a href="{concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/',substring(//*[@id=$ref]/@name,1,1),'/',//*[@id=$ref]/@name)}" target="_blank">
                        <xsl:value-of select="//ANdoc:*[@id=$ref]/@name" />
                    </a>
                </li>
            </xsl:for-each>
        </ul>
        <xsl:apply-templates />
    </xsl:template>

<!--    <xsl:template match="ANdoc:images">
        <xsl:for-each select="ANdoc:img">
            <xsl:variable name="ref" select="@src" />
            <h4><xsl:value-of select="@title" /></h4>
            <div class="imgcontainer">
                <a class="image" href="images/{@src}"><img src="images/{@src}" /></a>
            </div>
        </xsl:for-each>
        <xsl:apply-templates />
    </xsl:template> -->

    <xsl:template match="xhtml:*">
        <xsl:element name="{local-name(.)}">
            <xsl:for-each select="@*">
            	<xsl:if test="not(name(.)='href')">
	                <xsl:attribute name="{name(.)}">
	                    <xsl:value-of select="." />
	                </xsl:attribute>
				</xsl:if>
				<xsl:if test="name(.)='href'">
				    <xsl:attribute name="{name(.)}">
				        <xsl:variable name="pointed" select="substring-before(substring-after(.,'/'),'.')" />
						<xsl:value-of select="concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/',substring(//*[@id=$pointed]/@name,1,1),'/',//*[@id=$pointed]/@name)" />
	                </xsl:attribute>
				</xsl:if>
            </xsl:for-each>
			<xsl:if test="not(@href='')">
			 	<xsl:attribute name="target">_blank</xsl:attribute>
			</xsl:if>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:div[@class='xmlcode']">
        <pre class="xmlcode">
            <xsl:apply-templates mode="xmlcode"/>
        </pre>
    </xsl:template>
        
    <xsl:template match="*" mode="xmlcode">
        <xsl:choose>
            <xsl:when test="count(node())=0"> 
                <span class="codetag"><xsl:text>&lt;</xsl:text>
                <xsl:value-of select="name(.)" /></span>
                <xsl:apply-templates select="@*" mode="xmlcode"/>
                <span class="codetag"><xsl:text>/&gt;</xsl:text></span>
            </xsl:when>
            <xsl:otherwise>
                <span class="codetag"> <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="name(.)" /></span>
                <xsl:apply-templates select="@*" mode="xmlcode"/>
                <span class="codetag"><xsl:text>&gt;</xsl:text></span>
                <xsl:apply-templates mode="xmlcode"/>
                <span class="codetag"><xsl:text>&lt;/</xsl:text></span>
                <span class="codetag"><xsl:value-of select="name(.)" /></span>
                <span class="codetag"> <xsl:text>&gt;</xsl:text></span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="@*" mode="xmlcode">
        <xsl:text> </xsl:text>
        <span class="codeattname"><xsl:value-of select="name(.)" /></span>
        <span class="codeattname"><xsl:text>=</xsl:text></span><span class="codeattvalue"><xsl:text>"</xsl:text></span>
        <span class="codeattvalue"><xsl:value-of select="."/></span>
        <span class="codeattvalue"><xsl:text>"</xsl:text></span>
    </xsl:template>

    <xsl:template match="@*" mode="import-list-recursive">
        <xsl:variable name="findr" select="." />
        <xsl:for-each select="//*[@id=$findr]//ANdoc:internal_reference">
            <xsl:if test="not(position()=last())">
                <xsl:variable name="pointed" select="@href" />
                <xsl:if test="not(name(//*[@id=$pointed]) = 'ANdoc:elmGroupDoc') and not(name(//*[@id=$pointed]) = 'ANdoc:attGroupDoc')">
                   <!-- <a href="./{@href}.html"><xsl:value-of select="//*[@id=$pointed]/@name" /></a>,-->     
                   <a href="{concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/',substring(//*[@id=$pointed]/@name,1,1),'/',//*[@id=$pointed]/@name)}" target="_blank"><xsl:value-of select="//*[@id=$pointed]/@name" /></a>,     
                </xsl:if>
                <xsl:if test="name(//*[@id=$pointed]) = 'ANdoc:elmGroupDoc'">
                    <xsl:variable name="next-pointed" select="//*[@id=$pointed]/@id"/>
                    <xsl:apply-templates select="$next-pointed" mode="import-list-recursive"/>, 
                </xsl:if>
                <xsl:if test="name(//*[@id=$pointed]) = 'ANdoc:attGroupDoc'">
                    <xsl:variable name="next-pointed" select="//*[@id=$pointed]/@id"/>
                    <xsl:apply-templates select="$next-pointed" mode="import-list-recursive"/>, 
                </xsl:if>
            </xsl:if>
            <xsl:if test="position()=last()">
                <xsl:variable name="pointed" select="@href" />
                <xsl:if test="not(name(//*[@id=$pointed]) = 'ANdoc:elmGroupDoc') and not(name(//*[@id=$pointed]) = 'ANdoc:attGroupDoc')">
                    <a href="{concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/',substring(//*[@id=$pointed]/@name,1,1),'/',//*[@id=$pointed]/@name)}" target="_blank"><xsl:value-of select="//*[@id=$pointed]/@name" /></a>    
                </xsl:if>
                <xsl:if test="name(//*[@id=$pointed]) = 'ANdoc:elmGroupDoc'">
                    <xsl:variable name="next-pointed" select="//*[@id=$pointed]/@id"/>
                    <xsl:apply-templates select="$next-pointed" mode="import-list-recursive"/>
                </xsl:if>
                <xsl:if test="name(//*[@id=$pointed]) = 'ANdoc:attGroupDoc'">
                    <xsl:variable name="next-pointed" select="//*[@id=$pointed]/@id"/>
                    <xsl:apply-templates select="$next-pointed" mode="import-list-recursive"/> 
                </xsl:if>
            </xsl:if>   
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="@*" mode="import-list-no-recursive">
        <xsl:variable name="findnor" select="." />
        <xsl:for-each select="//*[@id=$findnor]//ANdoc:internal_reference">
            <xsl:if test="not(position()=last())">
                <xsl:variable name="pointed" select="@href" />
                <a href="./{@href}.html"><xsl:value-of select="//*[@id=$pointed]/@name" /></a>,     
            </xsl:if>
            <xsl:if test="position()=last()">
                <xsl:variable name="pointed" select="@href" />
                <a href="./{@href}.html"><xsl:value-of select="//*[@id=$pointed]/@name" /></a>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="xhtml:import-list">
        <xsl:if test="@recursive='false'">
            <xsl:apply-templates select="@href" mode="import-list-no-recursive"/> 
        </xsl:if>     
        <xsl:if test="@recursive='true'">
            <xsl:apply-templates select="@href" mode="import-list-recursive"/>
        </xsl:if>     
    </xsl:template>
    
    <xsl:template match="ANdoc:glossary"> </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:an="http://www.akomantoso.org/2.0">
    
    <!-- identity transform -->
    <xsl:template match="@*|*|processing-instruction()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- match annotation -->
    <xsl:template match="xsd:annotation">
        <xsl:copy><xsl:apply-templates /></xsl:copy>
    </xsl:template>
    
    <!-- match documentation - we render it without the other tags -->
    <xsl:template match="xsd:documentation">
       <xsl:copy>
       <xsl:choose>
           <xsl:when test="an:name">
               <xsl:value-of select="an:name"/>
               <xsl:text>(</xsl:text>
               <xsl:value-of select="an:type"/>
               <xsl:text>) :</xsl:text>
               <xsl:value-of select="an:comment" />
           </xsl:when>
           <xsl:otherwise>
               <xsl:value-of select="." />
           </xsl:otherwise>
       </xsl:choose>
       </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
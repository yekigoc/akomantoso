<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://www.akomantoso.org/1.0">
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/|*|text()|@*|comment()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="xsd:documentation/comment()">
		<xsl:variable name="comment-pieces" select="tokenize(., '\s*\n\s*', 'm')"/>
		<xsl:variable name="comment-offsets" select="index-of($comment-pieces, '*')"/>
		<xsl:variable name="comment" select="subsequence($comment-pieces, $comment-offsets[count($comment-offsets)] + 1)"/>
		<xsl:variable name="comment-regex" select="'\s*\*\s*'"/>
		<xsl:if test="string-length($comment[1]) > 0">
			<type>
				<xsl:value-of select="replace(replace($comment-pieces[4], 'Entity', ''), $comment-regex, '')"/>
			</type>
			<name>
				<xsl:value-of select="replace($comment-pieces[6], $comment-regex, '')"/>
			</name>
			<comment>
				<xsl:value-of select="replace(string-join($comment, ''), $comment-regex, '')"/>
			</comment>
		</xsl:if>
	</xsl:template>

	<xsl:template match="xsd:annotation|xsd:documentation" name="uno">
		<xsl:variable name="content">
			<xsl:apply-templates/>
		</xsl:variable>
		<xsl:if test="normalize-space($content) ne ''">
			<xsl:copy>
				<xsl:copy-of select="$content"/>
			</xsl:copy>
		</xsl:if>
	</xsl:template>

	<xsl:template match="xsd:element[not(xsd:annotation) and following-sibling::*[1][name()='xsd:annotation']]">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="following-sibling::*[1]" mode="internal"/>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="xsd:annotation[preceding-sibling::*[1][name()='xsd:element']]" mode="internal">
		<xsl:call-template name="uno"/>
	</xsl:template>
	<xsl:template match="xsd:annotation[preceding-sibling::*[1][name()='xsd:element']]"/>

	<xsl:template match="xsd:any">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="processContents">lax</xsl:attribute>
			<xsl:attribute name="minOccurs">0</xsl:attribute>
			<xsl:attribute name="maxOccurs">unbounded</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="xsd:import[@namespace=&quot;http://www.w3.org/XML/1998/namespace&quot;]">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="schemaLocation">http://www.w3.org/2001/xml.xsd</xsl:attribute>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:param name="outside"> none </xsl:param>
	
	<xsl:variable name="inside">
		<xsl:if test="contains($outside,'optionalCore')"> advancedRefs  advancedMetadata  advancedPreface  toc  tblock  semantic  publishing  delimiters  html  table  generic  additionalGeneric outOfLine popup</xsl:if>
		<xsl:if test="contains($outside,'optionalLegislation')"> modifications civilLaw optHierarchy additionalHierarchy</xsl:if>
		<xsl:if test="contains($outside,'Docs')"> someDocs </xsl:if>
		<xsl:if test="contains($outside,'legislativeDocs') or contains($outside,'judgementDocs')"> analysis </xsl:if>
		<xsl:if test="contains($outside,'legislativeDocs') and contains($outside,'judgementDocs')"> bothAnalysis </xsl:if>
		<xsl:if test="not(contains($outside,'act')) and not(contains($outside,'bill'))"> bill act bothLegislative </xsl:if>
		<xsl:if test="contains($outside,'act') and contains($outside,'bill')"> bothLegislative </xsl:if>
		<xsl:value-of select="$outside"/>
	</xsl:variable>
	
	<xsl:variable name="selected-modules" select="concat($outside,$inside)"/>
	<xsl:variable name="want-complete-schema" select="contains($outside, 'complete')"/>
	<xsl:variable name="newline"><xsl:text xml:space="preserve">&#10;</xsl:text></xsl:variable>
	<xsl:variable name="tab"><xsl:text xml:space="preserve">&#9;</xsl:text></xsl:variable>

	<xsl:template match="report">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="@version"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		
		<xsl:choose>
			<xsl:when test="not($want-complete-schema)">
				<xsl:value-of select="$tab"/>
				<xsl:text>Automatically generated modular subversion from the full schema.</xsl:text>
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$tab"/>
				<xsl:text>Current subversion contains the following modules:</xsl:text>
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="$outside"/> <!-- FIXME: $selected-modules? -->
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$tab"/>
				<xsl:text>Please consult http://www.akomantoso.org/subversions for more information.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$tab"/>
				<xsl:text>Complete version.</xsl:text>
				<xsl:value-of select="$newline"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="comment()">&lt;!--<xsl:value-of select="."/>--&gt;</xsl:template>
	
	<xsl:template match="modular">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="include[@v]">
		<xsl:if test="contains($selected-modules,@if) or $want-complete-schema">
			<xsl:value-of select="@v"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="include">
		<xsl:if test="contains($selected-modules,@if) or $want-complete-schema">
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>

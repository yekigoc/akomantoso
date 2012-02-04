<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:h="http://www.w3.org/1999/xhtml"
                              xmlns="http://www.w3.org/1999/xhtml">
	<xsl:param name="debug" select="false()"/>
	
	<xsl:param name="default-modules">core</xsl:param>
	<xsl:param name="hide">analysis bothAnalysis</xsl:param>
	
	<xsl:param name="generator-version">FIXME(generator version)</xsl:param>
	<xsl:param name="generator-version-date">FIXME(generator version date)</xsl:param>
	<xsl:param name="generator-download-uri">FIXME(akn-subschema-gen download uri)</xsl:param>
	
	<xsl:variable name="schema" select="//schema-xml"/>
	<xsl:variable name="html" select="//template-html"/>
	
	<xsl:variable name="schema-version" select="concat($schema//report/@version, ' (Beta)')"/>

	<xsl:template match="/">
		<xsl:apply-templates select="$html/h:html"/>
	</xsl:template>
		
	<xsl:template match="h:span[@id = 'schema-version']/text()">
		<xsl:value-of select="$schema-version"/>
	</xsl:template>
	
	<xsl:template match="h:span[@id = 'generator-version']/text()">
		<xsl:value-of select="$generator-version"/>
	</xsl:template>
	
	<xsl:template match="h:span[@id = 'generator-version-date']/text()">
		<xsl:value-of select="$generator-version-date"/>
	</xsl:template>
	
	<xsl:template match="h:a[@id = 'download-link']">
		<xsl:element name="a">
			<xsl:attribute name="href" select="$generator-download-uri"/>
			<xsl:value-of select="./text()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="h:span[@id = 'core-modules-checkboxes']">
		<xsl:call-template name="input">
			<xsl:with-param name="if">core</xsl:with-param>
			<xsl:with-param name="label">Required elements of the schema</xsl:with-param>
			<xsl:with-param name="content" select="$schema//include[not(@if) or (@if='core')]"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="h:span[@id = 'document-modules-checkboxes']">
		<xsl:for-each-group select="$schema//include[matches(@if,'Docs')]" group-by="@if">
			<xsl:call-template name="input"/>
		</xsl:for-each-group>
	</xsl:template>
	
	<xsl:template match="h:span[@id = 'document-combos']">
		<xsl:apply-templates select="$schema//combo"/>
	</xsl:template>

	<xsl:template name="input">
		<xsl:param name="if" select="@if"/>
		<xsl:param name="label" select="current-group()/@label"/>
		<xsl:param name="content" select="current-group()"/>
		
		<xsl:variable name='input-id' select="concat('check-', $if)"/>
		<div class="basic">
			<p class="item">
				<input type="checkbox" name="modules[]" value="{$if}" id="{$input-id}" class="input {@dependsOn}">
					<xsl:if test="matches($if,$default-modules)">
						<xsl:attribute name="checked">checked</xsl:attribute>
						<xsl:attribute name="disabled">disabled</xsl:attribute>
					</xsl:if>
				</input>
				<xsl:text> </xsl:text>
				<label for="{$input-id}">
					<xsl:value-of select="$label"/>
					<xsl:text> </xsl:text>
					<span class="moduleName"> (code: <xsl:value-of select="$if"/>)</span>
				</label>
			</p>
			<ul class="description" id="desc-{$if}">
				<xsl:apply-templates select="$content/@desc"/>
			</ul>
		</div>
		<div>
			<xsl:if test="$if != 'core'">
				<xsl:attribute name="class">subModules</xsl:attribute>
			</xsl:if>
			<xsl:for-each-group select="$schema//include[@dependsOn=$if]" group-by="@if">
				<xsl:call-template name="input"/>
			</xsl:for-each-group>
		</div>
	</xsl:template>
	
	<xsl:template match="h:td[@id = 'debug-orphans']">
		<xsl:choose>
			<xsl:when test="$debug">
				<xsl:call-template name="orphans"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template name="orphans">
		<tr>
			<th colspan="2">Orphaned Modules</th>
		</tr>
		<tr>
			<td colspan="2">
				<ul class="orphans">
					<xsl:for-each-group select="$schema//include" group-by="@if">
						<xsl:if test="not(matches($hide, @if)) and not(current-group()/@desc) and not(current-group()/@label)">
							<li>
								<xsl:value-of select="@if"/>
							</li>
						</xsl:if>
					</xsl:for-each-group>
				</ul>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="combo"> 
		<xsl:variable name="content" select="@content"/>
		<div class="basic">
			<p class="item">
				<input type="radio" name="combos[]" value="{$content}" id="combo-{@id}" class="combo"/>
				<xsl:text> </xsl:text>
				<label for="combo-{@id}">
					<xsl:value-of select="@name"/>
					<xsl:text> </xsl:text>
					<span class="desc"> <xsl:value-of select="@desc"/> </span>
				</label>
			</p>
			<div class="description" id="desc-{@id}">
					<p>The combination '<xsl:value-of select="@name"/>' contains the following modules:</p>
					<ul>
				<xsl:for-each select="$schema//include[@label and (contains($content,'complete') or contains($content,@if))]">
					<li><xsl:value-of select="@label"/> <span class="moduleName"> (<xsl:value-of select="@if"/>)</span></li>
				</xsl:for-each>
					</ul>
			</div>
		</div>
	</xsl:template>


	<xsl:template match="@desc">
		<xsl:element name="li">
			<xsl:analyze-string select="." regex="\$(\w+)">
				<xsl:matching-substring>
					<xsl:element name="span">
						<xsl:attribute name="class">elementName</xsl:attribute>
						<xsl:value-of select="regex-group(1)"/>
					</xsl:element>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:value-of select="."/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>

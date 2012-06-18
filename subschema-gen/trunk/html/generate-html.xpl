<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                version="1.0"
                name="subschema-generator-form-generation">
	<p:input port="source">
		<p:inline>
			<input>
				<template-html>
					<xi:include href="template.html"/>
				</template-html>
				<schema-xml>
					<xi:include href="../akn-schema/akomantoso20.dpp.xml"/>
				</schema-xml>
			</input>
		</p:inline>
	</p:input>
	
	<p:xinclude name="combine-inputs"/>
	
	<p:xslt name="generate-version-params">
		<p:input port="source">
			<p:document href="../version-info.xml"/>
		</p:input>
		<p:input port="stylesheet">
			<p:inline>
				<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
					<xsl:template match="/version-info">
						<c:param-set>
							<xsl:for-each select="./*">
								<c:param  name="generator-{./name()}" value="{.}"/>
							</xsl:for-each>
						</c:param-set>
					</xsl:template>
				</xsl:stylesheet>
			</p:inline>
		</p:input>
		<p:input port="parameters"><p:empty/></p:input>
	</p:xslt>
	 
	<p:xslt name="generate-form-html">
		<p:input port="source">
			<p:pipe step="combine-inputs" port="result"/>
		</p:input>
		<p:input port="stylesheet">
			<p:document href="form-generator.xsl"/>
		</p:input>
		<p:input port="parameters">
			<p:pipe step="generate-version-params" port="result"/>
		</p:input>
	</p:xslt>
	
	<p:store name="save-form-html" href="aknssg.html">
		<p:input port="source">
			<p:pipe step="generate-form-html" port="result"/>
		</p:input>
		<p:with-option name="indent" select="false()"/> <!-- FIXME: why indentation does not suppress excess whitespace? -->
		<p:with-option name="method" select="'xhtml'"/>
		<p:with-option name="omit-xml-declaration" select="true()"/>
		<p:with-option name="doctype-system" select="'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'"/>
		<p:with-option name="doctype-public" select="'-//W3C//DTD XHTML 1.0 Transitional//EN'"/>
	</p:store>
</p:declare-step>

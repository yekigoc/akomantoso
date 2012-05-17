<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:cx="http://xmlcalabash.com/ns/extensions"
                xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
                xmlns:aknssg="aknssg"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                name="subschema-generation">
	<p:input port="parameters" kind="parameter"/>
	
	<p:option name="tmp-dir-path" required="true"/>
	<p:option name="schema-name" required="true"/>
	
	<p:import href="../support/xproc/calabash-steps-library-1.0.xpl"/>
	<p:import href="../support/xproc/calabash-fileutils.xpl"/>
	<p:import href="aknssg-steps-library.xpl"/>
	
	<p:variable name="schema-dir-path" select="concat($tmp-dir-path, '/', $schema-name)"/>
	<p:variable name="zip-path" select="concat($schema-dir-path, '.zip')"/>
	
	<p:variable name="dpp-file-path" select="concat($schema-dir-path, '/', $schema-name, '.dpp')"/>
	<p:variable name="xsd-file-path" select="concat($schema-dir-path, '/', $schema-name, '.xsd')"/>
	<p:variable name="dtd-file-path" select="concat($schema-dir-path, '/', $schema-name, '.dtd')"/>
	<p:variable name="pst_dtd-file-path" select="concat($schema-dir-path, '/', 'pst.dtd')"/>
	
	<p:variable name="converter-args" select="'-jar ../support/lib/PreValidator2v20061107.jar'"/>
	<p:variable name="xsd-args" select="concat($converter-args, ' -dppdoc -schema ', $xsd-file-path, ' ', $dpp-file-path)"/>
	<p:variable name="dtd-args" select="concat($converter-args, ' -v -dtd ', $dtd-file-path, ' ', $dpp-file-path)"/>
	
	<p:group name="create-directories">
		<cxf:mkdir name="create-tmp-directory">
			<p:with-option name="href" select="$tmp-dir-path"/>
		</cxf:mkdir>
		
		<cxf:mkdir name="create-schema-directory">
			<p:with-option name="href" select="$schema-dir-path"/>
		</cxf:mkdir>
	</p:group>
	
	<p:store name="save-html-form-parameters" cx:depends-on="create-directories">
		<p:input port="source">
			<p:pipe step="subschema-generation" port="parameters"/>
		</p:input>
		<p:with-option name="href" select="concat($schema-dir-path, '/', 'html-form-parameters.out')"/>
		<p:with-option name="indent" select="'true'"/>
	</p:store>
	
	<!-- The following step is a workaround for XProc's inability to deal
	     with pure text inputs. See <http://lists.w3.org/Archives/Public/xproc-dev/2010Feb/0015.html>. -->
	<p:identity name="adapted-module-xsl">
		<p:input port="source">
			<p:inline>
				<xsl:stylesheet version="2.0">
					<xsl:import href="extract-subschema.xsl"/>
					<xsl:template match="/">
						<data>
							<xsl:apply-imports/>
						</data>
					</xsl:template>
				</xsl:stylesheet>
			</p:inline>
		</p:input>
	</p:identity>
	
	<p:xslt name="generate-subschema-dpp" cx:depends-on="create-directories">
		<p:input port="source">
			<p:document href="../akn-schema/akomantoso20.dpp.xml"/>
		</p:input>
		<p:input port="stylesheet">
			<p:pipe step="adapted-module-xsl" port="result"/>
		</p:input>
		<p:input port="parameters">
			<p:pipe step="subschema-generation" port="parameters"/>
		</p:input>
	</p:xslt>
	
	<p:store name="save-subschema-dpp" method="text">
		<p:input port="source" select="/data">
			<p:pipe step="generate-subschema-dpp" port="result"/>
		</p:input>
		<p:with-option name="href" select="$dpp-file-path"/>
	</p:store>
	
	<p:group name="convert-to-xsd">
		<p:output port="result">
			<p:pipe step="save-xsd" port="result"/>
		</p:output>
		
		<aknssg:exec-conversion name="convert-to-raw-xsd">
			<p:input port="source">
				<p:pipe step="save-subschema-dpp" port="result"/>
			</p:input>
			<p:with-option name="args" select="$xsd-args"/>
			<p:with-option name="type" select="'xsd'"/>
			<p:with-option name="schema-dir-path" select="$schema-dir-path"/>
		</aknssg:exec-conversion>
		
		<p:load name="load-raw-xsd-file" cx:depends-on="convert-to-xsd">
			<p:with-option name="href" select="$xsd-file-path"/>
		</p:load>
		
		<p:xslt name="fix-xsd-documentation">
			<p:input port="source">
				<p:pipe step="load-raw-xsd-file" port="result"/>
			</p:input>
			<p:input port="stylesheet">
				<p:document href="fix-xsd-documentation.xsl"/>
			</p:input>
			<p:input port="parameters"><p:empty/></p:input>
		</p:xslt>
		
		<p:store name="save-xsd">
			<p:input port="source">
				<p:pipe step="fix-xsd-documentation" port="result"/>
			</p:input>
			<p:with-option name="href" select="$xsd-file-path"/>
		</p:store>
	</p:group>
	
	<p:group name="convert-to-dtd">
		<p:output port="result">
			<p:pipe step="copy-pst_dtd" port="result"/>
		</p:output>
		
		<aknssg:exec-conversion name="convert-to-main-dtd">
			<p:input port="source">
				<p:pipe step="save-subschema-dpp" port="result"/>
			</p:input>
			<p:with-option name="args" select="$dtd-args"/>
			<p:with-option name="type" select="'dtd'"/>
			<p:with-option name="schema-dir-path" select="$schema-dir-path"/>
		</aknssg:exec-conversion>
		
		<!-- FIXME: let PreValidator generate it -->
		<cxf:copy name="copy-pst_dtd">
			<p:with-option name="href" select="'../support/pst.dtd'"/>
			<p:with-option name="target" select="$pst_dtd-file-path"/>
		</cxf:copy>
	</p:group>
	
	<p:sink name="all-files-converted">
		<p:input port="source">
			<p:pipe step="convert-to-xsd" port="result"/>
			<p:pipe step="convert-to-dtd" port="result"/>
		</p:input>
	</p:sink>
	
	<aknssg:create-zip-manifest name="create-zip-manifest">
		<p:input port="files">
			<p:inline><c:entry name="akn.dpp"/></p:inline>
			<p:inline><c:entry name="akn.xsd"/></p:inline>
			<p:inline><c:entry name="akn.dtd"/></p:inline>
			<p:inline><c:entry name="xml.xsd"/></p:inline>
			<p:inline><c:entry name="pst.dtd"/></p:inline>
		</p:input>
		<p:with-option name="schema-name" select="$schema-name"/>
		<p:with-option name="schema-dir-path" select="$schema-dir-path"/>
	</aknssg:create-zip-manifest>
	
	<cx:zip name="create-zip-archive" cx:depends-on="all-files-converted">
		<p:input port="source"><p:empty/></p:input>
		<p:input port="manifest">
			<p:pipe step="create-zip-manifest" port="manifest"/>
		</p:input>
		<p:with-option name="href" select="$zip-path"/>
		<p:with-option name="command" select="'create'"/>
	</cx:zip>
	
	<p:sink/>
</p:declare-step>

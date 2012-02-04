<?xml version="1.0" encoding="UTF-8"?>
<p:library xmlns:p="http://www.w3.org/ns/xproc"
           xmlns:c="http://www.w3.org/ns/xproc-step"
           xmlns:cx="http://xmlcalabash.com/ns/extensions"
           xmlns:aknssg="aknssg"
           version="1.0">
	<p:declare-step type="aknssg:exec-conversion">
		<p:input port="source"/>
		
		<p:option name="args" required="true"/>
		<p:option name="type" required="true"/> <!-- 'dtd' | 'xsd' -->
		<p:option name="schema-dir-path" required="true"/>
		
		<p:exec name="run-conversion-tool">
			<p:with-option name="command" select="'/usr/bin/java'"/>
			<p:with-option name="args" select="$args"/>
			<p:with-option name="source-is-xml" select="'false'"/>
			<p:with-option name="result-is-xml" select="'false'"/>
		</p:exec>
		
		<p:wrap-sequence name="wrap-conversion-output">
			<p:input port="source">
				<p:pipe step="run-conversion-tool" port="result"/>
				<p:pipe step="run-conversion-tool" port="errors"/>
			</p:input>
			<p:with-option name="wrapper" select="'output'"/>
		</p:wrap-sequence>
		
		<p:store name="save-conversion-errors">
			<p:input port="source">
				<p:pipe step="wrap-conversion-output" port="result"/>
			</p:input>
			<p:with-option name="href" select="concat($schema-dir-path, '/', 'conversion-errors-', $type, '.out')"/>
		</p:store>
		
		<p:choose name="stop-on-failure">
			<p:xpath-context>
				<p:pipe step="run-conversion-tool" port="exit-status"/>
			</p:xpath-context>
			<p:when test="number(/c:result) != 0">
				<p:error code="aknssg:exec-failure">
					<p:input port="source">
						<p:pipe port="result" step="save-conversion-errors"/>
					</p:input>
				</p:error>
				<p:sink/>
			</p:when>
			<p:otherwise>
				<p:sink>
					<p:input port="source"><p:empty/></p:input>
				</p:sink>
			</p:otherwise>
		</p:choose>
	</p:declare-step>
	
	<p:declare-step type="aknssg:create-zip-manifest">
		<p:input port="files" sequence="true"/>
		<p:output port="manifest"/>
		
		<p:option name="schema-name" required="true"/>
		<p:option name="schema-dir-path" required="true"/>
		
		<p:for-each>
			<p:group>
				<p:variable name="raw-name" select="/c:entry/@name"/>
				<p:variable name="file-ext" select="substring-after($raw-name, '.')"/>
				<p:variable name="file-name" select="if (starts-with($raw-name, 'akn')) then concat($schema-name, '.', $file-ext) else $raw-name"/>
				
				<p:variable name="file-path" select="concat($schema-dir-path, '/', $file-name)"/>
				<p:variable name="path-in-zip" select="concat($schema-name, '/', $file-name)"/>
				
				<p:add-attribute match="/c:entry">
					<p:with-option name="attribute-name" select="'href'"/>
					<p:with-option name="attribute-value" select="$file-path"/>
				</p:add-attribute>
				
				<p:add-attribute match="/c:entry">
					<p:with-option name="attribute-name" select="'name'"/>
					<p:with-option name="attribute-value" select="$path-in-zip"/>
				</p:add-attribute>
			</p:group>
		</p:for-each>
		
		<p:wrap-sequence wrapper="c:zip-manifest"/>
	</p:declare-step>
</p:library>

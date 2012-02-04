<p:library xmlns:p="http://www.w3.org/ns/xproc"
	xmlns:cx="http://xmlcalabash.com/ns/extensions"
	xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
	xmlns:ml="http://xmlcalabash.com/ns/extensions/marklogic"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	version="1.0">
	
	<p:declare-step type="cxf:copy">
		<p:output port="result" primary="false"/>
		<p:option name="href" required="true"/>                       <!-- anyURI -->
		<p:option name="target" required="true"/>                     <!-- boolean -->
		<p:option name="fail-on-error" select="'true'"/>              <!-- boolean -->
	</p:declare-step>
	
	<p:declare-step type="cxf:mkdir">
		<p:output port="result" primary="false"/>
		<p:option name="href" required="true"/>                       <!-- anyURI -->
		<p:option name="fail-on-error" select="'true'"/>              <!-- boolean -->
	</p:declare-step>
	
	<p:declare-step type="cxf:tempfile">
		<p:output port="result" primary="false"/>
		<p:option name="href" required="true"/>                       <!-- anyURI -->
		<p:option name="prefix"/>                                     <!-- string -->
		<p:option name="suffix"/>                                     <!-- string -->
		<p:option name="delete-on-exit"/>                             <!-- boolean -->
		<p:option name="fail-on-error" select="'true'"/>              <!-- boolean -->
	</p:declare-step>
</p:library>

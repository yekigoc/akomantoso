<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:h="http://www.w3.org/1999/xhtml" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="h:html">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="h:head"> </xsl:template>

    <xsl:template match="h:hr"> </xsl:template>

    <xsl:template match="h:p[@class='footer']"> </xsl:template>

    <xsl:template match="h:h1"> </xsl:template>

    <xsl:template match="h:h3"> </xsl:template>
    
    <xsl:template match="h:h4"> </xsl:template>

    <xsl:template match="h:body">
        <div class="documentation">
            <h1><xsl:value-of select="//h:h3/h:a"/></h1>
            <div class="technical">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="h:*">
        <xsl:element name="{name(.)}">
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name(.)='href'">
                        <xsl:attribute name="target">_blank</xsl:attribute>
                        <xsl:if test="ancestor-or-self::h:td[@class='documentation']">
                            <xsl:attribute name="href">
                                <xsl:value-of
                                    select="concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/technical-documentation/',substring(substring-after(substring-before(.,'.html'),'/'),1,1), '/' , substring-after(substring-before(.,'.html'),'/'), '.html')"
                                />
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="not(ancestor-or-self::h:td[@class='documentation'])">
                            <xsl:attribute name="href">
                                <xsl:variable name="attvalue" select="."/>
                                <xsl:variable name="attribute_element_type"
                                    select="substring-before(substring-after(substring-after($attvalue, '_'),'_'), '_')"/>
                                <xsl:variable name="attribute_element_name"
                                    select="substring-before(substring-after(substring-after(substring-after($attvalue, '_'), '_'), '_'), '.')"/>
                                <xsl:value-of select="$attribute_element_type"/>{}
                                <xsl:choose>
                                    <xsl:when test="$attribute_element_type = 'element'">
                                        <xsl:value-of
                                            select="concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/technical-documentation/',substring($attribute_element_name,1,1) , '/' ,$attribute_element_name, 'E.html')"
                                        />
                                    </xsl:when>
                                    <xsl:when test="$attribute_element_type = 'attributeGroup'">
                                        <xsl:value-of
                                            select="concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/technical-documentation/',substring($attribute_element_name,1,1) , '/' ,$attribute_element_name, 'AG.html')"
                                        />
                                    </xsl:when>
                                    <xsl:when test="$attribute_element_type = 'group'">
                                        <xsl:value-of
                                            select="concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/technical-documentation/',substring($attribute_element_name,1,1) , '/' ,$attribute_element_name, 'EG.html')"
                                        />
                                    </xsl:when>
                                    <xsl:when test="$attribute_element_type = 'type'">
                                        <xsl:value-of
                                            select="concat('http://schemadocs.akomantoso.org/listing/alphabetical-listing/technical-documentation/',$attribute_element_name, 'CT.html')"
                                        />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="{name(.)}">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*">
        <xsl:element name="{name(.)}">
            <xsl:for-each select="@*">
                <xsl:choose>
                    <xsl:when test="name(.)='href'">
                        <xsl:variable name="fragment" select="."/>
                        <xsl:variable name="fragname" select="substring-before($fragment,'.html')"/>
                        <xsl:variable name="extractpoint" select="string-length($fragname)"/>
                        <xsl:attribute name="target">_blank</xsl:attribute>
                        <xsl:attribute name="name"><xsl:value-of select="$fragname"/></xsl:attribute>
                        <xsl:attribute name="onclick">javascript:return false;</xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('php/sidebyside.php?el_documentation=', translate(substring($fragname,1),'ABCDEFGHIJKLMNOPQRSSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')  , '&amp;type=technical')"/>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="{name(.)}">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>

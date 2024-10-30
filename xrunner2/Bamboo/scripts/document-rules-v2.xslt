<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	document-rules-v2.xslt
    # Purpose:  	From the rule data sheet create documentation.
    # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2022- -
    # Copyright:	(c) 2022 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="xml"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <!-- <xsl:output method="text" encoding="utf-8" /> -->
    <xsl:include href="project.xslt"/>
    <xsl:include href="var-string.xslt"/>
    <xsl:param name="viewset"/>
    <xsl:variable name="sfm-var-data" select="doc(f:file2uri(concat($projectpath,'\output\sfm-var.xml')))"/>
    <xsl:variable name="static-var-data" select="doc(f:file2uri(concat($projectpath,'\output\static-var.xml')))"/>
    <xsl:template match="/*">
        <xsl:element name="html">
            <xsl:call-template name="head"/>
            <xsl:element name="body">
                <xsl:element name="h1">
                    <xsl:value-of select="$viewset"/>
                    <xsl:text> error checks documentation.</xsl:text>
                </xsl:element>
                <xsl:element name="h4">
                    <xsl:attribute name="id">
                        <xsl:text>index</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Error Reference Index</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates select="//item[grp = $viewset]" mode="index">
                        <xsl:sort select="Order" data-type="number"/>
                    </xsl:apply-templates>
                </xsl:element>
                <xsl:element name="h4">
                    <xsl:attribute name="id">
                        <xsl:text>index2</xsl:text>
                    </xsl:attribute>
                    <xsl:text>SFM Index</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index2</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates select="//item[grp = $viewset]" mode="index2">
                    </xsl:apply-templates>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index3</xsl:text>
                    </xsl:attribute>
                    <h3 id="static-index">Static string variables</h3>
                    <xsl:apply-templates select="$static-var-data//item" mode="index3">
                        <xsl:sort select="Order"/>
                    </xsl:apply-templates>
                </xsl:element>
                <xsl:element name="h2">Rules</xsl:element>
                <xsl:apply-templates select="/*/*"/>
                <xsl:element name="h2"><a href="#static-index">Static</a> string variables</xsl:element>
                <xsl:apply-templates select="$static-var-data//item" mode="static"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="item" mode="index">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:text>#err</xsl:text>
                <xsl:value-of select="Ref"/>
            </xsl:attribute>
            <xsl:value-of select="Ref"/>
        </xsl:element>
        <xsl:text>&#x2003;</xsl:text>
    </xsl:template>
    <xsl:template match="*[name() = $usxdata]" mode="index2">
        <xsl:choose>
            <xsl:when test="string-length(@style) gt 0">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:text>#sfm-</xsl:text>
                        <xsl:value-of select="@style"/>
                    </xsl:attribute>
                    <xsl:value-of select="@style"/>
                </xsl:element>
                <xsl:text>&#x2003;</xsl:text>
            </xsl:when>
            <xsl:when test="name() = 'table'">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:text>#sfm-</xsl:text>
                        <xsl:value-of select="'tr'"/>
                    </xsl:attribute>
                    <xsl:value-of select="'tr'"/>
                </xsl:element>
                <xsl:text>&#x2003;</xsl:text>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="*[name() = 'item']" mode="index3">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:text>#static-</xsl:text>
                <xsl:value-of select="name"/>
            </xsl:attribute>
            <xsl:value-of select="name"/>
        </xsl:element>
        <xsl:text>&#x2003;</xsl:text>
    </xsl:template>
    <xsl:template match="*[name() = $usxelem]">
        <xsl:element name="div">
            <xsl:element name="h3">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:text>#index2</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>sfm-</xsl:text>
                        <xsl:value-of select="@style"/>
                    </xsl:attribute>
                    <xsl:value-of select="concat(if (string-length(@style) != 0) then concat('\',@style,' in ') else '','USX element ',name())"/>
                </xsl:element>
            </xsl:element>
            <xsl:apply-templates select="*"/>
            <xsl:if test="string-length(@style) != 0">
                <xsl:element name="h4">\<xsl:value-of select="@style"/> variables</xsl:element>
            </xsl:if>
            <xsl:apply-templates select="$sfm-var-data//item" mode="var">
                <xsl:with-param name="curstyle" select="@style"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="item">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>testrow</xsl:text>
            </xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>h4</xsl:text>
                </xsl:attribute>
                <xsl:text>Check: </xsl:text>
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:text>err</xsl:text>
                        <xsl:value-of select="Ref"/>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>#index</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="Ref"/>
                </xsl:element>
                <xsl:text>&#x2003;Message: </xsl:text>
                <xsl:value-of select="replace(message,'\\\\','\\')"/>
                <xsl:text>&#x2003;Priority: </xsl:text>
                <xsl:value-of select="rank"/>
            </xsl:element>
            <xsl:if test="string-length(note) gt 0">
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="note"/>
                </xsl:element>
            </xsl:if>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>test</xsl:text>
                </xsl:attribute>
                <xsl:text>Test 1: </xsl:text>
                <xsl:value-of select="test"/>
            </xsl:element>
            <xsl:if test="string-length(test2) gt 0">
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>test2</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Test 2: </xsl:text>
                    <xsl:value-of select="test2"/>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    <xsl:template match="@style" mode="style">
        <xsl:value-of select="."/>
        <xsl:text>&#x2002;</xsl:text>
    </xsl:template>
    <xsl:template name="head">
        <head>
            <title>
                <xsl:text>Rule Docs</xsl:text>
            </title>
            <meta charset='utf-8'/>
            <meta name='description' content=''/>
            <link rel="stylesheet" href="{$documentationcss}" type="text/css"/>
            <style type="text/css">
h3 {margin-left:2em}
h4 {margin-left:3em}
.index, .index2, .index3, .h4 {margin-left:4em}
.test, .test2, .note {margin-left:6em}
.testrow {padding-bottom:6pt;}
div.index {padding-bottom:12pt;}
.var {padding-left:4em}
</style>
        </head>
    </xsl:template>
    <xsl:template match="text()"/>
    <xsl:template match="item" mode="var">
        <xsl:param name="curstyle"/>
        <xsl:if test="$curstyle = sfm">
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>var</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="concat(name,'&#x2003;',f:keyvalue($var-string,name)[1])"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    <xsl:template match="item" mode="static">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('static-',name)"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:text>var</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="concat(name,'&#x2003;',value)"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

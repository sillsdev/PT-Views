<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	document-rules.xslt
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
    <xsl:variable name="xml-pre" select="f:file2uri(concat($projectpath,'\output\struc-data.xml'))"/>
    <xsl:variable name="col-name" select="tokenize($data[1],'\t')"/>
    <xsl:variable name="x1">
        <xsl:for-each select="$data[position() gt 1]">
            <xsl:variable name="cell" select="tokenize(.,'\t')"/>
            <xsl:element name="datarow">
                <xsl:for-each select="$cell">
                    <xsl:variable name="pos" select="position()"/>
                    <xsl:element name="{$col-name[number($pos)]}">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="g1">
        <xsl:for-each-group select="$x1/*[not(disable = 'TRUE')]" group-by="element">
            <xsl:sort select="element"/>
            <xsl:element name="elgroup">
                <xsl:attribute name="id">
                    <xsl:value-of select="element[1]"/>
                </xsl:attribute>
                <xsl:for-each-group select="current-group()" group-by="style">
                    <xsl:sort select="style" data-type="number"/>
                    <xsl:element name="{element[1]}">
                        <xsl:attribute name="style">
                            <xsl:value-of select="style[1]"/>
                        </xsl:attribute>
                        <xsl:perform-sort select="current-group()">
                            <xsl:sort select="rank" data-type="number" order="descending"/>
                            <!-- <xsl:copy-of select="current-group()"/> -->
                        </xsl:perform-sort>
                    </xsl:element>
                </xsl:for-each-group>
            </xsl:element>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:template match="/">
        <!-- <xsl:result-document href="{$xml-pre}" format="xml">
            <xsl:element name="data">
                <xsl:copy-of select="$g1"/>
            </xsl:element>
        </xsl:result-document> -->
        <xsl:element name="html">
            <xsl:call-template name="head"/>
            <xsl:element name="body">
                <xsl:element name="h1">
                    <xsl:text>TNDD error checks documentation.</xsl:text>
                </xsl:element>
                <xsl:element name="h4">
                    <xsl:attribute name="id">
                        <xsl:text>index</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Check number Index</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates select="$x1/*" mode="index"/>
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
                    <xsl:apply-templates select="$g1/*/*" mode="index2">
                        <xsl:sort select="@style"/>
                    </xsl:apply-templates>
                </xsl:element>
                <xsl:apply-templates select="$g1/*"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="datarow" mode="index">
        <xsl:choose>
            <xsl:when test="disable = 'TRUE'">
                <xsl:element name="span">
                    <xsl:value-of select="ck-id"/>
                    <xsl:text> disabled&#x2003;</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:text>#err</xsl:text>
                        <xsl:value-of select="ck-id"/>
                    </xsl:attribute>
                    <xsl:value-of select="ck-id"/>
                </xsl:element>
                <xsl:text>&#x2003;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="*[name() = $usxelem]" mode="index2">
        <xsl:if test="string-length(@style) gt 0">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:text>#sfm-</xsl:text>
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
                <xsl:value-of select="@style"/>
            </xsl:element>
            <xsl:text>&#x2003;</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="elgroup">
        <xsl:variable name="seqstyle">
            <xsl:apply-templates select="*/@style" mode="style">
                <xsl:sort select="."/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:element name="h2">
            <xsl:text>USX: </xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>&#x2003;SFM: </xsl:text>
            <xsl:value-of select="$seqstyle"/>
        </xsl:element>
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="*[name() = $usxelem]">
        <xsl:choose>
            <xsl:when test="string-length(@style) gt 0">
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
                            <xsl:value-of select="@style"/>
                        </xsl:element>
                    </xsl:element>
                    <xsl:apply-templates select="*"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="div">
                    <xsl:element name="h3">
                        <xsl:text>No style/SFM defined</xsl:text>
                    </xsl:element>
                    <xsl:apply-templates select="*"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="datarow">
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
                        <xsl:value-of select="ck-id"/>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>#index</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="ck-id"/>
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
.index, .index2, .h4 {margin-left:4em}
.test, .test2, .note {margin-left:6em}
.testrow {padding-bottom:6pt;}
div.index {padding-bottom:12pt;}
</style>
        </head>
    </xsl:template>
    <xsl:template match="text()"/>
</xsl:stylesheet>

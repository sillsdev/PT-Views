<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	extract-digraph-data.xslt
    # Purpose:  	extract info from para data.
    # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2020- -
    # Copyright:	(c) 2020 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="text" encoding="utf-8"/>
    <xsl:output method="text" encoding="utf-8" name="text"/>
    <xsl:include href="project.xslt"/>
    <xsl:template match="/*">
        <xsl:apply-templates select="*" mode="after"/>
        <xsl:result-document href="{concat(f:file2uri($projectpath),'/output/preceding-style-unsorted.txt')}" format="text">
            <xsl:apply-templates select="*" mode="before"/>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="para" mode="after">
        <xsl:value-of select="@style"/>
        <xsl:text>&#9;</xsl:text>
        <xsl:value-of select="following-sibling::*[1]/@style"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="para" mode="before">
        <xsl:value-of select="@style"/>
        <xsl:text>&#9;</xsl:text>
        <xsl:value-of select="preceding-sibling::*[1]/@style"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>

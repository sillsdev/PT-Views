<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	extract-trigraph-data-v2.xslt
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
        <xsl:for-each-group select="*/*" group-by="@style">
            <xsl:sort select="@style"/>
            <xsl:variable name="curstyle" select="current-group()[1]/@style"/>
            <xsl:for-each-group select="current-group()" group-by="@prestyle">
                <xsl:sort select="@prestyle"/>
                <xsl:variable name="curprestyle" select="current-group()[1]/@prestyle"/>
                <xsl:variable name="precount" select="count(current-group())"/>
                <xsl:value-of select="$precount"/>
                <xsl:for-each-group select="current-group()" group-by="@poststyle">
                    <xsl:sort select="@poststyle"/>
                    <xsl:variable name="postcount" select="count(current-group())"/>
                    <xsl:text>&#9;</xsl:text>
                    <xsl:value-of select="$curprestyle"/>
                    <xsl:text>&#9;</xsl:text>
                    <xsl:value-of select="$curstyle"/>
                    <xsl:text>&#9;</xsl:text>
                    <xsl:value-of select="@poststyle"/>
                    <xsl:text>&#9;</xsl:text>
                    <xsl:value-of select="$postcount"/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>
<!--                 <xsl:for-each select="current-group()">
                    <xsl:sort select="@poststyle"/>
                    <xsl:text>&#9;</xsl:text>
                    <xsl:value-of select="@prestyle"/>
                    <xsl:text>&#9;</xsl:text>
                    <xsl:value-of select="@style"/>
                    <xsl:text>&#9;</xsl:text>
                    <xsl:value-of select="@poststyle"/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>
             -->

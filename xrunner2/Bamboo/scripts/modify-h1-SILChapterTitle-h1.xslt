<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	modify-h1-SILChapterTitle-h1.xslt
    # Purpose:  	change h2 to h1 if class = SILChapterTitle.
    # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner2
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2024-06-27
    # Copyright:	(c) 2024 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <!-- <xsl:output method="text" encoding="utf-8" /> -->
    <xsl:include href="project.xslt"/>
    <xsl:include href="inc-copy-anything.xslt"/>
    <xsl:template match="*[name() = 'h2'][@class = 'SILChapterTitle']">
        <xsl:element name="h1">
            <xsl:if test="preceding-sibling::*[1][@class = 'SILChapterNumber']">
                <xsl:value-of select="*[@class = 'SILChapterNumber']"/>
                <xsl:element name="br"/>
            </xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*[@class = 'SILChapterNumber']"/>
</xsl:stylesheet>

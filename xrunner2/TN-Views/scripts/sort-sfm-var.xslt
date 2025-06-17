<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	sort-sfm-var.xslt
    # Purpose:  	sort SFM variable.
    # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner2
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2023-11-14
    # Copyright:	(c) 2023 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <!-- <xsl:output method="text" encoding="utf-8" /> -->
    <xsl:include href="project.xslt"/>
    <xsl:template match="/*">
        <xsl:copy>
            <xsl:apply-templates select="*">
                <xsl:sort select="order"/>
                <xsl:sort select="sfm"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="item">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>

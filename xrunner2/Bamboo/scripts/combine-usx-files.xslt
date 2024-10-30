<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	combine-usx-files.xslt
    # Purpose:  	.
    # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner2
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2024- -
    # Copyright:	(c) 2024 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" suppress-indentation="para cell"/>
    <!-- <xsl:output method="text" encoding="utf-8" /> -->
    <xsl:param name="project"/>
    <xsl:variable name="projpath" select="concat($usxpath,'\',$project)"/>
    <xsl:variable name="usxpathuri" select="f:file2uri($projpath)"/>
    <xsl:variable name="collection" select="collection(concat($usxpathuri,'?select=',$collectionfile))"/>
    <xsl:include href="project.xslt"/>
    <xsl:template match="/*">
        <xsl:element name="bible">
            <xsl:copy-of select="$collection/usx"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

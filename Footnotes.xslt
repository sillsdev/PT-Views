<?xml version="1.0" encoding="UTF-8" ?>
<!--
    #############################################################
    # Name:     	Footnotes.xslt
    # Purpose:  	Provide a view of footnotes
    # Part of:  	PT-Views - https://github.com/SILAsiaPub/PT-Views
    # Concept:	Mark Penny
    # XSLT:		Ian McQuay <ian_mcquay@sil.org>
    # CSS:		Ian McQuay
    # Created:  	2019-12-05
    # Copyright:	(c) 2019 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:extensions="urn:extensions" xmlns:usfmextensions="urn:usfmextensions">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/*">
        <div class="usfm">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="para">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="note">
        <div class="{@style}">
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:text>marker</xsl:text>
                </xsl:attribute>
                <xsl:text>\</xsl:text>
                <xsl:value-of select="@style"/>
                <xsl:text> </xsl:text>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:text>caller</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="@caller"/>
                <xsl:text> </xsl:text>
            </xsl:element>
            <xsl:apply-templates mode="fn"/>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:text>marker</xsl:text>
                </xsl:attribute>
                <xsl:text>\</xsl:text>
                <xsl:value-of select="@style"/>
                <xsl:text>* </xsl:text>
            </xsl:element>
        </div>
    </xsl:template>
    <xsl:template match="char" mode="fn">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>marker</xsl:text>
            </xsl:attribute>
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text> </xsl:text>
        </xsl:element>
        <span class="{@style}">
            <xsl:apply-templates mode="fn"/>
        </span>
    </xsl:template>
    <xsl:template match="chapter">
        <style type="text/css">
            .f {vertical-align: text-top;}
		.marker {color:gray}
		.fr {font-weight:bold;}
		.ft {}
		.fq {font-style:italic}
        </style>
    </xsl:template>
    <xsl:template match="text()"/>
    <xsl:template match="text()" mode="fn">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>

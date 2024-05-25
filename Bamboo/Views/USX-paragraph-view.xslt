<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	USX-paragraph-view.xslt
    # Purpose:  	Show USX markup plus any overlayed xml
    # Part of:  	Xrunner - https://github.com/sillsdev/PT-views
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2024-05-25
    # Copyright:	(c) 2024 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/*">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="table|tr|para|book|row">
        <div>
            <!-- <xsl:apply-templates select="@*"/> -->
            <xsl:element name="char">
                <xsl:attribute name="style">
                    <xsl:text>color:blue</xsl:text>
                </xsl:attribute>
                <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:apply-templates select="@*" mode="show"/>
                <xsl:text>&gt;</xsl:text>
            </xsl:element>
            <xsl:apply-templates select="node()"/>
            <span style="color:blue;">
                <xsl:text>&lt;/</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:text>&gt;</xsl:text>
            </span>
        </div>
    </xsl:template>
    <xsl:template match="char|note|cell">
        <xsl:element name="char">
            <xsl:attribute name="style">
                <xsl:text>color:blue</xsl:text>
            </xsl:attribute>
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:apply-templates select="@*" mode="show"/>
            <xsl:text>&gt;</xsl:text>
        </xsl:element>
        <xsl:apply-templates select="node()"/>
        <span style="color:blue;">
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>&gt;</xsl:text>
        </span>
    </xsl:template>
    <xsl:template match="verse|fig|chapter">
        <xsl:if test="name() = 'chapter' and count(preceding::chapter) = 0">
            <xsl:element name="h4">
                <xsl:text>Version: 7 USX Paragraph view</xsl:text>
            </xsl:element>
        </xsl:if>
        <xsl:element name="char">
            <xsl:attribute name="style">
                <xsl:text>color:blue</xsl:text>
            </xsl:attribute>
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:apply-templates select="@*" mode="show"/>
            <xsl:text>/&gt;</xsl:text>
        </xsl:element>
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:copy>
            <xsl:value-of select="."/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@*" mode="show">
        <!-- <xsl:text>[[</xsl:text> -->
        <xsl:text> </xsl:text>
        <span style="color:red">
            <xsl:value-of select="name()"/>
        </span>
        <xsl:text>=</xsl:text>
        <xsl:text>"</xsl:text>
        <span style="background:slategrey; color:white; padding: 0 3pt 0 3pt;">
            <xsl:value-of select="."/>
        </span>
        <xsl:text>"</xsl:text>
        <!-- <xsl:text>]]</xsl:text> -->
    </xsl:template>
</xsl:stylesheet>

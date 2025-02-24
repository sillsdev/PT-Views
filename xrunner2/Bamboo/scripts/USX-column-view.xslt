<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	USX-view.xslt
    # Purpose:  	Show USX markup plus any overlayed xml
    # Part of:  	Xrunner - https://github.com/sillsdev/PT-views
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2020-01-01
    # Modified:	2024-04-14
    # Copyright:	(c) 2024 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="version" select="'7'"/>
    <xsl:variable name="view" select="' USX column view.'"/>
    <xsl:variable name="created" select="' Created: 2024-05-24'"/>
    <xsl:template match="/*">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="*">
        <xsl:if test="name() = 'chapter' and count(preceding::chapter) = 0">
            <xsl:element name="h4">
                <xsl:value-of select="concat('Version: ',$version,$view,$created)"/>
            </xsl:element>
        </xsl:if>
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
            <span style="color:blue;background:orange">
                <xsl:text>&lt;/</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:text>&gt;</xsl:text>
            </span>
        </div>
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

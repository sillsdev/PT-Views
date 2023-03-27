<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	.xslt
    # Purpose:  	Get sequence or para, table, tr.
    # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2020- -
    # Copyright:	(c) 2020 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:include href="project.xslt"/>
    <xsl:template match="/*">
        <xsl:element name="paras">
            <xsl:apply-templates select="usx"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="usx">
        <xsl:copy>
            <xsl:apply-templates select="*">
                <xsl:with-param name="bk" select="@book"/>
                <xsl:with-param name="seq" select="@seq*100000"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*[name() = $para]">
        <xsl:param name="bk"/>
        <xsl:param name="seq"/>
        <xsl:element name="para">
            <xsl:attribute name="style">
                <xsl:value-of select="if (name() = 'table') then 'tr' else @style"/>
            </xsl:attribute>
            <xsl:attribute name="prestyle">
                <xsl:value-of select="if (preceding-sibling::*[1]/name() = 'table') then 'tr' else preceding-sibling::*[1]/@style"/>
            </xsl:attribute>
            <xsl:attribute name="poststyle">
                <xsl:value-of select="if (following-sibling::*[1]/name() = 'table') then 'tr' else following-sibling::*[1]/@style"/>
            </xsl:attribute>
            <xsl:attribute name="seq">
                <!-- <xsl:value-of select=""/> -->
                <xsl:value-of select="$seq+position()"/>
                <!-- <xsl:value-of select="if (following-sibling::*[name() = $para][1]/name() = 'table') then 'tr' else following-sibling::*[name() = $para][1]/@style"/> -->
            </xsl:attribute>
            <xsl:attribute name="ref">
                <xsl:value-of select="$bk"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="if (number(following-sibling::chapter[1]/@number) = 1) then '0:0' else replace(preceding-sibling::*[@style = 'sl1'][1]/text()[1],'^([\d:\-a-e]+)  ?.*','$1')"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    <!-- <xsl:template match="text()"/> -->
</xsl:stylesheet>

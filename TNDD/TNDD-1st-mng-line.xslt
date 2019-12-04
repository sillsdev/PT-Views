<?xml version="1.0" encoding="UTF-8" ?>
    <!--
    #############################################################
    # Name:     	TNDD-1st-mng-line.xslt
    # Purpose:  	Provide a view of the first \ml1 after the \sl1 .
    # Part of:  		PT-Views - https://github.com/SILAsiaPub/PT-Views
    # Concept:	Mark Penny
    # XSLT:		Ian McQuay <ian_mcquay@sil.org>
    # CSS:		Ian McQuay
    # Created:  	2019-12-05
    # Copyright:	(c) 2019 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="5"/>
    <xsl:template match="/*">
        <div class="usfm">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="para">
        <xsl:text><!-- Do nothing for most --></xsl:text>
        <xsl:apply-templates select="verse"/>
    </xsl:template>
    <xsl:template match="para[@style='sl1']">
        <span class="verse">
        <xsl:apply-templates select="text()[1]" mode="verse"/>
        </span>
    </xsl:template>
    <xsl:template match="para[@style='ml1']">
        <xsl:variable name="pre-style" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="pre-style2" select="preceding-sibling::*[2]/@style"/>
        <xsl:if test="$pre-style = 'sl1' or $pre-style2 = 'sl1' ">
            <span class="{@style}">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="table">
        <xsl:text><!-- Do nothing for most --></xsl:text>
    </xsl:template>
    <xsl:template match="char">
        <span class="{@style}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="verse[@number]">
        <br/>
    </xsl:template>
    <xsl:template match="chapter">
        <style type="text/css">
            .ml1 {}
		.imp {color:blue}
		.tr {font-size:120%;font-weight:bold}
		.brk {vertical-align: sub;}
		.verse {vertical-align: super; color:forestgreen;font-size:85%}
        </style>
    </xsl:template>
    <xsl:template match="text()" mode="verse">
        <xsl:variable name="v">
            <xsl:choose>
                <xsl:when test="string-length(substring-after(.,':')) = 0">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring-after(.,':')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="normalize-space($v)"/>
    </xsl:template>
</xsl:stylesheet>

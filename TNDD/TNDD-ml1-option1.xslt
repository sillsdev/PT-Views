<?xml version="1.0" encoding="UTF-8" ?>
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
    <xsl:template match="para[@style='ml1']">
        <xsl:variable name="pre-style" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="pre-style2" select="preceding-sibling::*[2]/@style"/>
        <xsl:if test="$pre-style = 'sl1' or $pre-style2 = 'sl1' ">
            <div class="{@style}">
                <xsl:apply-templates/>
            </div>
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
<xsl:template match="verse">
<br />
</xsl:template>
    <xsl:template match="chapter">
        <style type="text/css">
            .ml1 {display:inline-block;vertical-align: text-top;}
		.imp {color:blue}
		.tr {font-size:120%;font-weight:bold}
		.brk {vertical-align: sub;}
        </style>
    </xsl:template>
</xsl:stylesheet>

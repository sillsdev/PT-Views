<?xml version="1.0" encoding="UTF-8" ?>
    <!--
    #############################################################
    # Name:     	TNDD-table-view.xslt
    # Purpose:  	Provide a table view of TNDD data with \sl1 and up to three columns of \ml1 data.
    # Part of:  	PT-Views - https://github.com/SILAsiaPub/PT-Views
    # Concept:	Mark Penny
    # XSLT:		Ian McQuay <ian_mcquay@sil.org>
    # CSS:		Ian McQuay, Mark Penny
    # Created:  	2019-12-04
    # Copyright:	(c) 2019 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Credits: Mark Penny for the idea; Ian McQuay for the XSLT and CSS details to make it all work! -->
    <xsl:output method="html"/>
    <xsl:template match="/*">
        <div class="usfm">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="para">
        <xsl:text><!-- Do nothing for most markers--></xsl:text>
    </xsl:template>
    <xsl:template match="para[@style='sl1' or @style='ml1' or @style='tr']">
        <xsl:if test="@style = 'sl1'">
            <br/>
        </xsl:if>
        <div class="{@style}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="table">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="row[@style='tr']">
        <br/>
        <div class="{@style}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="char">
        <span class="{@style}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="chapter">
        <style type="text/css">
            .usfm {white-space: nowrap;}
            .sl1 {font-size:80%;width:20%;display:inline-block;padding-left: 2em; text-indent:-2em;
                  white-space:normal;vertical-align: text-top;font-weight:bold;background:lavender}
            .ml1 {width:24%;display:inline-block;padding-left: 0.7em; text-indent:-0.7em;
                  white-space:normal;vertical-align: text-top}
            .imp {color:blue}
            .brk {vertical-align: sub;}
            .tr {font-size:120%;font-weight:bold;color:red;margin-top:15pt;white-space:normal}
        </style>
    </xsl:template>
</xsl:stylesheet>

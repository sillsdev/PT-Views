<?xml version="1.0" encoding="UTF-8" ?>
<!--
    #############################################################
    # Name:     		TNDD-2nd-mng-line.xslt
    # Purpose:  		Provide a view of the second \ml1 after the \sl1 .
    # Part of:  		PT-Views - https://github.com/SILAsiaPub/PT-Views
    # Concept:		Mark Penny
    # XSLT & CSS:	Ian McQuay <ian_mcquay@sil.org>
    # Created:  		2019-12-05
    # Copyright:		(c) 2019 SIL International
    # Licence:  		<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="5" indent="no"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/*">
        <div class="usfm">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="para|book">
        <!-- Do nothing with most para, except find verses to break lines -->
        <xsl:apply-templates select="verse"/>
    </xsl:template>
    <xsl:template match="para[@style='sl1']">
        <!-- match the \sl1 marker to get the verse info then check to see where and which \ml1 markers are in the right context -->
        <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-2" select="following-sibling::*[2]/@style"/>
        <xsl:variable name="post-style-3" select="following-sibling::*[3]/@style"/>
        <xsl:variable name="post-style-4" select="following-sibling::*[4]/@style"/>
        <xsl:text> </xsl:text>
        <span class="verse">
            <xsl:apply-templates select="text()[1]" mode="verse"/>
        </span>
        <xsl:choose>
            <xsl:when test="$post-style-2 = 'ml1' and $post-style-4 = 'ml1' and $post-style-3 = 'mlor'">
                <!-- handle \p after \sl1 -->
                <xsl:apply-templates select="following-sibling::*[4]" mode="meaning"/>
            </xsl:when>
            <xsl:when test="$post-style-1 = 'ml1' and $post-style-3 = 'ml1'  and $post-style-2 = 'mlor'">
                <!-- handle \ml1 in the correct order -->
                <xsl:apply-templates select="following-sibling::*[3]" mode="meaning"/>
            </xsl:when>
            <xsl:when test="$post-style-2 = 'ml1'">
                <!-- handle \p after \sl1 but no 2nd \ml1 -->
                <xsl:text>((</xsl:text>
                <xsl:apply-templates select="following-sibling::*[2]" mode="meaning">
                    <xsl:with-param name="prev" select="'1st'"/>
                </xsl:apply-templates>
                <xsl:text>))</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <span class="{@style}">
                    <xsl:text>((</xsl:text>
                    <xsl:apply-templates select="following-sibling::*[1]" mode="meaning">
                        <xsl:with-param name="prev" select="'1st'"/>
                    </xsl:apply-templates>
                    <xsl:text>))</xsl:text>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="para[@style='ml1']" mode="meaning">
        <!-- Output the marker selected relative to \sl1 -->
        <xsl:param name="prev"/>
        <xsl:variable name="style">
            <xsl:choose>
                <xsl:when test="string-length($prev) = 0">
                    <xsl:value-of select="@style"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@style"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="$prev"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <span class="{$style}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="*">
        <!-- Do nothing -->
    </xsl:template>
    <xsl:template match="char">
        <!-- handle character styles -->
        <span class="{@style}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="verse[@number]">
        <!-- Output a line break to separate verses handle USFM 2 and 3 -->
        <xsl:element name="br"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="chapter">
        <!-- Provide a style for each chapter -->
        <style type="text/css">
            .ml1 {}
            .ml1-2nd {color:saddlebrown}
            .ml1-1st {color:firebrick}
		.imp {color:blue}
            .brk {vertical-align: sub;font-size:70%;color:gray}
		.verse {vertical-align: super; color:forestgreen;font-size:85%}
        </style>
    </xsl:template>
    <xsl:template match="text()" mode="verse">
        <!-- This is text we want to show -->
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

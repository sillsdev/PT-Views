<?xml version="1.0" encoding="UTF-8" ?>
<!--
    #############################################################
    # Name:     		TNDD-3rd-mng-line.xslt
    # Purpose:  		Provide a view of the third \ml1 after the \sl1 .
    # Part of:  		PT-Views - https://github.com/SILAsiaPub/PT-Views
    # Concept:		Mark Penny
    # XSLT & CSS:	Ian McQuay <ian_mcquay@sil.org>
    # Created:  		2019-12-05
    # Modified:  		2020-11-04
    # Copyright:		(c) 2019 SIL International
    # Licence:  		<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="5" indent="no"/>
    <xsl:strip-space elements="*"/>
    <xsl:variable name="version" select="'7'"/>
    <xsl:variable name="view" select="' TNDD 3rd meaning line view.'"/>
    <xsl:variable name="created" select="' Modified: 2024-06-19'"/>
    <xsl:variable name="get-ml1" select="3"/>
    <xsl:variable name="show-chap" select="'false'"/>
    <xsl:variable name="ml1-pos">
        <xsl:choose>
            <xsl:when test="$get-ml1 = '1'">
                <xsl:text>1st</xsl:text>
            </xsl:when>
            <xsl:when test="$get-ml1 = '2'">
                <xsl:text>2nd</xsl:text>
            </xsl:when>
            <xsl:when test="$get-ml1 = '3'">
                <xsl:text>3rd</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$get-ml1"/>
                <xsl:text>th</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="/*">
        <div class="usfm">
            <xsl:element name="h4">
                <xsl:value-of select="concat('Version: ',$version,$view,$created)"/>
            </xsl:element>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="para|book">
        <!-- Do nothing with most para, except find verses to break lines -->
        <xsl:apply-templates select="verse"/>
    </xsl:template>
    <xsl:template match="para[@style='sl1']">
        <xsl:variable name="cur-sl1-pos" select="position()"/>
        <xsl:variable name="ml1-target-pos" select="count(following-sibling::*[@style = 'ml1'][number($get-ml1)]/preceding-sibling::*) + 1"/>
        <xsl:variable name="ml1-prev1-pos" select="count(following-sibling::*[@style = 'ml1'][number($get-ml1) -1]/preceding-sibling::*) + 1"/>
        <xsl:variable name="ml1-prev2-pos" select="count(following-sibling::*[@style = 'ml1'][number($get-ml1) -2]/preceding-sibling::*) + 1"/>
        <xsl:variable name="ml1-first" select="count(following-sibling::*[@style = 'ml1'][1]/preceding-sibling::*) + 1"/>
        <xsl:variable name="p-first" select="count(following-sibling::*[@style = 'p'][1]/preceding-sibling::*) + 1"/>
        <xsl:variable name="next-sl1-pos" select="count(following-sibling::*[@style = 'sl1'][1]/preceding-sibling::*) + 1"/>
        <xsl:variable name="chap" select="substring-before(text()[1],':')"/>
        <xsl:if test="count(preceding-sibling::*[@style='sl1']) = 0">
            <!-- Provide styles once weather for the whole book or for chapter by chapter like in Paratext -->
            <xsl:call-template name="styles"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <span class="verse">
            <xsl:apply-templates select="text()[1]" mode="verse">
                <xsl:with-param name="chap" select="$chap"/>
            </xsl:apply-templates>
            <xsl:text> </xsl:text>
        </span>
        <xsl:choose>
            <xsl:when test="number($next-sl1-pos) = 1 and $ml1-target-pos &gt; $cur-sl1-pos">
                <!-- This handles end of book where there is no next \sl1. Next \sl1 position returns 1 -->
                <xsl:apply-templates select="following-sibling::*[@style = 'ml1'][number($get-ml1)]" mode="meaning"/>
            </xsl:when>
            <xsl:when test="$next-sl1-pos &gt; $cur-sl1-pos and $ml1-first &gt; $next-sl1-pos and $p-first &lt; $next-sl1-pos">
                <!-- This handles when there is no \ml1 between the current \sl1 and the next \sl1 but there is a \p that can be used -->
                <span class="reordered">
                    <xsl:text> (( (reordered) </xsl:text>
                    <xsl:apply-templates select="following-sibling::*[@style = 'p'][1]" mode="meaning"/>
                    <xsl:text> )) </xsl:text>
                </span>
            </xsl:when>
            <xsl:when test="$ml1-target-pos &lt; $next-sl1-pos">
                <!-- This is for when the target \ml1 exists -->
                <span class="ml1">
                    <xsl:apply-templates select="following-sibling::*[@style = 'ml1'][number($get-ml1)]" mode="meaning"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <!-- This handles getting previous \ml1 lines -->
                <span class="sub">
                    <xsl:text> (( </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$ml1-prev1-pos &lt; $next-sl1-pos">
                            <!-- Handles when there is a previous line -->
                            <span class="ml1-prev1">
                                <xsl:apply-templates select="following-sibling::*[@style = 'ml1'][number($get-ml1) - 1]" mode="meaning"/>
                            </span>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- Handles when there is a second previous line. Ie. \ml1[3] does not exist nor does \ml1[2] but \ml1[1] exists  -->
                            <span class="ml1-prev2">
                                <xsl:apply-templates select="following-sibling::*[@style = 'ml1'][number($get-ml1) - 2]" mode="meaning"/>
                            </span>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> )) </xsl:text>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="para[@style='ml1' or @style = 'p']" mode="meaning">
        <!-- Output the marker selected relative to preceding \sl1 -->
        <xsl:apply-templates/>
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
    <xsl:template match="text()" mode="verse">
        <xsl:param name="chap"/>
        <!-- This is text we want to show -->
        <xsl:variable name="v">
            <xsl:choose>
                <xsl:when test="string-length(substring-before(.,' ')) &gt; 0">
                    <xsl:value-of select="substring-before(.,' ')"/>
                </xsl:when>
                <xsl:when test="string-length(substring-after(.,':')) = 0">
                    <xsl:value-of select="concat($chap,':',.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$show-chap = 'true'">
                <xsl:value-of select="normalize-space($v)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(substring-after($v,':'))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="table">
        <xsl:element name="h2">
            <xsl:value-of select="*/*/*[@style = 'sbx'][1]"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="annot">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    <xsl:template name="styles">
        <style type="text/css">
		.sub {color:saddlebrown}
            .ml1 {}
            .ml1-prev1 {color:saddlebrown}
            .ml1-prev2 {color:firebrick}
		.reordered {color:purple}
		.imp {color:blue}
            .brk {vertical-align: sub;font-size:70%;color:gray}
		.verse {vertical-align: super; color:forestgreen;font-size:85%}
		.rgi , .rgm {vertical-align: super;}
        </style>
    </xsl:template>
</xsl:stylesheet>

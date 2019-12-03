<?xml version="1.0" encoding="UTF-8" ?>
<!--
    #############################################################
    # Name:     		TNDD-ml1-option3.xslt
    # Purpose:  		Provide a view of the third \ml1 after the \sl1 .
    # Part of:  		PT-Views - https://github.com/SILAsiaPub/PT-Views
    # Concept:		Mark Penny
    # XSLT & CSS:	Ian McQuay <ian_mcquay@sil.org>
    # Created:  		2019-12-05
    # Copyright:		(c) 2019 SIL International
    # Licence:  		<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="5" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/*">
        <div class="usfm">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="para[@style='sl1']">
        <!-- match the \sl1 marker to get the verse info then check to see where and which \ml1 markers are in the right context -->
        <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-2" select="following-sibling::*[2]/@style"/>
        <xsl:variable name="post-style-3" select="following-sibling::*[3]/@style"/>
        <xsl:variable name="post-style-4" select="following-sibling::*[4]/@style"/>
        <xsl:variable name="post-style-5" select="following-sibling::*[5]/@style"/>
        <xsl:variable name="post-style-6" select="following-sibling::*[6]/@style"/>
        <xsl:variable name="child-style-1" select="child::*[1]/@style"/>
        <div class="verse">
            <xsl:apply-templates select="text()[1]" mode="verse"/>
        </div>
        <xsl:if test="$post-style-1 = 'p'">
            <div class="error">Paragraph marks should not occur between \sl1 and \ml1 in the same group</div>
        </xsl:if>
<xsl:choose>
<xsl:when test="$child-style-1 = 'tbb'"/>
            <div class="error">This style is missing the <span class="example">\tbb __\tbb*</span> markers</div>


<xsl:otherwise>

</xsl:otherwise>
</xsl:choose>

    </xsl:template>
    <xsl:template match="para[@style='ml1']" mode="meaning">
        <!-- Checks for \ml1 marker -->
        <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-2" select="following-sibling::*[2]/@style"/>
        <xsl:variable name="post-style-3" select="following-sibling::*[3]/@style"/>
        <xsl:if test="$post-style-1 = 'ml1'">
            <div class="error">There is a missing \mlor marker between this \ml1 and the next \ml1</div>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="$pre-style-1 = 'sl1'"/>
            <xsl:when test="$pre-style-1 = 'mlor'"/>
            <xsl:otherwise>
                <div class="error">The marker before this marker is not allowed. It is <span class="example">\<xsl:value-of select="$pre-style-1"/></span> but should be one of <span class="example">\sl1 </span> or  <span class="example">\mlor </span></div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="char">
        <!-- handle character styles -->
        <xsl:choose>
            <xsl:when test="@style = 'brk'">
                <xsl:choose>
                    <xsl:when test=". = '⌋'"/>
                    <xsl:when test=". = '⌊'"/>
                    <xsl:otherwise>
                        <div class="error">There is text that is not allowed in the \brk marker. It appears to not be closed. <span class="example"><xsl:value-of select="."/></span> Or contains other text.</div>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@style = 'imp'">
                <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
                <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
                <xsl:if test="$pre-style-1 = not('brk')">
                    <div class="error">This marker should be preceded by <span class="example">\brk ⌊\brk*</span></div>
                </xsl:if>
                <xsl:if test="$post-style-1 = not('brk')">
                    <div class="error">This marker should be followed by <span class="example">\brk ⌋\brk*</span></div>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
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
    <xsl:template match="text()"/>
    <xsl:template match="chapter">
        <!-- Provide a style for each chapter -->
        <style type="text/css">
            .error {border-left:10pt solid red;}
            .example {color:firebrick}
            .verse {color:forestgreen;font-size:80%;font-weight:bold;}
        </style>
    </xsl:template>
</xsl:stylesheet>

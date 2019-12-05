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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="html" version="5" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/*">
        <div class="usfm">
            <h3>Error list</h3>
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
        <xsl:variable name="v" select="normalize-space(text()[1])"/>
        <xsl:variable name="prevv" select="normalize-space(preceding-sibling::*[@style = 'sl1'][1]/text()[1])"/>
        <xsl:choose>
            <xsl:when test="string-length(normalize-space(.))= 0">
                <div class="error"><span class="verse"><xsl:value-of select="$prevv"/> is preceding reference. \<xsl:value-of select="@style"/>&#x2003;</span>This marker should not be empty!<br />Context: <span class="context">\<xsl:value-of select="preceding-sibling::*[1]/@style"/> <xsl:value-of select="preceding-sibling::*[1]"/> <br />\<xsl:value-of select="@style"/> <xsl:value-of select="."/> <br />\<xsl:value-of select="following-sibling::*[1]/@style"/> <xsl:value-of select="following-sibling::*[1]"/></span></div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$post-style-1 = 'p' and $post-style-2 = 'ml1'">
                    <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>Paragraph style \p marks should not occur between \sl1 and \ml1 in the same group. <br />Context: <span class="context"> \<xsl:value-of select="@style"/> <xsl:value-of select="."/> <br />\<xsl:value-of select="following-sibling::*[1]/@style"/> <xsl:value-of select="following-sibling::*[1]"/></span></div>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="$child-style-1 = 'tbb'"/>
                    <xsl:otherwise>
                        <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>The <span class="example">\sl1 </span> style is missing the <span class="example">\tbb __\tbb*</span> markers. </div>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="para[@style='ml1']" mode="meaning">
        <!-- Checks for \ml1 marker -->
        <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-2" select="following-sibling::*[2]/@style"/>
        <xsl:variable name="post-style-3" select="following-sibling::*[3]/@style"/>
        <xsl:variable name="child-style-1" select="*[1]/@style"/>
        <xsl:variable name="v" select="normalize-space(preceding-sibling::*[@style = 'sl1'][1]/text()[1])"/>
        <xsl:if test="$post-style-1 = 'ml1'">
            <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is a missing \mlor marker between this \ml1 and the next \ml1</div>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="$pre-style-1 = 'sl1'"/>
            <xsl:when test="$pre-style-1 = 'mlor'"/>
            <xsl:otherwise>
                <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>The marker before this marker is not allowed. It is <span class="example">\<xsl:value-of select="$pre-style-1"/></span> but should be one of <span class="example">\sl1 </span> or  <span class="example">\mlor </span></div>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$child-style-1 = 'tbb'">
            <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>Is the marker <span class="example">\tbb</span> allowed here??</div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="char">
        <!-- handle character styles -->
        <xsl:variable name="v" select="normalize-space(preceding::*[@style = 'sl1'][1]/text()[1])"/>
        <xsl:variable name="pos" select="count(preceding-sibling::node())+ 1"/>
        <xsl:variable name="text" select="."/>
        <xsl:choose>
            <xsl:when test="@style = 'brk'">
                <xsl:choose>
                    <xsl:when test=". = '⌋'"/>
                    <xsl:when test=". = '⌊'"/>
                    <xsl:when test="normalize-space(.) = '⌋'">
                        <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is extra space after or before the <span class="example">⌋</span> character. <br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span></div>
                    </xsl:when>
                    <xsl:when test="normalize-space(.) = '⌊'">
                        <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is extra space after or before the <span class="example">⌊</span> character.<br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span></div>
                    </xsl:when>
                    <xsl:when test="string-length(normalize-space(.)  = 0)">
                        <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>This character marker is empty. Should be <span class="example">⌊</span> or <span class="example">⌋</span> character. <br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span> </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is text that is not allowed in the \brk marker. It appears to contains other text: <span class="example"><xsl:value-of select="."/></span> and or not be closed. <br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span></div>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@style = 'imp'">
                <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
                <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
                <xsl:choose>
                    <xsl:when test="string-length(normalize-space(.))= 0">
                        <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>This marker has no purpose being empty! It should contain words or be removed.</div>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="$pre-style-1 = not('brk')">
                            <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>This marker containing <span class="example"><xsl:value-of select="$text"/></span> should be preceded by <span class="example">\brk ⌊\brk*</span></div>
                        </xsl:if>
                        <xsl:if test="$post-style-1 = not('brk')">
                            <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>This marker containing <span class="example"><xsl:value-of select="$text"/></span> should be followed by <span class="example">\brk ⌋\brk*</span></div>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="text()"/>
    <xsl:template match="chapter">
        <!-- Provide a style for each chapter -->
        <style type="text/css">
            .error {border-left:10pt solid red;padding-left:3pt}
            .example {color:firebrick}
            .verse {color:forestgreen;font-size:80%;font-weight:bold;}
		.context {color:slategray;background:thistle}
        </style>
    </xsl:template>
    <xsl:template name="verse">
        <xsl:param name="ref"/>
        <xsl:choose>
            <xsl:when test="string-length(substring-after(.,':')) = 0">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(substring-after(.,':'))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

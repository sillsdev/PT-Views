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
    <xsl:template match="para[@style='p']">
        <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
        <xsl:variable name="child-style-1" select="child::*[1]/@style"/>
        <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="post-text-1" select="following-sibling::*[1]/text()"/>
        <xsl:variable name="pre-text-1" select="preceding-sibling::*[1]/text()"/>
        <xsl:variable name="v">
            <xsl:choose>
                <xsl:when test="verse">
                    <xsl:value-of select="v/@number"/>
                </xsl:when>
                <xsl:when test="preceding-sibling::*[1][@style = 'sl1']">
                    <xsl:value-of select="preceding-sibling::*[1][@style = 'sl1']/text()[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="preceding::verse[1]/@number"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="verse[@number = '1']">
            <!-- targeting verse start -->
            <xsl:if test="following-sibling::*[1][@style = 'b']">
                <!-- SC2 -->
                <xsl:variable name="data">
                    <xsl:text>t=SC2 There should be no 
e=\b 
t=following a 
e=\p 
</xsl:text>
                </xsl:variable>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="$v"/>
                    <xsl:with-param name="sty" select="@style"/>
                    <xsl:with-param name="data" select="$data"/>
                    <!-- <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>  -->
                    <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',' \v 1')"/>
                    <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
                </xsl:call-template>
                <!-- <div class="error"><span class="verse">1&#x2003;</span>There should be no <span class="context">\b </span> following a <br /><span class="context">\p \v 1</span></div> -->
            </xsl:if>
            <xsl:if test="$pre-style-1 = 'p'">
                <!-- SC10 -->
                <xsl:variable name="data">
                    <xsl:text>t=SC10 The marker preceding 
e=\p \v 1 
t=should not be a 
e=\p </xsl:text>
                </xsl:variable>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="$v"/>
                    <xsl:with-param name="sty" select="@style"/>
                    <xsl:with-param name="data" select="$data"/>
                    <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                    <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                    <!-- <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/> -->
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
        <xsl:choose>
            <!-- SC13 -->
            <xsl:when test="following-sibling::*[name() = 'table']">
                <xsl:text><!-- correct --></xsl:text>
            </xsl:when>
            <xsl:when test="$post-style-1 = 'sl1'">
                <xsl:if test="not(verse)">
                    <xsl:variable name="data">
                        <xsl:text>t=SC13 A 
e=\p 
t=marker should not occur in this position. Unless it has a 
e=\v 
t=marker in it. </xsl:text>
                    </xsl:variable>
                    <xsl:call-template name="error">
                        <xsl:with-param name="v" select="$v"/>
                        <xsl:with-param name="sty" select="@style"/>
                        <xsl:with-param name="data" select="$data"/>
                        <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                        <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                        <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>XXX unhandled situation</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
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
        <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="post-text-1" select="following-sibling::*[1]/text()"/>
        <xsl:variable name="pre-text-1" select="preceding-sibling::*[1]/text()"/>
        <xsl:variable name="v">
            <xsl:call-template name="verse">
                <xsl:with-param name="ref" select="text()[1]"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="prevv" select="normalize-space(preceding-sibling::*[@style = 'sl1'][1]/text()[1])"/>
        <xsl:if test="string-length(normalize-space(.))= 0">
            <!-- Empty \sl1 -->
            <!-- <div class="error"><span class="verse"><xsl:value-of select="$prevv"/> is preceding reference. \<xsl:value-of select="@style"/>&#x2003;</span>This marker should not be empty!<br />Context: <span class="context">\<xsl:value-of select="preceding-sibling::*[1]/@style"/> <xsl:value-of select="preceding-sibling::*[1]"/> <br />\<xsl:value-of select="@style"/> <xsl:value-of select="."/> <br />\<xsl:value-of select="following-sibling::*[1]/@style"/> <xsl:value-of select="following-sibling::*[1]"/></span></div> -->
            <xsl:variable name="data">
                <xsl:text>t=This marker should not be empty! </xsl:text>
            </xsl:variable>
            <xsl:call-template name="error">
                <xsl:with-param name="v" select="concat($prevv,' is preceding reference.')"/>
                <xsl:with-param name="sty" select="@style"/>
                <xsl:with-param name="data" select="$data"/>
                <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$post-style-1 = 'p' and $post-style-2 = 'ml1'">
            <!-- \p occuring after \sl1 -->
            <!-- <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>Paragraph style \p marks should not occur between \sl1 and \ml1 in the same group. 
<br />Context: <span class="context"> \<xsl:value-of select="@style"/> <xsl:value-of select="."/> <br />\<xsl:value-of select="following-sibling::*[1]/@style"/> <xsl:value-of select="following-sibling::*[1]"/></span></div> -->
            <xsl:variable name="data">
                <xsl:text>t:Paragraph style
e=\p 
t=should not occur between 
e=\sl1 
t=and 
e=\ml1 
t=in the same group 
</xsl:text>
            </xsl:variable>
            <xsl:call-template name="error">
                <xsl:with-param name="v" select="$v"/>
                <xsl:with-param name="sty" select="@style"/>
                <xsl:with-param name="data" select="$data"/>
                <!-- <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/> -->
                <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
            </xsl:call-template>
            <c>\<xsl:value-of select="@style"/> <xsl:value-of select="."/> 
                            <br />\<xsl:value-of select="following-sibling::*[1]/@style"/> <xsl:value-of select="following-sibling::*[1]"/></c>
        </xsl:if>
        <xsl:choose>
            <!-- when no \tbb in \sl1 -->
            <xsl:when test="$child-style-1 = 'tbb'"/>
            <xsl:otherwise>
                <xsl:variable name="data">
                    <xsl:text>t=SC2 This paragraph is missing the 
e=\tbb __\tbb* 
t=markers after the reference. 
</xsl:text>
                </xsl:variable>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="$v"/>
                    <xsl:with-param name="sty" select="@style"/>
                    <xsl:with-param name="data" select="$data"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="para[@style='ml1']">
        <!-- Checks for \ml1 marker -->
        <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
        <xsl:variable name="post-style-2" select="following-sibling::*[2]/@style"/>
        <xsl:variable name="post-style-3" select="following-sibling::*[3]/@style"/>
        <xsl:variable name="child-style-1" select="*[1]/@style"/>
        <xsl:variable name="post-3-child-style-1" select="following-sibling::*[3][@style ='ml1']/*[1]/@style"/>
        <xsl:variable name="post-5-child-style-1" select="following-sibling::*[5][@style ='ml1']/*[1]/@style"/>
        <xsl:variable name="pre-text-1" select="preceding-sibling::*[1]/text()"/>
        <xsl:variable name="v">
            <xsl:call-template name="verse">
                <xsl:with-param name="ref" select="normalize-space(preceding-sibling::*[@style = 'sl1'][1]/text()[1])"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="preceding-sibling::*[2][name() = 'table']">
            <!-- Steve list 4 following section head in table, ml1 must have a \tbb -->
            <xsl:choose>
                <xsl:when test="$child-style-1 = 'tbb'">
<!-- this is correct -->
</xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="data">
                        <xsl:text>t=This paragraph is a missing
e=\tbb __\tbb* 
t=. As it follows a Section head it must be present in this context.
</xsl:text>
                    </xsl:variable>
                    <xsl:call-template name="error">
                        <xsl:with-param name="v" select="$v"/>
                        <xsl:with-param name="sty" select="@style"/>
                        <xsl:with-param name="data" select="$data"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="$child-style-1 = 'tbb' and child::*[@style = 'imp']">
            <!-- SC14  -->
            <xsl:variable name="data">
                <xsl:text>t=SC14 Implied information cannot fill the entire paragraph. 
t=Count nodes</xsl:text>
                <xsl:value-of select="count(node())"/>
            </xsl:variable>
            <xsl:call-template name="error">
                <xsl:with-param name="v" select="$v"/>
                <xsl:with-param name="sty" select="@style"/>
                <xsl:with-param name="data" select="$data"/>
                <!-- <xsl:with-param name="precontext" select="concat('char','=',$pre-style-1,'=',$pre-text-1)"/> -->
                <!-- <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/> -->
                <!-- <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/> -->
                <xsl:with-param name="curcontent" select="."/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$post-style-1 = 'ml1'">
            <!-- <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is a missing \mlor marker between this \ml1 and the next \ml1</div> -->
            <xsl:variable name="data">
                <xsl:text>t=There is a missing
e=\mlor 
t=marker between this 
e=\ml1 
t=and the next 
e=\ml1 
</xsl:text>
            </xsl:variable>
            <xsl:call-template name="error">
                <xsl:with-param name="v" select="$v"/>
                <xsl:with-param name="sty" select="@style"/>
                <xsl:with-param name="data" select="$data"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="$pre-style-1 = 'sl1'"/>
            <xsl:when test="$pre-style-1 = 'mlor'"/>
            <xsl:otherwise>
                <!-- <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>The marker before this marker is not allowed. It is <span class="example">\<xsl:value-of select="$pre-style-1"/></span> but should be one of <span class="example">\sl1 </span> or  <span class="example">\mlor </span></div> -->
                <xsl:variable name="data">
                    <xsl:text>t=The marker before this marker is not allowed. It should be one of 
e=\sl1 
t=or 
e=\mlor </xsl:text>
                </xsl:variable>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="$v"/>
                    <xsl:with-param name="sty" select="@style"/>
                    <xsl:with-param name="data" select="$data"/>
                    <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                    <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                    <!-- <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/> -->
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$child-style-1 = 'tbb'">
            <xsl:if test="$post-3-child-style-1  != 'tbb'">
                <xsl:variable name="data">
                    <xsl:text>t=There is no matching 
e=\tbb __\tbb* 
t=character markup in the 2nd meaning.</xsl:text>
                </xsl:variable>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="$v"/>
                    <xsl:with-param name="sty" select="'\ml1 [2] '"/>
                    <xsl:with-param name="data" select="$data"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="$post-5-child-style-1 != 'tbb'">
                <xsl:variable name="data">
                    <xsl:text>t=There is no matching 
e=\tbb __\tbb*
t=character markup in the 3nd meaning.</xsl:text>
                </xsl:variable>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="$v"/>
                    <xsl:with-param name="sty" select="'\ml1 [3] '"/>
                    <xsl:with-param name="data" select="$data"/>
                </xsl:call-template>
            </xsl:if>
            <!--  <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>Is the marker <span class="example">\tbb</span> allowed here??</div>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="$v"/>
                    <xsl:with-param name="sty" select="@style"/>
                    <xsl:with-param name="data">
                        <t>Is the marker </t>
                        <e>\tbb </e>
                        <t>allowed here. </t>
                    </xsl:with-param>
                </xsl:call-template> -->
        </xsl:if>
    </xsl:template>
    <xsl:template match="para[@style = 'mlor']">
        <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
        <!-- <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/> -->
        <!-- <xsl:variable name="post-style-2" select="following-sibling::*[2]/@style"/> -->
        <!-- <xsl:variable name="post-style-3" select="following-sibling::*[3]/@style"/> -->
        <!-- <xsl:variable name="child-style-1" select="*[1]/@style"/> -->
        <!-- <xsl:variable name="post-3-child-style-1" select="following-sibling::*[3][@style ='ml1']/*[1]/@style"/> -->
        <!-- <xsl:variable name="post-5-child-style-1" select="following-sibling::*[5][@style ='ml1']/*[1]/@style"/> -->
        <xsl:variable name="pre-text-1" select="preceding-sibling::*[1]/text()"/>
        <xsl:variable name="v">
            <xsl:call-template name="verse">
                <xsl:with-param name="ref" select="normalize-space(preceding-sibling::*[@style = 'sl1'][1]/text()[1])"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test=". = '-OR-'">
            <!-- SC11 -->
            <xsl:variable name="data">
                <xsl:text>t=SC11 The case of this field should be lower case. It should be 
e=-or-</xsl:text>
            </xsl:variable>
            <xsl:call-template name="error">
                <xsl:with-param name="v" select="$v"/>
                <xsl:with-param name="sty" select="@style"/>
                <xsl:with-param name="data" select="$data"/>
                <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                <!-- <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/> -->
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template match="table">
        <xsl:if test="count(row) > 1">
            <xsl:if test="following-sibling::*[@style = 'b']">
                <xsl:variable name="data">
                    <xsl:text>t=Only one 
e=\tr 
t=is allowed. Empty ones should be removed.</xsl:text>
                </xsl:variable>
                <xsl:call-template name="error">
                    <xsl:with-param name="v" select="preceding::verse[1]/@number"/>
                    <xsl:with-param name="sty" select="'tr'"/>
                    <xsl:with-param name="data" select="$data"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
        <xsl:apply-templates select="*/*"/>
    </xsl:template>
    <xsl:template match="cell">
        <xsl:variable name="v">
            <xsl:value-of select="preceding::verse[1]/@number"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="following::para[1]/text()[1]"/>
        </xsl:variable>
        <xsl:if test="count(char[@style = 'sbx']) != 2">
            <!-- SC1 -->
            <xsl:variable name="data">
                <xsl:text>t=SC1 There should be two 
e=\sbx 
t=character markups in this 
e=\tr </xsl:text>
            </xsl:variable>
            <xsl:call-template name="error">
                <xsl:with-param name="v" select="$v"/>
                <xsl:with-param name="sty" select="@style"/>
                <xsl:with-param name="data" select="$data"/>
                <!-- <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/> -->
                <!-- <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/> -->
                <!-- <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/> -->
                <xsl:with-param name="curcontent" select="."/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="count(char[@style = 'tbb'])  != 1">
            <!-- SC1 -->
            <xsl:variable name="data">
                <xsl:text>t=SC1 There should be one 
e=\tbb __\tbb*
t= element in this 
e=\tr </xsl:text>
            </xsl:variable>
            <xsl:call-template name="error">
                <xsl:with-param name="v" select="$v"/>
                <xsl:with-param name="sty" select="@style"/>
                <xsl:with-param name="data" select="$data"/>
                <xsl:with-param name="curcontent" select="."/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template name="error">
        <xsl:param name="v"/>
        <xsl:param name="sty"/>
        <xsl:param name="data"/>
        <xsl:param name="precontext"/>
        <xsl:param name="curcontext"/>
        <xsl:param name="postcontext"/>
        <xsl:param name="curcontent"/>
        <div class="error">
            <span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="$sty"/>&#x2003;</span>
            <xsl:call-template name="parsedata">
                <xsl:with-param name="text" select="$data"/>
            </xsl:call-template>
            <xsl:if test="$curcontext">
                <br/>
                <xsl:text>Context: </xsl:text>
                <span class="context">
                    <xsl:if test="$precontext">
                        <xsl:call-template name="parsecontext">
                            <xsl:with-param name="text" select="$precontext"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="$curcontent">
                            <xsl:apply-templates select="$curcontent/node()" mode="inpara"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="parsecontext">
                                <xsl:with-param name="text" select="$curcontext"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="$postcontext">
                        <xsl:call-template name="parsecontext">
                            <xsl:with-param name="text" select="$postcontext"/>
                        </xsl:call-template>
                    </xsl:if>
                </span>
            </xsl:if>
        </div>
    </xsl:template>
    <xsl:template name="parsedata">
        <xsl:param name="text"/>
        <xsl:variable name="first" select="substring-before($text,'&#10;')"/>
        <xsl:variable name="rest" select="substring-after($text,'&#10;')"/>
        <xsl:choose>
            <xsl:when test="string-length($rest) = 0">
                <xsl:call-template name="parsefield">
                    <xsl:with-param name="text" select="$text"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="parsefield">
                    <xsl:with-param name="text" select="$first"/>
                </xsl:call-template>
                <xsl:call-template name="parsedata">
                    <xsl:with-param name="text" select="$rest"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="parsefield">
        <xsl:param name="text"/>
        <xsl:variable name="type" select="substring-before($text,'=')"/>
        <xsl:variable name="rest" select="substring-after($text,'=')"/>
        <xsl:choose>
            <xsl:when test="$type = 'e'">
                <span class="example">
                    <xsl:value-of select="$rest"/>
                </span>
            </xsl:when>
            <xsl:when test="$type = 'c'">
                <br/>
                <xsl:text>Context: </xsl:text>
                <br/>
                <span class="context">
                    <xsl:value-of select="$rest"/>
                </span>
            </xsl:when>
            <xsl:when test="$type = 'b'">
                <br/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$rest"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="parsecontext">
        <xsl:param name="text"/>
        <xsl:variable name="type" select="substring-before($text,'=')"/>
        <xsl:variable name="sty" select="substring-before(substring-after($text,'='),'=')"/>
        <xsl:variable name="txt" select="substring-after(substring-after($text,'='),'=')"/>
        <xsl:if test="$type = 'para'">
            <br/>
        </xsl:if>
        <xsl:if test="string-length($sty) > 0">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="$sty"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:value-of select="$txt"/>
        <xsl:if test="string-length($sty) > 0">
            <xsl:if test="$type = 'char'">
                <xsl:text>\</xsl:text>
                <xsl:value-of select="$sty"/>
                <xsl:text>* </xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    <xsl:template match="char">
        <!-- handle character styles -->
        <xsl:variable name="pre-style-1" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="pre-text-1" select="preceding-sibling::*[1]/text()"/>
        <xsl:variable name="post-style-1" select="following-sibling::*[1]/@style"/>
        <xsl:variable name="child-style-1" select="child::*[1]/@style"/>
        <xsl:variable name="post-text-1" select="following-sibling::*[1]/text()"/>
        <xsl:variable name="v" select="normalize-space(preceding::*[@style = 'sl1'][1]/text()[1])"/>
        <xsl:variable name="pos" select="count(preceding-sibling::node())+ 1"/>
        <xsl:variable name="text" select="."/>
        <xsl:choose>
            <xsl:when test="@style = 'brk'">
                <xsl:variable name="post-char-1" select="substring($post-text-1,1,1)"/>
                <xsl:choose>
                    <xsl:when test="@closed = 'false'">
                        <!-- SC9 Handles non closed \brk markup -->
                        <xsl:variable name="data">
                            <xsl:text>t= SC9 The character marker
e=\brk
t= is not closed with a 
e=\bk*
t= marker. There may also be other non allowed text besides the allowed 
e=⌊⌋
t= marks.</xsl:text>
                        </xsl:variable>
                        <xsl:call-template name="error">
                            <xsl:with-param name="v" select="$v"/>
                            <xsl:with-param name="sty" select="@style"/>
                            <xsl:with-param name="data" select="$data"/>
                            <!-- <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/> -->
                            <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                            <!-- <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/> -->
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test=". = '⌋'"/>
                    <xsl:when test=". = '⌊'"/>
                    <xsl:when test="normalize-space(.) = '⌋'">
                        <!-- <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is extra space after or before the <span class="example">⌋</span> character. <br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span></div> -->
                        <xsl:variable name="data">
                            <xsl:text>t=There is extra space after or before the 
e=⌋ 
t=character. </xsl:text>
                        </xsl:variable>
                        <xsl:call-template name="error">
                            <xsl:with-param name="v" select="$v"/>
                            <xsl:with-param name="sty" select="@style"/>
                            <xsl:with-param name="data" select="$data"/>
                            <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                            <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                            <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="normalize-space(.) = '⌊'">
                        <!-- <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is extra space after or before the <span class="example">⌊</span> character.<br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span></div> -->
                        <xsl:variable name="data">
                            <xsl:text>t=There is extra space after or before the 
e=⌊ 
t=character. </xsl:text>
                        </xsl:variable>
                        <xsl:call-template name="error">
                            <xsl:with-param name="v" select="$v"/>
                            <xsl:with-param name="sty" select="@style"/>
                            <xsl:with-param name="data" select="$data"/>
                            <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                            <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                            <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test=". = '⌋' and $post-char-1 != ' '">
                        <!-- SC7 Checks if the character following a \brk* is a space -->
                        <xsl:variable name="data">
                            <xsl:text>t=SC7  The character following a 
e=\brk*
t= must be a space.</xsl:text>
                        </xsl:variable>
                        <xsl:call-template name="error">
                            <xsl:with-param name="v" select="$v"/>
                            <xsl:with-param name="sty" select="@style"/>
                            <xsl:with-param name="data" select="$data"/>
                            <!-- <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/> -->
                            <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                            <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="string-length(normalize-space(.))  = 0">
                        <!-- <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>This character marker is empty. Should be <span class="example">⌊</span> or <span class="example">⌋</span> character. <br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span> </div> -->
                        <xsl:variable name="data">
                            <xsl:text>t=This character marker is empty. Should be one of 
e=⌊
t= or 
e=⌋
t= character. 
</xsl:text>
                        </xsl:variable>
                        <xsl:call-template name="error">
                            <xsl:with-param name="v" select="$v"/>
                            <xsl:with-param name="sty" select="@style"/>
                            <xsl:with-param name="data" select="$data"/>
                            <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                            <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                            <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- SC8 other characters not allowed in \brk -->
                        <!-- <div class="error"><span class="verse"><xsl:value-of select="$v"/> \<xsl:value-of select="@style"/>&#x2003;</span>There is text that is not allowed in the \brk marker. It appears to contains other text: <span class="example"><xsl:value-of select="."/></span> and or not be closed. <br />Context: <span class="context"><xsl:value-of select="preceding-sibling::node()[1]"/> \brk <xsl:value-of select="."/>\brk* <xsl:value-of select="following-sibling::node()[1]"/></span></div> -->
                        <xsl:variable name="data">
                            <xsl:text>t=SC8 There is text that is not allowed in the 
e=\brk 
t= marker. I should only be 
e=⌊
t= or 
e=⌋
t= characters.  It contains other text. 
</xsl:text>
                        </xsl:variable>
                        <xsl:call-template name="error">
                            <xsl:with-param name="v" select="$v"/>
                            <xsl:with-param name="sty" select="@style"/>
                            <xsl:with-param name="data" select="$data"/>
                            <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                            <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                            <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@style = 'imp'">
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
            <xsl:when test="@style = 'rgm' or @style = 'rgi'">
                <!-- SC6 \rgm and \rgi must immediately follow a puctuation mark -->
                <xsl:variable name="pre-char" select="substring($pre-text-1,string-length($pre-text-1) -1,1)"/>
                <xsl:choose>
                    <xsl:when test="$pre-char = ',' or $pre-char = '.' or $pre-char = '?' or $pre-char = '!' or $pre-char = ':' or $pre-char = ';' ">
                        <xsl:text><!-- This is a correct match --></xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="data">
                            <xsl:text>t=SC6 The preceding character to this style should be one of these  
e=,.?!:; 
t= characters. </xsl:text>
                        </xsl:variable>
                        <xsl:call-template name="error">
                            <xsl:with-param name="v" select="$v"/>
                            <xsl:with-param name="sty" select="@style"/>
                            <xsl:with-param name="data" select="$data"/>
                            <xsl:with-param name="precontext" select="concat(name(),'=',$pre-style-1,'=',$pre-text-1)"/>
                            <xsl:with-param name="curcontext" select="concat(name(),'=',@style,'=',.)"/>
                            <!-- <xsl:with-param name="postcontext" select="concat(name(),'=',$post-style-1,'=',$post-text-1)"/> -->
                        </xsl:call-template>
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
            .example {color:firebrick;background:palegoldenrod;}
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
    <xsl:template match="char" mode="inpara">
        <xsl:text>\</xsl:text>
        <xsl:value-of select="@style"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>\</xsl:text>
        <xsl:value-of select="@style"/>
        <xsl:text>*</xsl:text>
    </xsl:template>
    <xsl:template match="text()" mode="inpara">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>

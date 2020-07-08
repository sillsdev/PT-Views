<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	TNDD-test2.xslt
    # Purpose:  	Combine first \ml1 and make into paragraphs count sentences and words and give average words per sentence.
    # Part of:  		Xrunner - https://github.com/SILAsiaPub/xrunner
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2020-07-03
    # Copyright:	(c) 2020 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://exslt.org/strings" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl str">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:variable name="step1">
        <xsl:apply-templates select="/*/*" mode="s1"/>
    </xsl:variable>
    <xsl:variable name="step2">
        <xsl:call-template name="reorder-para">
            <xsl:with-param name="string" select="$step1"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="step3">
        <xsl:call-template name="reorder-quotes">
            <xsl:with-param name="string" select="$step2"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:template match="/*">
        <xsl:apply-templates select="chapter"/>
    </xsl:template>
    <xsl:template match="chapter">
        <xsl:element name="style">
            <xsl:attribute name="type">
                <xsl:text>text/css</xsl:text>
            </xsl:attribute>
            <xsl:text>            .sentence {display:block;max-width:90%;}
            .sentence:nth-of-type(odd) {background:#e0e0e0}
            .words {display:inline-block;padding: 0 0 3pt 3pt;}
            .count {display:inline-block;width:35px;font-weight:bold;padding: 0 1em 0 1em}
            .lt9, .green {background:lawngreen}
            .yellow {background:yellow}
            .gold {background:gold}
            .orange {background:orange}
            .darkorange {background:darkorange}
            .tomato {background:tomato}
            .red {background:red}
            table {margin-left: 3em}
</xsl:text>
        </xsl:element>
       <!--  <xsl:element name="table">
            <xsl:element name="tr">
                <xsl:element name="th">
                    <xsl:text>Color key</xsl:text>
                </xsl:element>
                <xsl:element name="th">
                    <xsl:text>Min</xsl:text>
                </xsl:element>
                <xsl:element name="th">
                    <xsl:text>Max</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>green</xsl:text>
                    </xsl:attribute>
                    <xsl:text>green</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>-</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>8</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>yellow</xsl:text>
                    </xsl:attribute>
                    <xsl:text>yellow</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>9</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>11</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>gold</xsl:text>
                    </xsl:attribute>
                    <xsl:text>gold</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>12</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>17</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>orange</xsl:text>
                    </xsl:attribute>
                    <xsl:text>orange</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>18</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>21</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>darkorange</xsl:text>
                    </xsl:attribute>
                    <xsl:text>darkorange</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>22</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>25</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>tomato</xsl:text>
                    </xsl:attribute>
                    <xsl:text>tomato</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>26</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>29</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>red</xsl:text>
                    </xsl:attribute>
                    <xsl:text>red</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>30</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:text>-</xsl:text>
                </xsl:element>
            </xsl:element>
        </xsl:element> -->
        <xsl:call-template name="parse-sent">
            <xsl:with-param name="string" select="$step3"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="parse-sent">
        <xsl:param name="string"/>
        <xsl:param name="eosp"/>
        <xsl:choose>
            <xsl:when test="contains($string,'.')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,'.')"/>
                    <xsl:with-param name="eosp" select="'.'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,'.')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'?')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,'?')"/>
                    <xsl:with-param name="eosp" select="'?'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,'?')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'!')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,'!')"/>
                    <xsl:with-param name="eosp" select="'!'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,'!')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,':')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,':')"/>
                    <xsl:with-param name="eosp" select="':'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,':')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="word-count">
                    <xsl:call-template name="wordCount">
                        <xsl:with-param name="input" select="$string"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>sentence</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>count </xsl:text>
                            <xsl:call-template name="count-color">
                                <xsl:with-param name="words" select="$word-count"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="$word-count"/>
                    </xsl:element>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>words</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="$string"/>
                        <xsl:value-of select="$eosp"/>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="verse|chapter" mode="s1">
        <xsl:if test="name() = 'chapter'">
            <xsl:text>[</xsl:text>
        </xsl:if>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="@number"/>
        <xsl:text>]</xsl:text>
        <xsl:if test="name() = 'chapter'">
            <xsl:text>]</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*" mode="s1"/>
    <xsl:template match="char[@style = 'imp']" mode="s1">
        <xsl:text>{</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="annot" mode="s1">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="text()" mode="s1">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="*[@style = 'ml1']" mode="s1">
        <xsl:variable name="pre-style" select="preceding-sibling::*[1]/@style"/>
        <xsl:variable name="pre-style2" select="preceding-sibling::*[2]/@style"/>
        <xsl:if test="$pre-style = 'sl1' or $pre-style2 = 'sl1' ">
            <xsl:apply-templates mode="s1"/>
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*[@style = 'brk']" mode="s1"/>
    <xsl:template match="*[@style = 'tbb']" mode="s1"/>
    <xsl:template match="*[@style = 'p']" mode="s1">
        <xsl:apply-templates mode="s1"/>
    </xsl:template>
    <xsl:template name="wordCount">
        <xsl:param name="input"/>
        <xsl:param name="sep" select="'‒–—―'"/>
        <xsl:variable name="big">
            <xsl:value-of select="normalize-space(translate($input, $sep, ' '))"/>
        </xsl:variable>
        <xsl:variable name="small">
            <xsl:value-of select="translate($big, ' ', '')"/>
        </xsl:variable>
        <xsl:value-of select="string-length($big) - string-length($small) + 1"/>
    </xsl:template>
    <xsl:template name="reorder-para">
        <xsl:param name="string"/>
        <xsl:choose>
            <xsl:when test="contains($string,']¶')">
                <xsl:variable name="beforepara" select="substring-before($string,']¶')"/>
                <xsl:variable name="bp-length" select="string-length($beforepara)"/>
                <xsl:variable name="afterpara" select="substring-after($string,']¶')"/>
                <xsl:variable name="before-4" select="substring($beforepara,$bp-length - 3,1)"/>
                <xsl:variable name="before-3" select="substring($beforepara,$bp-length - 2,1)"/>
                <xsl:variable name="before-2" select="substring($beforepara,$bp-length - 1,1)"/>
                <xsl:choose>
                    <xsl:when test="$before-4 = '['">
                        <xsl:variable name="char-len" select="3"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1)"/>
                        <xsl:text> ¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) +2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:when test="$before-3 = '['">
                        <xsl:variable name="char-len" select="2"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1)"/>
                        <xsl:text> ¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) +2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:when test="$before-2 = '['">
                        <xsl:variable name="char-len" select="1"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1 )"/>
                        <xsl:text> ¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) + 2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>fatal flaw</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:call-template name="reorder-para">
                    <xsl:with-param name="string" select="$afterpara"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="reorder-quotes">
        <xsl:param name="string"/>
        <xsl:choose>
<!-- handle double smart quotes after sentence end punct -->
            <xsl:when test="contains($string,'.”')">
                <xsl:variable name="pre-str" select="substring-before($string,'.”')"/>
                <xsl:variable name="post-str" select="substring-after($string,'.”')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'”.',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'?”')">
                <xsl:variable name="pre-str" select="substring-before($string,'?”')"/>
                <xsl:variable name="post-str" select="substring-after($string,'?”')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'”?',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'!”')">
                <xsl:variable name="pre-str" select="substring-before($string,'!”')"/>
                <xsl:variable name="post-str" select="substring-after($string,'!”')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'”!',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,':”')">
                <xsl:variable name="pre-str" select="substring-before($string,':”')"/>
                <xsl:variable name="post-str" select="substring-after($string,'!”')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'”:',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
<!-- handle single smart quotes after sentence end punct -->
            <xsl:when test="contains($string,'.’')">
                <xsl:variable name="pre-str" select="substring-before($string,'.’')"/>
                <xsl:variable name="post-str" select="substring-after($string,'.’')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'’.',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'?’')">
                <xsl:variable name="pre-str" select="substring-before($string,'?’')"/>
                <xsl:variable name="post-str" select="substring-after($string,'?’')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'’?',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'!’')">
                <xsl:variable name="pre-str" select="substring-before($string,'!’')"/>
                <xsl:variable name="post-str" select="substring-after($string,'!’')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'’!',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,':’')">
                <xsl:variable name="pre-str" select="substring-before($string,':’')"/>
                <xsl:variable name="post-str" select="substring-after($string,'!’')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'’:',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
<!-- handle " double straight quotes after sentence end punct -->
            <xsl:when test="contains($string,'.&#34;')">
                <xsl:variable name="pre-str" select="substring-before($string,'.&#34;')"/>
                <xsl:variable name="post-str" select="substring-after($string,'.&#34;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#34;.',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'?&#34;')">
                <xsl:variable name="pre-str" select="substring-before($string,'?&#34;')"/>
                <xsl:variable name="post-str" select="substring-after($string,'?&#34;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#34;?',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'!&#34;')">
                <xsl:variable name="pre-str" select="substring-before($string,'!&#34;')"/>
                <xsl:variable name="post-str" select="substring-after($string,'!&#34;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#34;!',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,':&#34;')">
                <xsl:variable name="pre-str" select="substring-before($string,':&#34;')"/>
                <xsl:variable name="post-str" select="substring-after($string,':&#34;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#34;:',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
<!-- handle hair space u200A after sentence end punct assuming it is between a single and double quote -->
            <xsl:when test="contains($string,'.&#x200A;')">
                <xsl:variable name="pre-str" select="substring-before($string,'.&#x200A;')"/>
                <xsl:variable name="post-str" select="substring-after($string,'.&#x200A;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#x200A;.',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'?&#x200A;')">
                <xsl:variable name="pre-str" select="substring-before($string,'?&#x200A;')"/>
                <xsl:variable name="post-str" select="substring-after($string,'?&#x200A;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#x200A;?',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'!&#x200A;')">
                <xsl:variable name="pre-str" select="substring-before($string,'!&#x200A;')"/>
                <xsl:variable name="post-str" select="substring-after($string,'!&#x200A;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#x200A;!',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,':&#x200A;')">
                <xsl:variable name="pre-str" select="substring-before($string,':&#x200A;')"/>
                <xsl:variable name="post-str" select="substring-after($string,':&#x200A;')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'&#x200A;:',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
<!-- handle } after sentence end punct -->
            <xsl:when test="contains($string,'.}')">
                <xsl:variable name="pre-str" select="substring-before($string,'.}')"/>
                <xsl:variable name="post-str" select="substring-after($string,'.}')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'}.',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'?}')">
                <xsl:variable name="pre-str" select="substring-before($string,'?}')"/>
                <xsl:variable name="post-str" select="substring-after($string,'?}')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'}?',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'!}')">
                <xsl:variable name="pre-str" select="substring-before($string,'!}')"/>
                <xsl:variable name="post-str" select="substring-after($string,'!}')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'}!',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,':}')">
                <xsl:variable name="pre-str" select="substring-before($string,':}')"/>
                <xsl:variable name="post-str" select="substring-after($string,':}')"/>
                <xsl:call-template name="reorder-quotes">
                    <xsl:with-param name="string" select="concat($pre-str,'}:',$post-str)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="count-color">
        <xsl:param name="words"/>
<xsl:if test="number($words) &gt; 17">
tomato
</xsl:if>
        <!-- <xsl:choose>
            <xsl:when test="number($words) &lt; 9">
                <xsl:text>green</xsl:text>
            </xsl:when>
            <xsl:when test="number($words) &gt; 8 and number($words) &lt; 12">
                <xsl:text>yellow</xsl:text>
            </xsl:when>
            <xsl:when test="number($words) &gt; 11 and number($words) &lt; 18">
                <xsl:text>gold</xsl:text>
            </xsl:when>
            <xsl:when test="number($words) &gt; 17 and number($words) &lt; 22">
                <xsl:text>orange</xsl:text>
            </xsl:when>
            <xsl:when test="number($words) &gt; 21 and number($words) &lt; 26">
                <xsl:text>darkorange</xsl:text>
            </xsl:when>
            <xsl:when test="number($words) &gt; 25 and number($words) &lt; 30">
                <xsl:text>tomato</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>red</xsl:text>
            </xsl:otherwise>
        </xsl:choose> -->
    </xsl:template>
</xsl:stylesheet>

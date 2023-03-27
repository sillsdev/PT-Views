<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	TNDD-word-count-1st-mng-line.xslt
    # Purpose:  	Combine first \ml1 and make into paragraphs count words per sentence.
    # Part of:  		https://github.com/SILAsiaPub/PT-views
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2020-07-08
    # Copyright:	(c) 2020 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://exslt.org/strings" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl str">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Define the color levels and colors-->
    <xsl:variable name="level1" select="17"/>
    <xsl:variable name="color1" select="'orange'"/>
    <xsl:variable name="level2" select="30"/>
    <xsl:variable name="color2" select="'red'"/>
    <xsl:variable name="level3" select="0"/>
    <xsl:variable name="color3" select="''"/>
    <!-- get the data in a string
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
    </xsl:variable> -->
    <xsl:template match="/*">
        <xsl:apply-templates select="*[preceding-sibling::chapter]|chapter"/>
    </xsl:template>
    <xsl:template match="chapter[@style]">
        <xsl:element name="style">
            <xsl:attribute name="type">
                <xsl:text>text/css</xsl:text>
            </xsl:attribute>
            <xsl:text>            .sentence {max-width:90%;}
            tr:nth-of-type(odd) {background:#e0e0e0}
            .words {padding: 0 0 3pt 3pt;}
            .count {width:5em;font-weight:bold;padding: 0 1em 0 1em;text-align:right;}
            .lt9, .green {background:lawngreen}
            .yellow {background:yellow}
            .gold {background:gold}
            .orange {background:orange}
            .darkorange {background:darkorange}
            .tomato {background:tomato}
            .red {background:red}
            table {margin-left: 1em; width:95%}
            table caption {font-weight:bold;font-size:120%;background:greenyellow;}
		th {background:peachpuff;}
            .subcap {font-size:85%;font-weight:normal;}
		.versediv {color:navy;font-weight:bold;font-family:Arial;background:cyan;}
	    </xsl:text>
        </xsl:element>
        <xsl:element name="table">
            <caption>
                <xsl:text>Word count per sentence for 1st meaning line,</xsl:text>
                <xsl:if test="$level1 &gt; 0">
                    <br/>
                    <xsl:value-of select="$color1"/>
                    <xsl:text> on the left marks sentences with over </xsl:text>
                    <xsl:value-of select="$level1"/>
                    <xsl:text> words.</xsl:text>
                </xsl:if>
                <xsl:if test="$level2 &gt; 0">
                    <br/>
                    <xsl:value-of select="$color2"/>
                    <xsl:text> on the left marks sentences with over </xsl:text>
                    <xsl:value-of select="$level2"/>
                    <xsl:text> words.</xsl:text>
                </xsl:if>
                <xsl:if test="$level3 &gt; 0">
                    <br/>
                    <xsl:value-of select="$color3"/>
                    <xsl:text> on the left marks sentences with over </xsl:text>
                    <xsl:value-of select="$level3"/>
                    <xsl:text> words.</xsl:text>
                </xsl:if>
            </caption>
            <xsl:element name="tr">
                <xsl:element name="th">
                    <xsl:attribute name="class">
                        <xsl:text>count</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Word count</xsl:text>
                </xsl:element>
                <xsl:element name="th">
                    <xsl:text>Sentence</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:apply-templates select="*"/>
            <!-- <xsl:call-template name="parse-sent">
                <xsl:with-param name="string" select="$step3"/>
            </xsl:call-template> -->
        </xsl:element>
    </xsl:template>
    <xsl:template name="parse-sent">
        <xsl:param name="string"/>
        <xsl:param name="eosp"/>
        <xsl:choose>
            <xsl:when test="contains($string,'. ')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,'. ')"/>
                    <xsl:with-param name="eosp" select="'.'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,'. ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'? ')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,'? ')"/>
                    <xsl:with-param name="eosp" select="'?'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,'? ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,'! ')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,'! ')"/>
                    <xsl:with-param name="eosp" select="'!'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,'! ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,': ')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,': ')"/>
                    <xsl:with-param name="eosp" select="':'"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,': ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="word-count">
                    <xsl:call-template name="wordCount">
                        <xsl:with-param name="input" select="$string"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:attribute name="class">
                            <xsl:text>count </xsl:text>
                            <xsl:call-template name="count-color">
                                <xsl:with-param name="words" select="$word-count"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="$word-count"/>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:attribute name="class">
                            <xsl:text>words</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="translate($string,'^',':')"/>
                        <xsl:value-of select="$eosp"/>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="*[@style = 's5']">
        <xsl:element name="table">
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>count</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>versediv</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*"/>
    <xsl:template match="text()" mode="s1">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="*[@style = 'n1']|*[@style = 'n2']|*[@style = 'n3']|*[@style = 'ntn']">
        <xsl:variable name="step1">
            <xsl:apply-templates select="node()" mode="s1"/>
        </xsl:variable>
        <xsl:variable name="step2">
            <xsl:call-template name="reorder-quotes">
                <xsl:with-param name="string" select="$step1"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:element name="table">
<tr>
<th></th>
<th><xsl:value-of select="concat('\',@style)"/></th>
</tr>
            <xsl:call-template name="parse-sent">
                <xsl:with-param name="string" select="$step2"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*[@style = 'tec']" mode="s1"/>
<xsl:template match="*[@style = 'f']" mode="s1"/>
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
                <xsl:variable name="before-7" select="substring($beforepara,$bp-length - 6,1)"/>
                <xsl:variable name="before-6" select="substring($beforepara,$bp-length - 5,1)"/>
                <xsl:variable name="before-5" select="substring($beforepara,$bp-length - 4,1)"/>
                <xsl:variable name="before-4" select="substring($beforepara,$bp-length - 3,1)"/>
                <xsl:variable name="before-3" select="substring($beforepara,$bp-length - 2,1)"/>
                <xsl:variable name="before-2" select="substring($beforepara,$bp-length - 1,1)"/>
                <xsl:choose>
                    <xsl:when test="$before-7 = '['">
                        <xsl:variable name="char-len" select="6"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1)"/>
                        <xsl:text>¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) +2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:when test="$before-6 = '['">
                        <xsl:variable name="char-len" select="5"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1)"/>
                        <xsl:text>¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) +2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:when test="$before-5 = '['">
                        <xsl:variable name="char-len" select="4"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1)"/>
                        <xsl:text>¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) +2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:when test="$before-4 = '['">
                        <xsl:variable name="char-len" select="3"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1)"/>
                        <xsl:text>¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) +2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:when test="$before-3 = '['">
                        <xsl:variable name="char-len" select="2"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1)"/>
                        <xsl:text>¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) +2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:when test="$before-2 = '['">
                        <xsl:variable name="char-len" select="1"/>
                        <xsl:value-of select="substring($beforepara,1,$bp-length - number($char-len) - 1 )"/>
                        <xsl:text>¶</xsl:text>
                        <xsl:value-of select="substring($beforepara,$bp-length - number($char-len),number($char-len) + 2)"/>
                        <xsl:text>]</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>fatal flaw </xsl:text>
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
        <xsl:choose>
            <xsl:when test="number($level3) &gt; number($level1) and number($words) &gt; number($level3)">
                <xsl:value-of select="$color3"/>
            </xsl:when>
            <xsl:when test="number($level2) &gt; number($level1) and number($words) &gt; number($level2)">
                <xsl:value-of select="$color2"/>
            </xsl:when>
            <xsl:when test="number($words) &gt; number($level1)">
                <xsl:value-of select="$color1"/>
            </xsl:when>
            <xsl:otherwise>
		<!-- no color -->
	     </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

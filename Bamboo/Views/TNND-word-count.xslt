<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	TNDD-word-count-1st-mng-line.xslt
    # Purpose:  	Combine first \ml1 and make into paragraphs count words per sentence.
    # Part of:  		https://github.com/SILAsiaPub/PT-views
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2020-07-08 Modified: v2 2023-04-21, v3 2023-04-22
    # Copyright:	(c) 2023 SIL International
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
    <!-- basic forms -->
    <xsl:variable name="periodspace" select="'. '"/>
    <xsl:variable name="questspace" select="'? '"/>
    <xsl:variable name="exclamspace" select="'! '"/>
    <xsl:variable name="colonspace" select="': '"/>
    <!-- end followed by right double quote -->
    <xsl:variable name="periodrdqsp" select="'.” '"/>
    <xsl:variable name="questrdqsp" select="'?” '"/>
    <xsl:variable name="exclamrdqsp" select="'!” '"/>
    <xsl:variable name="colonrdqsp" select="':” '"/>
    <!-- end followed by right single quote -->
    <xsl:variable name="periodrsqsp" select="'.’ '"/>
    <xsl:variable name="questrsqsp" select="'?’ '"/>
    <xsl:variable name="exclamrsqsp" select="'!’ '"/>
    <xsl:variable name="colonrsqsp" select="':’ '"/>
    <!-- end followed by " -->
    <xsl:variable name="perioddqsp" select="'.&#34; '"/>
    <xsl:variable name="questdqsp" select="'?&#34; '"/>
    <xsl:variable name="exclamdqsp" select="'!&#34; '"/>
    <xsl:variable name="colondqsp" select="':&#34; '"/>
    <!-- end followed by ) -->
    <xsl:variable name="periodrrbsp" select="'.) '"/>
    <xsl:variable name="questrrbsp" select="'?) '"/>
    <xsl:variable name="exclamrrbsp" select="'!) '"/>
    <xsl:variable name="colonrrbsp" select="':) '"/>
    <!-- end followed by } -->
    <xsl:variable name="periodrcbsp" select="'.} '"/>
    <xsl:variable name="questrcbsp" select="'?} '"/>
    <xsl:variable name="exclamrcbsp" select="'!} '"/>
    <xsl:variable name="colonrcbsp" select="':} '"/>
    <!-- end followed by ] -->
    <xsl:variable name="periodrsbsp" select="'.] '"/>
    <xsl:variable name="questrsbsp" select="'?] '"/>
    <xsl:variable name="exclamrsbsp" select="'!] '"/>
    <xsl:variable name="colonrsbsp" select="':] '"/>
    <xsl:template match="/*">
        <xsl:apply-templates select="chapter[@number]|*"/>
    </xsl:template>
    <xsl:template match="chapter[@style][count(preceding::chapter) > 0]">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>c</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="@number"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="chapter[@style][count(preceding::chapter) = 0]">
        <xsl:element name="style">
            <xsl:attribute name="type">
                <xsl:text>text/css</xsl:text>
            </xsl:attribute>
            <xsl:text>            .sentence {max-width:90%;}
            tr:nth-of-type(odd) {background:#e0e0e0}
            .words {padding: 0 0 3pt 3pt;}
		.style {font-weight:bold;background:peachpuff;}
            .count {font-weight:bold;text-align:right;padding-right:6px;}
            .lt9, .green {background:lawngreen}
            .yellow {background:yellow}
            .gold {background:gold}
            .orange {background:orange}
            .darkorange {background:darkorange}
            .tomato {background:tomato}
            .red {background:red}
            table.s5 {margin-left: 0em; width:95%}
		table.header {margin-left: 0em; width:95%}
            table caption {font-weight:bold;font-size:120%;background:greenyellow;}
		th {background:peachpuff;}
            .subcap {font-size:85%;font-weight:normal;}
		.versediv {color:navy;font-weight:bold;font-family:Arial;background:cyan;}
		.versepara {font-weight:bold;font-family:Arial;background:greenyellow;}
		.w3 {width:3em;padding-left:0em;}
		.w6 {width:6em;}
		.w2 {width:2em;}
		div.c {text-align:center; font-weight:bold;font-size:30pt;background:lawngreen; width:95%;margin-left:0en;}
		.sfm {float:left;width:2em;font-weight:bold;font-size:16pt}
		table.para {width:95%;padding-left:0em;}
		table.para td.style {background:white;color:white;}
		table.para tr:first-child td.style {color:black;background:peachpuff;}

	    </xsl:text>
        </xsl:element>
        <xsl:element name="table">
            <xsl:attribute name="class">
                <xsl:text>header</xsl:text>
            </xsl:attribute>
            <caption>
                <xsl:text>Word count per sentence for TNND.</xsl:text>
                <xsl:if test="$level1 &gt; 0">
                    <br/>
                    <xsl:value-of select="concat(translate(substring($color1,1,1),'or','OR'),substring($color1,2))"/>
                    <xsl:text> on the left marks sentences with over </xsl:text>
                    <xsl:value-of select="$level1"/>
                    <xsl:text> words.</xsl:text>
                </xsl:if>
                <xsl:if test="$level2 &gt; 0">
                    <br/>
                    <xsl:value-of select="concat(translate(substring($color2,1,1),'or','OR'),substring($color2,2))"/>
                    <xsl:text> on the left marks sentences with over </xsl:text>
                    <xsl:value-of select="$level2"/>
                    <xsl:text> words.</xsl:text>
                </xsl:if>
                <xsl:if test="$level3 &gt; 0">
                    <br/>
                    <xsl:value-of select="concat(translate(substring($color3,1,1),'or','OR'),substring($color3,2))"/>
                    <xsl:text> on the left marks sentences with over </xsl:text>
                    <xsl:value-of select="$level3"/>
                    <xsl:text> words.</xsl:text>
                </xsl:if>
            </caption>
            <xsl:element name="tr">
                <xsl:element name="th">
                    <xsl:attribute name="class">
                        <xsl:text>w3</xsl:text>
                    </xsl:attribute>
                    <xsl:text>&#xA0;</xsl:text>
                </xsl:element>
                <xsl:element name="th">
                    <xsl:attribute name="class">
                        <xsl:text>w6</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Word</xsl:text>
                    <xsl:element name="br"/>
                    <xsl:text>count</xsl:text>
                </xsl:element>
                <xsl:element name="th">
                    <xsl:text>Sentence</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:apply-templates select="*"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*[@style = 's5']">
        <xsl:element name="table">
            <xsl:attribute name="class">
                <xsl:text>s5</xsl:text>
            </xsl:attribute>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>w3</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="concat('\',@style)"/>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>w3</xsl:text>
                    </xsl:attribute>
                    <xsl:text>&#xA0;</xsl:text>
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
    <xsl:template match="*[@style = 'b3']|*[@style = 'p']">
        <xsl:variable name="chap" select="preceding::chapter/@number"/>
        <xsl:element name="table">
            <xsl:attribute name="class">
                <xsl:text>s5</xsl:text>
            </xsl:attribute>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>w3</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="concat('\',@style)"/>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>w3</xsl:text>
                    </xsl:attribute>
                    <xsl:text>&#xA0;</xsl:text>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:attribute name="class">
                        <xsl:text>versepara</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="concat($chap,':',*[@style = 'v']/@number)"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*"/>
    <xsl:template match="text()" mode="s1">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="*[@style = 'n1' or @style = 'n2' or @style = 'n3'or @style = 'ntn' or @style = 'li1' or @style = 'hb1' or @style = 'qp'  or @style = 'qns']">
        <xsl:variable name="step1">
            <xsl:apply-templates select="node()" mode="s1"/>
        </xsl:variable>
        <xsl:variable name="step2">
            <xsl:call-template name="mark-sentence">
                <xsl:with-param name="para-string" select="$step1"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:comment><xsl:value-of select="$step2"/></xsl:comment>
        <xsl:element name="table">
            <xsl:attribute name="class">
                <xsl:text>para</xsl:text>
            </xsl:attribute>
            <xsl:call-template name="parse-sent">
                <xsl:with-param name="string" select="$step2"/>
                <xsl:with-param name="style" select="@style"/>
                 <!-- <xsl:with-param name="pos" select="0"/> -->
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*" mode="s1">
        <xsl:apply-templates select="node()" mode="s1"/>
    </xsl:template>
    <xsl:template match="*[@style = 'f']" mode="s1"/><!-- Footnotes not included -->
    <xsl:template name="parse-sent">
        <xsl:param name="string"/>
        <xsl:param name="style"/>
        <xsl:choose>
            <xsl:when test="contains($string,'±')">
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-before($string,'±')"/>
                    <xsl:with-param name="style" select="$style"/>
                </xsl:call-template>
                <xsl:call-template name="parse-sent">
                    <xsl:with-param name="string" select="substring-after($string,'±')"/>
                    <xsl:with-param name="style" select="$style"/>
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
                            <xsl:text>w3</xsl:text>
                        </xsl:attribute>
                        <xsl:if test="string-length($style) > 0">
                            <xsl:attribute name="class">
                                <xsl:text>style w3</xsl:text>
                            </xsl:attribute>
                            <xsl:value-of select="concat('\',$style)"/>
                        </xsl:if>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:attribute name="class">
                            <xsl:text>count w3 </xsl:text>
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
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
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
    <xsl:template name="mark-sentence">
        <xsl:param name="para-string"/>
        <xsl:variable name="string" select="translate($para-string,'&#x200A;','')"/>

        <xsl:choose>
            <!-- handle basic forms -->
            <xsl:when test="contains($string,$periodspace)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$periodspace"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$questspace)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$questspace"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$exclamspace)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$exclamspace"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$colonspace)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$colonspace"/>
                </xsl:call-template>
            </xsl:when>
            <!-- Handle more complex forms -->
            <!-- handle double smart quotes after sentence end punct -->
            <xsl:when test="contains($string,$periodrdqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$periodrdqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$questrdqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$questrdqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$exclamrdqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$exclamrdqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$colonrdqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$colonrdqsp"/>
                </xsl:call-template>
            </xsl:when>
            <!-- handle single smart quotes after sentence end punct -->
            <xsl:when test="contains($string,$periodrsqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$periodrsqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$questrsqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$questrsqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$exclamrsqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$exclamrsqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$colonrsqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$colonrsqsp"/>
                </xsl:call-template>
            </xsl:when>
            <!-- handle " double straight quotes after sentence end punct -->
            <xsl:when test="contains($string,$perioddqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$perioddqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$questdqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$questdqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$exclamdqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$exclamdqsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$colondqsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$colondqsp"/>
                </xsl:call-template>
            </xsl:when>
            <!-- handle ) after sentence end punct -->
            <xsl:when test="contains($string,$periodrrbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$periodrrbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$questrrbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$questrrbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$exclamrrbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$exclamrrbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$colonrrbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$colonrrbsp"/>
                </xsl:call-template>
            </xsl:when>
            <!-- handle } after sentence end punct -->
            <xsl:when test="contains($string,$periodrcbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$periodrcbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$questrcbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$questrcbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$exclamrcbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$exclamrcbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$colonrcbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$colonrcbsp"/>
                </xsl:call-template>
            </xsl:when>
            <!-- handle ] after sentence end punct -->
            <xsl:when test="contains($string,$periodrsbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$periodrsbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$questrsbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$questrsbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$exclamrsbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$exclamrsbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string,$colonrsbsp)">
                <xsl:call-template name="insert-token">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="divider" select="$colonrsbsp"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="insert-token">
        <xsl:param name="string"/>
        <xsl:param name="divider"/>
        <xsl:variable name="pre-str" select="substring-before($string,$divider)"/>
        <xsl:variable name="post-str" select="substring-after($string,$divider)"/>
        <xsl:call-template name="mark-sentence">
            <xsl:with-param name="para-string" select="concat($pre-str,translate($divider,' ',''),'±',$post-str)"/>
        </xsl:call-template>
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

<?xml version="1.0" encoding="utf-8"?>
<!--
     #############################################################
     # Name:     	data2xslt-v4.xslt
     # Purpose:  	Generate TNND schema check from flat xml.
     # Part of:  		Xrunner - https://github.com/SILAsiaPub/xrunner
     # Author:   	Ian McQuay <ian_mcquay@sil.org>
     # Created:  	2019-12-12
     # Modified:		2021-03-25; 2023-02-27; 2023-11-10; 2023-11-18; 2023-11-20
     # Copyright:	(c) 2019-2022 SIL International
     # Licence:  	<MIT>
     ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="xml"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
    <xsl:param name="dqsqoff"/>
    <xsl:include href="project.xslt"/>
    <xsl:include href="var-string.xslt"/>
    <xsl:variable name="xml-pre" select="concat($projectpath,'\output\struc-data.xml')"/>
    <xsl:variable name="static-var-xml-url" select="f:file2uri($static-var-xml)"/>
    <xsl:variable name="sfm-var-xml-url" select="f:file2uri($sfm-var-xml)"/>
    <xsl:variable name="g1">
        <xsl:for-each-group select="/*/*[string-length(disable) = 0 and string-length(Ref) gt 0]" group-by="element">
            <xsl:sort select="style"/>
            <xsl:for-each-group select="current-group()" group-by="style">
                <xsl:sort select="rank" data-type="number"/>
                <xsl:element name="{element[1]}">
                    <xsl:attribute name="style">
                        <xsl:value-of select="style[1]"/>
                    </xsl:attribute>
                    <xsl:perform-sort select="current-group()">
                        <xsl:sort select="rank" data-type="number" order="ascending"/>
                    </xsl:perform-sort>
                </xsl:element>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:template match="/">
        <!-- Start here ======================================================================================== -->
        <gen:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <xsl:call-template name="gen-static"/>
            <xsl:apply-templates select="$g1/*"/>
            <xsl:if test="$outputxml = $true">
                <xsl:call-template name="output-xml"/>
            </xsl:if>
        </gen:stylesheet>
    </xsl:template>
    <xsl:template match="para">
        <xsl:comment select="concat(' ',name(),' @style=',@style,' ')"/>
        <xsl:variable name="pred" select="if (string-length(@style) &gt; 0) then concat('[@style = ',$sq,@style,$sq,']') else '' "/>
        <gen:template match="{name()}{$pred}">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="div">
                <gen:element name="span">
                    <gen:attribute name="class">
                        <gen:value-of select="@style"/>
                        <xsl:apply-templates select="*"/>
                        <xsl:if test="string-length(@style) &gt; 0">
                            <xsl:comment select="'common para errors'"/>
                            <xsl:apply-templates select="//para[string-length(@style) = 0]/*"/>
                        </xsl:if>
                    </gen:attribute>
                    <xsl:sequence select="f:sfm(@style)"/>
                    <gen:apply-templates select="node()">
                        <gen:with-param name="embedded" select="0"/>
                    </gen:apply-templates>
                </gen:element>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="note">
        <gen:template match="note[@style = '{@style}']">
            <xsl:sequence select="f:note-start(@style)"/>
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <xsl:sequence select="f:sfm-f(@style,@caller)"/>
                <gen:apply-templates select="node()">
                    <gen:with-param name="embedded" select="0"/>
                </gen:apply-templates>
                <xsl:sequence select="f:sfm-end(@style,@closed)"/>
            </gen:element>
            <xsl:sequence select="f:note-end(@style)"/>
        </gen:template>
    </xsl:template>
    <xsl:template match="cell">
        <xsl:comment select="concat(' ',name(),' @style=',@style,' ')"/>
        <xsl:variable name="pred" select="if (string-length(@style) &gt; 0) then concat('[@style = ',$sq,@style,$sq,']') else '' "/>
        <gen:template match="{name()}{$pred}">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <xsl:value-of select="'cell '"/>
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                    <xsl:if test="string-length(@style) &gt; 0">
                        <xsl:comment select="'common cell errors'"/>
                        <xsl:apply-templates select="//cell[string-length(@style) = 0]/*"/>
                    </xsl:if>
                </gen:attribute>
                <xsl:sequence select="f:sfm(@style)"/>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="table">
        <gen:template match="{name()}">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="div">
                <gen:attribute name="class">
                    <xsl:value-of select="name()"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="char">
        <xsl:comment select="concat(' ',name(),' @style=',@style,' ')"/>
        <xsl:variable name="pred" select="if (string-length(@style) &gt; 0) then concat('[@style = ',$sq,@style,$sq,']') else '' "/>
        <gen:template match="{name()}{$pred}">
            <gen:param name="embedded"/>
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:if test="string-length(@style) &gt; 0">
                        <xsl:comment select="'common char errors'"/>
                        <xsl:apply-templates select="//char[string-length(@style) = 0]/*"/>
                    </xsl:if>
                    <xsl:comment select="'style specific errors'"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <xsl:sequence select="f:sfm(@style)"/>
                <xsl:call-template name="char-gen"/>
                <xsl:sequence select="f:sfm-end(@style,@closed)"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="figure">
        <gen:template match="figure[@style = '{@style}']">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:text>\fig </gen:text>
                <gen:element name="span">
                    <gen:attribute name="class">
                        <xsl:text>fig-attrib</xsl:text>
                    </gen:attribute>
                    <gen:apply-templates select="@*"/>
                </gen:element>
                <gen:text>\fig*</gen:text>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="link">
        <gen:template match="link[@style = '{@style}']">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:text>\jmp </gen:text>
                <gen:apply-templates select="node()"/>
                <gen:text>|</gen:text>
                <gen:element name="span">
                    <gen:attribute name="class">
                        <xsl:text>linkref</xsl:text>
                    </gen:attribute>
                    <gen:value-of select="@link-href"/>
                    <!-- <gen:apply-templates select="@*"/> -->
                </gen:element>
                <gen:text>\jmp*</gen:text>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="row">
        <xsl:comment select="concat(' ',name(),' @style=',@style,' ')"/>
        <!-- 2023-04-06 updated two following lines so \tr is matched and has variables -->
        <xsl:variable name="pred" select="if (string-length(@style) &gt; 0) then concat('[@style = ',$sq,@style,$sq,']') else '' "/>
        <gen:template match="{name()}{$pred}">
            <!-- 2023-04-06 added three following lines so variables are assigned for sfm -->
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                    <!-- 2023-04-06 removed duplicate of the above line -->
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()">
                    <gen:with-param name="embedded" select="0"/>
                </gen:apply-templates>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="*[name() = $rowname]" mode="next">
        <xsl:if test="string-length(nextstyle1) gt 0">
            <gen:variable name="{concat('next1-',translate(Ref,'.','-'))}" select="{nextstyle1}"/>
            <gen:variable name="{concat('next2-',translate(Ref,'.','-'))}" select="{nextstyle2}"/>
        </xsl:if>
    </xsl:template>
    <xsl:template name="char-gen">
        <!-- <gen:text>
            <xsl:text>&#160;</xsl:text>
        </gen:text> -->
        <gen:apply-templates select="node()">
            <gen:with-param name="embedded" select="1"/>
        </gen:apply-templates>
    </xsl:template>
    <xsl:template name="char-gen-note">

    </xsl:template>
    <xsl:template match="*[name() = $rowname]">
        <xsl:variable name="test1" select="tokenize(test,'=')[1]"/>
        <xsl:variable name="test2" select="tokenize(test2,'=')[1]"/>
        <xsl:variable name="t1">
            <xsl:choose>
                <!-- when meta language is used in the test -->
                <xsl:when test="$test1 = $metalang">
                    <xsl:call-template name="seq">
                        <xsl:with-param name="string" select="test"/>
                        <xsl:with-param name="ref" select="Ref"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- when the content of the test is copied with out change  -->
                <xsl:otherwise>
                    <xsl:value-of select="test"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="t2">
            <xsl:choose>
                <!-- when meta language is used in the test2 -->
                <xsl:when test="$test2 = $metalang">
                    <xsl:call-template name="seq">
                        <xsl:with-param name="string" select="test2"/>
                        <xsl:with-param name="ref" select="Ref"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- when the content of the test2 is copied with out change  -->
                <xsl:otherwise>
                    <xsl:value-of select="test2"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="comm" select="concat('ref ',Ref,' - rank=',rank)"/>
        <xsl:choose>
            <xsl:when test="string-length($t1) = 0"/>
            <xsl:when test="string-length($t2) gt 0">
                <xsl:comment select="$comm"/>
                <gen:if test="preceding::chapter">
                    <gen:if test="{$t1}">
                        <gen:if test="{$t2}">
                            <gen:text>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="class"/>
                            </gen:text>
                        </gen:if>
                    </gen:if>
                </gen:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment select="$comm"/>
                <gen:if test="preceding::chapter">
                    <gen:if test="{$t1}">
                        <gen:text>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="class"/>
                        </gen:text>
                    </gen:if>
                </gen:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="*[name() = $rowname]" mode="css">
        <xsl:variable name="get-type" select="tokenize(class,'\-')[4]"/>
        <xsl:variable name="css-type" select="if (string-length($get-type) &gt; 0) then $get-type else 'default'"/>
        <xsl:if test="string-length(Ref) gt 0">
            <xsl:text>.</xsl:text>
            <xsl:value-of select="class"/>
            <xsl:text> {</xsl:text>
            <xsl:choose>
                <xsl:when test="element = $para-like">
                    <xsl:value-of select="f:keyvalue($para-css,$css-type)"/>
                </xsl:when>
                <xsl:when test="element = $char-like">
                    <xsl:value-of select="f:keyvalue($char-css,$css-type)"/>
                </xsl:when>
            </xsl:choose>
            <xsl:text>}&#10;</xsl:text>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="class"/>
            <xsl:text>::after {content:'</xsl:text>
            <xsl:value-of select="message"/>
            <xsl:text> #</xsl:text>
            <xsl:value-of select="Ref"/>
            <xsl:text>';</xsl:text>
            <xsl:if test="element = $char-like">
                <xsl:text>border:2pt solid thistle;border-left:5pt solid tomato;</xsl:text>
            </xsl:if>
            <xsl:if test="element = $para-like">
                <xsl:text>border:2pt solid thistle;border-left:5pt solid tomato;</xsl:text>
            </xsl:if>
            <xsl:text>}&#10;</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*[name() = $rowname]" mode="var">
        <gen:variable name="next1-{translate(Ref,'.','-')}">
            <gen:call-template name="next">
                <gen:with-param name="style" select="{nextstyle1}"/>
                <gen:with-param name="curpos" select="$pos"/>
            </gen:call-template>
        </gen:variable>
        <gen:variable name="next2-{translate(Ref,'.','-')}">
            <gen:call-template name="next">
                <gen:with-param name="style" select="{nextstyle2}"/>
                <gen:with-param name="curpos" select="$pos"/>
            </gen:call-template>
        </gen:variable>
    </xsl:template>
    <xsl:template name="gen-static">
        <xsl:if test="string-length($dqsqoff)  = 0">
            <gen:variable name="sq">'</gen:variable>
            <gen:variable name="dq">"</gen:variable>
        </xsl:if>
        <xsl:apply-templates select="doc($static-var-xml-url)//*[name() = $rowname]" mode="static-var"/>
        <gen:template match="chapter[@number]">
            <!-- Provide a style for each chapter -->
            <gen:if test="count(preceding::chapter[@number]) = 0">
                <gen:call-template name="style"/>
            </gen:if>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ',@number)"/>
            </gen:element>
        </gen:template>
        <gen:template match="Ref">
            <gen:apply-templates select="*"/>
        </gen:template>
        <gen:template match="@*">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="name()"/>
                </gen:attribute>
                <gen:value-of select="concat(' ',name(),'=',$dq,.,$dq)"/>
            </gen:element>
        </gen:template>
        <gen:template match="usx">
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="'usx'"/>
                </gen:attribute>
                <gen:apply-templates select="*"/>
            </gen:element>
        </gen:template>
        <gen:template match="book">
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
        <gen:template match="*[@style = 'b' or @style = 'rem']">
            <gen:element name="div">
                <gen:element name="span">
                    <gen:attribute name="class">
                        <gen:value-of select="@style"/>
                    </gen:attribute>
                    <gen:value-of select="concat('\',@style,' ')"/>
                    <gen:apply-templates select="node()"/>
                </gen:element>
            </gen:element>
        </gen:template>
        <gen:template name="style">
            <style type="text/css">
			.usx {line-height:1.8;}
			.mt, .mt2, .mt3, .mt3n, .mt4, .mt4n, .mt5, .mt6, .mt7, .mt8, .mt9, .mt10 {text-align:center}
			.sl1 {border-left:10pt solid green;padding-left:3pt;font-size:120%}
			.sla, .pvr {border-left:10pt solid orange;padding-left:3pt;font-size:120%}
			.ml1 {border-left:20pt solid lightblue;padding-left:3pt;padding-left:1em}
			.mlor {border-left:30pt solid yellow;padding-left:3pt;padding-left:1em}
                 <!-- .tr {border-left:10pt solid blue;padding-left:3pt} the table now has the border -->
                <!-- .error-pre {border-left:5pt solid red;}
                .error-post {border-right:5pt solid red;} these are now handled by keyvalue variables-->
			::after {background:thistle;padding-left:4pt;color:black;font-weight:normal;}
			.s5 {background:lightcyan;}
			.v {background:navy;color:white;font-weight:bold;}
			.c {font-size:140%;background:green;color:white;font-weight:bold;}
			.rem {background:lightgreen;color:darkgreen;}
			.table {border:2pt solid purple;border-left:10pt solid purple;width:auto;}
			.tec, .sbx {font-weight:bold;}
			.tei, .trs {font-style:italic;}
			.teu {text-decoration: underline;}
			.tre {text-decoration: underline;font-style:italic;}
			.linkref {color:grey;}
			.f {background:lightgrey}
			.quote-error {background:orange;border-bottom:2pt solid red;}
			.quote-error:after {content:'This quote in quote in the above footnote, should be single quoted.';}
<xsl:apply-templates select="$g1//*[name() = $rowname]" mode="css"/>
            </style>
        </gen:template>
        <gen:template match="text()" mode="fntext">
            <gen:value-of select="."/>
        </gen:template>
        <gen:template match="*" mode="fntext">
            <gen:apply-templates select="node()" mode="fntext"/>
        </gen:template>
    </xsl:template>
    <xsl:template name="output-xml">
        <xsl:result-document href="{f:file2uri($xml-pre)}" format="xml">
            <xsl:element name="data">
                <xsl:copy-of select="$g1"/>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
    <xsl:template name="seq">
        <!-- This is used to convert meta language rules to full xquery strings -->
        <xsl:param name="string"/>
        <xsl:param name="ref"/>
        <xsl:comment>
            <xsl:value-of select="$string"/>
        </xsl:comment>
        <xsl:variable name="part" select="tokenize($string,'=')"/>
        <!-- I can't see I have used the subpart, I can't remember why it exists. Now there are SFM variables it may not be needed -->
        <xsl:variable name="subpart" select="tokenize($part[1],'-')"/>
        <!-- The following 2 var are only for character tests -->
        <xsl:variable name="len" select="string-length($part[2])"/>
        <xsl:variable name="plus" select="substring('++++++++++++++++++++++++++++++',1,number($len))"/>
        <!-- Create an array of the sfm in the list for para tests -->
        <xsl:variable name="sfm" select="tokenize($part[2],' ')"/>
        <xsl:variable name="parasfm" select="tokenize('pre post',' ')"/>
        <xsl:text>not(</xsl:text>
        <xsl:choose>
            <xsl:when test="$subpart[1] = $part[1]">
                <xsl:if test="normalize-space($part[1]) = 'pre'">
                    <xsl:text>preceding-sibling::*[1][</xsl:text>
                </xsl:if>
                <xsl:if test="normalize-space($part[1]) = 'post'">
                    <xsl:text>following-sibling::*[1][</xsl:text>
                </xsl:if>
                <xsl:text>@style = 'rem' or </xsl:text>
                <xsl:for-each select="$sfm">
                    <xsl:choose>
                        <xsl:when test=". = 'c'">
                            <xsl:text>name() = 'chapter'</xsl:text>
                        </xsl:when>
                        <xsl:when test=". = 'tr'">
                            <xsl:text>name() = 'table'</xsl:text>
                        </xsl:when>
                        <xsl:when test=". = 'mt_'">
                            <xsl:text>substring(@style,1,2) = 'mt'</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>@style = '</xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>'</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="not(position() = last())">
                        <xsl:text> or </xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:when test="$subpart[2] = 'char'">
                <xsl:text>translate(substring(</xsl:text>
                <xsl:value-of select="if ($subpart[1] = 'pre') then 'preceding' else 'following'"/>
                <xsl:text>-sibling::node()[1],</xsl:text>
                <xsl:value-of select="if ($subpart[1] = 'pre') then 'string-length(preceding-sibling::node()[1])' else '1'"/>
                <xsl:text>,1),'+</xsl:text>
                <xsl:value-of select="$part[2]"/>
                <xsl:text>','_</xsl:text>
                <xsl:value-of select="$plus"/>
                <xsl:text>') </xsl:text>
                <xsl:value-of select="if ($subpart[3] = 'not') then '!=' else '='"/>
                <xsl:text> '+'</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>invalid=</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>)</xsl:text>
    </xsl:template>
    <xsl:template match="verse">
        <gen:template match="{name()}[@style = '{@style}']">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//*[name() = $rowname]" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ',@number,' ')"/>
            </gen:element>
            <gen:element name="verse">
                <gen:attribute name="number">
                    <gen:value-of select="@number"/>
                </gen:attribute>
                <gen:attribute name="style">
                    <gen:value-of select="@style"/>
                </gen:attribute>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="*[name() = $rowname]" mode="sfm-var">
        <!-- This template handles variables that contain code or are defined in var-string -->
        <xsl:param name="style"/>
        <xsl:param name="element"/>
        <xsl:if test="$style = sfm or (string-length($style) = 0 and $element = sfm)">
            <xsl:element name="xsl:variable">
                <xsl:attribute name="name">
                    <xsl:value-of select="name"/>
                </xsl:attribute>
                <xsl:attribute name="select">
                    <xsl:choose>
                        <xsl:when test="string-length(value) &gt; 0">
                            <xsl:value-of select="value"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="f:keyvalue($var-string,name)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- get string from keyvalue -->
                </xsl:attribute>
            </xsl:element>
            <xsl:if test="$debug = 'on'">
                <gen:comment>
                    <xsl:value-of select="concat(' ',name,' = ')"/>
                    <gen:value-of select="concat($sq,{concat('$',name)},$sq,' ')"/>
                </gen:comment>
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*[name() = $rowname]" mode="static-var">
        <!-- This template handles text string variables -->
        <xsl:element name="xsl:variable">
            <xsl:attribute name="name">
                <xsl:value-of select="name"/>
            </xsl:attribute>
            <xsl:value-of select="value"/>
        </xsl:element>
    </xsl:template>
    <xsl:function name="f:sfm">
        <xsl:param name="style"/>
        <gen:value-of select="concat('\',$style,'&#160;')"/>
    </xsl:function>
    <xsl:function name="f:sfm-end">
        <xsl:param name="style"/>
        <xsl:param name="closed"/>
        <gen:if test="not($closed = 'false')">
            <gen:value-of select="concat('\',$style,'*')"/>
        </gen:if>
    </xsl:function>
    <xsl:function name="f:sfm-f">
        <xsl:param name="style"/>
        <xsl:param name="caller"/>
        <xsl:sequence select="f:sfm($style)"/>
        <gen:value-of select="$caller"/>
        <gen:text>&#160;</gen:text>
    </xsl:function>
    <xsl:function name="f:cvref">
        <xsl:if test="$debug = 'on'">
            <gen:comment>
                <gen:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
            </gen:comment>
        </xsl:if>
    </xsl:function>
    <xsl:function name="f:note-start">
        <xsl:param name="style"/>
        <xsl:choose>
            <xsl:when test="$style = 'f'">
                <gen:variable name="fnstring">
                    <gen:apply-templates select="node()" mode="fntext"/>
                </gen:variable>
                <gen:comment>&#10;fnstring = <gen:value-of select="$fnstring"/></gen:comment>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="f:note-end">
        <xsl:param name="style"/>
        <xsl:variable name="start" select="1"/>
        <xsl:variable name="end" select="10"/>
        <xsl:choose>
            <xsl:when test="$style = 'f'">
                <xsl:for-each select="$start to $end">
                    <gen:if test="contains($indqstr{.},'“') and $sqdiff{.} = 0">
                        <gen:text> </gen:text>
                        <gen:element name="span">
                            <gen:attribute name="class">
                                <gen:text>quote-error</gen:text>
                            </gen:attribute>
                            <gen:value-of select="concat('“',substring-after($indqstr{.},'“'),'”')"/>
                        </gen:element>
                    </gen:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>

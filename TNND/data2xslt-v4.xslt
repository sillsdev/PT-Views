<?xml version="1.0" encoding="utf-8"?>
<!--
     #############################################################
     # Name:     	data2xslt-v4.xslt
     # Purpose:  	Generate TNND schema check from flat xml.
     # Part of:  		Xrunner - https://github.com/SILAsiaPub/xrunner
     # Author:   	Ian McQuay <ian_mcquay@sil.org>
     # Created:  	2019-12-12
     # Modified:		2021-03-25; 2023-02-27
     # Copyright:	(c) 2019-2022 SIL International
     # Licence:  	<MIT>
     ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="xml"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
    <xsl:include href="project.xslt"/>
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
    <xsl:template match="cell">
        <gen:template match="{name()}">
            <gen:variable name="pos" select="position()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <xsl:value-of select="'cell '"/>
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:text>\</gen:text>
                <gen:value-of select="concat(@style,' ')"/>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="table">
        <gen:template match="{name()}">
            <gen:variable name="pos" select="position()"/>
            <gen:element name="div">
                <gen:attribute name="class">
                    <xsl:value-of select="name()"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="para">
        <xsl:comment select="concat(' ',name(),' @style=',@style,' ')"/>
        <xsl:variable name="pred" select="if (string-length(@style) &gt; 0) then concat('[@style = ',$sq,@style,$sq,']') else '' "/>
        <gen:template match="{name()}{$pred}">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//item" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()">
                    <gen:with-param name="embedded" select="0"/>
                </gen:apply-templates>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="char[string-length(@style) = 0]">
        <gen:template match="char">
            <gen:param name="embedded"/>
            <gen:variable name="pos" select="position()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <xsl:call-template name="char-gen"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="char">
        <gen:template match="char[@style = '{@style}']">
            <gen:param name="embedded"/>
            <xsl:apply-templates select="doc($sfm-var-xml-url)//item" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <!-- Aded two variables to get last char -->
            <gen:variable name="lastchar" select="substring(.,string-length(.),1)"/>
            <gen:variable name="lastchar2" select="substring(.,string-length(.) - 1,1)"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:comment select="'common char errors'"/>
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <xsl:comment select="'style specific errors'"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <xsl:call-template name="char-gen"/>
                <gen:value-of select="concat('\',@style,'*')"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="note">
        <gen:template match="note[@style = '{@style}']">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//item" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <xsl:call-template name="char-gen-note"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="figure">
        <gen:template match="figure[@style = '{@style}']">
            <gen:variable name="pos" select="position()"/>
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
            <xsl:apply-templates select="doc($sfm-var-xml-url)//item" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:text>\jmp </gen:text>
                <gen:element name="span">
                    <gen:attribute name="class">
                        <xsl:text>fig-attrib</xsl:text>
                    </gen:attribute>
                    <gen:apply-templates select="@*"/>
                </gen:element>
                <gen:text>\jmp*</gen:text>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="item" mode="next">
        <xsl:if test="string-length(nextstyle1) gt 0">
            <gen:variable name="{concat('next1-',translate(Ref,'.','-'))}" select="{nextstyle1}"/>
            <gen:variable name="{concat('next2-',translate(Ref,'.','-'))}" select="{nextstyle2}"/>
        </xsl:if>
    </xsl:template>
    <xsl:template name="char-gen">
        <gen:text>
            <xsl:text>&#160;</xsl:text>
        </gen:text>
        <gen:apply-templates select="node()">
            <gen:with-param name="embedded" select="1"/>
        </gen:apply-templates>
    </xsl:template>
    <xsl:template name="char-gen-note">
        <gen:text>\</gen:text>
        <gen:value-of select="@style"/>
        <gen:text>
            <xsl:text>&#160;</xsl:text>
        </gen:text>
        <gen:apply-templates select="node()">
            <gen:with-param name="embedded" select="0"/>
        </gen:apply-templates>
        <gen:if test="not(@closed = 'false')">
            <gen:text>\</gen:text>
            <gen:value-of select="@style"/>
            <gen:text>*</gen:text>
        </gen:if>
    </xsl:template>
    <xsl:template match="item">
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
                <gen:if test="{$t1}">
                    <gen:if test="{$t2}">
                        <gen:text>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="class"/>
                        </gen:text>
                    </gen:if>
                </gen:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment select="$comm"/>
                <gen:if test="{$t1}">
                    <gen:text>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="class"/>
                    </gen:text>
                </gen:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="item" mode="css">
        <xsl:variable name="css-type">
            <xsl:choose>
                <xsl:when test="matches(class,'-pre-')">
                    <xsl:text>pre</xsl:text>
                </xsl:when>
                <xsl:when test="matches(class,'-post-')">
                    <xsl:text>post</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>default</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="string-length(Ref) gt 0">
            <xsl:text>.</xsl:text>
            <xsl:value-of select="class"/>
            <xsl:text>::after {content:'</xsl:text>
            <xsl:value-of select="message"/>
            <xsl:text> #</xsl:text>
            <xsl:value-of select="Ref"/>
            <xsl:text>';}&#10;</xsl:text>
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
        </xsl:if>
    </xsl:template>
    <xsl:template match="item" mode="var">
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
        <xsl:apply-templates select="doc($static-var-xml-url)//item" mode="static-var"/>
        <gen:template match="chapter[@number]">
            <!-- Provide a style for each chapter -->
            <xsl:if test="count(preceding::chapter[@number]) = 0">
                <xsl:call-template name="style"/>
            </xsl:if>
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
                <gen:value-of select="concat(name(),'=',$dq,.,$dq)"/>
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
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template name="output-xml">
        <xsl:result-document href="{f:file2uri($xml-pre)}" format="xml">
            <xsl:element name="data">
                <xsl:copy-of select="$g1"/>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="row">
        <xsl:comment select="concat(' ',name(),' @style=',@style,' ')"/>
        <gen:template match="{name()}">
            <gen:variable name="pos" select="position()"/>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()">
                    <gen:with-param name="embedded" select="0"/>
                </gen:apply-templates>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template name="seq">
        <!-- This is used to convert meta language rules to full xquery strings -->
        <xsl:param name="string"/>
        <xsl:param name="ref"/>
        <xsl:variable name="part" select="tokenize($string,'=')"/>
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
            <gen:variable name="pos" select="position()"/>
            <gen:variable name="parent" select="parent::*/@style"/>
            <!-- <gen:comment select="$parent"/> -->
            <gen:element name="verse">
                <gen:attribute name="number">
                    <gen:value-of select="@number"/>
                </gen:attribute>
            </gen:element>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ',@number,' ')"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template name="style">
        <style type="text/css">
                .mt, .mt2, .mt3, .mt3n, .mt4, .mt4n, .mt5, .mt6, .mt7, .mt8, .mt9, .mt10 {text-align:center}
                .sl1 {border-left:10pt solid green;padding-left:3pt;font-size:120%}
                .sla, .pvr {border-left:10pt solid orange;padding-left:3pt;font-size:120%}
                .ml1 {border-left:20pt solid lightblue;padding-left:3pt;padding-left:1em}
                .mlor {border-left:30pt solid yellow;padding-left:3pt;padding-left:1em}
                .tr {border-left:10pt solid blue;padding-left:3pt}
                .error-pre {border-left:5pt solid red;}
                .error-post {border-right:5pt solid red;}
                ::after {background:thistle;padding-left:4pt;}
                .s5 {background:lightcyan;}
                .v {background:navy;color:white;font-weight:bold;}
		    .c {font-size:140%;background:green;color:white;font-weight:bold;}
			.rem {background:lightgreen;color:darkgreen;}
			.table {border-left:10pt solid purple;}
			.cell {border:2pt solid black}
                <xsl:apply-templates select="$g1//item" mode="css"/>
            </style>
    </xsl:template>
    <xsl:template match="item" mode="sfm-var">
        <!-- This template handles variables that contain code -->
        <xsl:param name="style"/>
        <xsl:if test="$style = sfm">
            <xsl:element name="xsl:variable">
                <xsl:attribute name="name">
                    <xsl:value-of select="name"/>
                </xsl:attribute>
                <xsl:attribute name="select">
                    <xsl:value-of select="value"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    <xsl:template match="item" mode="static-var">
        <!-- This template handles text string variables -->
        <xsl:element name="xsl:variable">
            <xsl:attribute name="name">
                <xsl:value-of select="name"/>
            </xsl:attribute>
            <xsl:attribute name="select">
                <xsl:value-of select="concat($sq,value,$sq)"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

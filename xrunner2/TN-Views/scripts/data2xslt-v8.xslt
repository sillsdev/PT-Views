<?xml version="1.0" encoding="utf-8"?>
<!--
     #############################################################
     # Name:     	data2xslt-v7.xslt
     # Purpose:  	Generate TNND and TNDD schema check from flat xml.
     # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner
     # Author:   	Ian McQuay <ian_mcquay@sil.org>
     # Created:  	2019-12-12
     # Modified:		2021-03-25; 2023-02-27; 2023-11-10; 2023-11-18; 2023-11-20
     # Mod note:		2023-11-20 used seq for sfm markers; removed embedded as can't see reason for it
     # Mod note:		2024-05-22 combining two tag errors
     # Copyright:	(c) 2019-2024 SIL International
     # Licence:  	<MIT>
     ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="xml"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
    <xsl:param name="project"/>
    <xsl:param name="dqsqoff"/>
    <xsl:include href="project.xslt"/>
    <xsl:include href="var-string.xslt"/>
    <xsl:variable name="xml-pre" select="concat($projectpath,'\output\',$project,'-struc-data.xml')"/>
    <xsl:variable name="static-var-xml-url" select="f:file2uri($static-var-xml)"/>
    <!-- <xsl:variable name="sfm-var-xml-url" select="f:file2uri($sfm-var-xml)"/> -->
    <xsl:variable name="sfm-map" select="doc(f:file2uri($sfm-var-xml))//*[child::grp = $project or child::grp = 'TN']"/>
    <xsl:variable name="g1">
        <xsl:for-each-group select="/*/*[string-length(disable) = 0 and (child::grp = $project or child::grp = 'TN')]" group-by="child::element">
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
        <!-- <xsl:comment select="$g1"/> -->
        <gen:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <gen:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
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
            <xsl:sequence select="f:note-start(@style)"/>
            <!-- $sfm-map//*[name() = $rowname] -->
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="div">
                <gen:attribute name="class">
                    <!-- <gen:value-of select="@style"/> -->
                    <gen:value-of select="concat(@style,' ',name())"/>
                    <!-- <xsl:apply-templates select="*"/> -->
                    <gen:if test="preceding::chapter">
                        <xsl:if test="string-length(@style) &gt; 0">
                            <xsl:comment select="'common para errors'"/>
                            <xsl:apply-templates select="//para[string-length(@style) = 0]/*"/>
                        </xsl:if>
                        <xsl:comment select="'specific para errors'"/>
                        <xsl:apply-templates select="*"/>
                    </gen:if>
                </gen:attribute>
                <gen:variable name="closed" select="''"/>
                <xsl:sequence select="f:sfm()"/>
                <gen:apply-templates select="node()"/>
                <xsl:sequence select="f:note-end(@style)"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="note">
        <xsl:variable name="pred" select="if (string-length(@style) &gt; 0) then concat('[@style = ',$sq,@style,$sq,']') else '' "/>
        <gen:template match="{name()}{$pred}">
            <xsl:sequence select="f:note-start(@style)"/>
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="concat(@style,' ',name())"/>
                    <xsl:apply-templates select="$g1/note[string-length(@style) = 0]/*"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <xsl:sequence select="f:sfm-f()"/>
                <gen:apply-templates select="node()"/>
                <xsl:sequence select="f:sfm-end()"/>
            </gen:element>
            <xsl:sequence select="f:note-end(@style)"/>
        </gen:template>
    </xsl:template>
    <xsl:template match="cell">
        <xsl:comment select="concat(' ',name(),' @style=',@style,' ')"/>
        <xsl:variable name="pred" select="if (string-length(@style) &gt; 0) then concat('[@style = ',$sq,@style,$sq,']') else '' "/>
        <gen:template match="{name()}{$pred}">
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="concat(@style,' ',name())"/>
                    <xsl:apply-templates select="*"/>
                    <xsl:if test="string-length(@style) &gt; 0">
                        <xsl:comment select="'common cell errors'"/>
                        <xsl:apply-templates select="//cell[string-length(@style) = 0]/*"/>
                    </xsl:if>
                </gen:attribute>
                <xsl:sequence select="f:sfm()"/>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="table">
        <gen:template match="{name()}">
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
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
            <!-- <gen:param name="embedded"/> -->
            <gen:variable name="embed">
                <gen:if test="parent::*[name() = 'char']">
                    <gen:text>+</gen:text>
                </gen:if>
            </gen:variable>
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="concat(@style,' ',name())"/>
                    <gen:if test="preceding::chapter">
                        <xsl:text>&#10;               </xsl:text>
                        <xsl:comment select="'specific char errors'"/>
                        <xsl:apply-templates select="*"/>
                        <xsl:comment select="'common char errors'"/>
                        <xsl:if test="string-length(@style) &gt; 0">
                            <xsl:apply-templates select="//char[string-length(@style) = 0]/*"/>
                        </xsl:if>
                    </gen:if>
                </gen:attribute>
                <xsl:sequence select="f:sfm-c()"/>
                <gen:apply-templates select="node()"/>
                <xsl:sequence select="f:sfm-c-end()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="figure">
        <gen:template match="figure[@style = '{@style}']">
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
                <xsl:with-param name="element" select="name()"/>
            </xsl:apply-templates>
            <xsl:sequence select="f:cvref()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="concat(@style,' ',name())"/>
                    <!-- <xsl:apply-templates select="$g1/figure[string-length(@style) = 0]/*"/> -->
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
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
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
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="concat(@style,' ',name())"/>
                    <xsl:apply-templates select="*"/>
                    <!-- 2023-04-06 removed duplicate of the above line -->
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <!-- <xsl:template match="*[name() = $rowname]" mode="next">
        <xsl:if test="string-length(nextstyle1) gt 0">
            <gen:variable name="{concat('next1-',translate(ref,'.','-'))}" select="{nextstyle1}"/>
            <gen:variable name="{concat('next2-',translate(ref,'.','-'))}" select="{nextstyle2}"/>
        </xsl:if>
    </xsl:template> -->
    <xsl:template match="*[name() = $rowname]">
        <xsl:variable name="test1" select="tokenize(test,'=')[1]"/>
        <xsl:variable name="test2" select="tokenize(test2,'=')[1]"/>
        <xsl:variable name="class" select="concat('err-',element,'-',style,'-',class-extra,'-',translate(ref,'&#46;','-'))"/>
        <xsl:variable name="t1">
            <xsl:choose>
                <!-- when meta language is used in the test -->
                <xsl:when test="$test1 = $metalang-key">
                    <xsl:value-of select="f:metalang(test,ref)"/>
                </xsl:when>
                <!-- when the content of the test is copied without change  -->
                <xsl:otherwise>
                    <xsl:value-of select="test"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="t2">
            <xsl:choose>
                <!-- when meta language is used in the test2 -->
                <xsl:when test="$test2 = $metalang-key">
                    <xsl:value-of select="f:metalang(test2,ref)"/>
                </xsl:when>
                <!-- when the content of the test2 is copied without change  -->
                <xsl:otherwise>
                    <xsl:value-of select="test2"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="comm" select="concat('ref ',ref,' - rank=',rank)"/>
        <xsl:choose>
            <xsl:when test="string-length($t1) = 0"/>
            <xsl:when test="string-length($t2) gt 0">
                <xsl:comment select="$comm"/>
                <!-- <gen:if test="preceding::chapter"> -->
                <gen:if test="{$t1}">
                    <gen:if test="{$t2}">
                        <gen:text>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="$class"/>
                        </gen:text>
                    </gen:if>
                    <!-- </gen:if> -->
                </gen:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment select="$comm"/>
                <!-- <gen:if test="preceding::chapter"> -->
                <gen:if test="{$t1}">
                    <gen:text>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$class"/>
                    </gen:text>
                </gen:if>
                <!-- </gen:if> -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="*[name() = $rowname]" mode="css">
        <xsl:variable name="get-type" select="class-extra"/>
        <xsl:variable name="css-type" select="if (string-length($get-type) &gt; 0) then $get-type else 'default'"/>
        <xsl:variable name="class" select="concat('err-',element,'-',style,'-',class-extra,'-',translate(ref,'&#46;','-'))"/>
        <xsl:if test="string-length(ref) gt 0">
            <xsl:text>.</xsl:text>
            <xsl:value-of select="$class"/>
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
            <xsl:value-of select="$class"/>
            <xsl:text>::after {content:'</xsl:text>
            <xsl:value-of select="message"/>
            <xsl:text>  [</xsl:text>
            <xsl:value-of select="f:keyvalue($projcode,$project)"/>
            <xsl:text></xsl:text>
            <xsl:value-of select="ref"/>
            <xsl:text>]';</xsl:text>
            <xsl:if test="element = $char-like">
                <xsl:text>border:2pt solid thistle;border-left:5pt solid tomato;</xsl:text>
            </xsl:if>
            <xsl:if test="element = $para-like">
                <xsl:text>border:2pt solid thistle;border-left:5pt solid tomato;</xsl:text>
            </xsl:if>
            <xsl:text>}&#10;</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template name="gen-static">
        <gen:param name="debug"/>
        <xsl:if test="string-length($dqsqoff)  = 0">
            <gen:variable name="sq">'</gen:variable>
            <gen:variable name="dq">"</gen:variable>
            <gen:variable name="project">
                <xsl:value-of select="$project"/>
            </gen:variable>
        </xsl:if>
        <xsl:apply-templates select="doc($static-var-xml-url)//*[name() = $rowname]" mode="static-var"/>
        <gen:template match="chapter[@number]">
            <gen:if test="count(preceding::chapter[@number]) = 0">
                <!-- Provide a style for each chapter -->
                <gen:call-template name="style"/>
            </gen:if>
      <gen:element name="div">
        <gen:attribute name="class">
          <gen:text>build</gen:text>
        </gen:attribute>
                <gen:value-of select="concat('Version: ',$version,' ',$project,$view,$modified,$moddate)"/>
        <xsl:element name="br"/>
        <gen:value-of select="concat('In this view, the ',substring($translatereplace,1,1),' character represents the narrow no-break space.')"/>
            </gen:element>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ',@number)"/>
            </gen:element>
        </gen:template>
        <gen:template match="ref">
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
        <gen:template match="cell">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:text>cell </gen:text>
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
        <gen:template match="verse">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:value-of select="@number"/>
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
                <xsl:text>
div {white-space: normal;}
.build {font-weight:bold;line-height:1.1;}
.usx {line-height:1.8;}
.mt, .mt2, .mt3, .mt3n, .mt4, .mt4n, .mt5, .mt6, .mt7, .mt8, .mt9, .mt10 {text-align:center;}
.sl1 {border-left:10pt solid green;padding-left:3pt;font-size:120%;}
.sla, .pvr {border-left:10pt solid orange;padding-left:3pt;font-size:120%;}
.ml1 {border-left:20pt solid lightblue;padding-left:1em;}
.mlor {border-left:30pt solid yellow;padding-left:1em;}
::after {background:thistle;padding-left:4pt;color:black;font-weight:normal;}
.s5 {background:lightcyan;}
.v {background:navy;color:white;font-weight:bold;padding-right:5px;}
.c {font-size:140%;background:green;color:white;font-weight:bold;}
.rem {background:lightgreen;color:darkgreen;}
.table {border:2pt solid purple;border-left:10pt solid purple;width:auto;}
.tec, .sbx {font-weight:bold;}
.tei, .trs {font-style:italic;}
.teu {text-decoration: underline;}
.tre {text-decoration: underline;font-style:italic;}
.linkref {color:grey;}
.f {background:lightgrey}
</xsl:text>
                <xsl:if test="$project = 'TNND'">
                    <xsl:for-each select="$quotecheck">
                        <xsl:value-of select="f:quotecss(.)"/>
                    </xsl:for-each>
                </xsl:if>
                <xsl:apply-templates select="$g1/*/*[name() = $rowname]" mode="css"/>
                <!-- <xsl:comment select="$g1"/> -->
            </style>
        </gen:template>
    <gen:template match="text()">
      <gen:choose>
        <gen:when test="$translatetextswitch = '1'">
          <gen:value-of select="translate(.,$translatefind,$translatereplace)"/>
        </gen:when>
        <gen:otherwise>
          <gen:value-of select="."/>
        </gen:otherwise>
      </gen:choose>
    </gen:template>
        <gen:template match="text()" mode="fntext">
      <gen:choose>
        <gen:when test="$translatetextswitch = '1'">
          <gen:value-of select="translate(.,$translatefind,$translatereplace)"/>
        </gen:when>
        <gen:otherwise>
            <gen:value-of select="."/>
        </gen:otherwise>
      </gen:choose>
        </gen:template>
        <gen:template match="*" mode="fntext">
            <gen:apply-templates select="node()" mode="fntext"/>
        </gen:template>
        <gen:template match="*[@style = 'tec']" mode="fntext"/>
    </xsl:template>
    <xsl:template name="output-xml">
        <xsl:result-document href="{f:file2uri($xml-pre)}" format="xml">
            <xsl:element name="data">
                <xsl:copy-of select="$g1"/>
                <xsl:copy-of select="$sfm-map"/>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="verse">
        <gen:template match="{name()}[@style = '{@style}']">
            <xsl:apply-templates select="$sfm-map" mode="sfm-var">
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
        <!-- <gen:text>&#160;</gen:text> -->
    </xsl:template>
    <xsl:template match="*[name() = $rowname]" mode="sfm-var">
        <!-- This template handles variables that contain code or are defined in var-string -->
        <xsl:param name="style"/>
        <xsl:param name="element"/>
        <xsl:if test="$style = sfm or (string-length($style) = 0 and $element = sfm) or ($element = 'table' and sfm = 'tr')">
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
                            <xsl:value-of select="f:keyvaluesep($var-string,name,'==')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- get string from keyvalue -->
                </xsl:attribute>
            </xsl:element>
            <xsl:if test="$debug = 'on'">
                <gen:if test="$debug = 'on'">
                    <gen:comment>
                        <xsl:value-of select="concat(' ',name,' = ')"/>
                        <gen:value-of select="concat($sq,{concat('$',name)},$sq,' ')"/>
                    </gen:comment>
                    <xsl:text>&#10;</xsl:text>
                </gen:if>
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
        <gen:element name="span">
            <gen:attribute name="class">
                <gen:value-of select="concat('sfm-',@style,' sfm')"/>
            </gen:attribute>
            <gen:value-of select="concat('\',@style,'&#160;')"/>
        </gen:element>
    </xsl:function>
    <xsl:function name="f:sfm-end">
        <gen:if test="not(@closed = 'false')">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="concat(@style,' ',name())"/>
                </gen:attribute>
                <gen:value-of select="concat('\',@style,'*')"/>
            </gen:element>
        </gen:if>
    </xsl:function>
    <xsl:function name="f:sfm-c">
        <gen:element name="span">
            <gen:attribute name="class">
                <gen:value-of select="concat('sfm-',@style,' sfm')"/>
            </gen:attribute>
            <gen:value-of select="concat('\',$embed,@style,'&#160;')"/>
        </gen:element>
    </xsl:function>
    <xsl:function name="f:sfm-c-end">
        <gen:if test="not(@closed = 'false')">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="concat(@style,' ',name())"/>
                </gen:attribute>
                <gen:value-of select="concat('\',$embed,@style,'*')"/>
            </gen:element>
        </gen:if>
    </xsl:function>
    <xsl:function name="f:sfm-f">
        <xsl:sequence select="f:sfm()"/>
        <gen:value-of select="@caller"/>
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
            <xsl:when test="$style = $quotecheck and ($project = 'TNND' or $project = 'TN')">
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
            <xsl:when test="$style = $quotecheck and ($project = 'TNND' or $project = 'TN')">
                <xsl:for-each select="$start to $end">
                    <gen:if test="contains($indqstr{.},'“') and $sqdiff{.} = 0">
                        <gen:text> </gen:text>
                        <gen:element name="span">
                            <gen:attribute name="class">
                                <gen:value-of select="concat('quote-error-',@style)"/>
                                <!-- <gen:text>quote-error</gen:text> -->
                            </gen:attribute>
                            <gen:value-of select="concat('“',substring-after($indqstr{.},'“'),'”')"/>
                        </gen:element>
                    </gen:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="f:quotecss">
        <!-- used to generate CSS for quotes -->
        <xsl:param name="style"/>
        <xsl:value-of select="concat('.quote-error-',$style,' {background:orange;border-top:2pt solid red;}&#10;')"/>
        <xsl:value-of select="concat('.quote-error-',$style,':after {content:',$sq,'This double quote in the above \\',$style,' ',f:keyvalue($style2element,$style),', is preceeded by an opening double quote, it should either be single quoted or there is some preceding error.',$sq,';}&#10;')"/>
        <!-- .quote-error-ntn {background:orange;border-top:2pt solid red;}
			.quote-error-f:after {content:'This quote in quote in the above \\f footnote, probably should be single quoted.';} -->
    </xsl:function>
    <xsl:function name="f:metalang">
        <!-- This is used to convert meta language rules to full xquery strings -->
        <xsl:param name="string"/>
        <xsl:param name="ref"/>
        <xsl:variable name="part" select="tokenize(normalize-space($string),'=')"/>
        <!-- Create an array of the sfm in the list for para tests -->
        <xsl:variable name="sfm" select="tokenize($part[2],' ')"/>
        <xsl:text>not(</xsl:text>
        <xsl:value-of select="f:keyvalue($metalang,$part[1])"/>
        <xsl:text>::</xsl:text>
        <xsl:value-of select="if (contains($part[1],'inline')) then 'node()' else '*'"/>
        <xsl:text>[1][@style = 'rem' or </xsl:text>
        <xsl:value-of select="f:matchsfm($sfm)"/>
        <xsl:text>]</xsl:text>
        <xsl:text>)</xsl:text>
    </xsl:function>
    <xsl:function name="f:matchsfm">
        <xsl:param name="sfm"/>
        <!-- handles an array of SFMs, some need other information than the SFM to match them. -->
        <xsl:for-each select="$sfm">
            <xsl:choose>
                <xsl:when test="string-length(.) = 0"/>
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
    </xsl:function>
</xsl:stylesheet>
<!-- <xsl:template match="*[name() = $rowname]" mode="var">
        <gen:variable name="next1-{translate(ref,'.','-')}">
            <gen:call-template name="next">
                <gen:with-param name="style" select="{nextstyle1}"/>
                <gen:with-param name="curpos" select="$pos"/>
            </gen:call-template>
        </gen:variable>
        <gen:variable name="next2-{translate(ref,'.','-')}">
            <gen:call-template name="next">
                <gen:with-param name="style" select="{nextstyle2}"/>
                <gen:with-param name="curpos" select="$pos"/>
            </gen:call-template>
        </gen:variable>
    </xsl:template> -->

<?xml version="1.0" encoding="utf-8"?>
<!--
     #############################################################
     # Name:     	data2xslt.xslt
     # Purpose:  	Generate TNDD schema check from table of data.
     # Part of:  		Xrunner - https://github.com/SILAsiaPub/xrunner
     # Author:   	Ian McQuay <ian_mcquay@sil.org>
     # Created:  	2019-12-12
     # Modified:		2021-03-25
     # Copyright:	(c) 2019-2021 SIL International
     # Licence:  	<MIT>
     ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="xml"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
    <xsl:include href="project.xslt"/>
    <xsl:variable name="xml-pre" select="concat($projectpath,'\output\struc-data.xml')"/>
    <xsl:variable name="col-name" select="tokenize($data[1],'\t')"/>
<xsl:variable name="x1uri" select="f:file2uri(concat($projectpath,'\output\x1.xml'))"/>
    <xsl:variable name="x1">
        <xsl:for-each select="$data[position() gt 1]">
            <xsl:variable name="cell" select="tokenize(.,'\t')"/>
            <xsl:if test="string-length(test) gt 0">
                <xsl:element name="datarow">
                    <xsl:for-each select="$cell">
                        <xsl:variable name="pos" select="position()"/>
                        <xsl:element name="{$col-name[number($pos)]}">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="g1">
        <xsl:for-each-group select="$x1/*[not(disable = 'TRUE')]" group-by="element">
            <xsl:sort select="style"/>
            <!--  <xsl:element name="group">
                 <xsl:attribute name="id">
                 <xsl:value-of select="element[1]"/>
                 </xsl:attribute> -->
            <xsl:for-each-group select="current-group()" group-by="style">
                <xsl:sort select="rank" data-type="number"/>
                <xsl:element name="{element[1]}">
                    <xsl:attribute name="style">
                        <xsl:value-of select="style[1]"/>
                    </xsl:attribute>
                    <xsl:perform-sort select="current-group()">
                        <xsl:sort select="rank" data-type="number" order="ascending"/>
                        <!-- <xsl:copy-of select="current-group()"/> -->
                    </xsl:perform-sort>
                </xsl:element>
            </xsl:for-each-group>
            <!-- </xsl:element> -->
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:template match="/">
        <!-- Start here ======================================================================================== -->
        <gen:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <gen:variable name="para-like" select="'para table row book'"/>
            <xsl:call-template name="gen-static"/>
            <xsl:apply-templates select="$g1/*"/>
            <xsl:if test="$outputxml = $true">
                <xsl:call-template name="output-xml"/>
            </xsl:if>
        </gen:stylesheet>
<xsl:result-document href="{$x1uri}" format="xml">
<xsl:element name="x1">
<xsl:copy-of select="$x1"/>
</xsl:element>
</xsl:result-document>
    </xsl:template>
    <xsl:template match="cell">
        <gen:template match="{name()}">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:text>\<xsl:value-of select="@style"/><xsl:text> </xsl:text></gen:text>
                <gen:apply-templates select="node()"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="*[name() = $para-like]">
        <xsl:choose>
            <xsl:when test="name() = 'table'">
                <gen:template match="{name()}[@style = '{@style}']">
                    <gen:element name="div">
                        <gen:attribute name="class">
                            <xsl:text>table</xsl:text>
                            <xsl:apply-templates select="*"/>
                            <!-- <xsl:apply-templates select="$g1/para[string-length(@style) = 0]/*"/> -->
                        </gen:attribute>
                        <gen:apply-templates select="node()"/>
                    </gen:element>
                </gen:template>
            </xsl:when>
            <xsl:when test="string-length(@style) = 0">
                <gen:template match="{name()}">
                    <gen:element name="div">
                        <gen:attribute name="class">
                            <gen:value-of select="@style"/>
                            <xsl:apply-templates select="*"/>
                        </gen:attribute>
                        <gen:text>
                            <xsl:text>\</xsl:text>
                        </gen:text>
                        <gen:value-of select="@style"/>
                        <gen:text>
                            <xsl:text> </xsl:text>
                        </gen:text>
                        <gen:apply-templates select="node()">
                            <gen:with-param name="embedded" select="0"/>
                        </gen:apply-templates>
                    </gen:element>
                </gen:template>
            </xsl:when>
            <xsl:otherwise>
                <gen:template match="{name()}[@style = '{@style}']">
                    <gen:element name="div">
                        <gen:attribute name="class">
                            <gen:value-of select="@style"/>
                            <xsl:apply-templates select="*"/>
                            <xsl:apply-templates select="$g1/para[string-length(@style) = 0]/*"/>
                        </gen:attribute>
                        <gen:text>
                            <xsl:text>\</xsl:text>
                        </gen:text>
                        <gen:value-of select="@style"/>
                        <gen:text>
                            <xsl:text> </xsl:text>
                        </gen:text>
                        <xsl:if test="@style = 'id'">
                            <gen:value-of select="@code"/>
                            <gen:text>
                                <xsl:text> </xsl:text>
                            </gen:text>
                        </xsl:if>
                        <gen:apply-templates select="node()">
                            <gen:with-param name="embedded" select="0"/>
                        </gen:apply-templates>
                    </gen:element>
                </gen:template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="char[string-length(@style) = 0]">
        <gen:template match="char">
            <gen:param name="embedded"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <xsl:call-template name="char-gen"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="char">
        <gen:template match="char[@style = '{@style}']">
            <gen:param name="embedded"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:comment select="'common char errors'"/>
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <xsl:comment select="'style specific errors'"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <xsl:call-template name="char-gen"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template match="note">
        <gen:template match="note[@style = '{@style}']">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:comment select="'common char errors'"/>
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <xsl:comment select="'style specific errors'"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <xsl:call-template name="char-gen-note"/>
            </gen:element>
        </gen:template>
    </xsl:template>
    <xsl:template name="char-gen">
        <gen:text>\</gen:text>
        <gen:if test="$embedded = '1' and name() = 'char'">
            <gen:text>+</gen:text>
        </gen:if>
        <gen:value-of select="@style"/>
        <gen:text>
            <xsl:text>&#160;</xsl:text>
        </gen:text>
        <gen:apply-templates select="node()">
            <gen:with-param name="embedded" select="1"/>
        </gen:apply-templates>
        <gen:if test="not(@closed = 'false')">
            <gen:text>\</gen:text>
            <gen:if test="$embedded = '1' and name() = 'char'">
                <gen:text>+</gen:text>
            </gen:if>
            <gen:value-of select="@style"/>
            <gen:text>*</gen:text>
        </gen:if>
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
    <xsl:template match="datarow">
        <xsl:variable name="metalang" select="'^(pre=|post=|pre-char=|post-char=)'"/>
        <xsl:variable name="t1">
            <xsl:choose>
                <xsl:when test="matches(test,$metalang)">
                    <xsl:call-template name="seq">
                        <xsl:with-param name="string" select="test"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="test"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="t2">
            <xsl:choose>
                <xsl:when test="matches(test2,$metalang)">
                    <xsl:call-template name="seq">
                        <xsl:with-param name="string" select="test2"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="test2"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="comm" select="concat('ck-id ',ck-id,' - rank=',rank)"/>
        <xsl:choose>
            <!-- <xsl:when test="element = style"/> -->
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
    <!-- <xsl:template match="chapter"/> -->
    <xsl:template match="datarow" mode="css">
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
        <xsl:text>.</xsl:text>
        <xsl:value-of select="class"/>
        <xsl:text>::after {content:'</xsl:text>
        <xsl:value-of select="message"/>
        <xsl:text> #</xsl:text>
        <xsl:value-of select="ck-id"/>
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
    </xsl:template>
    <xsl:template name="gen-static">
        <gen:template match="chapter[@number]">
            <!-- Provide a style for each chapter -->
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
                .v {color:forestgreen;font-size:80%;font-weight:bold;}
                <xsl:apply-templates select="$g1//datarow" mode="css"/>
            </style>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:text>\c </gen:text>
                <gen:value-of select="@number"/>
            </gen:element>
        </gen:template>
        <gen:template match="verse[@number]">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                </gen:attribute>
                <gen:text>\v<xsl:text> </xsl:text></gen:text>
                <gen:value-of select="@number"/>
            </gen:element>
        </gen:template>
        <gen:template match="ref">
            <gen:apply-templates select="*"/>
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
            <!-- <xsl:when test="$part[1] = 'pre-char'">
                 <xsl:value-of select="concat('translate(substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1),',$sq,'+',$part[2],$sq,',',$sq,'_',$plus,$sq,') = ',$sq,'+',$sq)"/>
                 </xsl:when>
                 <xsl:when test="$part[1] = 'post-char'">
                 <xsl:value-of select="concat('translate(substring(following-sibling::node()[1],1,1),',$sq,'+',$part[2],$sq,',',$sq,'_',$plus,$sq,') = ',$sq,'+',$sq)"/>
                 </xsl:when> -->
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
            <!-- <xsl:when test="$subpart[2] = 'space'">
                 <xsl:text>substring(</xsl:text>
                 <xsl:value-of select="if ($subpart[1] = 'pre') then 'preceding' else 'following'"/>
                 <xsl:text>-sibling::node()[1],</xsl:text>
                 <xsl:value-of select="if ($subpart[1] = 'pre') then 'string-length(preceding-sibling::node()[1])' else '1'"/>
                 <xsl:text>,1) '</xsl:text>
                 <xsl:value-of select="if ($subpart[3] = 'not') then '!=' else '='"/>
                 <xsl:text> ' '</xsl:text>
                 </xsl:when> -->
            <xsl:otherwise>
                <xsl:text>invalid=</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>)</xsl:text>
    </xsl:template>
</xsl:stylesheet>
<!--  <xsl:call-template name="handle-css">
     <xsl:with-param name="array" select="$char-css"/>
     <xsl:with-param name="class" select="*[name() = 'class']"/>
     </xsl:call-template> -->
<!--    <xsl:template name="handle-css">
     <xsl:param name="array"/>
     <xsl:param name="class"/>
     <xsl:for-each select="$array">
     <xsl:choose>
     <xsl:when test="matches($class,'-pre-')">
     <xsl:value-of select="substring-after(.,'=')"/>
     <xsl:text>;</xsl:text>
     </xsl:when>
     <xsl:when test="matches($class,'-post-')">
     <xsl:value-of select="substring-after(.,'=')"/>
     <xsl:text>;</xsl:text>
     </xsl:when>
     <xsl:when test="substring-before(.,'=') = 'default'">
     <xsl:value-of select="substring-after(.,'=')"/>
     <xsl:text>;</xsl:text>
     </xsl:when>
     </xsl:choose>
     </xsl:for-each>
     </xsl:template> -->
<!--  <xsl:template match="group">
     <xsl:apply-templates select="*"/>
     </xsl:template> -->
<!--     <gen:template match="para">
     <gen:element name="div">
     <gen:attribute name="class">
     <gen:value-of select="@style"/>
     <xsl:apply-templates select="*"/>
     </gen:attribute>
     <gen:text>\</gen:text>
     <gen:value-of select="@style"/>
     <gen:text>
     <xsl:text> </xsl:text>
     </gen:text>
     <gen:apply-templates select="node()"/>
     </gen:element>
     </gen:template> -->
<!--             <xsl:otherwise>
     <gen:if test="{c3}">
     <xsl:choose>
     <xsl:when test="string-length(c4) > 0">
     <gen:if test="{c4}">
     <gen:text>
     <gen:text> </gen:text>
     <gen:value-of select="c6"/>
     </gen:text>
     </gen:if>
     </xsl:when>
     <xsl:otherwise>
     <gen:text>
     <gen:text> </gen:text>
     <gen:value-of select="c6"/>
     </gen:text>
     </xsl:otherwise>
     </xsl:choose>
     </gen:if> -->
<!-- <gen:template match="text()">
     <gen:element name="span">
     <gen:value-of select="."/>
     </gen:element>
     </gen:template>
     <gen:template match="text()">
     <gen:value-of select="translate(.,'&#10;&#13;','')"/>
     </gen:template> -->
<!--   <xsl:template name="para-gen">
     <xsl:param name="style"/>
     <xsl:param name="tree"/>
     <gen:element name="div">
     <gen:attribute name="class">
     <gen:value-of select="@style"/>
     <xsl:apply-templates select="tr"/>
     </gen:attribute>
     <gen:text>\</gen:text>
     <gen:value-of select="@style"/>
     <gen:text>
     <xsl:text> </xsl:text>
     </gen:text>
     <xsl:if test="@style = 'id'">
     <gen:value-of select="@id"/>
     <gen:text>
     <xsl:text> </xsl:text>
     </gen:text>
     </xsl:if>
     <gen:apply-templates select="node()"/>
     </gen:element>
     </xsl:template> -->

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
            <!-- <xsl:element name="elgroup"> -->
            <!--  <xsl:attribute name="id">
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
            <!-- </xsl:element>  -->
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:template match="/">
        <!-- Start here ======================================================================================== -->
        <gen:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <!-- <gen:variable name="para-like" select="'para'"/> -->
            <!-- <gen:element name="div"> -->
            <!-- <xsl:apply-templates select="//item" mode="next"/> -->
            <xsl:call-template name="gen-static"/>
            <xsl:apply-templates select="$g1/*"/>
            <xsl:if test="$outputxml = $true">
                <xsl:call-template name="output-xml"/>
            </xsl:if>
            <!-- </gen:element> -->
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
                <!-- <xsl:apply-templates select="$g1//table"/> -->
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
            <!-- <gen:variable name="pos" select="position()"/>
            <gen:variable name="lastlet" select="substring(.,string-length(.),1)"/>
            <gen:variable name="preverse" select="preceding::verse[1]/@number"/>
            <gen:variable name="prechapter" select="preceding::chapter[1]/@number"/> -->
            <!-- <xsl:call-template name="nprevar"> -->
            <!-- added 2022-12-14 to add some variables for some fields. Initially the n1-n3 fields -->
            <!-- <xsl:with-param name="style" select="@style"/>
            </xsl:call-template> -->
            <!-- <gen:variable name="pre1" select="count(preceding-sibling::*[@style = '{$sfm[1]}'][1]/preceding-sibling::*)"/>
            <gen:variable name="pre2" select="count(preceding-sibling::*[@style = '{$sfm[2]}'][1]/preceding-sibling::*)"/>
            <gen:variable name="post1" select="count(following-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
            <gen:variable name="post2" select="count(following-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/> -->
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="*"/>
                    <!-- <xsl:apply-templates select="$g1/para[string-length(@style) = 0]/*"/> -->
                </gen:attribute>
                <gen:value-of select="concat('\',@style,' ')"/>
                <gen:apply-templates select="node()">
                    <gen:with-param name="embedded" select="0"/>
                </gen:apply-templates>
            </gen:element>
        </gen:template>
        <!-- </xsl:otherwise>
        </xsl:choose> -->
    </xsl:template>
    <xsl:template match="char[string-length(@style) = 0]">
        <gen:template match="char">
            <gen:param name="embedded"/>
            <gen:variable name="pos" select="position()"/>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <!-- <xsl:apply-templates select="*"/> -->
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
            <!-- <gen:comment select="concat($lastchar,' - ',$lastchar2)"/> -->
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
    <!-- <xsl:template match="verse[@number]">
        <gen:template match="verse[@style = '{@style}']">
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <xsl:apply-templates select="$g1/verse/*"/>
                </gen:attribute>
                <gen:text>\</gen:text>
                <gen:value-of select="@style"/>
                <gen:text>
                    <xsl:text>&#160;</xsl:text>
                </gen:text>
                <gen:value-of select="@number"/>
            </gen:element>
        </gen:template>
    </xsl:template> -->
    <xsl:template match="note">
        <gen:template match="note[@style = '{@style}']">
            <xsl:apply-templates select="doc($sfm-var-xml-url)//item" mode="sfm-var">
                <xsl:with-param name="style" select="@style"/>
            </xsl:apply-templates>
            <gen:element name="span">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <!-- <xsl:comment select="'common char errors'"/> -->
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <!-- <xsl:comment select="'style specific errors'"/> -->
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
                    <!-- <xsl:comment select="'common char errors'"/> -->
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <!-- <xsl:comment select="'style specific errors'"/> -->
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
                    <!-- <xsl:comment select="'common char errors'"/> -->
                    <xsl:apply-templates select="$g1/char[string-length(@style) = 0]/*"/>
                    <!-- <xsl:comment select="'style specific errors'"/> -->
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
        <!-- <gen:text>\</gen:text>
        <gen:if test="$embedded = '1' and name() = 'char'">
            <gen:text>+</gen:text>
        </gen:if>
        <gen:value-of select="@style"/> -->
        <gen:text>
            <xsl:text>&#160;</xsl:text>
        </gen:text>
        <gen:apply-templates select="node()">
            <gen:with-param name="embedded" select="1"/>
        </gen:apply-templates>
        <!-- <gen:if test="not(@closed = 'false')">
            <gen:text>\</gen:text>
            <gen:if test="$embedded = '1' and name() = 'char'">
                <gen:text>+</gen:text>
            </gen:if>
            <gen:value-of select="@style"/>
            <gen:text>*</gen:text>
        </gen:if> -->
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
        <!-- <gen:variable name="dq">"</gen:variable>
        <gen:variable name="validversepart">abcdefghij</gen:variable>
        <gen:variable name="validversepartall">abcdefghij–</gen:variable>
        <gen:variable name="invalidversepart">klmnopqrstuvwxyz</gen:variable>
        <gen:variable name="validversepartsub">##########$$$$$$$$$$–:</gen:variable>
        <gen:variable name="validcvchar">1234567890abcdefghij</gen:variable>
        <gen:variable name="validcvcharsub">##########$$$$$$$$$$</gen:variable>
        <gen:variable name="validcvall">1234567890abcdefghij–:</gen:variable>
        <gen:variable name="versepartbadsub">$$$$$$$$$$$$$$$$$$</gen:variable>
        <gen:variable name="numb">1234567890</gen:variable>
        <gen:variable name="numbsub">##########</gen:variable>
        <gen:variable name="versepartsub">$$$$$$$$$$</gen:variable>
        <gen:variable name="gteq">&gt;=</gen:variable>
        <gen:variable name="lteq">&lt;=</gen:variable>
        <gen:variable name="alphalc">abcdefghijklmnopqrstuvwxyz</gen:variable>
        <gen:variable name="teclast2bad">.,"’”</gen:variable>
        <gen:variable name="tecfirstbad">"‘“</gen:variable>
        <gen:variable name="teclast2badsub">%%%%%</gen:variable>
        <gen:variable name="alphalcsub">$$$$$$$$$$$$$$$$$$$$$$$$$$</gen:variable>
        <gen:variable name="alphauc">ABCDEFGHIJKLMNOPQRSTUVWXYZ</gen:variable> -->
        <gen:template match="chapter[@number]">
            <!-- Provide a style for each chapter -->
            <xsl:if test="count(preceding::chapter[@number]) = 0">
                <xsl:call-template name="style"/>
            </xsl:if>
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="@style"/>
                    <!-- <xsl:apply-templates select="*"/> -->
                    <!-- <xsl:apply-templates select="$g1/para[string-length(@style) = 0]/*"/> -->
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
        <!-- <gen:template name="findsfm">
            <gen:param name="cursfm"/>
            <gen:param name="sfmpos"/>
            <gen:param name="limit"/>
            <gen:variable name="newpos" select="$sfmpos + 1"/>
            <gen:choose>
                <gen:when test="$newpos &gt; $limit">
                    <gen:text>100</gen:text>
                </gen:when>
                <gen:when test="*[$sfmpos]/name() = $cursfm">
                    <gen:value-of select="$newpos"/>
                </gen:when>
                <gen:otherwise>
                    <gen:call-template name="findsfm">
                        <gen:with-param name="cursfm" select="$cursfm"/>
                        <gen:with-param name="sfmpos" select="$newpos"/>
                        <gen:with-param name="limit" select="$limit"/>
                    </gen:call-template>
                </gen:otherwise>
            </gen:choose>
        </gen:template> -->
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
                    <!-- <xsl:apply-templates select="$g1/para[string-length(@style) = 0]/*"/> -->
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
                <!-- the following was removed as preceding positions handles with variables 2022-12-14 -->
                <!-- <xsl:choose>
                    <xsl:when test="$part[1] = 'sequencebefore'">
                        <xsl:value-of select="concat('$ref',$ref,'pre1 &lt; $ref',$ref,'pre2')"/>
                    </xsl:when>
                    <xsl:when test="$part[1] = 'sequenceafter'">
                        <xsl:value-of select="concat('$ref',$ref,'post1 &gt; $ref',$ref,'post2')"/>
                    </xsl:when>
                    <xsl:otherwise> -->
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
                <!-- </xsl:otherwise>
                </xsl:choose> -->
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
            <!-- <xsl:when test="$part[1] = 'next-valid'">
                <xsl:variable name="sfm1pos">
                    <xsl:call-template name="findsfm">
                        <xsl:with-param name="cursfm" select="$sfm[1]"/>
                        <xsl:with-param name="sfmpos" select="$pos"/>
                        <xsl:with-param name="limit" select="$pos + 10"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="sfm2pos">
                    <xsl:call-template name="findsfm">
                        <xsl:with-param name="cursfm" select="$sfm[2]"/>
                        <xsl:with-param name="sfmpos" select="$pos"/>
                        <xsl:with-param name="limit" select="$pos + 10"/>
                    </xsl:call-template>
                </xsl:variable> -->
            <!-- This is unfinished. I think the variables need to be called by para that have the meta lang -->
            <!-- </xsl:when> -->
            <xsl:otherwise>
                <xsl:text>invalid=</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>)</xsl:text>
    </xsl:template>
    <!-- <xsl:template match="table">
        <gen:template match="table">
            <gen:element name="div">
                <gen:attribute name="class">
                    <gen:value-of select="table"/>
                    <xsl:apply-templates select="*"/>
                </gen:attribute>
                <gen:apply-templates select="*"/>
            </gen:element>
        </gen:template>
    </xsl:template> -->
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
    <!-- <xsl:template match="item" mode="rel">
        <xsl:variable name="itempos" select="position()"/>
        <xsl:variable name="part" select="tokenize(test,'=')"/>
        <xsl:variable name="sfm" select="tokenize($part[2],' ')"/>
        <xsl:choose>
            <xsl:when test="matches($part[1],'sequencebefore')"> -->
    <!-- <gen:variable name="item{$itempos}-sfm1" select="{$sfm[1]}"/> -->
    <!-- <gen:variable name="item{$itempos}-sfm2" select="{$sfm[2]}"/> -->
    <!-- <gen:variable name="ref{Ref}pre1" select="count(preceding-sibling::*[@style = '{$sfm[1]}'][1]/preceding-sibling::*)"/>
                <gen:variable name="ref{Ref}pre2" select="count(preceding-sibling::*[@style = '{$sfm[2]}'][1]/preceding-sibling::*)"/>
            </xsl:when>
            <xsl:when test="matches($part[1],'sequenceafter')">
                <gen:variable name="ref{Ref}post1" select="count(following-sibling::*[@style = $sfm1][1]/preceding-sibling::*)"/>
                <gen:variable name="ref{Ref}post2" select="count(following-sibling::*[@style = $sfm2][1]/preceding-sibling::*)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> -->
    <xsl:template name="nprevar">
        <!-- added 2022-12-14 to always have these preceding positions of certain elements available so can be used in test and test2 Used in in 12.x -->
        <xsl:param name="style"/>
        <xsl:choose>
            <xsl:when test="$style = 'n1'">
                <gen:variable name="pren1" select="count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
                <gen:variable name="pres5" select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
                <gen:variable name="pren1tec" select="preceding-sibling::*[@style = 'n1'][1]/*[@style = 'tec'][1]/text()"/>
                <gen:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
            </xsl:when>
            <xsl:when test="$style = 'n2'">
                <gen:variable name="pren1" select="count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
                <gen:variable name="pres5" select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
                <gen:variable name="pren2" select="count(preceding-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/>
                <gen:variable name="pren1tec" select="preceding-sibling::*[@style = 'n1'][1]/*[@style = 'tec'][1]/text()"/>
                <gen:variable name="pren2tec" select="preceding-sibling::*[@style = 'n2'][1]/*[@style = 'tec'][1]/text()"/>
                <gen:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
            </xsl:when>
            <xsl:when test="$style = 'n3'">
                <gen:variable name="pren1" select="count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
                <gen:variable name="pres5" select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
                <gen:variable name="pren2" select="count(preceding-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/>
                <gen:variable name="pren3" select="count(preceding-sibling::*[@style = 'n3'][1]/preceding-sibling::*)"/>
                <gen:variable name="pren1tec" select="preceding-sibling::*[@style = 'n1'][1]/*[@style = 'tec'][1]/text()"/>
                <gen:variable name="pren2tec" select="preceding-sibling::*[@style = 'n2'][1]/*[@style = 'tec'][1]/text()"/>
                <gen:variable name="pren3tec" select="preceding-sibling::*[@style = 'n3'][1]/*[@style = 'tec'][1]/text()"/>
                <gen:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
            </xsl:when>
            <xsl:when test="$style = 's3' or $style = 's5' ">
                <gen:variable name="vaftercolon" select="substring-after(.,':')"/>
            </xsl:when>
            <xsl:when test="$style = 's5' ">
                <gen:variable name="cprecolon" select="substring-before(.,':')"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
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
<!-- <xsl:choose>
            <xsl:when test="name() = 'table'">

            </xsl:when>
            <xsl:when test="string-length(@style) = 0">
                <gen:template match="{name()}">
                    <gen:variable name="pos" select="position()"/>
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
            <xsl:otherwise> -->

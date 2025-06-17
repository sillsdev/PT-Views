<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	TNND-highlighter.xslt
    # Purpose:  	Highlight character elements.
    # Part of:  	Paratext Views - https://github.com/sillsdev/pt-views
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2024-06-26
    # Copyright:	(c) 2024 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:variable name="para-like" select="'para table row book'"/>
    <xsl:template match="/">
        <style type="text/css">
body {line-height:1.2;}
.id {color:darkred;}
.char {background:khaki;}
.jmp {}
.jmp-val {border-bottom:2pt blue solid;color:blue;font-weight:bold;font-weight:bold;}
.jmpref {border-bottom:none;color:grey;}
.sbx {color:red;}
.tec {color:blueviolet;font-weight:bold;}
.teu {color:blue;}
.teu-val {border-bottom:1pt blue solid;}
.trs {color:fuchsia;font-style:italic;}
.ros {color:darkred;}
.imp {color:darkgreen;}
.ppl {color:blueviolet;}
.f {background:#ccff99;}
.ft {background:#ccff99;}
.tbb {background:paleturquoise;}
.brk {background:chartreuse;}
.sfm {color:grey;font-size:60%;}
td {border:thin black solid;}
.sfmrow {border:none}
table {border-collapse: collapse;}
.mt4 {font-weight:bold;text-align:center;}
.mt2 {font-weight:bold;text-align:center;}
.s4 {font-weight:bold;}
.n2 {padding-left:2em;}
.qp, .qor, .qns, .n3 {padding-left:4em;}
.li1 {padding-left:2em;}
.s5 {font-family:Arial;color:darkblue;font-weight:bold;}
span &gt; span {border:thin black solid;}
.v {color:cyan;font-weight:bold;}
.c {font-size:150%;font-weight:bold;}
.rem {background:#ccff00;}
.sfmchar {padding: 0;margin:0;}
td span {padding: 0;margin:0;}
td {padding: 0;margin:0;}
.ord-val {vertical-align: super;}
</style>
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    <xsl:template match="book">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:text>id</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="chapter[@number]">
        <xsl:variable name="sfm" select="concat('\',@style)"/>
        <xsl:element name="hr"/>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:value-of select="$sfm"/>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat(@style,'-val')"/>
                </xsl:attribute>
                <xsl:value-of select="@number"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="verse[@number]">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:text>\v </xsl:text>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat(@style,'-val')"/>
                </xsl:attribute>
                <xsl:value-of select="@number"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ref">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    <xsl:template match="table">
        <xsl:element name="table">
            <xsl:attribute name="class">table
         </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="para">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:value-of select="concat('\',@style,'&#160;')"/>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat(@style,'-val')"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()">
                    <xsl:with-param name="embedded" select="0"/>
                </xsl:apply-templates>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="char">
        <xsl:param name="embedded"/>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:text>\</xsl:text>
                <xsl:if test="$embedded = '1' and name() = 'char'">
                    <xsl:text>+</xsl:text>
                </xsl:if>
                <xsl:value-of select="@style"/>
                <xsl:text>&#160;</xsl:text>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat(@style,'-val')"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()">
                    <xsl:with-param name="embedded" select="1"/>
                </xsl:apply-templates>
            </xsl:element>
            <xsl:apply-templates select="@link-href"/>
            <xsl:if test="not(@closed = 'false')">
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="concat('sfm sfmpost sfm',name())"/>
                    </xsl:attribute>
                    <xsl:text>\</xsl:text>
                    <xsl:if test="$embedded = '1' and name() = 'char'">
                        <xsl:text>+</xsl:text>
                    </xsl:if>
                    <xsl:value-of select="@style"/>
                    <xsl:text>*</xsl:text>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    <xsl:template match="@link-href">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>jmpref</xsl:text>
            </xsl:attribute>
            <xsl:text>|</xsl:text>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="cell">
        <xsl:element name="td">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:value-of select="concat('\',@style,'&#160;')"/>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat(@style,'-val')"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="row[@style = 'tr']">
        <xsl:variable name="sfm" select="concat('\',@style,'&#160;')"/>
        <xsl:element name="tr">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="td">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:value-of select="$sfm"/>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat(@style,'-val')"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()">
                    <xsl:with-param name="embedded" select="0"/>
                </xsl:apply-templates>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="note[@style = 'f']">
        <xsl:variable name="sfm" select="concat('\',@style,'&#160;')"/>
        <xsl:variable name="sfme" select="concat('\',@style,'*')"/>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:value-of select="$sfm"/>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat(@style,'-val')"/>
                </xsl:attribute>
                <xsl:value-of select="@caller"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="node()"/>
            </xsl:element>
            <xsl:if test="not(@closed = 'false')">
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="concat('sfm sfm',name())"/>
                    </xsl:attribute>
                    <xsl:value-of select="$sfme"/>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

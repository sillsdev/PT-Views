<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	usx-highlighter.xslt
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
.char {background:khaki;}
.jmp {color:blue;}
.sbx {color:red;}
.tec {color:blueviolet;}
.teu {color:blue;}
.trs {color:fuchsia;}
.ros {color:darkred;}
.imp {color:darkgreen;}
.ppl {color:blueviolet;}
.f {background:#ccff99;}
.ft {background:#ccff99;}
.tbb {background:paleturquoise;}
.brk {background:chartreuse;}
.sfm {color:grey;font-size:60%;}
span > span {border:thin black solid;}
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
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat('sfm sfm',name())"/>
            </xsl:attribute>
            <xsl:value-of select="$sfm"/>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:value-of select="@number"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="verse[@number]">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat('sfm sfm',name())"/>
            </xsl:attribute>
            <xsl:text>\v </xsl:text>
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:value-of select="@number"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ref">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="table[@style = '']">
        <xsl:element name="div">
            <xsl:attribute name="class">table
         </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="para">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat('sfm sfm',name())"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,'&#160;')"/>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="char">
        <xsl:param name="embedded"/>
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
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="1"/>
            </xsl:apply-templates>
        </xsl:element>
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
    </xsl:template>
    <xsl:template match="cell">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat('sfm sfm',name())"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,'&#160;')"/>
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="row[@style = 'tr']">
        <xsl:variable name="sfm" select="concat('\',@style,'&#160;')"/>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat('sfm sfm',name())"/>
            </xsl:attribute>
            <xsl:value-of select="$sfm"/>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="note[@style = 'f']">
        <xsl:variable name="sfm" select="concat('\',@style,'&#160;')"/>
        <xsl:variable name="sfme" select="concat('\',@style,'*')"/>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat('sfm sfm',name())"/>
            </xsl:attribute>
            <xsl:value-of select="$sfm"/>
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
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
    </xsl:template>
</xsl:stylesheet>

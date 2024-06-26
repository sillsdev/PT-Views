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
    <xsl:template match="chapter[@number]">
        <style type="text/css">
.char {background:whitesmoke;}
.sbx {color:red;}
.tbb {color:blue;}

</style>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:text>\c </xsl:text>
            </xsl:element>
            <xsl:value-of select="@number"/>
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
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
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
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="1"/>
            </xsl:apply-templates>
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
    <xsl:template match="cell">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@style,' ',name())"/>
            </xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('sfm sfm',name())"/>
                </xsl:attribute>
                <xsl:value-of select="concat('\',@style,'&#160;')"/>
            </xsl:element>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="row[@style = 'tr']">
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
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

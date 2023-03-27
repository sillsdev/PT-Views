<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:param name="sfm" select="'n1'"/>
    <xsl:variable name="para-like" select="'para'"/>
    <xsl:variable name="dq">"</xsl:variable>
    <xsl:variable name="versepart">abcdefgh</xsl:variable>
    <xsl:variable name="versepartbad">ijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="versepartgood">1234567890abcdefgh–:</xsl:variable>
    <xsl:variable name="versepartbadsub">$$$$$$$$$$$$$$$$$$</xsl:variable>
    <xsl:variable name="numb">1234567890</xsl:variable>
    <xsl:variable name="numbsub">##########</xsl:variable>
    <xsl:variable name="versepartsub">$$$$$$$$</xsl:variable>
    <xsl:variable name="gteq">&gt;=</xsl:variable>
    <xsl:variable name="lteq">&lt;=</xsl:variable>
    <xsl:variable name="alphalc">abcdefghijklmnopqrstuvwxyz</xsl:variable>
    <xsl:variable name="teclast2bad">.,"’”</xsl:variable>
    <xsl:variable name="tecfirstbad">"‘“</xsl:variable>
    <xsl:variable name="teclast2badsub">%%%%%</xsl:variable>
    <xsl:variable name="alphalcsub">$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
    <xsl:variable name="alphauc">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
    <xsl:template match="chapter[@number]">
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
.testerror::after {content:'The \\n2 occurs before any \\n1 in this \\s5 note group';}
.testerror {border-bottom:2pt solid red}
.testerror2::after {content:'The \\n3 occurs before any \\n2 in this \\s5 note group';}
.testerror2 {border-bottom:2pt solid red}

</style>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="@style"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ',@number)"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="para[@style = 'n2']">
        <xsl:variable name="pos" select="position()"/>
        <xsl:variable name="lastlet" select="substring(.,string-length(.),1)"/>
<xsl:variable name="pre1" select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
<xsl:variable name="pre2" select="count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
        <xsl:variable name="sfm1" select="count(following-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
        <xsl:variable name="sfm2" select="count(following-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/>
        <xsl:variable name="sfm3" select="count(following-sibling::*[@style = 'n3'][1]/preceding-sibling::*)"/>)
        <xsl:variable name="sfmend" select="count(following-sibling::*[@style = 'p'][1]/preceding-sibling::*)"/>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="@style"/>
                <!--ref 12.2 - rank=-->
<!-- ($sfm1 &lt; $sfmend and $pos &lt; $sfm1)  and $sfm1 &gt; $sfm2 -->
                <xsl:if test="$pre2 &lt; $pre1">
                    <xsl:value-of select="concat(' testerror testbed-',$pos,'-',$sfm1,'-',$sfm2,'-',$sfmend)"/>
                </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="para[@style = 'n3']">
        <xsl:variable name="pos" select="position()"/>
        <xsl:variable name="lastlet" select="substring(.,string-length(.),1)"/>
<xsl:variable name="pre1" select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
<xsl:variable name="pre2" select="count(preceding-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/>
        <xsl:variable name="sfm1" select="count(following-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
        <xsl:variable name="sfm2" select="count(following-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/>
        <xsl:variable name="sfm3" select="count(following-sibling::*[@style = 'n3'][1]/preceding-sibling::*)"/>)
        <xsl:variable name="sfmend" select="count(following-sibling::*[@style = 'p'][1]/preceding-sibling::*)"/>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="@style"/>
                <!--ref 12.2 - rank=-->
<!-- ($sfm1 &lt; $sfmend and $pos &lt; $sfm1)  and $sfm1 &gt; $sfm2 -->
                <xsl:if test="$pre2 &lt; $pre1">
                    <xsl:value-of select="concat(' testerror2 testbed-',$pos,'-',$sfm1,'-',$sfm2,'-',$sfmend)"/>
                </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="Ref">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:element name="span">
            <xsl:value-of select="concat(name(),'=',$dq,.,$dq)"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="usx">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="'usx'"/>
            </xsl:attribute>
            <xsl:apply-templates select="*"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="book">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="@style"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="verse[@style = 'v']">
        <xsl:variable name="pos" select="position()"/>
        <xsl:variable name="parent" select="parent::*/@style"/>
        <xsl:element name="verse">
            <xsl:attribute name="number">
                <xsl:value-of select="@number"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="@style"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ',@number,' ')"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="para">
        <xsl:variable name="pos" select="position()"/>
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="@style"/>
                <!--ref 9.1 - rank=-->
            </xsl:attribute>
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="node()">
                <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

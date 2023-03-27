<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	.xslt
    # Purpose:  	Create a report for one or more books for a numbered check.
    # Part of:  	Xrunner - https://github.com/SILAsiaPub/xrunner
    # Author:   	Ian McQuay <ian_mcquay@sil.org>
    # Created:  	2022-01-17
    # Copyright:	(c) 2022 SIL International
    # Licence:  	<MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <!-- <xsl:output method="text" encoding="utf-8" /> -->
    <xsl:include href="project.xslt"/>
    <xsl:variable name="col-name" select="tokenize($data[1],'\t')"/>
    <xsl:variable name="x1">
        <xsl:for-each select="$data[position() gt 1]">
            <xsl:variable name="cell" select="tokenize(.,'\t')"/>
            <xsl:element name="datarow">
                <xsl:for-each select="$cell">
                    <xsl:variable name="pos" select="position()"/>
                    <xsl:element name="{$col-name[number($pos)]}">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:variable>
    <xsl:template match="*[@class = 'c']">
        <xsl:element name="h3">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="verse[@number]">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="@style"/>
            </xsl:attribute>
            <xsl:text>\v </xsl:text>
            <xsl:value-of select="@number"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*[matches(@class,' err-')]">
        <xsl:variable name="eachclass" select="tokenize(@class,' ')"/>
        <div class="grow">
            <div class="errmessage">
                <xsl:value-of select="preceding::*[@class = 'c'][1]"/>
                <xsl:text>:</xsl:text>
                <!-- <xsl:value-of select="preceding::*[@class = 'v'][1]"/> -->
                <xsl:text>&#x2003;</xsl:text>
                <xsl:value-of select="substring(preceding::*[@class = 'sl1'][1]/node()[1],5)"/>
                <xsl:text> </xsl:text>
                <xsl:for-each select="$eachclass[position() gt 1]">
                    <xsl:variable name="ruleno" select="tokenize(.,'\-')[last()]"/>
                    <xsl:text>&#x2003;#</xsl:text>
                    <xsl:value-of select="$ruleno"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$x1/*[ck-id = $ruleno]/message"/>
                    <!-- <xsl:value-of select="f:lookup('TNDD data',$data,$ruleno,'&#9;',2,11)"/> -->
                </xsl:for-each>
            </div>
            <xsl:if test="not(preceding-sibling::*[3]/@class = 'sl1')">
                <xsl:if test="preceding::*[@class = 'sl1'][1]">
                    <div class="context">
                        <xsl:copy-of select="preceding::*[@class = 'sl1'][1]"/>
                    </div>
                </xsl:if>
            </xsl:if>
            <xsl:copy-of select="preceding-sibling::*[3][not(name() = 'style')]"/>
            <xsl:copy-of select="preceding-sibling::*[2]"/>
            <xsl:copy-of select="preceding-sibling::*[1]"/>
            <xsl:copy-of select="."/>
            <xsl:copy-of select="following-sibling::*[1]"/>
            <xsl:copy-of select="following-sibling::*[2]"/>
            <xsl:copy-of select="following-sibling::*[3]"/>
        </div>
    </xsl:template>
    <xsl:template match="/*[not(@class)]">
        <xsl:copy>
            <xsl:copy-of select="style[1]"/>
            <style type="text/css">
.grow {
  padding: 5px 5px 5px 5px;
  border-radius:10px;
    height: 20px; 
    margin: 5px 1% 5px 5%; 
    position: relative; 
    transition:height 5s; 
    -webkit-transition:height 5s; 
    text-align: left;
  overflow: hidden;

}
.grow:hover {
    height: auto; /* This is the height on hover */
}
.errmessage {text-align:left;font-size:14pt;font-weight:bold;background-color:silver;padding-top:10px 0 10px 0;}
.errmessagechar {text-align:left;font-size:14pt;font-weight:bold;background-color:lightyellow;padding-top:10px 0 10px 0;}
.subpara {margin-top:30px;}
.context {padding-left:60px;}
</style>
            <xsl:apply-templates select="*[not(style)]"/>
            <!-- <div class="subpara">
                <h2>Character Errors</h2>
                <xsl:apply-templates select="*[not(style)]" mode="subpara"/>
            </div> -->
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*[@class][not(contains(@class,'err-')) and not(@class = 'c')]">
        <xsl:variable name="allclass" select="descendant::*/@class"/>
        <xsl:variable name="errclass">
            <xsl:for-each select="$allclass">
                <xsl:if test="contains(.,' err-')">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
<xsl:variable name="eachclass" select="tokenize($errclass,' ')"/>
        <xsl:if test="string-length($errclass) > 10">
            <div class="grow">
                <div class="errmessagechar">
                <xsl:text>&#x2003;</xsl:text>
                <xsl:value-of select="substring(preceding::*[@class = 'sl1'][1]/node()[1],5)"/>
                <xsl:text> </xsl:text>
                <xsl:for-each select="$eachclass[position() gt 1]">
                    <xsl:variable name="ruleno" select="tokenize(.,'\-')[last()]"/>
                    <xsl:text>&#x2003;#</xsl:text>
                    <xsl:value-of select="$ruleno"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$x1/*[ck-id = $ruleno]/message"/>
                    <!-- <xsl:value-of select="f:lookup('TNDD data',$data,$ruleno,'&#9;',2,11)"/> -->
                </xsl:for-each>


                </div>
                <xsl:if test="preceding::*[@class = 'sl1'][1]">
                    <div class="context">
                        <xsl:copy-of select="preceding::*[@class = 'sl1'][1]"/>
                    </div>
                </xsl:if>
                <xsl:copy-of select="."/>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="style"/>
    <xsl:template match="text()"/>
    <!-- <xsl:template match="text()" mode="subpara"/> -->
    <!--  <xsl:template match="*" mode="subpara">
        <xsl:variable name="allclass" select="descendant::*/@class"/>
        <xsl:variable name="errtest">
            <xsl:for-each select="$allclass">
                <xsl:if test="contains(.,' err-')">
                    <xsl:value-of select="'true'"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:if test="$errtest = 'true'">
            <div class="grow">
                <div class="errmessage">
                    <xsl:value-of select="substring(preceding::*[@class = 'sl1'][1]/node()[1],5)"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@class"/>
                </div>
                <xsl:copy-of select="preceding::*[@class = 'sl1'][1]"/>
                <xsl:copy-of select="."/>
            </div>
        </xsl:if>
    </xsl:template> -->
</xsl:stylesheet>

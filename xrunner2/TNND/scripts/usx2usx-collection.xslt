<?xml version="1.0"?>
<!--
    #############################################################
    # Name:         usx2usx-collection.xslt
    # Purpose:      Combine multiple USX files into a collection
    # Part of:      Xrunner - https://github.com/SILAsiaPub/xrunner
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2020-09-29
    # Copyright:    (c) 2020 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:include href='inc-copy-anything.xslt'/>
       <!-- <xsl:include href="inc-list2xml-xattrib.xslt"/> -->
      <xsl:include href="project.xslt"/>
      <xsl:variable name="usxpathuri" select="f:file2uri($usxpath)"/>
      <xsl:variable name="collection" select="collection(concat($usxpathuri,'?select=',$collectionfile))"/>
       <!-- <xsl:variable name="groupnodes" select="tokenize($groupnodelist,'\s+')"/> -->
      <xsl:output method="xml" encoding="utf-8" indent="yes"/>
      <xsl:template match="/">
            <data>
                  <xsl:for-each select="$collection/usx">
                        <xsl:sort select="number(f:sequence(book/@code))"/>
                        <xsl:variable name="pos" select="position()"/>
                        <xsl:variable name="book" select="book/@code"/>
                        <xsl:if test="$book = $include-book">
                              <xsl:copy>
                                    <xsl:attribute name="book">
                                          <xsl:value-of select="$book"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="seq">
                                          <xsl:value-of select="f:sequence($book)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="pos">
                                          <xsl:value-of select="$pos"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="bookname">
                                          <xsl:value-of select="$pos"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="@*|node()"/>
                                    <!-- <xsl:for-each-group select="*" group-starting-with="*[local-name() = $groupnodes]">
                                          <xsl:choose>
                                                <xsl:when test="self::*[local-name() = $groupnodes]">
                                                      <xsl:element name="{local-name()}Group">
                                                            <xsl:attribute name="book">
                                                                  <xsl:value-of select="$book"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="number">
                                                                  <xsl:choose>
                                                                        <xsl:when test="not(@number)">
                                                                              <xsl:text>0</xsl:text>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                              <xsl:value-of select="@number"/>
                                                                        </xsl:otherwise>
                                                                  </xsl:choose>
                                                            </xsl:attribute>
                                                            <xsl:apply-templates select="current-group()"/>
                                                      </xsl:element>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                      <xsl:apply-templates select="current-group()"/>
                                                </xsl:otherwise>
                                          </xsl:choose>
                                    </xsl:for-each-group> -->
                              </xsl:copy >
                        </xsl:if>
                  </xsl:for-each>
            </data>
      </xsl:template>
      <xsl:function name="f:sequence">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$string = $usxseq-key">
                        <xsl:value-of select="f:keyvalue($usxseq,$string)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>1001</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>

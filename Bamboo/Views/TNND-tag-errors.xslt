<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="xml"
               version="1.0"
               encoding="utf-8"
               omit-xml-declaration="yes"
               indent="yes"/>
   <xsl:variable name="sq">'</xsl:variable>
   <xsl:variable name="dq">"</xsl:variable>
   <xsl:variable name="project">TNND</xsl:variable>
   <xsl:variable name="numb">1234567890</xsl:variable>
   <xsl:variable name="numbsub">##########</xsl:variable>
   <xsl:variable name="validvlet">abcdefghij</xsl:variable>
   <xsl:variable name="validvletsub">$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validvletpunc">–abcdefghij</xsl:variable>
   <xsl:variable name="invalidvlet">klmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="validcvnumblet">1234567890abcdefghij</xsl:variable>
   <xsl:variable name="validcvnumbletsub">##########$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validcvnumbletpunc">1234567890abcdefghij–:</xsl:variable>
   <xsl:variable name="letlc">abcdefghijklmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="letuc">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
   <xsl:variable name="letsub">$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="letulc">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="letulcsub">$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="invalidtecendpunc">.,’”</xsl:variable>
   <xsl:variable name="invalidtecendpuncsub">%%%%</xsl:variable>
   <xsl:variable name="invalidtecfirstpunc">‘“</xsl:variable>
   <xsl:variable name="validreorderedcvnumbletpunc">1234567890abcdefghij–:,</xsl:variable>
   <xsl:variable name="letucnumb">ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789</xsl:variable>
   <xsl:variable name="letucnumbsub">$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validcvnumbletendash">1234567890abcdefghij–</xsl:variable>
   <xsl:variable name="validcvnumbletendashsub">##########$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validvletendash">abcdefghij–,</xsl:variable>
   <xsl:variable name="puncreplace">,….“‘’”!?:—-</xsl:variable>
   <xsl:variable name="puncreplacespace"/>
   <xsl:variable name="ldq">“</xsl:variable>
   <xsl:variable name="rdq">”</xsl:variable>
   <xsl:variable name="lsq">‘</xsl:variable>
   <xsl:variable name="rsq">’</xsl:variable>
   <xsl:variable name="version">7</xsl:variable>
   <xsl:variable name="view"> tag errors view </xsl:variable>
   <xsl:variable name="modified"> Modified: </xsl:variable>
   <xsl:variable name="moddate">2024-09-10</xsl:variable>
   <xsl:variable name="postrsq">”,.</xsl:variable>
   <xsl:variable name="validrsqcontext">’ </xsl:variable>
   <xsl:variable name="ellipsis">…</xsl:variable>
   <xsl:template match="chapter[@number]">
      <xsl:if test="count(preceding::chapter[@number]) = 0">
         <xsl:call-template name="style"/>
      </xsl:if>
      <xsl:element name="h4">
         <xsl:value-of select="concat('Version: ',$version,' ',$project,$view,$modified,$moddate)"/>
      </xsl:element>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ',@number)"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="Ref">
      <xsl:apply-templates select="*"/>
   </xsl:template>
   <xsl:template match="@*">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="name()"/>
         </xsl:attribute>
         <xsl:value-of select="concat(' ',name(),'=',$dq,.,$dq)"/>
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
   <xsl:template match="cell">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:text>cell </xsl:text>
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:value-of select="@number"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="*[@style = 'b' or @style = 'rem']">
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <xsl:template name="style">
      <style type="text/css">
div {white-space: normal;}
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
.quote-error-f {background:orange;border-top:2pt solid red;}
.quote-error-f:after {content:'This double quote in the above \\f footnote, is preceeded by an opening double quote, it should either be single quoted or there is some preceding error.';}
.quote-error-n1 {background:orange;border-top:2pt solid red;}
.quote-error-n1:after {content:'This double quote in the above \\n1 paragraph, is preceeded by an opening double quote, it should either be single quoted or there is some preceding error.';}
.quote-error-n2 {background:orange;border-top:2pt solid red;}
.quote-error-n2:after {content:'This double quote in the above \\n2 paragraph, is preceeded by an opening double quote, it should either be single quoted or there is some preceding error.';}
.quote-error-n3 {background:orange;border-top:2pt solid red;}
.quote-error-n3:after {content:'This double quote in the above \\n3 paragraph, is preceeded by an opening double quote, it should either be single quoted or there is some preceding error.';}
.quote-error-ntn {background:orange;border-top:2pt solid red;}
.quote-error-ntn:after {content:'This double quote in the above \\ntn paragraph, is preceeded by an opening double quote, it should either be single quoted or there is some preceding error.';}
.err-table--post-6-1 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-6-1::after {content:'When you have a Part Box, a Division Box must occur after the Part summary.  (But any \tr in the Part summary will cause a false positive.)  [N6.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--post-6-2 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-6-2::after {content:'When you have a Division Box, a Section Box must occur after the Division summary. (But any \tr in the Div. summary will cause a false positive.)  [N6.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--post-6-3 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-6-3::after {content:'When you have a Section Box, a Paragraph Box must occur after the Section summary. (But any \\tr in the Section summary will cause a false positive.)  [N6.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--pre-7-2 {background:peachpuff;border-top:2pt solid red;}
.err-table--pre-7-2::after {content:'There should be a \\b before a \\tr (and after the \\p (or b3) \\v paragraph), except at v.1.  [N7.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-1::after {content:'The chapter number in this \\s5 should match the current chapter number.  [N8.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-21 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-21::after {content:'The verse number in this \\s5 should match the current verse number.  [N8.21]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-21-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-21-2::after {content:'The verse number in this \\s5 should match the current verse number.  [N8.21.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-23 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-23::after {content:'The first verse number in the range in this \\s5 should match the first number of current verse range.  [N8.23]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-26 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-26::after {content:'The verse number in this \\s5 must be within the current verse range.  [N8.26]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-3::after {content:'This \\s5 reference has invalid character(s). Numbers, colon, en dash, and letters a–j are allowed.  [N8.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-3-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-3-1::after {content:'This \\s5 reference has invalid character(s). Numbers, colon, en dash, comma, and letters a–j are allowed.  [N8.3.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-3-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-3-2::after {content:'This \\s5 reference is reordered and does not contain a \\tbb between the verse reference and the (reordered) part.  [N8.3.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-22 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-22::after {content:'The first verse number in the range in this \\s5 should match current verse number.  [N8.22]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-25 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-25::after {content:'This \\s5 must contain a colon between the chapter and verse.  [N8.25]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-9-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-9-1::after {content:'The hyphen in a verse range in this paragraph should be an en dash.  [N9.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-23-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-23-1::after {content:'This paragraph type should not be empty. Allowed are \\b, \\b2, and , if needed, \\tc2, \\tc3. \\tc4, and \\tc5.  [N23.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-26-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-26-1::after {content:'This paragraph contains a straight quote mark. It should be a curly quote mark.  [N26.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-qp-pre-14-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-qp-pre-14-2::after {content:'Two \\qp paragraphs, one after the other, are not allowed, unless it is one example with two paragraphs, or you are illustrating parallel lines of Hebrew poetry.  [N14.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ntn-pre-18-1 {background:peachpuff;border-top:2pt solid red;}
.err-para-ntn-pre-18-1::after {content:'An \\ntn should be preceeded by a \\s3, \\s5, \\tr, \\ntn, \\qp, \\qns, \\q1tn, \\q2tn, \\li1, \\li2, \\hb1, \\gra, or \\gj.  [N18.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ntn-mid-24-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ntn-mid-24-1::after {content:'An \\ntn should not contain a \\tec.  [N24.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gj-mid-22-9 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gj-mid-22-9::after {content:'This \\gj paragraph is missing a ‘Click here...’ jump link ( \\jmp).  [N22.9]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gj-mid-22-9-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gj-mid-22-9-1::after {content:'This \\gj paragraph should contain only one ‘Click here...’ \\jmp item, and no other text or markup.  [N22.9.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gj-pre-22-9-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-gj-pre-22-9-2::after {content:'The paragraph preceding this \\gj paragraph is not a \\gra.  [N22.9.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b2-pre-23-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-b2-pre-23-2::after {content:'A \\b2 should not precede a \\b.  [N23.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b2-mid-23-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b2-mid-23-4::after {content:'A \\b2 paragraph should be empty.  [N23.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-post-23-3 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b-post-23-3::after {content:'A \\b2 should not follow a \\b.  [N23.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-mid-23-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b-mid-23-5::after {content:'A \\b paragraph should be empty.  [N23.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-mid-12-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n1-mid-12-1::after {content:'The contents of this \\n1 \\tec is a portion of the previous \\n1 \\tec. Perhaps this should be an \\n2?  [N12.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-post-14-1 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-n1-post-14-1::after {content:'Only these paragraphs are allowed after a \\n1: \\n1 \\n2 \\n3 \\ntn \\qp \\q1tn \\q2tn \\b \\b2 \\b3 \\p \\s5 \\li1 \\hb1 \\s3 \\gra \\c.  [N14.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-mid-10-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n1-mid-10-1::after {content:'There should be only one \\tec per \\n1 paragraph.  [N10.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-mid-10-1-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n1-mid-10-1-4::after {content:'This \\n1 paragraph is missing a \\tec, or perhaps should be a \\n2 or a \\ntn.  [N10.1.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7-3::after {content:'The contents of this \\n2 \\tec are not found in the preceding \\n1 \\tec.  [N12.7.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7-4::after {content:'The contents of this \\n2 \\tec are not found in the preceding \\n1 \\tec.  [N12.7.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-pre-12-8-1 {background:peachpuff;border-top:2pt solid red;}
.err-para-n2-pre-12-8-1::after {content:'There is no \\n1 preceding this \\n2. It should be an \\n1.  [N12.8.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-10-1-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-10-1-2::after {content:'There not should be two or more \\tec in a \\n2 paragraph.  [N10.1.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7::after {content:'The contents of this \\n2 \\tec are not found in the preceding \\n1 \\tec. Perhaps this should be an \\\n1?  [N12.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7-1::after {content:'The contents of this \\n2 \\tec are not found in the preceding \\n1 \\tec.  [N12.7.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7-2::after {content:'The contents of this \\n2 \\tec are not found in the preceding \\n1 \\tec.  [N12.7.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7-3::after {content:'The contents of this \\n2 \\tec are not found in the preceding \\n1 \\tec.  [N12.7.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7-4::after {content:'The contents of this \\n2 \\tec are not found in the preceding \\n1 \\tec.  [N12.7.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2--12-7-5 {background:peachpuff;}
.err-para-n2--12-7-5::after {content:'  [N12.7.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-2::after {content:'The contents of this \\n2 \\tec is a portion of the previous \\n2 \\tec. Perhaps this should be an \\n3?  [N12.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-12-6-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-12-6-2::after {content:'The contents of this \\n3 \\tec are not found in the preceding \\n2 or \\n1 \\tec.  [N12.6.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-12-6-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-12-6-3::after {content:'The contents of this \\n3 \\tec are not found in the preceding  \\n2 or \\n1 \\tec.  [N12.6.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-10-1-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-10-1-3::after {content:'There should be only one \\tec per \\n3 paragraph.  [N10.1.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-10-1-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-10-1-5::after {content:'This \\n3 paragraph is missing a \\tec.  [N10.1.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-10-2-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-10-2-2::after {content:'There should be text in a \\tec at the beginning of this \\n3 paragraph.  [N10.2.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-12-6 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-12-6::after {content:'The contents of this \\n3 \\tec are not found in the preceding \\n2 or \\n1 \\tec.  [N12.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-12-6-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-12-6-1::after {content:'The contents of this \\n3 \\tec are not found in the preceding \\n2 or \\n1 \\tec.  [N12.6.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-pre-12-8-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-n3-pre-12-8-2::after {content:'The \\n3 occurs before any \\n2 in this \\s5 note group.  [N12.8.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-4::after {content:'The verse number in this \\s3 does not match the current verse number in \\v above or the hyphen should be a en dash.  [N19.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-4-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-4-1::after {content:'The verse number in this \\s3 does not match the current verse number in \\v above.  [N19.4.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-5::after {content:'The verse number in this \\s3 does not match the current verse number in \\v above.  [N19.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-6 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-6::after {content:'The last verse number in the range in this \\s3 does not match the current verse number in the \\v above.  [N19.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-8::after {content:'An \\s3 can only be followed by an \\ntn.  [N19.8]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-3::after {content:'The chapter number in this \\s3 does not match the current chapter number.  [N19.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-7 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-7::after {content:'The ending verse part does not match the previous \\s5 verse part.  [N19.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-1::after {content:'An \\s3 paragraph always starts with `General Comment on`  [N19.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-2::after {content:'This \\s3 paragraph is missing a valid chapter verse reference, or the colon is missing.  [N19.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-post-7-1-1 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b3-post-7-1-1::after {content:'A \\b para is not needed after the \\b3 \\v 1 (start of chapter).  [N7.1.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-pre-7-1-3 {background:peachpuff;border-top:2pt solid red;}
.err-para-b3-pre-7-1-3::after {content:'A \\b should be after the \\b3 \\v stuff, not before it.  [N7.1.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-post-7-10-2 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b3-post-7-10-2::after {content:'A \\tr needs a \\b above it (below the \\b3 \\v stuff), except @ v.1.  [N7.10.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-post-15-1 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b3-post-15-1::after {content:'The first \\s5 below should include the first verse in the \\v verse range here.  [N15.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-post-15-5 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b3-post-15-5::after {content:'The last \\s5 below (in this verse range) should include the last verse in this \\v verse range.  [N15.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-mid-1-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b3-mid-1-1::after {content:'A \\b3 paragraph must contain a \\v.  [N1.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-7-1-2 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-7-1-2::after {content:'A \\b para is not needed after a \\p \\v 1 (start of chapter).  [N7.1.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-7-1-4 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-7-1-4::after {content:'A \\b should be after the \\p, \\v stuff not before it.  [N7.1.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-7-10-1 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-7-10-1::after {content:'A \\tr needs a \\b above it (below the \\p \\v stuff), except @ v.1.  [N7.10.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-15-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-15-2::after {content:'The first \\s5 below should include the first verse in the \\v verse range here.  [N15.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-15-6 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-15-6::after {content:'The last \\s5 below (in this verse range) should include the last verse in this \\v verse range.  [N15.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-mid-1-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-p-mid-1-2::after {content:'A \\p paragraph must contain a \\v.  [N1.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gra-mid-22-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gra-mid-22-8::after {content:'This \\gra paragraph is missing the copyright footnote.  [N22.8]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gra-mid-22-10- {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gra-mid-22-10-::after {content:'This \\gra paragraph is missing a \\fig.  [N22.10.]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gra-mid-22-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gra-mid-22-2::after {content:'This \\gra has all the required elements of \\fig and a footnote, but also has some other markup, extra spaces or text.  [N22.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-pre-22-3 {background:orange;border-left:4pt solid red;}
.err-note-f-pre-22-3::after {content:'The sequence should be \\fig...\\fig*\\f...\\f*. Note no space after \\fig*.  [N22.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-pre-22-5 {background:orange;border-left:4pt solid red;}
.err-note-f-pre-22-5::after {content:'The caller for the \\f must be a plus sign.  [N22.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-mid-27-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-note-f-mid-27-4::after {content:'Quotes within quotes of scholars need to be adjusted to single quotes and so forth through the levels of quotes.   [N27.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-pre-22-2-1 {background:orange;border-left:4pt solid red;}
.err-figure-fig-pre-22-2-1::after {content:'The \\fig must be the first item in a \\gra paragraph.  [N22.2.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-7 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-7::after {content:'The referenced verse number for the \\fig does not match the current verse number.  [N22.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-7-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-7-2::after {content:'The reference should be chapter number then colon then verse number. No book code.  [N22.7.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-6 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-6::after {content:'The referenced chapter number for the \\fig does not match the current chapter number.  [N22.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-6-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-6-2::after {content:'The reference in this \\fig should not contain a book code, and the full stop between chapter and verse must be a colon.  [N22.6.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-pre-22-1 {background:orange;border-left:4pt solid red;}
.err-figure-fig-pre-22-1::after {content:'A \\fig must only occur in a \\gra paragraph.  [N22.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-link-jmp-pre-22-4 {background:orange;border-left:4pt solid red;}
.err-link-jmp-pre-22-4::after {content:'This ‘Click here...’ \\jmp should occur as the only item in a \\gj paragraph. The \\gj  para should be immediately after a \\gra paragraph.  [N22.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-3::after {content:'The first verse of the range in this \\sbx does not match the current verse number in \\v above.  [N8.4.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-4::after {content:'The verse in this \\sbx does not match the current verse number in \\v above. (Or you maybe using an em dash rather than an en dash.)  [N8.4.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-5 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-5::after {content:'The chapter in this \\sbx does not match the current chapter number.  [N8.4.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-7 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-7::after {content:'The chapter in this \\sbx does not match the current chapter number.  [N8.4.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--mid-9-6 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char--mid-9-6::after {content:'The hyphen in a verse range in this paragraph should be an en dash.  [N9.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--mid-30 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char--mid-30::after {content:'There is a space before the closing SFM. Best to put the space after the close, except that the space should be after the numeral in a \\ros.  [N30]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---38 {background:orange;}
.err-char---38::after {content:'This character SFM is empty  [N38]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--mid-26-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char--mid-26-2::after {content:'This character SFM contains a straight quote mark. It should be a curly quote mark.  [N26.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--pre-40 {background:orange;border-left:4pt solid red;}
.err-char--pre-40::after {content:'There is an erroneous \\xxx* \\xxx, where 'xxx' is the same in both cases.  [N40]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---37 {background:orange;}
.err-char---37::after {content:'This character SFM is not closed. No end marker was found.  [N37]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-10-2-1 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-10-2-1::after {content:'The \\tec should be at the start of the paragraph (or you are not using an \\n1, \\n2, or \\n3 style).  [N10.2.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-11-1 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-11-1::after {content:'The first character should not be punctuation unless you are specifically talking about that punctuation in this Note, or it is a short quote within a larger text.  [N11.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-20-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-20-3::after {content:'A \\tec cannot contain a footnote (\\f ...\\f*). It must be after the \\tec*.  [N20.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-10-32 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-10-32::after {content:'The last character of this \\tec should be a colon.  [N10.32]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-pre-10-2-3 {background:orange;border-left:4pt solid red;}
.err-char-tec-pre-10-2-3::after {content:'This \\tec should not be here. There should be only one \\tec at the start of this paragraph.  [N10.2.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-10-31 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-10-31::after {content:'The last character of this \\tec should be a colon, not a space.  [N10.31]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-4::after {content:'A \\tec should precede this \\trs in the paragraph, or perhaps this paragraph should be an \\n2.  [N10.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-6 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-6::after {content:'The word/phrase in this \\trs is not found in the closest preceding \\tec, or is misspelled, or has wrong capitalization, or has punctuation that does not belong in the \\trs.  [N10.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-6-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-6-2::after {content:'The word or phrase in this \\trs are not found in the preceding \\tec.  [N10.6.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-6-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-6-3::after {content:'The word or phrase in this \\trs are not found in the preceding \\tec.  [N10.6.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-6-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-6-4::after {content:'The word or phrase in this \\trs are not found in the preceding \\tec.  [N10.6.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tei-mid-10-5 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tei-mid-10-5::after {content:'Any repeat of the words found in the preceding \\tec should be in a \\trs, not in this \\tei.  [N10.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-fr-mid-15-7 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-fr-mid-15-7::after {content:'Remove this \\fr and the address. TNs do not use them.  [N15.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-mid-17-1-1 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tbb-mid-17-1-1::after {content:'There should be only two underscore characters in the \\tbb __\\tbb*.  [N17.1.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-pre-17-2 {background:orange;border-left:4pt solid red;}
.err-char-tbb-pre-17-2::after {content:'There should not be a space before a \\tbb.  [N17.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-post-17-3 {background:orange;border-right:4pt solid red;}
.err-char-tbb-post-17-3::after {content:'There should not be a space after a \\tbb*.  [N17.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ord-mid-31 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-ord-mid-31::after {content:'The \\ord is only used for the ordinal ending after a numeral (i.e., 3rd). This one probably should be a \\ros.  [N31]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ord-mid-31-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-ord-mid-31-2::after {content:'The preceding number does not match the ordinal letters.  [N31.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ord-mid-31-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-ord-mid-31-3::after {content:'The preceding number does not match the ordinal letters.  [N31.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ord-mid-31-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-ord-mid-31-4::after {content:'The preceding number does not match the ordinal letters.  [N31.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-pre-32 {background:orange;border-left:4pt solid red;}
.err-char-brk-pre-32::after {content:'This \\brk SFM is not preceded by a space or quotes or left parenthesis  [N32]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk--34 {background:orange;}
.err-char-brk--34::after {content:'This \\brk SFM can contain only ⌊ or ⌋ but this does not match either of those.  [N34]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-post-39 {background:orange;border-right:4pt solid red;}
.err-char-brk-post-39::after {content:'This \\brk SFM is not followed by a space or punctuation  [N39]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-pre-33 {background:orange;border-left:4pt solid red;}
.err-char-brk-pre-33::after {content:'This \\brk SFM should only occur immediately after an \\imp* or \\rgi* SFM, except if in a \\ros ...\\ros*.  [N33]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi-pre-28-1 {background:orange;border-left:4pt solid red;}
.err-char-rgi-pre-28-1::after {content:'The \\rgi should be immediately after the word it modifies.  [N28.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi-post-28-3 {background:orange;border-right:4pt solid red;}
.err-char-rgi-post-28-3::after {content:'A letter should not immediately follow an \\rgi*.  [N28.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi--28-4 {background:orange;}
.err-char-rgi--28-4::after {content:'This \\rgi SFM should be embedded in a \\imp SFM like this \\+rgi  [N28.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgm-pre-28-2 {background:orange;border-left:4pt solid red;}
.err-char-rgm-pre-28-2::after {content:'The \\rgm should be immediately after the word it modifies.  [N28.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgm-post-28-5 {background:orange;border-right:4pt solid red;}
.err-char-rgm-post-28-5::after {content:'A letter should not immediately follow an \\rgm*.  [N28.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ros-mid-29 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-ros-mid-29::after {content:'The space must be before the \\ros*, and no space after it.  [N29]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tre-mid-30-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tre-mid-30-2::after {content:'There is a space before the closing SFM. Best to put the space after the close, except if followed by \\teu.  [N30.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-teu-mid-30-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-teu-mid-30-3::after {content:'There is a space before the closing SFM. Best to put the space after the close, except if followed by \\tre.  [N30.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-imp-post-35 {background:orange;border-right:4pt solid red;}
.err-char-imp-post-35::after {content:'This implied bracket sequence is incomplete or incorrect (it should be: \\brk ⌊\\brk*\\imp...\\imp*\\brk ⌋\\brk*)  [N35]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-imp-pre-36 {background:orange;border-left:4pt solid red;}
.err-char-imp-pre-36::after {content:'This \\imp...\\imp* should be preceded by \\bk ⌊\\bk*, or a \\rgi and a space, or removed.  [N36]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-4-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-4-4::after {content:'A \\tc1 must contain either an \\sbx or the word ‘Paragraph’.  [N4.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-4-7 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-4-7::after {content:'These \\sbx should be separated by \\tbb __\\tbb*.  [N4.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-4-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-4-8::after {content:'The address and the heading should be separated by this: \\sbx*\\tbb __\\tbb*\\sbx .  [N4.8]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-1::after {content:'The first verse of the range in this Paragraph Box does not match the current verse number in \\v above.  [N8.4.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-2::after {content:'The verse in this Paragraph Box does not match the current verse number in \\v above.  [N8.4.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-6 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-6::after {content:'The chapter in this \\tc1 does not match the current chapter number.  [N8.4.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-8::after {content:'The chapter in this \\tc1 does not match the current chapter number.  [N8.4.8]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1--4-9 {background:peachpuff;}
.err-cell-tc1--4-9::after {content:'A \\tc1 can only occur as the first SFM in a \\tr.  [N4.9]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell--mid-9-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell--mid-9-5::after {content:'The hyphen in a verse range in this \\tr \\tc1 should be an en dash.  [N9.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell--mid-26-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell--mid-26-3::after {content:'This table cell contains a straight quote mark. It should be a curly quote mark.  [N26.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--4-2 {background:peachpuff;}
.err-row-tr--4-2::after {content:'The second column must be a \\tc2 in \\tr.  [N4.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--4-3 {background:peachpuff;}
.err-row-tr--4-3::after {content:'The first column must be a \\tc1 in \\tr.  [N4.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr-post-6-8 {background:peachpuff;border-bottom:2pt solid red;}
.err-row-tr-post-6-8::after {content:'An \\ntn is used for the summary under a Part, Division or Section Box.  [N6.8]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-verse-v-mid-9-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-verse-v-mid-9-2::after {content:'The en dash in the verse range in this \\v must be a hyphen.  [N9.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-verse-v-mid-9-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-verse-v-mid-9-3::after {content:'A \\v cannot have verse parts in it.  [N9.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
</style>
   </xsl:template>
   <xsl:template match="text()" mode="fntext">
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="*" mode="fntext">
      <xsl:apply-templates select="node()" mode="fntext"/>
   </xsl:template>
   <xsl:template match="*[@style = 'tec']" mode="fntext"/>
   <xsl:template match="table">
      <xsl:variable name="containsparagraph" select="contains(.,'Paragraph')"/>
      <xsl:comment> containsparagraph = <xsl:value-of select="concat($sq,$containsparagraph,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countfolls5pretable"
                    select="count(following::*[@style = 's5'][1]/preceding-sibling::table)"/>
      <xsl:comment> countfolls5pretable = <xsl:value-of select="concat($sq,$countfolls5pretable,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countfolltabledivision"
                    select="count(following::table[descendant::*[@style = 'sbx']][contains(descendant::*[@style = 'sbx'],'Division')][1]/preceding-sibling::table)"/>
      <xsl:comment> countfolltabledivision = <xsl:value-of select="concat($sq,$countfolltabledivision,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countfolltablesection"
                    select="count(following::table[descendant::*[@style = 'sbx']][contains(descendant::*[@style = 'sbx'],'Section')][1]/preceding-sibling::table)"/>
      <xsl:comment> countfolltablesection = <xsl:value-of select="concat($sq,$countfolltablesection,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countposttablewithdivision"
                    select="count(following::table[contains(descendant::*[@style = 'tc1'],'Division')])"/>
      <xsl:comment> countposttablewithdivision = <xsl:value-of select="concat($sq,$countposttablewithdivision,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countposttablewithparagraph"
                    select="count(following::table[contains(descendant::*[@style = 'tc1'],'Paragraph')])"/>
      <xsl:comment> countposttablewithparagraph = <xsl:value-of select="concat($sq,$countposttablewithparagraph,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countposttablewithsection"
                    select="count(following::table[contains(descendant::*[@style = 'tc1'],'Section')])"/>
      <xsl:comment> countposttablewithsection = <xsl:value-of select="concat($sq,$countposttablewithsection,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasfollowingtable" select="count(following::table) &gt; 0"/>
      <xsl:comment> hasfollowingtable = <xsl:value-of select="concat($sq,$hasfollowingtable,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="notposttabledivision"
                    select="not(contains(following-sibling::table[1],'Division'))"/>
      <xsl:comment> notposttabledivision = <xsl:value-of select="concat($sq,$notposttabledivision,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="notposttableparagraph"
                    select="not(contains(following-sibling::table[1],'Paragraph'))"/>
      <xsl:comment> notposttableparagraph = <xsl:value-of select="concat($sq,$notposttableparagraph,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="notposttablesection"
                    select="not(contains(following-sibling::table[1],'Section'))"/>
      <xsl:comment> notposttablesection = <xsl:value-of select="concat($sq,$notposttablesection,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presib" select="preceding-sibling::*[1]/@style"/>
      <xsl:comment> presib = <xsl:value-of select="concat($sq,$presib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presib2" select="preceding-sibling::*[2]/@style"/>
      <xsl:comment> presib2 = <xsl:value-of select="concat($sq,$presib2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="containsdivision" select="contains(.,'Division')"/>
      <xsl:comment> containsdivision = <xsl:value-of select="concat($sq,$containsdivision,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="containspart" select="contains(.,'Part')"/>
      <xsl:comment> containspart = <xsl:value-of select="concat($sq,$containspart,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="containssection" select="contains(.,'Section')"/>
      <xsl:comment> containssection = <xsl:value-of select="concat($sq,$containssection,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpretable" select="count(parent::*/preceding-sibling::table)"/>
      <xsl:comment> countpretable = <xsl:value-of select="concat($sq,$countpretable,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrdivision"
                    select="contains(*[1]/*[1]/text(),'Division') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrdivision = <xsl:value-of select="concat($sq,$hastrdivision,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrparagraph"
                    select="contains(*[1]/text(),'Paragraph') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrparagraph = <xsl:value-of select="concat($sq,$hastrparagraph,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrpart"
                    select="contains(*[1]/*[1]/text(),'Part') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrpart = <xsl:value-of select="concat($sq,$hastrpart,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrsection"
                    select="contains(*[1]/*[1]/text(),'Section') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrsection = <xsl:value-of select="concat($sq,$hastrsection,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpostsib" select="parent::*/following-sibling::*[1]/@style"/>
      <xsl:comment> parentpostsib = <xsl:value-of select="concat($sq,$parentpostsib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpresib" select="parent::*/preceding-sibling::*[1]/@style"/>
      <xsl:comment> parentpresib = <xsl:value-of select="concat($sq,$parentpresib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpresib2" select="parent::*/preceding-sibling::*[2]/@style"/>
      <xsl:comment> parentpresib2 = <xsl:value-of select="concat($sq,$parentpresib2,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">table<!--ref 6.1 - rank=--><xsl:if test="$containspart and $hasfollowingtable">
               <xsl:if test="$notposttabledivision">
                  <xsl:text> err-table--post-6-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 6.2 - rank=-->
            <xsl:if test="$containsdivision and $hasfollowingtable">
               <xsl:if test="$notposttablesection">
                  <xsl:text> err-table--post-6-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 6.3 - rank=-->
            <xsl:if test="$containssection and $hasfollowingtable">
               <xsl:if test="$notposttableparagraph">
                  <xsl:text> err-table--post-6-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 7.2 - rank=-->
            <xsl:if test="($containsdivision or $containspart or $containssection or $containsparagraph) and not($presib2 = 'c')">
               <xsl:if test="not($presib = 'b' or ($presib = 'b' and $presib2 = 'b3') or ($presib = 'b' and $presib2 = 'p'))">
                  <xsl:text> err-table--pre-7-2</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=s5 -->
   <xsl:template match="para[@style = 's5']">
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="concat($sq,$refcolonv,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="concat($sq,$strlenb4chap,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasreordered" select="contains(.,'reordered)')"/>
      <xsl:comment> hasreordered = <xsl:value-of select="concat($sq,$hasreordered,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastbb" select="boolean(child::*[@style = 'tbb'])"/>
      <xsl:comment> hastbb = <xsl:value-of select="concat($sq,$hastbb,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasvlet"
                    select="contains(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#$')"/>
      <xsl:comment> hasvlet = <xsl:value-of select="concat($sq,$hasvlet,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasvsub"
                    select="contains(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#$–$')"/>
      <xsl:comment> hasvsub = <xsl:value-of select="concat($sq,$hasvsub,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="numbfirst"
                    select="substring(translate(.,$numb,$numbsub),1,1) = '#'"/>
      <xsl:comment> numbfirst = <xsl:value-of select="concat($sq,$numbfirst,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverser1" select="substring-before($preverse,'-')"/>
      <xsl:comment> preverser1 = <xsl:value-of select="concat($sq,$preverser1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prevhyphen" select="contains($preverse,'-')"/>
      <xsl:comment> prevhyphen = <xsl:value-of select="concat($sq,$prevhyphen,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refchapcolon" select="substring-before(node()[not(self::*)],':')"/>
      <xsl:comment> refchapcolon = <xsl:value-of select="concat($sq,$refchapcolon,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvlet"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$letlc,$letsub),'$')"/>
      <xsl:comment> refcolonvlet = <xsl:value-of select="concat($sq,$refcolonvlet,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="concat($sq,$refcolonvr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refvendash" select="contains(node()[not(self::*)],'–')"/>
      <xsl:comment> refvendash = <xsl:value-of select="concat($sq,$refvendash,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 8.1 - rank=-->
               <xsl:if test="$hascvref and $numbfirst ">
                  <xsl:if test="$refchapcolon != $prechapter">
                     <xsl:text> err-para-s5-mid-8-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.21 - rank=-->
               <xsl:if test="not($prevhyphen) and not($refvendash) and not($hasvlet)">
                  <xsl:if test="$refcolonv != $preverse">
                     <xsl:text> err-para-s5-mid-8-21</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.21.2 - rank=-->
               <xsl:if test="not($prevhyphen) and not($refvendash) and $hasvlet">
                  <xsl:if test="$refcolonvlet != $preverse">
                     <xsl:text> err-para-s5-mid-8-21-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.23 - rank=-->
               <xsl:if test="$prevhyphen and $refvendash">
                  <xsl:if test="$refcolonvr1 != $preverser1">
                     <xsl:text> err-para-s5-mid-8-23</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.26 - rank=-->
               <xsl:if test="contains($preverse,'-') and not(contains(.,'–'))">
                  <xsl:if test="not((translate(substring-after(.,':'),$letlc,'') = substring-before($preverse,'-') or  translate(substring-after(.,':'),$letlc,'') &gt; substring-before($preverse,'-')) and ( translate(substring-after(.,':'),$letlc,'') = substring-after($preverse,'-') )or  translate(substring-after(.,':'),$letlc,'') &lt; substring-after($preverse,'-') )">
                     <xsl:text> err-para-s5-mid-8-26</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.3 - rank=-->
               <xsl:if test="string-length(translate(.,$validcvnumbletpunc,'')) &gt; 0">
                  <xsl:if test="not($hasreordered)">
                     <xsl:text> err-para-s5-mid-8-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.3.1 - rank=-->
               <xsl:if test="string-length(translate(text()[1],$validreorderedcvnumbletpunc,'')) &gt; 0">
                  <xsl:if test="$hasreordered and $hastbb">
                     <xsl:text> err-para-s5-mid-8-3-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.3.2 - rank=-->
               <xsl:if test="string-length(translate(.,$validreorderedcvnumbletpunc,'')) &gt; 0">
                  <xsl:if test="$hasreordered and not($hastbb)">
                     <xsl:text> err-para-s5-mid-8-3-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.22 - rank=5-->
               <xsl:if test="not($prevhyphen) and $refvendash and not($hasvlet)">
                  <xsl:if test="$refcolonvr1 != $preverse">
                     <xsl:text> err-para-s5-mid-8-22</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.25 - rank=10-->
               <xsl:if test="not(contains(.,':'))">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style= -->
   <xsl:template match="para">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=qp -->
   <xsl:template match="para[@style = 'qp']">
      <xsl:variable name="ancestor" select="ancestor::*/@style "/>
      <xsl:comment> ancestor = <xsl:value-of select="concat($sq,$ancestor,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 14.2 - rank=-->
               <xsl:if test="preceding-sibling::*[1][@style = 'qp']">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=ntn -->
   <xsl:template match="para[@style = 'ntn']">
      <xsl:variable name="fnstring">
         <xsl:apply-templates select="node()" mode="fntext"/>
      </xsl:variable>
      <xsl:comment>
fnstring = <xsl:value-of select="$fnstring"/>
      </xsl:comment>
      <xsl:variable name="dqstr1" select="substring-before($fnstring,$rdq)"/>
      <xsl:comment> dqstr1 = <xsl:value-of select="concat($sq,$dqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr10"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr10 = <xsl:value-of select="concat($sq,$dqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr2"
                    select="substring-before(substring-after($fnstring,$rdq),$rdq)"/>
      <xsl:comment> dqstr2 = <xsl:value-of select="concat($sq,$dqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr3"
                    select="substring-before(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr3 = <xsl:value-of select="concat($sq,$dqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr4"
                    select="substring-before(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr4 = <xsl:value-of select="concat($sq,$dqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr5"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr5 = <xsl:value-of select="concat($sq,$dqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr6"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr6 = <xsl:value-of select="concat($sq,$dqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr7"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr7 = <xsl:value-of select="concat($sq,$dqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr8"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr8 = <xsl:value-of select="concat($sq,$dqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr9"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr9 = <xsl:value-of select="concat($sq,$dqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr1" select="substring-after($dqstr1,$ldq)"/>
      <xsl:comment> indqstr1 = <xsl:value-of select="concat($sq,$indqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr10" select="substring-after($dqstr10,$ldq)"/>
      <xsl:comment> indqstr10 = <xsl:value-of select="concat($sq,$indqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr2" select="substring-after($dqstr2,$ldq)"/>
      <xsl:comment> indqstr2 = <xsl:value-of select="concat($sq,$indqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr3" select="substring-after($dqstr3,$ldq)"/>
      <xsl:comment> indqstr3 = <xsl:value-of select="concat($sq,$indqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr4" select="substring-after($dqstr4,$ldq)"/>
      <xsl:comment> indqstr4 = <xsl:value-of select="concat($sq,$indqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr5" select="substring-after($dqstr5,$ldq)"/>
      <xsl:comment> indqstr5 = <xsl:value-of select="concat($sq,$indqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr6" select="substring-after($dqstr6,$ldq)"/>
      <xsl:comment> indqstr6 = <xsl:value-of select="concat($sq,$indqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr7" select="substring-after($dqstr7,$ldq)"/>
      <xsl:comment> indqstr7 = <xsl:value-of select="concat($sq,$indqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr8" select="substring-after($dqstr8,$ldq)"/>
      <xsl:comment> indqstr8 = <xsl:value-of select="concat($sq,$indqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr9" select="substring-after($dqstr9,$ldq)"/>
      <xsl:comment> indqstr9 = <xsl:value-of select="concat($sq,$indqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr1" select="substring-before($indqstr1,$ldq)"/>
      <xsl:comment> ldqstr1 = <xsl:value-of select="concat($sq,$ldqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr10" select="substring-before($indqstr10,$ldq)"/>
      <xsl:comment> ldqstr10 = <xsl:value-of select="concat($sq,$ldqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr2" select="substring-before($indqstr2,$ldq)"/>
      <xsl:comment> ldqstr2 = <xsl:value-of select="concat($sq,$ldqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr3" select="substring-before($indqstr3,$ldq)"/>
      <xsl:comment> ldqstr3 = <xsl:value-of select="concat($sq,$ldqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr4" select="substring-before($indqstr4,$ldq)"/>
      <xsl:comment> ldqstr4 = <xsl:value-of select="concat($sq,$ldqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr5" select="substring-before($indqstr5,$ldq)"/>
      <xsl:comment> ldqstr5 = <xsl:value-of select="concat($sq,$ldqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr6" select="substring-before($indqstr6,$ldq)"/>
      <xsl:comment> ldqstr6 = <xsl:value-of select="concat($sq,$ldqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr7" select="substring-before($indqstr7,$ldq)"/>
      <xsl:comment> ldqstr7 = <xsl:value-of select="concat($sq,$ldqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr8" select="substring-before($indqstr8,$ldq)"/>
      <xsl:comment> ldqstr8 = <xsl:value-of select="concat($sq,$ldqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr9" select="substring-before($indqstr9,$ldq)"/>
      <xsl:comment> ldqstr9 = <xsl:value-of select="concat($sq,$ldqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff1"
                    select="string-length(translate($ldqstr1,$rsq,'')) - string-length(translate($ldqstr1,$lsq,''))"/>
      <xsl:comment> sqdiff1 = <xsl:value-of select="concat($sq,$sqdiff1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff10"
                    select="string-length(translate($ldqstr10,$rsq,'')) - string-length(translate($ldqstr10,$lsq,''))"/>
      <xsl:comment> sqdiff10 = <xsl:value-of select="concat($sq,$sqdiff10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff2"
                    select="string-length(translate($ldqstr2,$rsq,'')) - string-length(translate($ldqstr2,$lsq,''))"/>
      <xsl:comment> sqdiff2 = <xsl:value-of select="concat($sq,$sqdiff2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff3"
                    select="string-length(translate($ldqstr3,$rsq,'')) - string-length(translate($ldqstr3,$lsq,''))"/>
      <xsl:comment> sqdiff3 = <xsl:value-of select="concat($sq,$sqdiff3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff4"
                    select="string-length(translate($ldqstr4,$rsq,'')) - string-length(translate($ldqstr4,$lsq,''))"/>
      <xsl:comment> sqdiff4 = <xsl:value-of select="concat($sq,$sqdiff4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff5"
                    select="string-length(translate($ldqstr5,$rsq,'')) - string-length(translate($ldqstr5,$lsq,''))"/>
      <xsl:comment> sqdiff5 = <xsl:value-of select="concat($sq,$sqdiff5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff6"
                    select="string-length(translate($ldqstr6,$rsq,'')) - string-length(translate($ldqstr6,$lsq,''))"/>
      <xsl:comment> sqdiff6 = <xsl:value-of select="concat($sq,$sqdiff6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff7"
                    select="string-length(translate($ldqstr7,$rsq,'')) - string-length(translate($ldqstr7,$lsq,''))"/>
      <xsl:comment> sqdiff7 = <xsl:value-of select="concat($sq,$sqdiff7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff8"
                    select="string-length(translate($ldqstr8,$rsq,'')) - string-length(translate($ldqstr8,$lsq,''))"/>
      <xsl:comment> sqdiff8 = <xsl:value-of select="concat($sq,$sqdiff8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff9"
                    select="string-length(translate($ldqstr9,$rsq,'')) - string-length(translate($ldqstr9,$lsq,''))"/>
      <xsl:comment> sqdiff9 = <xsl:value-of select="concat($sq,$sqdiff9,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 18.1 - rank=-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 's3' or @style = 's5' or @style = 'ntn' or name() = 'table' or @style = 'ntn' or @style = 'qp' or @style = 'qns' or @style = 'q1tn' or @style = 'q2tn' or @style = 'li1' or @style = 'li2' or @style = 'gra' or @style = 'gj' or @style = 'hb1'])">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 24.1 - rank=-->
               <xsl:if test="char[@style = 'tec']">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="contains($indqstr1,'“') and $sqdiff1 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr1,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr2,'“') and $sqdiff2 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr2,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr3,'“') and $sqdiff3 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr3,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr4,'“') and $sqdiff4 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr4,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr5,'“') and $sqdiff5 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr5,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr6,'“') and $sqdiff6 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr6,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr7,'“') and $sqdiff7 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr7,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr8,'“') and $sqdiff8 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr8,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr9,'“') and $sqdiff9 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr9,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr10,'“') and $sqdiff10 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr10,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- para @style=gj -->
   <xsl:template match="para[@style = 'gj']">
      <xsl:variable name="countjmp" select="count(*[@style = 'jmp'])"/>
      <xsl:comment> countjmp = <xsl:value-of select="concat($sq,$countjmp,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countnode" select="count(node())"/>
      <xsl:comment> countnode = <xsl:value-of select="concat($sq,$countnode,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 22.9 - rank=-->
               <xsl:if test="$countjmp = 0">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 22.9.1 - rank=-->
               <xsl:if test="$countnode != 1">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 22.9.2 - rank=-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'gra'])">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b2 -->
   <xsl:template match="para[@style = 'b2']">
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="nodecount" select="count(node())"/>
      <xsl:comment> nodecount = <xsl:value-of select="concat($sq,$nodecount,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 23.2 - rank=-->
               <xsl:if test="following-sibling::*[1][@style = 'b']">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 23.4 - rank=-->
               <xsl:if test="count(node()) &gt; 0">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b -->
   <xsl:template match="para[@style = 'b']">
      <xsl:variable name="nodecount" select="count(node())"/>
      <xsl:comment> nodecount = <xsl:value-of select="concat($sq,$nodecount,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 23.3 - rank=-->
               <xsl:if test="following-sibling::*[1][@style = 'b2']">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 23.5 - rank=-->
               <xsl:if test="count(node()) &gt; 0">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n1 -->
   <xsl:template match="para[@style = 'n1']">
      <xsl:variable name="fnstring">
         <xsl:apply-templates select="node()" mode="fntext"/>
      </xsl:variable>
      <xsl:comment>
fnstring = <xsl:value-of select="$fnstring"/>
      </xsl:comment>
      <xsl:variable name="curtec"
                    select="substring(*[@style = 'tec'][1],1,string-length(*[@style = 'tec'][1])-1)"/>
      <xsl:comment> curtec = <xsl:value-of select="concat($sq,$curtec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr1" select="substring-before($fnstring,$rdq)"/>
      <xsl:comment> dqstr1 = <xsl:value-of select="concat($sq,$dqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr10"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr10 = <xsl:value-of select="concat($sq,$dqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr2"
                    select="substring-before(substring-after($fnstring,$rdq),$rdq)"/>
      <xsl:comment> dqstr2 = <xsl:value-of select="concat($sq,$dqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr3"
                    select="substring-before(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr3 = <xsl:value-of select="concat($sq,$dqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr4"
                    select="substring-before(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr4 = <xsl:value-of select="concat($sq,$dqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr5"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr5 = <xsl:value-of select="concat($sq,$dqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr6"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr6 = <xsl:value-of select="concat($sq,$dqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr7"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr7 = <xsl:value-of select="concat($sq,$dqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr8"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr8 = <xsl:value-of select="concat($sq,$dqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr9"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr9 = <xsl:value-of select="concat($sq,$dqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]"/>
      <xsl:comment> pren1tec = <xsl:value-of select="concat($sq,$pren1tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="concat($sq,$countpren1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="concat($sq,$countpres5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="concat($sq,$countpresibnode,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="counttec" select="count(*[@style = 'tec'])"/>
      <xsl:comment> counttec = <xsl:value-of select="concat($sq,$counttec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countteu" select="count(*[@style = 'teu'])"/>
      <xsl:comment> countteu = <xsl:value-of select="concat($sq,$countteu,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastecchild" select="boolean(child::*[@style = 'tec'])"/>
      <xsl:comment> hastecchild = <xsl:value-of select="concat($sq,$hastecchild,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr1" select="substring-after($dqstr1,$ldq)"/>
      <xsl:comment> indqstr1 = <xsl:value-of select="concat($sq,$indqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr10" select="substring-after($dqstr10,$ldq)"/>
      <xsl:comment> indqstr10 = <xsl:value-of select="concat($sq,$indqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr2" select="substring-after($dqstr2,$ldq)"/>
      <xsl:comment> indqstr2 = <xsl:value-of select="concat($sq,$indqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr3" select="substring-after($dqstr3,$ldq)"/>
      <xsl:comment> indqstr3 = <xsl:value-of select="concat($sq,$indqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr4" select="substring-after($dqstr4,$ldq)"/>
      <xsl:comment> indqstr4 = <xsl:value-of select="concat($sq,$indqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr5" select="substring-after($dqstr5,$ldq)"/>
      <xsl:comment> indqstr5 = <xsl:value-of select="concat($sq,$indqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr6" select="substring-after($dqstr6,$ldq)"/>
      <xsl:comment> indqstr6 = <xsl:value-of select="concat($sq,$indqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr7" select="substring-after($dqstr7,$ldq)"/>
      <xsl:comment> indqstr7 = <xsl:value-of select="concat($sq,$indqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr8" select="substring-after($dqstr8,$ldq)"/>
      <xsl:comment> indqstr8 = <xsl:value-of select="concat($sq,$indqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr9" select="substring-after($dqstr9,$ldq)"/>
      <xsl:comment> indqstr9 = <xsl:value-of select="concat($sq,$indqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="positiontec" select="positiontec"/>
      <xsl:comment> positiontec = <xsl:value-of select="concat($sq,$positiontec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postcharn1tec"
                    select="translate(substring(substring-after($pren1tec,$curtec),1, 1),$letulc,$letulcsub)"/>
      <xsl:comment> postcharn1tec = <xsl:value-of select="concat($sq,$postcharn1tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="precharn1tec"
                    select="translate(substring(substring-before($pren1tec,$curtec),string-length(substring-before($pren1tec,$curtec)), 1),$letulc,$letulcsub)"/>
      <xsl:comment> precharn1tec = <xsl:value-of select="concat($sq,$precharn1tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr1" select="substring-before($indqstr1,$ldq)"/>
      <xsl:comment> ldqstr1 = <xsl:value-of select="concat($sq,$ldqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr10" select="substring-before($indqstr10,$ldq)"/>
      <xsl:comment> ldqstr10 = <xsl:value-of select="concat($sq,$ldqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr2" select="substring-before($indqstr2,$ldq)"/>
      <xsl:comment> ldqstr2 = <xsl:value-of select="concat($sq,$ldqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr3" select="substring-before($indqstr3,$ldq)"/>
      <xsl:comment> ldqstr3 = <xsl:value-of select="concat($sq,$ldqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr4" select="substring-before($indqstr4,$ldq)"/>
      <xsl:comment> ldqstr4 = <xsl:value-of select="concat($sq,$ldqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr5" select="substring-before($indqstr5,$ldq)"/>
      <xsl:comment> ldqstr5 = <xsl:value-of select="concat($sq,$ldqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr6" select="substring-before($indqstr6,$ldq)"/>
      <xsl:comment> ldqstr6 = <xsl:value-of select="concat($sq,$ldqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr7" select="substring-before($indqstr7,$ldq)"/>
      <xsl:comment> ldqstr7 = <xsl:value-of select="concat($sq,$ldqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr8" select="substring-before($indqstr8,$ldq)"/>
      <xsl:comment> ldqstr8 = <xsl:value-of select="concat($sq,$ldqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr9" select="substring-before($indqstr9,$ldq)"/>
      <xsl:comment> ldqstr9 = <xsl:value-of select="concat($sq,$ldqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff1"
                    select="string-length(translate($ldqstr1,$rsq,'')) - string-length(translate($ldqstr1,$lsq,''))"/>
      <xsl:comment> sqdiff1 = <xsl:value-of select="concat($sq,$sqdiff1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff10"
                    select="string-length(translate($ldqstr10,$rsq,'')) - string-length(translate($ldqstr10,$lsq,''))"/>
      <xsl:comment> sqdiff10 = <xsl:value-of select="concat($sq,$sqdiff10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff2"
                    select="string-length(translate($ldqstr2,$rsq,'')) - string-length(translate($ldqstr2,$lsq,''))"/>
      <xsl:comment> sqdiff2 = <xsl:value-of select="concat($sq,$sqdiff2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff3"
                    select="string-length(translate($ldqstr3,$rsq,'')) - string-length(translate($ldqstr3,$lsq,''))"/>
      <xsl:comment> sqdiff3 = <xsl:value-of select="concat($sq,$sqdiff3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff4"
                    select="string-length(translate($ldqstr4,$rsq,'')) - string-length(translate($ldqstr4,$lsq,''))"/>
      <xsl:comment> sqdiff4 = <xsl:value-of select="concat($sq,$sqdiff4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff5"
                    select="string-length(translate($ldqstr5,$rsq,'')) - string-length(translate($ldqstr5,$lsq,''))"/>
      <xsl:comment> sqdiff5 = <xsl:value-of select="concat($sq,$sqdiff5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff6"
                    select="string-length(translate($ldqstr6,$rsq,'')) - string-length(translate($ldqstr6,$lsq,''))"/>
      <xsl:comment> sqdiff6 = <xsl:value-of select="concat($sq,$sqdiff6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff7"
                    select="string-length(translate($ldqstr7,$rsq,'')) - string-length(translate($ldqstr7,$lsq,''))"/>
      <xsl:comment> sqdiff7 = <xsl:value-of select="concat($sq,$sqdiff7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff8"
                    select="string-length(translate($ldqstr8,$rsq,'')) - string-length(translate($ldqstr8,$lsq,''))"/>
      <xsl:comment> sqdiff8 = <xsl:value-of select="concat($sq,$sqdiff8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff9"
                    select="string-length(translate($ldqstr9,$rsq,'')) - string-length(translate($ldqstr9,$lsq,''))"/>
      <xsl:comment> sqdiff9 = <xsl:value-of select="concat($sq,$sqdiff9,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 12.1 - rank=-->
               <xsl:if test="$counttec &gt; 0 and contains($pren1tec,$curtec) and $precharn1tec != '$' and $postcharn1tec != '$'">
                  <xsl:if test="$countpres5 &lt; $countpren1">
                     <xsl:text> err-para-n1-mid-12-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 14.1 - rank=-->
               <xsl:if test="position() != last()">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'n1' or @style = 'n2' or @style = 'n3' or @style = 'ntn' or @style = 'qp' or @style = 'q1tn' or @style = 'q2tn' or @style = 'b' or @style = 'b2' or @style = 'b3' or @style = 'p' or @style = 's5' or @style = 'li1' or @style = 'hb1' or @style = 's3' or name() = 'chapter' or @style = 'gra'])">
                     <xsl:text> err-para-n1-post-14-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.1 - rank=5-->
               <xsl:if test="$counttec &gt; 1">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 10.1.4 - rank=5-->
               <xsl:if test="$counttec + $countteu  = 0 ">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="contains($indqstr1,'“') and $sqdiff1 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr1,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr2,'“') and $sqdiff2 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr2,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr3,'“') and $sqdiff3 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr3,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr4,'“') and $sqdiff4 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr4,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr5,'“') and $sqdiff5 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr5,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr6,'“') and $sqdiff6 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr6,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr7,'“') and $sqdiff7 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr7,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr8,'“') and $sqdiff8 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr8,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr9,'“') and $sqdiff9 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr9,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr10,'“') and $sqdiff10 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr10,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n2 -->
   <xsl:template match="para[@style = 'n2']">
      <xsl:variable name="fnstring">
         <xsl:apply-templates select="node()" mode="fntext"/>
      </xsl:variable>
      <xsl:comment>
fnstring = <xsl:value-of select="$fnstring"/>
      </xsl:comment>
      <xsl:variable name="curtec"
                    select="substring(*[@style = 'tec'][1],1,string-length(*[@style = 'tec'][1])-1)"/>
      <xsl:comment> curtec = <xsl:value-of select="concat($sq,$curtec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecver" select="normalize-space(substring-after($curtec,')'))"/>
      <xsl:comment> curtecver = <xsl:value-of select="concat($sq,$curtecver,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr1" select="substring-before($fnstring,$rdq)"/>
      <xsl:comment> dqstr1 = <xsl:value-of select="concat($sq,$dqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr10"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr10 = <xsl:value-of select="concat($sq,$dqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr2"
                    select="substring-before(substring-after($fnstring,$rdq),$rdq)"/>
      <xsl:comment> dqstr2 = <xsl:value-of select="concat($sq,$dqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr3"
                    select="substring-before(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr3 = <xsl:value-of select="concat($sq,$dqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr4"
                    select="substring-before(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr4 = <xsl:value-of select="concat($sq,$dqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr5"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr5 = <xsl:value-of select="concat($sq,$dqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr6"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr6 = <xsl:value-of select="concat($sq,$dqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr7"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr7 = <xsl:value-of select="concat($sq,$dqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr8"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr8 = <xsl:value-of select="concat($sq,$dqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr9"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr9 = <xsl:value-of select="concat($sq,$dqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pren2tec"
                    select="preceding::*[@style = 'n2'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]"/>
      <xsl:comment> pren2tec = <xsl:value-of select="concat($sq,$pren2tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsisparse1" select="substring-after($curtec,'…')"/>
      <xsl:comment> curtecpostellipsisparse1 = <xsl:value-of select="concat($sq,$curtecpostellipsisparse1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="counttecellipsis"
                    select="string-length($curtec) - string-length(translate($curtec,'…',''))"/>
      <xsl:comment> counttecellipsis = <xsl:value-of select="concat($sq,$counttecellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsisparse2"
                    select="substring-after($curtecpostellipsisparse1,'…')"/>
      <xsl:comment> curtecpostellipsisparse2 = <xsl:value-of select="concat($sq,$curtecpostellipsisparse2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsisparse3"
                    select="substring-after($curtecpostellipsisparse2,'…')"/>
      <xsl:comment> curtecpostellipsisparse3 = <xsl:value-of select="concat($sq,$curtecpostellipsisparse3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsisparse4"
                    select="substring-after($curtecpostellipsisparse3,'…')"/>
      <xsl:comment> curtecpostellipsisparse4 = <xsl:value-of select="concat($sq,$curtecpostellipsisparse4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec1ellipsis1" select="substring-before($curtec,$ellipsis)"/>
      <xsl:comment> tec1ellipsis1 = <xsl:value-of select="concat($sq,$tec1ellipsis1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec2ellipsis2"
                    select="substring-before($curtecpostellipsisparse1,$ellipsis)"/>
      <xsl:comment> tec2ellipsis2 = <xsl:value-of select="concat($sq,$tec2ellipsis2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec3ellipsis3"
                    select="substring-before($curtecpostellipsisparse2,$ellipsis)"/>
      <xsl:comment> tec3ellipsis3 = <xsl:value-of select="concat($sq,$tec3ellipsis3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec4ellipsis4"
                    select="substring-before($curtecpostellipsisparse4,$ellipsis)"/>
      <xsl:comment> tec4ellipsis4 = <xsl:value-of select="concat($sq,$tec4ellipsis4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec1ellipsis2" select="$curtecpostellipsisparse1"/>
      <xsl:comment> tec1ellipsis2 = <xsl:value-of select="concat($sq,$tec1ellipsis2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec2ellipsis3" select="$curtecpostellipsisparse2"/>
      <xsl:comment> tec2ellipsis3 = <xsl:value-of select="concat($sq,$tec2ellipsis3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec3ellipsis4" select="$curtecpostellipsisparse3"/>
      <xsl:comment> tec3ellipsis4 = <xsl:value-of select="concat($sq,$tec3ellipsis4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tec4ellipsis5" select="$curtecpostellipsisparse4"/>
      <xsl:comment> tec4ellipsis5 = <xsl:value-of select="concat($sq,$tec4ellipsis5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="concat($sq,$countpren1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren2"
                    select="count(preceding::*[@style = 'n2'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren2 = <xsl:value-of select="concat($sq,$countpren2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="concat($sq,$countpres5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="concat($sq,$countpresibnode,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="counttec" select="count(*[@style = 'tec'])"/>
      <xsl:comment> counttec = <xsl:value-of select="concat($sq,$counttec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsis" select="substring-after($curtec,'…')"/>
      <xsl:comment> curtecpostellipsis = <xsl:value-of select="concat($sq,$curtecpostellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpreellipsis" select="substring-before($curtec,'…')"/>
      <xsl:comment> curtecpreellipsis = <xsl:value-of select="concat($sq,$curtecpreellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecverpreellipsis"
                    select="substring-before(substring-after($curtec,')'),'…')"/>
      <xsl:comment> curtecverpreellipsis = <xsl:value-of select="concat($sq,$curtecverpreellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtei" select="*[@style = 'tei']/text()"/>
      <xsl:comment> curtei = <xsl:value-of select="concat($sq,$curtei,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastecchild" select="boolean(child::*[@style = 'tec'])"/>
      <xsl:comment> hastecchild = <xsl:value-of select="concat($sq,$hastecchild,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastecellipsis" select="contains(*[@style = 'tec'][1],'…')"/>
      <xsl:comment> hastecellipsis = <xsl:value-of select="concat($sq,$hastecellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastecversion"
                    select="starts-with(translate(*[@style = 'tec'][1],$letucnumb,$letucnumbsub),'($$$') or  starts-with(translate(*[@style = 'tec'][1],'ALT','alt'),'(alt:')"/>
      <xsl:comment> hastecversion = <xsl:value-of select="concat($sq,$hastecversion,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr1" select="substring-after($dqstr1,$ldq)"/>
      <xsl:comment> indqstr1 = <xsl:value-of select="concat($sq,$indqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr10" select="substring-after($dqstr10,$ldq)"/>
      <xsl:comment> indqstr10 = <xsl:value-of select="concat($sq,$indqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr2" select="substring-after($dqstr2,$ldq)"/>
      <xsl:comment> indqstr2 = <xsl:value-of select="concat($sq,$indqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr3" select="substring-after($dqstr3,$ldq)"/>
      <xsl:comment> indqstr3 = <xsl:value-of select="concat($sq,$indqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr4" select="substring-after($dqstr4,$ldq)"/>
      <xsl:comment> indqstr4 = <xsl:value-of select="concat($sq,$indqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr5" select="substring-after($dqstr5,$ldq)"/>
      <xsl:comment> indqstr5 = <xsl:value-of select="concat($sq,$indqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr6" select="substring-after($dqstr6,$ldq)"/>
      <xsl:comment> indqstr6 = <xsl:value-of select="concat($sq,$indqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr7" select="substring-after($dqstr7,$ldq)"/>
      <xsl:comment> indqstr7 = <xsl:value-of select="concat($sq,$indqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr8" select="substring-after($dqstr8,$ldq)"/>
      <xsl:comment> indqstr8 = <xsl:value-of select="concat($sq,$indqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr9" select="substring-after($dqstr9,$ldq)"/>
      <xsl:comment> indqstr9 = <xsl:value-of select="concat($sq,$indqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postcharn2tec"
                    select="translate(substring(substring-after($pren2tec,$curtec),1, 1),$letulc,$letulcsub)"/>
      <xsl:comment> postcharn2tec = <xsl:value-of select="concat($sq,$postcharn2tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="precharn2tec"
                    select="translate(substring(substring-before($pren2tec,$curtec),string-length(substring-before($pren2tec,$curtec)), 1),$letulc,$letulcsub)"/>
      <xsl:comment> precharn2tec = <xsl:value-of select="concat($sq,$precharn2tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preellipsisstring"
                    select="normalize-space(concat(' ',substring-before(node()[not(self::*)],'…'),' '))"/>
      <xsl:comment> preellipsisstring = <xsl:value-of select="concat($sq,$preellipsisstring,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]"/>
      <xsl:comment> pren1tec = <xsl:value-of select="concat($sq,$pren1tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr1" select="substring-before($indqstr1,$ldq)"/>
      <xsl:comment> ldqstr1 = <xsl:value-of select="concat($sq,$ldqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr10" select="substring-before($indqstr10,$ldq)"/>
      <xsl:comment> ldqstr10 = <xsl:value-of select="concat($sq,$ldqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr2" select="substring-before($indqstr2,$ldq)"/>
      <xsl:comment> ldqstr2 = <xsl:value-of select="concat($sq,$ldqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr3" select="substring-before($indqstr3,$ldq)"/>
      <xsl:comment> ldqstr3 = <xsl:value-of select="concat($sq,$ldqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr4" select="substring-before($indqstr4,$ldq)"/>
      <xsl:comment> ldqstr4 = <xsl:value-of select="concat($sq,$ldqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr5" select="substring-before($indqstr5,$ldq)"/>
      <xsl:comment> ldqstr5 = <xsl:value-of select="concat($sq,$ldqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr6" select="substring-before($indqstr6,$ldq)"/>
      <xsl:comment> ldqstr6 = <xsl:value-of select="concat($sq,$ldqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr7" select="substring-before($indqstr7,$ldq)"/>
      <xsl:comment> ldqstr7 = <xsl:value-of select="concat($sq,$ldqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr8" select="substring-before($indqstr8,$ldq)"/>
      <xsl:comment> ldqstr8 = <xsl:value-of select="concat($sq,$ldqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr9" select="substring-before($indqstr9,$ldq)"/>
      <xsl:comment> ldqstr9 = <xsl:value-of select="concat($sq,$ldqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff1"
                    select="string-length(translate($ldqstr1,$rsq,'')) - string-length(translate($ldqstr1,$lsq,''))"/>
      <xsl:comment> sqdiff1 = <xsl:value-of select="concat($sq,$sqdiff1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff10"
                    select="string-length(translate($ldqstr10,$rsq,'')) - string-length(translate($ldqstr10,$lsq,''))"/>
      <xsl:comment> sqdiff10 = <xsl:value-of select="concat($sq,$sqdiff10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff2"
                    select="string-length(translate($ldqstr2,$rsq,'')) - string-length(translate($ldqstr2,$lsq,''))"/>
      <xsl:comment> sqdiff2 = <xsl:value-of select="concat($sq,$sqdiff2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff3"
                    select="string-length(translate($ldqstr3,$rsq,'')) - string-length(translate($ldqstr3,$lsq,''))"/>
      <xsl:comment> sqdiff3 = <xsl:value-of select="concat($sq,$sqdiff3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff4"
                    select="string-length(translate($ldqstr4,$rsq,'')) - string-length(translate($ldqstr4,$lsq,''))"/>
      <xsl:comment> sqdiff4 = <xsl:value-of select="concat($sq,$sqdiff4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff5"
                    select="string-length(translate($ldqstr5,$rsq,'')) - string-length(translate($ldqstr5,$lsq,''))"/>
      <xsl:comment> sqdiff5 = <xsl:value-of select="concat($sq,$sqdiff5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff6"
                    select="string-length(translate($ldqstr6,$rsq,'')) - string-length(translate($ldqstr6,$lsq,''))"/>
      <xsl:comment> sqdiff6 = <xsl:value-of select="concat($sq,$sqdiff6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff7"
                    select="string-length(translate($ldqstr7,$rsq,'')) - string-length(translate($ldqstr7,$lsq,''))"/>
      <xsl:comment> sqdiff7 = <xsl:value-of select="concat($sq,$sqdiff7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff8"
                    select="string-length(translate($ldqstr8,$rsq,'')) - string-length(translate($ldqstr8,$lsq,''))"/>
      <xsl:comment> sqdiff8 = <xsl:value-of select="concat($sq,$sqdiff8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff9"
                    select="string-length(translate($ldqstr9,$rsq,'')) - string-length(translate($ldqstr9,$lsq,''))"/>
      <xsl:comment> sqdiff9 = <xsl:value-of select="concat($sq,$sqdiff9,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 12.7.3 - rank=-->
               <xsl:if test="not(contains($pren1tec,$tec1ellipsis1) and contains($pren1tec,$tec2ellipsis2)  and contains($pren1tec,$tec3ellipsis3) and contains($pren1tec,$tec4ellipsis4)  and contains($pren1tec,$tec4ellipsis5)) ">
                  <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and $hastecellipsis and $hastecversion">
                     <xsl:text> err-para-n2-mid-12-7-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.7.4 - rank=-->
               <xsl:if test="not(contains($pren2tec,$curtecver) or contains($pren1tec,$curtecver))">
                  <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and not($hastecellipsis) and $hastecversion">
                     <xsl:text> err-para-n2-mid-12-7-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.8.1 - rank=-->
               <xsl:if test="$countpres5 &gt; $countpren1">
                  <xsl:if test="child::*[@style = 'tec']">
                     <xsl:text> err-para-n2-pre-12-8-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.1.2 - rank=5-->
               <xsl:if test="$counttec &gt; 1">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 12.7 - rank=5-->
               <xsl:if test="not(contains($pren1tec,$curtec))">
                  <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and not($hastecellipsis) and not($hastecversion)">
                     <xsl:text> err-para-n2-mid-12-7</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.7.1 - rank=5-->
               <xsl:if test="not(contains($pren1tec,$tec1ellipsis1) and contains($pren1tec,$tec1ellipsis2)) ">
                  <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and $counttecellipsis = 1 and not($hastecversion)">
                     <xsl:text> err-para-n2-mid-12-7-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.7.2 - rank=5-->
               <xsl:if test="not(contains($pren1tec,$tec1ellipsis1) and contains($pren1tec,$tec2ellipsis2)  and contains($pren1tec,$tec2ellipsis3)) ">
                  <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and $counttecellipsis = 2 and not($hastecversion)">
                     <xsl:text> err-para-n2-mid-12-7-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.7.3 - rank=5-->
               <xsl:if test="not(contains($pren1tec,$tec1ellipsis1) and contains($pren1tec,$tec2ellipsis2)  and contains($pren1tec,$tec3ellipsis3)  and contains($pren1tec,$tec3ellipsis4)) ">
                  <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and $counttecellipsis = 3 and not($hastecversion)">
                     <xsl:text> err-para-n2-mid-12-7-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.7.4 - rank=5-->
               <xsl:if test="not(contains($pren1tec,$tec1ellipsis1) and contains($pren1tec,$tec2ellipsis2)  and contains($pren1tec,$tec3ellipsis3)  and contains($pren1tec,$tec3ellipsis4)) ">
                  <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and $counttecellipsis = 4 and not($hastecversion)">
                     <xsl:text> err-para-n2-mid-12-7-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.2 - rank=8-->
               <xsl:if test="$counttec &gt; 0 and contains($pren2tec,$curtec) and $precharn2tec != '$' and $postcharn2tec != '$'">
                  <xsl:if test="$countpren1 &lt; $countpren2 and $countpres5 &lt; $countpren2">
                     <xsl:text> err-para-n2-mid-12-2</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="contains($indqstr1,'“') and $sqdiff1 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr1,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr2,'“') and $sqdiff2 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr2,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr3,'“') and $sqdiff3 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr3,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr4,'“') and $sqdiff4 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr4,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr5,'“') and $sqdiff5 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr5,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr6,'“') and $sqdiff6 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr6,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr7,'“') and $sqdiff7 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr7,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr8,'“') and $sqdiff8 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr8,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr9,'“') and $sqdiff9 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr9,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr10,'“') and $sqdiff10 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr10,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n3 -->
   <xsl:template match="para[@style = 'n3']">
      <xsl:variable name="fnstring">
         <xsl:apply-templates select="node()" mode="fntext"/>
      </xsl:variable>
      <xsl:comment>
fnstring = <xsl:value-of select="$fnstring"/>
      </xsl:comment>
      <xsl:variable name="curtec"
                    select="substring(*[@style = 'tec'][1],1,string-length(*[@style = 'tec'][1])-1)"/>
      <xsl:comment> curtec = <xsl:value-of select="concat($sq,$curtec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecver" select="normalize-space(substring-after($curtec,')'))"/>
      <xsl:comment> curtecver = <xsl:value-of select="concat($sq,$curtecver,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr1" select="substring-before($fnstring,$rdq)"/>
      <xsl:comment> dqstr1 = <xsl:value-of select="concat($sq,$dqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr10"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr10 = <xsl:value-of select="concat($sq,$dqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr2"
                    select="substring-before(substring-after($fnstring,$rdq),$rdq)"/>
      <xsl:comment> dqstr2 = <xsl:value-of select="concat($sq,$dqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr3"
                    select="substring-before(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr3 = <xsl:value-of select="concat($sq,$dqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr4"
                    select="substring-before(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr4 = <xsl:value-of select="concat($sq,$dqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr5"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr5 = <xsl:value-of select="concat($sq,$dqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr6"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr6 = <xsl:value-of select="concat($sq,$dqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr7"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr7 = <xsl:value-of select="concat($sq,$dqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr8"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr8 = <xsl:value-of select="concat($sq,$dqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr9"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr9 = <xsl:value-of select="concat($sq,$dqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="concat($sq,$countpren1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren2"
                    select="count(preceding::*[@style = 'n2'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren2 = <xsl:value-of select="concat($sq,$countpren2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren3"
                    select="count(preceding::*[@style = 'n3'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren3 = <xsl:value-of select="concat($sq,$countpren3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="concat($sq,$countpres5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="concat($sq,$countpresibnode,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="counttec" select="count(*[@style = 'tec'])"/>
      <xsl:comment> counttec = <xsl:value-of select="concat($sq,$counttec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="counttrs" select="count(*[@style = 'trs'])"/>
      <xsl:comment> counttrs = <xsl:value-of select="concat($sq,$counttrs,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsis" select="substring-after($curtec,'…')"/>
      <xsl:comment> curtecpostellipsis = <xsl:value-of select="concat($sq,$curtecpostellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecpreellipsis" select="substring-before($curtec,'…')"/>
      <xsl:comment> curtecpreellipsis = <xsl:value-of select="concat($sq,$curtecpreellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtecverpreellipsis"
                    select="substring-before(substring-after($curtec,')'),'…')"/>
      <xsl:comment> curtecverpreellipsis = <xsl:value-of select="concat($sq,$curtecverpreellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curtei" select="*[@style = 'tei']/text()"/>
      <xsl:comment> curtei = <xsl:value-of select="concat($sq,$curtei,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastecchild" select="boolean(child::*[@style = 'tec'])"/>
      <xsl:comment> hastecchild = <xsl:value-of select="concat($sq,$hastecchild,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastecellipsis" select="contains(*[@style = 'tec'][1],'…')"/>
      <xsl:comment> hastecellipsis = <xsl:value-of select="concat($sq,$hastecellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastecversion"
                    select="starts-with(translate(*[@style = 'tec'][1],$letucnumb,$letucnumbsub),'($$$') or  starts-with(translate(*[@style = 'tec'][1],'ALT','alt'),'(alt:')"/>
      <xsl:comment> hastecversion = <xsl:value-of select="concat($sq,$hastecversion,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr1" select="substring-after($dqstr1,$ldq)"/>
      <xsl:comment> indqstr1 = <xsl:value-of select="concat($sq,$indqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr10" select="substring-after($dqstr10,$ldq)"/>
      <xsl:comment> indqstr10 = <xsl:value-of select="concat($sq,$indqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr2" select="substring-after($dqstr2,$ldq)"/>
      <xsl:comment> indqstr2 = <xsl:value-of select="concat($sq,$indqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr3" select="substring-after($dqstr3,$ldq)"/>
      <xsl:comment> indqstr3 = <xsl:value-of select="concat($sq,$indqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr4" select="substring-after($dqstr4,$ldq)"/>
      <xsl:comment> indqstr4 = <xsl:value-of select="concat($sq,$indqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr5" select="substring-after($dqstr5,$ldq)"/>
      <xsl:comment> indqstr5 = <xsl:value-of select="concat($sq,$indqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr6" select="substring-after($dqstr6,$ldq)"/>
      <xsl:comment> indqstr6 = <xsl:value-of select="concat($sq,$indqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr7" select="substring-after($dqstr7,$ldq)"/>
      <xsl:comment> indqstr7 = <xsl:value-of select="concat($sq,$indqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr8" select="substring-after($dqstr8,$ldq)"/>
      <xsl:comment> indqstr8 = <xsl:value-of select="concat($sq,$indqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr9" select="substring-after($dqstr9,$ldq)"/>
      <xsl:comment> indqstr9 = <xsl:value-of select="concat($sq,$indqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="lenchildtec" select="string-length(*[@style = 'tec']/text())"/>
      <xsl:comment> lenchildtec = <xsl:value-of select="concat($sq,$lenchildtec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="node1tec" select="node()[1][@style = 'tec']"/>
      <xsl:comment> node1tec = <xsl:value-of select="concat($sq,$node1tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preellipsisstring"
                    select="normalize-space(concat(' ',substring-before(node()[not(self::*)],'…'),' '))"/>
      <xsl:comment> preellipsisstring = <xsl:value-of select="concat($sq,$preellipsisstring,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]"/>
      <xsl:comment> pren1tec = <xsl:value-of select="concat($sq,$pren1tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pren2tec"
                    select="preceding::*[@style = 'n2'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]"/>
      <xsl:comment> pren2tec = <xsl:value-of select="concat($sq,$pren2tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pren3tec"
                    select="preceding::*[@style = 'n3'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]"/>
      <xsl:comment> pren3tec = <xsl:value-of select="concat($sq,$pren3tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="validtecfirst"
                    select="substring(translate(*[@style = 'tec']/text(),concat($letulc,'('),concat($letulcsub,'$')),1,1)"/>
      <xsl:comment> validtecfirst = <xsl:value-of select="concat($sq,$validtecfirst,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr1" select="substring-before($indqstr1,$ldq)"/>
      <xsl:comment> ldqstr1 = <xsl:value-of select="concat($sq,$ldqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr10" select="substring-before($indqstr10,$ldq)"/>
      <xsl:comment> ldqstr10 = <xsl:value-of select="concat($sq,$ldqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr2" select="substring-before($indqstr2,$ldq)"/>
      <xsl:comment> ldqstr2 = <xsl:value-of select="concat($sq,$ldqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr3" select="substring-before($indqstr3,$ldq)"/>
      <xsl:comment> ldqstr3 = <xsl:value-of select="concat($sq,$ldqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr4" select="substring-before($indqstr4,$ldq)"/>
      <xsl:comment> ldqstr4 = <xsl:value-of select="concat($sq,$ldqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr5" select="substring-before($indqstr5,$ldq)"/>
      <xsl:comment> ldqstr5 = <xsl:value-of select="concat($sq,$ldqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr6" select="substring-before($indqstr6,$ldq)"/>
      <xsl:comment> ldqstr6 = <xsl:value-of select="concat($sq,$ldqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr7" select="substring-before($indqstr7,$ldq)"/>
      <xsl:comment> ldqstr7 = <xsl:value-of select="concat($sq,$ldqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr8" select="substring-before($indqstr8,$ldq)"/>
      <xsl:comment> ldqstr8 = <xsl:value-of select="concat($sq,$ldqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr9" select="substring-before($indqstr9,$ldq)"/>
      <xsl:comment> ldqstr9 = <xsl:value-of select="concat($sq,$ldqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff1"
                    select="string-length(translate($ldqstr1,$rsq,'')) - string-length(translate($ldqstr1,$lsq,''))"/>
      <xsl:comment> sqdiff1 = <xsl:value-of select="concat($sq,$sqdiff1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff10"
                    select="string-length(translate($ldqstr10,$rsq,'')) - string-length(translate($ldqstr10,$lsq,''))"/>
      <xsl:comment> sqdiff10 = <xsl:value-of select="concat($sq,$sqdiff10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff2"
                    select="string-length(translate($ldqstr2,$rsq,'')) - string-length(translate($ldqstr2,$lsq,''))"/>
      <xsl:comment> sqdiff2 = <xsl:value-of select="concat($sq,$sqdiff2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff3"
                    select="string-length(translate($ldqstr3,$rsq,'')) - string-length(translate($ldqstr3,$lsq,''))"/>
      <xsl:comment> sqdiff3 = <xsl:value-of select="concat($sq,$sqdiff3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff4"
                    select="string-length(translate($ldqstr4,$rsq,'')) - string-length(translate($ldqstr4,$lsq,''))"/>
      <xsl:comment> sqdiff4 = <xsl:value-of select="concat($sq,$sqdiff4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff5"
                    select="string-length(translate($ldqstr5,$rsq,'')) - string-length(translate($ldqstr5,$lsq,''))"/>
      <xsl:comment> sqdiff5 = <xsl:value-of select="concat($sq,$sqdiff5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff6"
                    select="string-length(translate($ldqstr6,$rsq,'')) - string-length(translate($ldqstr6,$lsq,''))"/>
      <xsl:comment> sqdiff6 = <xsl:value-of select="concat($sq,$sqdiff6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff7"
                    select="string-length(translate($ldqstr7,$rsq,'')) - string-length(translate($ldqstr7,$lsq,''))"/>
      <xsl:comment> sqdiff7 = <xsl:value-of select="concat($sq,$sqdiff7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff8"
                    select="string-length(translate($ldqstr8,$rsq,'')) - string-length(translate($ldqstr8,$lsq,''))"/>
      <xsl:comment> sqdiff8 = <xsl:value-of select="concat($sq,$sqdiff8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff9"
                    select="string-length(translate($ldqstr9,$rsq,'')) - string-length(translate($ldqstr9,$lsq,''))"/>
      <xsl:comment> sqdiff9 = <xsl:value-of select="concat($sq,$sqdiff9,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 12.6.2 - rank=-->
               <xsl:if test="not((contains($pren2tec,$curtecverpreellipsis) and contains($pren2tec,$curtecpostellipsis)) or (contains($pren1tec,$curtecverpreellipsis) and contains($pren1tec,$curtecpostellipsis)))">
                  <xsl:if test="$hastecellipsis and $hastecchild  and $hastecversion">
                     <xsl:text> err-para-n3-mid-12-6-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.6.3 - rank=-->
               <xsl:if test="not(contains($pren2tec,$curtecver) or contains($pren1tec,$curtecver))">
                  <xsl:if test="not($hastecellipsis) and $hastecchild and $hastecversion">
                     <xsl:text> err-para-n3-mid-12-6-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.1.3 - rank=5-->
               <xsl:if test="$counttec &gt; 1">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 10.1.5 - rank=5-->
               <xsl:if test="$counttec = 0">
                  <xsl:if test="$counttrs = 0">
                     <xsl:text> err-para-n3-mid-10-1-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.2.2 - rank=5-->
               <xsl:if test="$node1tec and $counttec = 1">
                  <xsl:if test="$validtecfirst != '$'">
                     <xsl:text> err-para-n3-mid-10-2-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.6 - rank=5-->
               <xsl:if test="not(contains($pren2tec,$curtec) or contains($pren1tec,$curtec))">
                  <xsl:if test="$hastecchild and not($hastecversion) and not($hastecellipsis)">
                     <xsl:text> err-para-n3-mid-12-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.6.1 - rank=5-->
               <xsl:if test="not((contains($pren2tec,$curtecpreellipsis) and contains($pren2tec,$curtecpostellipsis)) or (contains($pren1tec,$curtecpreellipsis) and contains($pren1tec,$curtecpostellipsis)))">
                  <xsl:if test="$countpres5 &lt; $countpren2 and $countpres5 &lt; $countpren1 and $hastecellipsis and $hastecchild and not($hastecversion)">
                     <xsl:text> err-para-n3-mid-12-6-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.8.2 - rank=5-->
               <xsl:if test="$countpres5 &gt; $countpren2">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="contains($indqstr1,'“') and $sqdiff1 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr1,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr2,'“') and $sqdiff2 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr2,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr3,'“') and $sqdiff3 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr3,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr4,'“') and $sqdiff4 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr4,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr5,'“') and $sqdiff5 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr5,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr6,'“') and $sqdiff6 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr6,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr7,'“') and $sqdiff7 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr7,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr8,'“') and $sqdiff8 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr8,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr9,'“') and $sqdiff9 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr9,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
         <xsl:if test="contains($indqstr10,'“') and $sqdiff10 = 0">
            <xsl:text> </xsl:text>
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat('quote-error-',@style)"/>
               </xsl:attribute>
               <xsl:value-of select="concat('“',substring-after($indqstr10,'“'),'”')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- para @style=s3 -->
   <xsl:template match="para[@style = 's3']">
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="concat($sq,$refcolonv,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="concat($sq,$strlenb4chap,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasspacecref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),' #')"/>
      <xsl:comment> hasspacecref = <xsl:value-of select="concat($sq,$hasspacecref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hassubvrange"
                    select="contains(translate($refcolonv,$validvlet,$validvletsub),'$–$')"/>
      <xsl:comment> hassubvrange = <xsl:value-of select="concat($sq,$hassubvrange,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasvlet"
                    select="contains(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#$')"/>
      <xsl:comment> hasvlet = <xsl:value-of select="concat($sq,$hasvlet,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:comment> lastchar = <xsl:value-of select="concat($sq,$lastchar,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="lastchartype"
                    select="translate(substring(.,string-length(.),1),$validcvnumblet,$validcvnumbletsub)"/>
      <xsl:comment> lastchartype = <xsl:value-of select="concat($sq,$lastchartype,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pres5text" select="preceding::*[@style = 's5'][1]/text()"/>
      <xsl:comment> pres5text = <xsl:value-of select="concat($sq,$pres5text,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prevhyphen" select="contains($preverse,'-')"/>
      <xsl:comment> prevhyphen = <xsl:value-of select="concat($sq,$prevhyphen,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvlet"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$letlc,$letsub),'$')"/>
      <xsl:comment> refcolonvlet = <xsl:value-of select="concat($sq,$refcolonvlet,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="concat($sq,$refcolonvr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr2" select="substring-after($refcolonv,'–')"/>
      <xsl:comment> refcolonvr2 = <xsl:value-of select="concat($sq,$refcolonvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="reftype"
                    select="translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub)"/>
      <xsl:comment> reftype = <xsl:value-of select="concat($sq,$reftype,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refvendash" select="contains(node()[not(self::*)],'–')"/>
      <xsl:comment> refvendash = <xsl:value-of select="concat($sq,$refvendash,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refwordschapcolon"
                    select="substring-before(substring(node()[not(self::*)],$strlenb4chap +1),':')"/>
      <xsl:comment> refwordschapcolon = <xsl:value-of select="concat($sq,$refwordschapcolon,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 19.4 - rank=-->
               <xsl:if test="not($prevhyphen) and not($refvendash) and not($hasvlet)">
                  <xsl:if test="$refcolonv != $preverse">
                     <xsl:text> err-para-s3-mid-19-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.4.1 - rank=-->
               <xsl:if test="not($prevhyphen) and not($refvendash) and $hasvlet">
                  <xsl:if test="$refcolonvlet != $preverse">
                     <xsl:text> err-para-s3-mid-19-4-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.5 - rank=-->
               <xsl:if test="$hassubvrange and $hascvref ">
                  <xsl:if test="$refcolonvlet != $preverse">
                     <xsl:text> err-para-s3-mid-19-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.6 - rank=-->
               <xsl:if test="($refvendash  and ($lastchartype = '#')) or (contains($reftype,'#$–#')  and ($lastchartype = '#'))">
                  <xsl:if test="$refcolonvr2 != $preverse">
                     <xsl:text> err-para-s3-mid-19-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.8 - rank=-->
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ntn'])">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 19.3 - rank=5-->
               <xsl:if test="$hascvref and $hasspacecref">
                  <xsl:if test="$refwordschapcolon != $prechapter">
                     <xsl:text> err-para-s3-mid-19-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.7 - rank=5-->
               <xsl:if test="$hascvref and $lastchartype  = '$'">
                  <xsl:if test="$lastchar != substring($pres5text,string-length($pres5text),1)">
                     <xsl:text> err-para-s3-mid-19-7</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.1 - rank=6-->
               <xsl:if test="not(contains(text(),'General Comment on'))">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 19.2 - rank=6-->
               <xsl:if test="not($hascvref )">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b3 -->
   <xsl:template match="para[@style = 'b3']">
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="values5beforev"
                    select="following::*[@style = 'v'][1]/preceding::*[@style = 's5'][1]/text()"/>
      <xsl:comment> values5beforev = <xsl:value-of select="concat($sq,$values5beforev,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ancestor" select="ancestor::*/@style "/>
      <xsl:comment> ancestor = <xsl:value-of select="concat($sq,$ancestor,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curverse" select="verse/@number"/>
      <xsl:comment> curverse = <xsl:value-of select="concat($sq,$curverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curvr1" select="substring-before(verse/@number,'-')"/>
      <xsl:comment> curvr1 = <xsl:value-of select="concat($sq,$curvr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curvr2" select="substring-after(verse/@number,'-')"/>
      <xsl:comment> curvr2 = <xsl:value-of select="concat($sq,$curvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasvhyphen" select="contains(verse/@number,'-')"/>
      <xsl:comment> hasvhyphen = <xsl:value-of select="concat($sq,$hasvhyphen,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5beforevhaslrb" select="contains($values5beforev,'(')"/>
      <xsl:comment> posts5beforevhaslrb = <xsl:value-of select="concat($sq,$posts5beforevhaslrb,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5beforevhasvr2"
                    select="contains(translate($values5beforev,$validcvnumblet,$validcvnumbletsub),'–#')"/>
      <xsl:comment> posts5beforevhasvr2 = <xsl:value-of select="concat($sq,$posts5beforevhasvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5hasendashvr2"
                    select="contains(translate(following::*[@style = 's5'][1],$validcvnumblet,$validcvnumbletsub),'–#')"/>
      <xsl:comment> posts5hasendashvr2 = <xsl:value-of select="concat($sq,$posts5hasendashvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5hasleftround"
                    select="contains(following::*[@style = 's5'][1],'(')"/>
      <xsl:comment> posts5hasleftround = <xsl:value-of select="concat($sq,$posts5hasleftround,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5v"
                    select="substring-after(translate(following::*[@style = 's5'][1],$validvletendash,''),':')"/>
      <xsl:comment> posts5v = <xsl:value-of select="concat($sq,$posts5v,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsib" select="following-sibling::*[1]/@style"/>
      <xsl:comment> postsib = <xsl:value-of select="concat($sq,$postsib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsib2" select="postsib2"/>
      <xsl:comment> postsib2 = <xsl:value-of select="concat($sq,$postsib2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posttable" select="following-sibling::*[1][name() = 'table'] "/>
      <xsl:comment> posttable = <xsl:value-of select="concat($sq,$posttable,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posttable2" select="following-sibling::*[2][name() = 'table'] "/>
      <xsl:comment> posttable2 = <xsl:value-of select="concat($sq,$posttable2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pres5hasendashvr2"
                    select="contains(translate(preceding::*[@style = 's5'][1],$validcvnumblet,$validcvnumbletsub),'–#')"/>
      <xsl:comment> pres5hasendashvr2 = <xsl:value-of select="concat($sq,$pres5hasendashvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pres5hasleftround"
                    select="contains(preceding::*[@style = 's5'][1],'(')"/>
      <xsl:comment> pres5hasleftround = <xsl:value-of select="concat($sq,$pres5hasleftround,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pres5v"
                    select="substring-after(translate(preceding::*[@style = 's5'][1],$validvletendash,''),':')"/>
      <xsl:comment> pres5v = <xsl:value-of select="concat($sq,$pres5v,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presib" select="preceding-sibling::*[1]/@style"/>
      <xsl:comment> presib = <xsl:value-of select="concat($sq,$presib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presib2" select="preceding-sibling::*[2]/@style"/>
      <xsl:comment> presib2 = <xsl:value-of select="concat($sq,$presib2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverser1" select="substring-before($preverse,'-')"/>
      <xsl:comment> preverser1 = <xsl:value-of select="concat($sq,$preverser1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverser2" select="substring-after($preverse,'-')"/>
      <xsl:comment> preverser2 = <xsl:value-of select="concat($sq,$preverser2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prevhyphen" select="contains($preverse,'-')"/>
      <xsl:comment> prevhyphen = <xsl:value-of select="concat($sq,$prevhyphen,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 7.1.1 - rank=-->
               <xsl:if test="$curverse = 1">
                  <xsl:if test="$postsib = 'b'">
                     <xsl:text> err-para-b3-post-7-1-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.1.3 - rank=-->
               <xsl:if test="$curverse != 1">
                  <xsl:if test="$presib = 'b'">
                     <xsl:text> err-para-b3-pre-7-1-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.10.2 - rank=-->
               <xsl:if test="($curverse != 1) and $posttable">
                  <xsl:if test="not($postsib = 'b' or ( $postsib = 'rem' and $postsib2 = 'b'))">
                     <xsl:text> err-para-b3-post-7-10-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 15.1 - rank=-->
               <xsl:if test="$hasvhyphen and not($posts5hasendashvr2) and not($posts5hasleftround)">
                  <xsl:if test="$posts5v != $curvr1">
                     <xsl:text> err-para-b3-post-15-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 15.5 - rank=-->
               <xsl:if test="$hasvhyphen and not($posts5beforevhasvr2) and not($posts5beforevhaslrb) ">
                  <xsl:if test="not(contains($values5beforev,concat(':',$curvr2)))">
                     <xsl:text> err-para-b3-post-15-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 1.1 - rank=8-->
               <xsl:if test="not(verse)">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=p -->
   <xsl:template match="para[@style = 'p']">
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="values5beforev"
                    select="following::*[@style = 'v'][1]/preceding::*[@style = 's5'][1]/text()"/>
      <xsl:comment> values5beforev = <xsl:value-of select="concat($sq,$values5beforev,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ancestor" select="ancestor::*/@style "/>
      <xsl:comment> ancestor = <xsl:value-of select="concat($sq,$ancestor,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curverse" select="verse/@number"/>
      <xsl:comment> curverse = <xsl:value-of select="concat($sq,$curverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curvr1" select="substring-before(verse/@number,'-')"/>
      <xsl:comment> curvr1 = <xsl:value-of select="concat($sq,$curvr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curvr2" select="substring-after(verse/@number,'-')"/>
      <xsl:comment> curvr2 = <xsl:value-of select="concat($sq,$curvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasvhyphen" select="contains(verse/@number,'-')"/>
      <xsl:comment> hasvhyphen = <xsl:value-of select="concat($sq,$hasvhyphen,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5beforevhaslrb" select="contains($values5beforev,'(')"/>
      <xsl:comment> posts5beforevhaslrb = <xsl:value-of select="concat($sq,$posts5beforevhaslrb,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5beforevhasvr2"
                    select="contains(translate($values5beforev,$validcvnumblet,$validcvnumbletsub),'–#')"/>
      <xsl:comment> posts5beforevhasvr2 = <xsl:value-of select="concat($sq,$posts5beforevhasvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5hasendashvr2"
                    select="contains(translate(following::*[@style = 's5'][1],$validcvnumblet,$validcvnumbletsub),'–#')"/>
      <xsl:comment> posts5hasendashvr2 = <xsl:value-of select="concat($sq,$posts5hasendashvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5hasleftround"
                    select="contains(following::*[@style = 's5'][1],'(')"/>
      <xsl:comment> posts5hasleftround = <xsl:value-of select="concat($sq,$posts5hasleftround,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posts5v"
                    select="substring-after(translate(following::*[@style = 's5'][1],$validvletendash,''),':')"/>
      <xsl:comment> posts5v = <xsl:value-of select="concat($sq,$posts5v,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsib" select="following-sibling::*[1]/@style"/>
      <xsl:comment> postsib = <xsl:value-of select="concat($sq,$postsib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsib2" select="postsib2"/>
      <xsl:comment> postsib2 = <xsl:value-of select="concat($sq,$postsib2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posttable" select="following-sibling::*[1][name() = 'table'] "/>
      <xsl:comment> posttable = <xsl:value-of select="concat($sq,$posttable,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="posttable2" select="following-sibling::*[2][name() = 'table'] "/>
      <xsl:comment> posttable2 = <xsl:value-of select="concat($sq,$posttable2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pres5hasendashvr2"
                    select="contains(translate(preceding::*[@style = 's5'][1],$validcvnumblet,$validcvnumbletsub),'–#')"/>
      <xsl:comment> pres5hasendashvr2 = <xsl:value-of select="concat($sq,$pres5hasendashvr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pres5hasleftround"
                    select="contains(preceding::*[@style = 's5'][1],'(')"/>
      <xsl:comment> pres5hasleftround = <xsl:value-of select="concat($sq,$pres5hasleftround,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pres5v"
                    select="substring-after(translate(preceding::*[@style = 's5'][1],$validvletendash,''),':')"/>
      <xsl:comment> pres5v = <xsl:value-of select="concat($sq,$pres5v,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presib" select="preceding-sibling::*[1]/@style"/>
      <xsl:comment> presib = <xsl:value-of select="concat($sq,$presib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presib2" select="preceding-sibling::*[2]/@style"/>
      <xsl:comment> presib2 = <xsl:value-of select="concat($sq,$presib2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverser1" select="substring-before($preverse,'-')"/>
      <xsl:comment> preverser1 = <xsl:value-of select="concat($sq,$preverser1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverser2" select="substring-after($preverse,'-')"/>
      <xsl:comment> preverser2 = <xsl:value-of select="concat($sq,$preverser2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prevhyphen" select="contains($preverse,'-')"/>
      <xsl:comment> prevhyphen = <xsl:value-of select="concat($sq,$prevhyphen,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 7.1.2 - rank=-->
               <xsl:if test="$curverse = 1">
                  <xsl:if test="$postsib = 'b'">
                     <xsl:text> err-para-p-post-7-1-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.1.4 - rank=-->
               <xsl:if test="$curverse != 1">
                  <xsl:if test="$presib = 'b'">
                     <xsl:text> err-para-p-pre-7-1-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.10.1 - rank=-->
               <xsl:if test="($curverse != 1) and $posttable">
                  <xsl:if test="not($postsib = 'b' or ( $postsib = 'rem' and $postsib2 = 'b'))">
                     <xsl:text> err-para-p-post-7-10-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 15.2 - rank=-->
               <xsl:if test="$hasvhyphen and not($posts5hasendashvr2) and not($posts5hasleftround)">
                  <xsl:if test="$posts5v != $curvr1">
                     <xsl:text> err-para-p-pre-15-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 15.6 - rank=-->
               <xsl:if test="$hasvhyphen and not($posts5beforevhasvr2) and not($posts5beforevhaslrb) ">
                  <xsl:if test="not(contains($values5beforev,concat(':',$curvr2)))">
                     <xsl:text> err-para-p-post-15-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 1.2 - rank=8-->
               <xsl:if test="not(verse)">
                  <xsl:text> </xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=gra -->
   <xsl:template match="para[@style = 'gra']">
      <xsl:variable name="countf" select="count(*[@style = 'f'])"/>
      <xsl:comment> countf = <xsl:value-of select="concat($sq,$countf,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countfig" select="count(*[@style = 'fig'])"/>
      <xsl:comment> countfig = <xsl:value-of select="concat($sq,$countfig,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countnode" select="count(node())"/>
      <xsl:comment> countnode = <xsl:value-of select="concat($sq,$countnode,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref 9.1 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para--mid-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="not(@style = 'b') and not(@style = 'b2')  and not(@style = 'tc2')  and not(@style = 'tc3') and not(@style = 'tc4') and not(@style = 'tc5')">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para--mid-23-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 22.8 - rank=-->
               <xsl:if test="$countfig + $countf = 1">
                  <xsl:if test="$countf = 0">
                     <xsl:text> err-para-gra-mid-22-8</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 22.10. - rank=-->
               <xsl:if test="$countfig + $countf = 1">
                  <xsl:if test="$countfig = 0">
                     <xsl:text> err-para-gra-mid-22-10-</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 22.2 - rank=8-->
               <xsl:if test="$countfig + $countf = 2">
                  <xsl:if test="$countnode != 2">
                     <xsl:text> err-para-gra-mid-22-2</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="note[@style = 'f']">
      <xsl:variable name="fnstring">
         <xsl:apply-templates select="node()" mode="fntext"/>
      </xsl:variable>
      <xsl:comment>
fnstring = <xsl:value-of select="$fnstring"/>
      </xsl:comment>
      <xsl:variable name="dqstr1" select="substring-before($fnstring,$rdq)"/>
      <xsl:comment> dqstr1 = <xsl:value-of select="concat($sq,$dqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr10"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr10 = <xsl:value-of select="concat($sq,$dqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr2"
                    select="substring-before(substring-after($fnstring,$rdq),$rdq)"/>
      <xsl:comment> dqstr2 = <xsl:value-of select="concat($sq,$dqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr3"
                    select="substring-before(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr3 = <xsl:value-of select="concat($sq,$dqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr4"
                    select="substring-before(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr4 = <xsl:value-of select="concat($sq,$dqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr5"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr5 = <xsl:value-of select="concat($sq,$dqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr6"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr6 = <xsl:value-of select="concat($sq,$dqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr7"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr7 = <xsl:value-of select="concat($sq,$dqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr8"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr8 = <xsl:value-of select="concat($sq,$dqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="dqstr9"
                    select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($fnstring,$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq),$rdq)"/>
      <xsl:comment> dqstr9 = <xsl:value-of select="concat($sq,$dqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curpos" select="position()"/>
      <xsl:comment> curpos = <xsl:value-of select="concat($sq,$curpos,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="graparent" select="parent::para[@style = 'gra']"/>
      <xsl:comment> graparent = <xsl:value-of select="concat($sq,$graparent,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr1" select="substring-after($dqstr1,$ldq)"/>
      <xsl:comment> indqstr1 = <xsl:value-of select="concat($sq,$indqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr10" select="substring-after($dqstr10,$ldq)"/>
      <xsl:comment> indqstr10 = <xsl:value-of select="concat($sq,$indqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr2" select="substring-after($dqstr2,$ldq)"/>
      <xsl:comment> indqstr2 = <xsl:value-of select="concat($sq,$indqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr3" select="substring-after($dqstr3,$ldq)"/>
      <xsl:comment> indqstr3 = <xsl:value-of select="concat($sq,$indqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr4" select="substring-after($dqstr4,$ldq)"/>
      <xsl:comment> indqstr4 = <xsl:value-of select="concat($sq,$indqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr5" select="substring-after($dqstr5,$ldq)"/>
      <xsl:comment> indqstr5 = <xsl:value-of select="concat($sq,$indqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr6" select="substring-after($dqstr6,$ldq)"/>
      <xsl:comment> indqstr6 = <xsl:value-of select="concat($sq,$indqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr7" select="substring-after($dqstr7,$ldq)"/>
      <xsl:comment> indqstr7 = <xsl:value-of select="concat($sq,$indqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr8" select="substring-after($dqstr8,$ldq)"/>
      <xsl:comment> indqstr8 = <xsl:value-of select="concat($sq,$indqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="indqstr9" select="substring-after($dqstr9,$ldq)"/>
      <xsl:comment> indqstr9 = <xsl:value-of select="concat($sq,$indqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr1" select="substring-before($indqstr1,$ldq)"/>
      <xsl:comment> ldqstr1 = <xsl:value-of select="concat($sq,$ldqstr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr10" select="substring-before($indqstr10,$ldq)"/>
      <xsl:comment> ldqstr10 = <xsl:value-of select="concat($sq,$ldqstr10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr2" select="substring-before($indqstr2,$ldq)"/>
      <xsl:comment> ldqstr2 = <xsl:value-of select="concat($sq,$ldqstr2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr3" select="substring-before($indqstr3,$ldq)"/>
      <xsl:comment> ldqstr3 = <xsl:value-of select="concat($sq,$ldqstr3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr4" select="substring-before($indqstr4,$ldq)"/>
      <xsl:comment> ldqstr4 = <xsl:value-of select="concat($sq,$ldqstr4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr5" select="substring-before($indqstr5,$ldq)"/>
      <xsl:comment> ldqstr5 = <xsl:value-of select="concat($sq,$ldqstr5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr6" select="substring-before($indqstr6,$ldq)"/>
      <xsl:comment> ldqstr6 = <xsl:value-of select="concat($sq,$ldqstr6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr7" select="substring-before($indqstr7,$ldq)"/>
      <xsl:comment> ldqstr7 = <xsl:value-of select="concat($sq,$ldqstr7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr8" select="substring-before($indqstr8,$ldq)"/>
      <xsl:comment> ldqstr8 = <xsl:value-of select="concat($sq,$ldqstr8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ldqstr9" select="substring-before($indqstr9,$ldq)"/>
      <xsl:comment> ldqstr9 = <xsl:value-of select="concat($sq,$ldqstr9,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff1"
                    select="string-length(translate($ldqstr1,$rsq,'')) - string-length(translate($ldqstr1,$lsq,''))"/>
      <xsl:comment> sqdiff1 = <xsl:value-of select="concat($sq,$sqdiff1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff10"
                    select="string-length(translate($ldqstr10,$rsq,'')) - string-length(translate($ldqstr10,$lsq,''))"/>
      <xsl:comment> sqdiff10 = <xsl:value-of select="concat($sq,$sqdiff10,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff2"
                    select="string-length(translate($ldqstr2,$rsq,'')) - string-length(translate($ldqstr2,$lsq,''))"/>
      <xsl:comment> sqdiff2 = <xsl:value-of select="concat($sq,$sqdiff2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff3"
                    select="string-length(translate($ldqstr3,$rsq,'')) - string-length(translate($ldqstr3,$lsq,''))"/>
      <xsl:comment> sqdiff3 = <xsl:value-of select="concat($sq,$sqdiff3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff4"
                    select="string-length(translate($ldqstr4,$rsq,'')) - string-length(translate($ldqstr4,$lsq,''))"/>
      <xsl:comment> sqdiff4 = <xsl:value-of select="concat($sq,$sqdiff4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff5"
                    select="string-length(translate($ldqstr5,$rsq,'')) - string-length(translate($ldqstr5,$lsq,''))"/>
      <xsl:comment> sqdiff5 = <xsl:value-of select="concat($sq,$sqdiff5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff6"
                    select="string-length(translate($ldqstr6,$rsq,'')) - string-length(translate($ldqstr6,$lsq,''))"/>
      <xsl:comment> sqdiff6 = <xsl:value-of select="concat($sq,$sqdiff6,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff7"
                    select="string-length(translate($ldqstr7,$rsq,'')) - string-length(translate($ldqstr7,$lsq,''))"/>
      <xsl:comment> sqdiff7 = <xsl:value-of select="concat($sq,$sqdiff7,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff8"
                    select="string-length(translate($ldqstr8,$rsq,'')) - string-length(translate($ldqstr8,$lsq,''))"/>
      <xsl:comment> sqdiff8 = <xsl:value-of select="concat($sq,$sqdiff8,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="sqdiff9"
                    select="string-length(translate($ldqstr9,$rsq,'')) - string-length(translate($ldqstr9,$lsq,''))"/>
      <xsl:comment> sqdiff9 = <xsl:value-of select="concat($sq,$sqdiff9,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref 9.6 - rank=-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                  <xsl:text> err-char--mid-9-6</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 30 - rank=0-->
            <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                  <xsl:text> err-char--mid-30</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 38 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 40 - rank=9-->
            <xsl:if test="preceding-sibling::*[1]/@style = @style">
               <xsl:if test="preceding::text()[1] = ' '">
                  <xsl:text> err-char--pre-40</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 37 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---37</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.3 - rank=-->
            <xsl:if test="$graparent">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'fig'] )">
                  <xsl:text> err-note-f-pre-22-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.5 - rank=-->
            <xsl:if test="@caller != '+'">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 27.4 - rank=-->
            <xsl:if test="(contains($indqstr1,$ldq) and $sqdiff1 = 0) or (contains($indqstr2,$ldq) and $sqdiff2 = 0) or (contains($indqstr3,$ldq) and $sqdiff3 = 0) or (contains($indqstr4,$ldq) and $sqdiff4 = 0) or (contains($indqstr5,$ldq) and $sqdiff5 = 0) or (contains($indqstr6,$ldq) and $sqdiff6 = 0) or (contains($indqstr7,$ldq) and $sqdiff7 = 0) or (contains($indqstr8,$ldq) and $sqdiff8 = 0) or (contains($indqstr9,$ldq) and $sqdiff9 = 0) or (contains($indqstr10,$ldq) and $sqdiff10 = 0)">
               <xsl:text> </xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:value-of select="@caller"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
      <xsl:if test="contains($indqstr1,'“') and $sqdiff1 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr1,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr2,'“') and $sqdiff2 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr2,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr3,'“') and $sqdiff3 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr3,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr4,'“') and $sqdiff4 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr4,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr5,'“') and $sqdiff5 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr5,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr6,'“') and $sqdiff6 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr6,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr7,'“') and $sqdiff7 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr7,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr8,'“') and $sqdiff8 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr8,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr9,'“') and $sqdiff9 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr9,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
      <xsl:if test="contains($indqstr10,'“') and $sqdiff10 = 0">
         <xsl:text> </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('quote-error-',@style)"/>
            </xsl:attribute>
            <xsl:value-of select="concat('“',substring-after($indqstr10,'“'),'”')"/>
         </xsl:element>
      </xsl:if>
   </xsl:template>
   <xsl:template match="figure[@style = 'fig']">
      <xsl:variable name="curpos" select="position()"/>
      <xsl:comment> curpos = <xsl:value-of select="concat($sq,$curpos,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="graparent" select="parent::para[@style = 'gra']"/>
      <xsl:comment> graparent = <xsl:value-of select="concat($sq,$graparent,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascoloncvref" select="contains(@ref,':')"/>
      <xsl:comment> hascoloncvref = <xsl:value-of select="concat($sq,$hascoloncvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasspaceinref" select="contains(@ref,' ')"/>
      <xsl:comment> hasspaceinref = <xsl:value-of select="concat($sq,$hasspaceinref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refattchap" select="substring-before(@ref,':')"/>
      <xsl:comment> refattchap = <xsl:value-of select="concat($sq,$refattchap,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refattchapdot" select="substring-before(@ref,'.')"/>
      <xsl:comment> refattchapdot = <xsl:value-of select="concat($sq,$refattchapdot,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refattdotverse" select="substring-after(@ref,'.')"/>
      <xsl:comment> refattdotverse = <xsl:value-of select="concat($sq,$refattdotverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refattverse" select="substring-after(@ref,':')"/>
      <xsl:comment> refattverse = <xsl:value-of select="concat($sq,$refattverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refchapter" select="refchapter"/>
      <xsl:comment> refchapter = <xsl:value-of select="concat($sq,$refchapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refverse" select="refverse"/>
      <xsl:comment> refverse = <xsl:value-of select="concat($sq,$refverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref 9.6 - rank=-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                  <xsl:text> err-char--mid-9-6</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 30 - rank=0-->
            <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                  <xsl:text> err-char--mid-30</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 38 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 40 - rank=9-->
            <xsl:if test="preceding-sibling::*[1]/@style = @style">
               <xsl:if test="preceding::text()[1] = ' '">
                  <xsl:text> err-char--pre-40</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 37 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---37</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.2.1 - rank=-->
            <xsl:if test="$curpos != 1">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 22.7 - rank=-->
            <xsl:if test="$hascoloncvref and not($hasspaceinref)">
               <xsl:if test="$refattverse != $preverse">
                  <xsl:text> err-figure-fig-mid-22-7</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.7.2 - rank=-->
            <xsl:if test="not($hascoloncvref)">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 22.6 - rank=2-->
            <xsl:if test="$hascoloncvref and not($hasspaceinref)">
               <xsl:if test="$refattchap != $prechapter">
                  <xsl:text> err-figure-fig-mid-22-6</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.6.2 - rank=2-->
            <xsl:if test="$hascoloncvref and $hasspaceinref">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 22.1 - rank=8-->
            <xsl:if test="not($graparent)">
               <xsl:text> </xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\fig </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">fig-attrib</xsl:attribute>
            <xsl:apply-templates select="@*"/>
         </xsl:element>
         <xsl:text>\fig*</xsl:text>
      </xsl:element>
   </xsl:template>
   <xsl:template match="link[@style = 'jmp']">
      <xsl:variable name="containsclickhere" select="contains(.,'Click here')"/>
      <xsl:comment> containsclickhere = <xsl:value-of select="concat($sq,$containsclickhere,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curpos" select="position()"/>
      <xsl:comment> curpos = <xsl:value-of select="concat($sq,$curpos,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="gjparent" select="parent::para[@style = 'gj']"/>
      <xsl:comment> gjparent = <xsl:value-of select="concat($sq,$gjparent,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:text>\jmp </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:text>|</xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">linkref</xsl:attribute>
            <xsl:value-of select="@link-href"/>
         </xsl:element>
         <xsl:text>\jmp*</xsl:text>
      </xsl:element>
   </xsl:template>
   <!-- char @style=sbx -->
   <xsl:template match="char[@style = 'sbx']">
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="concat($sq,$refcolonv,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="concat($sq,$strlenb4chap,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="chappos"
                    select="string-length(substring-before(translate(node()[not(self::*)],$numb,$numbsub), '#'))+1"/>
      <xsl:comment> chappos = <xsl:value-of select="concat($sq,$chappos,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasspacecref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),' #')"/>
      <xsl:comment> hasspacecref = <xsl:value-of select="concat($sq,$hasspacecref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="numbfirst"
                    select="substring(translate(.,$numb,$numbsub),1,1) = '#'"/>
      <xsl:comment> numbfirst = <xsl:value-of select="concat($sq,$numbfirst,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refchapcolon" select="substring-before(node()[not(self::*)],':')"/>
      <xsl:comment> refchapcolon = <xsl:value-of select="concat($sq,$refchapcolon,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="concat($sq,$refcolonvr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refwordschapcolon"
                    select="substring-before(substring(node()[not(self::*)],$strlenb4chap +1),':')"/>
      <xsl:comment> refwordschapcolon = <xsl:value-of select="concat($sq,$refwordschapcolon,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 8.4.3 - rank=-->
               <xsl:if test="$hascvref and not(contains($preverse,'-')) and contains(.,'–')">
                  <xsl:if test="$refcolonvr1 != $preverse">
                     <xsl:text> err-char-sbx-mid-8-4-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.4.4 - rank=-->
               <xsl:if test="$hascvref and not(contains($preverse,'-'))  and not(contains(.,'–'))">
                  <xsl:if test="$refcolonv != $preverse">
                     <xsl:text> err-char-sbx-mid-8-4-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.4.5 - rank=-->
               <xsl:if test="$hasspacecref  and $hascvref ">
                  <xsl:if test="$refwordschapcolon != $prechapter">
                     <xsl:text> err-char-sbx-mid-8-4-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.4.7 - rank=-->
               <xsl:if test="$numbfirst and $hascvref">
                  <xsl:if test="$refchapcolon != $prechapter">
                     <xsl:text> err-char-sbx-mid-8-4-7</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style= -->
   <xsl:template match="char">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tec -->
   <xsl:template match="char[@style = 'tec']">
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="concat($sq,$countpren1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren2"
                    select="count(preceding::*[@style = 'n2'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren2 = <xsl:value-of select="concat($sq,$countpren2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="concat($sq,$countpres5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="concat($sq,$countpresibnode,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpretec" select="count(preceding-sibling::*[@style = 'tec'])"/>
      <xsl:comment> countpretec = <xsl:value-of select="concat($sq,$countpretec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasellipsis" select="contains(node()[not(self::*)],'…')"/>
      <xsl:comment> hasellipsis = <xsl:value-of select="concat($sq,$hasellipsis,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:comment> lastchar = <xsl:value-of select="concat($sq,$lastchar,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="lastchar2" select="substring(.,string-length(.) - 1,1)"/>
      <xsl:comment> lastchar2 = <xsl:value-of select="concat($sq,$lastchar2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postellipsisstring"
                    select="normalize-space(concat(' ',substring-after(translate(node()[not(self::*)],':',''),'…'),' '))"/>
      <xsl:comment> postellipsisstring = <xsl:value-of select="concat($sq,$postellipsisstring,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preellipsisstring"
                    select="normalize-space(concat(' ',substring-before(node()[not(self::*)],'…'),' '))"/>
      <xsl:comment> preellipsisstring = <xsl:value-of select="concat($sq,$preellipsisstring,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 10.2.1 - rank=-->
               <xsl:if test="$countpresibnode &gt; 0">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 11.1 - rank=-->
               <xsl:if test="translate(substring(.,1,1),$invalidtecfirstpunc,'%%') = '%'">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 20.3 - rank=-->
               <xsl:if test="*[@style = 'f']">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 10.32 - rank=3-->
               <xsl:if test="not($lastchar = ':')">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 10.2.3 - rank=5-->
               <xsl:if test="$countpretec &gt; 0">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 10.31 - rank=5-->
               <xsl:if test="$lastchar = ' '">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=trs -->
   <xsl:template match="char[@style = 'trs']">
      <xsl:variable name="ellipsiscount"
                    select="string-length(.)-string-length(translate(.,'…',''))"/>
      <xsl:comment> ellipsiscount = <xsl:value-of select="concat($sq,$ellipsiscount,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pretec" select="concat(' ',preceding::*[@style = 'tec'][1])"/>
      <xsl:comment> pretec = <xsl:value-of select="concat($sq,$pretec,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="split2ellipsisstring1" select="substring-before(.,'…')"/>
      <xsl:comment> split2ellipsisstring1 = <xsl:value-of select="concat($sq,$split2ellipsisstring1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="split2ellipsisstring2" select="substring-after(.,'…')"/>
      <xsl:comment> split2ellipsisstring2 = <xsl:value-of select="concat($sq,$split2ellipsisstring2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tecstringposttrs" select="substring-after($pretec,.)"/>
      <xsl:comment> tecstringposttrs = <xsl:value-of select="concat($sq,$tecstringposttrs,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="tecstringpretrs" select="substring-before($pretec,.)"/>
      <xsl:comment> tecstringpretrs = <xsl:value-of select="concat($sq,$tecstringpretrs,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="split3ellipsisstring2"
                    select="substring-before($split2ellipsisstring2,'…')"/>
      <xsl:comment> split3ellipsisstring2 = <xsl:value-of select="concat($sq,$split3ellipsisstring2,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="split3ellipsisstring3"
                    select="substring-after($split2ellipsisstring2,'…')"/>
      <xsl:comment> split3ellipsisstring3 = <xsl:value-of select="concat($sq,$split3ellipsisstring3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="split4ellipsisstring3"
                    select="substring-before($split3ellipsisstring3,'…')"/>
      <xsl:comment> split4ellipsisstring3 = <xsl:value-of select="concat($sq,$split4ellipsisstring3,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="split4ellipsisstring4"
                    select="substring-after($split3ellipsisstring3,'…')"/>
      <xsl:comment> split4ellipsisstring4 = <xsl:value-of select="concat($sq,$split4ellipsisstring4,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="ancestor" select="ancestor::*/@style "/>
      <xsl:comment> ancestor = <xsl:value-of select="concat($sq,$ancestor,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="concat($sq,$countpren1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="concat($sq,$countpres5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="curspfield" select="concat(' ',.)"/>
      <xsl:comment> curspfield = <xsl:value-of select="concat($sq,$curspfield,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parent" select="parent::*/@style"/>
      <xsl:comment> parent = <xsl:value-of select="concat($sq,$parent,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="teccharposttrs"
                    select="translate(substring($tecstringposttrs,1, 1),$letulc,$letulcsub)"/>
      <xsl:comment> teccharposttrs = <xsl:value-of select="concat($sq,$teccharposttrs,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="teccharpretrs"
                    select="translate(substring($tecstringpretrs,string-length($tecstringpretrs), 1),$letulc,$letulcsub)"/>
      <xsl:comment> teccharpretrs = <xsl:value-of select="concat($sq,$teccharpretrs,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 10.4 - rank=-->
               <xsl:if test="not(preceding-sibling::*[@style = 'tec']) ">
                  <xsl:if test="not($ancestor= 'f' or $parent = 'n2' or $parent = 'li1' or $parent = 'hb1')">
                     <xsl:text> err-char-trs-mid-10-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.6 - rank=-->
               <xsl:if test="$ellipsiscount = 0 and not(contains($pretec,.))">
                  <xsl:if test="not(contains($pretec,$curspfield) and $teccharposttrs = '$') or  not($teccharpretrs = '$' or $teccharposttrs = '$') ">
                     <xsl:text> err-char-trs-mid-10-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.6.2 - rank=-->
               <xsl:if test="$ellipsiscount = 1">
                  <xsl:if test="not(contains($pretec,$split2ellipsisstring1) and contains($pretec,$split2ellipsisstring2))">
                     <xsl:text> err-char-trs-mid-10-6-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.6.3 - rank=-->
               <xsl:if test="$ellipsiscount = 2">
                  <xsl:if test="not(contains($pretec,$split2ellipsisstring1) and contains($pretec,$split3ellipsisstring2) and contains($pretec,$split3ellipsisstring3))">
                     <xsl:text> err-char-trs-mid-10-6-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.6.4 - rank=-->
               <xsl:if test="$ellipsiscount = 3">
                  <xsl:if test="not(contains($pretec,$split2ellipsisstring1) and contains($pretec,$split3ellipsisstring2) and contains($pretec,$split4ellipsisstring3) and contains($pretec,$split4ellipsisstring4))">
                     <xsl:text> err-char-trs-mid-10-6-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tei -->
   <xsl:template match="char[@style = 'tei']">
      <xsl:variable name="ancestor" select="ancestor::*/@style "/>
      <xsl:comment> ancestor = <xsl:value-of select="concat($sq,$ancestor,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="concat($sq,$countpren1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="concat($sq,$countpres5,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parent" select="parent::*/@style"/>
      <xsl:comment> parent = <xsl:value-of select="concat($sq,$parent,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpresib" select="parent::*/preceding-sibling::*[1]/@style"/>
      <xsl:comment> parentpresib = <xsl:value-of select="concat($sq,$parentpresib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpresibpos" select="count(parent::*/preceding-sibling::*)"/>
      <xsl:comment> parentpresibpos = <xsl:value-of select="concat($sq,$parentpresibpos,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]"/>
      <xsl:comment> pren1tec = <xsl:value-of select="concat($sq,$pren1tec,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 10.5 - rank=-->
               <xsl:if test="$countpren1 &gt; $countpres5 or $parentpresibpos &gt; $countpres5 ">
                  <xsl:if test="contains($pren1tec,text()) and not($ancestor = 'p') and not($ancestor = 'f') and not($ancestor = 'qp') and not($ancestor = 'q1tn') and not($ancestor = 'q2tn') and not($ancestor = 'qns') and not($ancestor = 'b3')">
                     <xsl:text> err-char-tei-mid-10-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=fr -->
   <xsl:template match="char[@style = 'fr']">
      <xsl:variable name="hasbadcvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#.#')"/>
      <xsl:comment> hasbadcvref = <xsl:value-of select="concat($sq,$hasbadcvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 15.7 - rank=-->
               <xsl:if test="$hascvref or $hasbadcvref">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tbb -->
   <xsl:template match="char[@style = 'tbb']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 17.1.1 - rank=-->
               <xsl:if test="not(text() = '__')">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 17.2 - rank=5-->
               <xsl:if test="substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1) = ' '">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 17.3 - rank=10-->
               <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=ord -->
   <xsl:template match="char[@style = 'ord']">
      <xsl:variable name="precedingtext" select="preceding::text()[1]"/>
      <xsl:comment> precedingtext = <xsl:value-of select="concat($sq,$precedingtext,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="lenpretext" select="string-length($precedingtext)"/>
      <xsl:comment> lenpretext = <xsl:value-of select="concat($sq,$lenpretext,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="precedingchar" select="substring($precedingtext,$lenpretext,1) "/>
      <xsl:comment> precedingchar = <xsl:value-of select="concat($sq,$precedingchar,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preceding2char"
                    select="substring($precedingtext,$lenpretext - 1,2) "/>
      <xsl:comment> preceding2char = <xsl:value-of select="concat($sq,$preceding2char,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 31 - rank=0-->
               <xsl:if test="not(text() = 'st' or text() = 'nd' or text() = 'rd' or text() = 'th')">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 31.2 - rank=3-->
               <xsl:if test="text() = 'st'">
                  <xsl:if test="not($preceding2char = ' 1')">
                     <xsl:text> err-char-ord-mid-31-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 31.3 - rank=3-->
               <xsl:if test="text() = 'nd'">
                  <xsl:if test="not($preceding2char = ' 2')">
                     <xsl:text> err-char-ord-mid-31-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 31.4 - rank=3-->
               <xsl:if test="text() = 'rd'">
                  <xsl:if test="not($preceding2char = ' 3')">
                     <xsl:text> err-char-ord-mid-31-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=brk -->
   <xsl:template match="char[@style = 'brk']">
      <xsl:variable name="postsibnode1" select="following-sibling::node()[1]"/>
      <xsl:comment> postsibnode1 = <xsl:value-of select="concat($sq,$postsibnode1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presibnode1" select="preceding-sibling::node()[1]"/>
      <xsl:comment> presibnode1 = <xsl:value-of select="concat($sq,$presibnode1,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 32 - rank=0-->
               <xsl:if test="contains(text(),'⌊') and position() &gt; 1 and not(preceding-sibling::node()[1][@style = 'tbb']) and not(substring(following-sibling::char[1][@style = 'imp'],1,1) = '’')">
                  <xsl:if test="not(translate(substring($presibnode1,string-length($presibnode1),1),'+ “/(‘','_+++++') = '+')">
                     <xsl:text> err-char-brk-pre-32</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 34 - rank=5-->
               <xsl:if test="string-length(text()) != 1">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 39 - rank=5-->
               <xsl:if test="contains(text(),'⌋') and not(position() = last()) and not(parent::cell)">
                  <xsl:if test="not(translate(substring($postsibnode1,1,1),'+ ,.?!:;”’)','_++++++++++') = '+')">
                     <xsl:text> err-char-brk-post-39</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 33 - rank=8-->
               <xsl:if test="contains(text(),'⌋') and not(parent::*[@style = 'ros'])">
                  <xsl:if test="not(preceding-sibling::node()[1][@style = 'rem' or @style = 'imp' or @style = 'rgi' or @style = 'rgm'])">
                     <xsl:text> err-char-brk-pre-33</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=rgi -->
   <xsl:template match="char[@style = 'rgi']">
      <xsl:variable name="presibnode1" select="preceding-sibling::node()[1]"/>
      <xsl:comment> presibnode1 = <xsl:value-of select="concat($sq,$presibnode1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presibtext1" select="preceding-sibling::text()[1]"/>
      <xsl:comment> presibtext1 = <xsl:value-of select="concat($sq,$presibtext1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsibnode1" select="following-sibling::node()[1]"/>
      <xsl:comment> postsibnode1 = <xsl:value-of select="concat($sq,$postsibnode1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsibtext1" select="following-sibling::text()[1]"/>
      <xsl:comment> postsibtext1 = <xsl:value-of select="concat($sq,$postsibtext1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pretextlastchar"
                    select="substring($presibtext1,string-length($presibtext1),1)"/>
      <xsl:comment> pretextlastchar = <xsl:value-of select="concat($sq,$pretextlastchar,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postchar1" select="substring($postsibtext1,1,1)"/>
      <xsl:comment> postchar1 = <xsl:value-of select="concat($sq,$postchar1,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 28.1 - rank=1-->
               <xsl:if test="$presibnode1 = $presibtext1">
                  <xsl:if test="translate($pretextlastchar,' ,.?!):”’','#########') = '#'">
                     <xsl:text> err-char-rgi-pre-28-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 28.3 - rank=2-->
               <xsl:if test="$postsibnode1 = $postsibtext1">
                  <xsl:if test="translate($postchar1,$letulc,$letulcsub) = '$'">
                     <xsl:text> err-char-rgi-post-28-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 28.4 - rank=5-->
               <xsl:if test="not(parent::*[@style = 'imp'] or preceding-sibling::*[1][@style = 'imp'])">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=rgm -->
   <xsl:template match="char[@style = 'rgm']">
      <xsl:variable name="presibnode1" select="preceding-sibling::node()[1]"/>
      <xsl:comment> presibnode1 = <xsl:value-of select="concat($sq,$presibnode1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presibtext1" select="preceding-sibling::text()[1]"/>
      <xsl:comment> presibtext1 = <xsl:value-of select="concat($sq,$presibtext1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsibnode1" select="following-sibling::node()[1]"/>
      <xsl:comment> postsibnode1 = <xsl:value-of select="concat($sq,$postsibnode1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postsibtext1" select="following-sibling::text()[1]"/>
      <xsl:comment> postsibtext1 = <xsl:value-of select="concat($sq,$postsibtext1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pretextlastchar"
                    select="substring($presibtext1,string-length($presibtext1),1)"/>
      <xsl:comment> pretextlastchar = <xsl:value-of select="concat($sq,$pretextlastchar,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postchar1" select="substring($postsibtext1,1,1)"/>
      <xsl:comment> postchar1 = <xsl:value-of select="concat($sq,$postchar1,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 28.2 - rank=1-->
               <xsl:if test="$presibnode1 = $presibtext1">
                  <xsl:if test="translate($pretextlastchar,' ,.?!):”’','#########') = '#'">
                     <xsl:text> err-char-rgm-pre-28-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 28.5 - rank=2-->
               <xsl:if test="$postsibnode1 = $postsibtext1">
                  <xsl:if test="translate($postchar1,$letulc,$letulcsub) = '$'">
                     <xsl:text> err-char-rgm-post-28-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=ros -->
   <xsl:template match="char[@style = 'ros']">
      <xsl:variable name="posttext" select="following::text()[1]"/>
      <xsl:comment> posttext = <xsl:value-of select="concat($sq,$posttext,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="postnodechar1" select="substring($posttext,1,1)"/>
      <xsl:comment> postnodechar1 = <xsl:value-of select="concat($sq,$postnodechar1,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 29 - rank=5-->
               <xsl:if test="not(substring(node()[last()],string-length(text()[last()]),1) = ' ' ) or $postnodechar1 = ' '">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tre -->
   <xsl:template match="char[@style = 'tre']">
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:comment> lastchar = <xsl:value-of select="concat($sq,$lastchar,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 30.2 - rank=5-->
               <xsl:if test="$lastchar = ' '">
                  <xsl:if test="not(following-sibling::node()[1]/@style = 'teu')">
                     <xsl:text> err-char-tre-mid-30-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=teu -->
   <xsl:template match="char[@style = 'teu']">
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:comment> lastchar = <xsl:value-of select="concat($sq,$lastchar,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 30.3 - rank=5-->
               <xsl:if test="$lastchar = ' '">
                  <xsl:if test="not(following-sibling::node()[1]/@style = 'tre')">
                     <xsl:text> err-char-teu-mid-30-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=imp -->
   <xsl:template match="char[@style = 'imp']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 35 - rank=5-->
               <xsl:if test="not(following-sibling::node()[1][@style = 'rem' or @style = 'brk' or @style = 'rgi' or @style = 'rgm'])">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 36 - rank=8-->
               <xsl:if test="not(preceding-sibling::node()[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 9.6 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=0-->
               <xsl:if test="not(@style = 'ros' or @style = 'teu' or @style = 'tre' or @closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char--mid-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 38 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 26.2 - rank=5-->
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> </xsl:text>
               </xsl:if>
               <!--ref 40 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 37 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---37</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- cell @style=tc1 -->
   <xsl:template match="cell[@style = 'tc1']">
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="concat($sq,$refcolonv,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="concat($sq,$strlenb4chap,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="chappos"
                    select="string-length(substring-before(translate(node()[not(self::*)],$numb,$numbsub), '#'))+1"/>
      <xsl:comment> chappos = <xsl:value-of select="concat($sq,$chappos,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="containsparagraph" select="contains(.,'Paragraph')"/>
      <xsl:comment> containsparagraph = <xsl:value-of select="concat($sq,$containsparagraph,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countprenode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countprenode = <xsl:value-of select="concat($sq,$countprenode,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countsbx" select="count(*[@style = 'sbx'])"/>
      <xsl:comment> countsbx = <xsl:value-of select="concat($sq,$countsbx,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="counttbb" select="count(*[@style = 'tbb'])"/>
      <xsl:comment> counttbb = <xsl:value-of select="concat($sq,$counttbb,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hasspacecref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),' #')"/>
      <xsl:comment> hasspacecref = <xsl:value-of select="concat($sq,$hasspacecref,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="notmultirowtable"
                    select="not(parent::*[@style = 'tr']/preceding-sibling::*[@style = 'tr']) or not(parent::*[@style = 'tr']/following-sibling::*[@style = 'tr'])"/>
      <xsl:comment> notmultirowtable = <xsl:value-of select="concat($sq,$notmultirowtable,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="notsbxchild" select="not(child::*[@style = 'sbx'])"/>
      <xsl:comment> notsbxchild = <xsl:value-of select="concat($sq,$notsbxchild,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="numbfirst"
                    select="substring(translate(.,$numb,$numbsub),1,1) = '#'"/>
      <xsl:comment> numbfirst = <xsl:value-of select="concat($sq,$numbfirst,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="pos" select="pos"/>
      <xsl:comment> pos = <xsl:value-of select="concat($sq,$pos,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refchapcolon" select="substring-before(node()[not(self::*)],':')"/>
      <xsl:comment> refchapcolon = <xsl:value-of select="concat($sq,$refchapcolon,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvnumb"
                    select="translate(substring-after(text(),':'),$validvlet,'')"/>
      <xsl:comment> refcolonvnumb = <xsl:value-of select="concat($sq,$refcolonvnumb,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="concat($sq,$refcolonvr1,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="refwordschapcolon"
                    select="substring-before(substring(node()[not(self::*)],$strlenb4chap +1),':')"/>
      <xsl:comment> refwordschapcolon = <xsl:value-of select="concat($sq,$refwordschapcolon,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref 4.4 - rank=-->
            <xsl:if test="count(following-sibling::cell) = 0 and @style = 'tc1'">
               <xsl:if test="not(*[@style = 'sbx'] or contains(text(),'Paragraph'))">
                  <xsl:text> err-cell-tc1-mid-4-4</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.7 - rank=-->
            <xsl:if test="$countsbx &gt; 1">
               <xsl:if test="$counttbb + 1 != $countsbx">
                  <xsl:text> err-cell-tc1-mid-4-7</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.8 - rank=-->
            <xsl:if test="$countsbx = 1">
               <xsl:if test="count(*/*[@style = '+tbb']) = 0 and $counttbb = 0">
                  <xsl:text> err-cell-tc1-mid-4-8</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.1 - rank=-->
            <xsl:if test="$hasspacecref and $hascvref and not(contains($preverse,'-')) and contains(.,'–') and $notsbxchild">
               <xsl:if test="$refcolonvr1 != $preverse">
                  <xsl:text> err-cell-tc1-mid-8-4-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.2 - rank=-->
            <xsl:if test="$hascvref and not(contains($preverse,'-'))  and not(contains(.,'–')) and $containsparagraph">
               <xsl:if test="$refcolonvnumb != $preverse">
                  <xsl:text> err-cell-tc1-mid-8-4-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.6 - rank=-->
            <xsl:if test="$hasspacecref and $hascvref ">
               <xsl:if test="$refwordschapcolon != $prechapter">
                  <xsl:text> err-cell-tc1-mid-8-4-6</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.8 - rank=-->
            <xsl:if test="$numbfirst and $hascvref and $notmultirowtable and $containsparagraph">
               <xsl:if test="$refchapcolon != $prechapter">
                  <xsl:text> err-cell-tc1-mid-8-4-8</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.9 - rank=5-->
            <xsl:if test="$countprenode &gt; 1">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--common cell errors-->
            <!--ref 9.5 - rank=-->
            <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                  <xsl:text> err-cell--mid-9-5</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 26.3 - rank=-->
            <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
               <xsl:text> </xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- cell @style= -->
   <xsl:template match="cell">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref 9.5 - rank=-->
            <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                  <xsl:text> err-cell--mid-9-5</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 26.3 - rank=-->
            <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
               <xsl:text> </xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- row @style=tr -->
   <xsl:template match="row[@style = 'tr']">
      <xsl:variable name="containsdivision" select="contains(.,'Division')"/>
      <xsl:comment> containsdivision = <xsl:value-of select="concat($sq,$containsdivision,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="containspart" select="contains(.,'Part')"/>
      <xsl:comment> containspart = <xsl:value-of select="concat($sq,$containspart,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="containssection" select="contains(.,'Section')"/>
      <xsl:comment> containssection = <xsl:value-of select="concat($sq,$containssection,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="countpretable" select="count(parent::*/preceding-sibling::table)"/>
      <xsl:comment> countpretable = <xsl:value-of select="concat($sq,$countpretable,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrdivision"
                    select="contains(*[1]/*[1]/text(),'Division') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrdivision = <xsl:value-of select="concat($sq,$hastrdivision,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrparagraph"
                    select="contains(*[1]/text(),'Paragraph') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrparagraph = <xsl:value-of select="concat($sq,$hastrparagraph,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrpart"
                    select="contains(*[1]/*[1]/text(),'Part') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrpart = <xsl:value-of select="concat($sq,$hastrpart,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="hastrsection"
                    select="contains(*[1]/*[1]/text(),'Section') and count(following-sibling::*) = 0"/>
      <xsl:comment> hastrsection = <xsl:value-of select="concat($sq,$hastrsection,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpostsib" select="parent::*/following-sibling::*[1]/@style"/>
      <xsl:comment> parentpostsib = <xsl:value-of select="concat($sq,$parentpostsib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpresib" select="parent::*/preceding-sibling::*[1]/@style"/>
      <xsl:comment> parentpresib = <xsl:value-of select="concat($sq,$parentpresib,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="parentpresib2" select="parent::*/preceding-sibling::*[2]/@style"/>
      <xsl:comment> parentpresib2 = <xsl:value-of select="concat($sq,$parentpresib2,$sq,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref 4.2 - rank=-->
            <xsl:if test="cell[2]/@style = 'tc1'">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 4.3 - rank=-->
            <xsl:if test="cell[1]/@style = 'tc2'">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 6.8 - rank=-->
            <xsl:if test="$containspart or $containsdivision or $containssection">
               <xsl:if test="not($parentpostsib = 'ntn')">
                  <xsl:text> err-row-tr-post-6-8</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse[@style = 'v']">
      <xsl:variable name="parent" select="parent::*/@style"/>
      <xsl:comment> parent = <xsl:value-of select="concat($sq,$parent,$sq,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.2 - rank=-->
            <xsl:if test="contains(@number,'–')">
               <xsl:text> </xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$-#') or contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$')">
               <xsl:text> </xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ',@number,' ')"/>
      </xsl:element>
      <xsl:element name="verse">
         <xsl:attribute name="number">
            <xsl:value-of select="@number"/>
         </xsl:attribute>
         <xsl:attribute name="style">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>

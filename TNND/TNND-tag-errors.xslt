<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:variable name="sq">'</xsl:variable>
   <xsl:variable name="numb">1234567890</xsl:variable>
   <xsl:variable name="numbsub">##########</xsl:variable>
   <xsl:variable name="validvlet">abcdefghij</xsl:variable>
   <xsl:variable name="validvletpunc">abcdefghij–</xsl:variable>
   <xsl:variable name="validvletsub">$$$$$$$$$$</xsl:variable>
   <xsl:variable name="invalidvlet">klmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="validcvnumblet">1234567890abcdefghij</xsl:variable>
   <xsl:variable name="validcvnumbletsub">##########$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validcvnumbletpunc">1234567890abcdefghij–:</xsl:variable>
   <xsl:variable name="letlc">abcdefghijklmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="letuc">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
   <xsl:variable name="letsub">$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="letulc">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="invalidtecendpunc">.,’”</xsl:variable>
   <xsl:variable name="invalidtecendpuncsub">%%%%</xsl:variable>
   <xsl:variable name="invalidtecfirstpunc">‘“</xsl:variable>
   <xsl:variable name="dq">"</xsl:variable>
   <xsl:template match="chapter[@number]">
      <xsl:if test="count(preceding::chapter[@number]) = 0">
         <xsl:call-template name="style"/>
      </xsl:if>
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
			.usx {line-height:1.8;}
                .mt, .mt2, .mt3, .mt3n, .mt4, .mt4n, .mt5, .mt6, .mt7, .mt8, .mt9, .mt10 {text-align:center}
                .sl1 {border-left:10pt solid green;padding-left:3pt;font-size:120%}
                .sla, .pvr {border-left:10pt solid orange;padding-left:3pt;font-size:120%}
                .ml1 {border-left:20pt solid lightblue;padding-left:3pt;padding-left:1em}
                .mlor {border-left:30pt solid yellow;padding-left:3pt;padding-left:1em}
                 
                
                ::after {background:thistle;padding-left:4pt;color:black;font-weight:normal;}
                .s5 {background:lightcyan;}
                .v {background:navy;color:white;font-weight:bold;}
		    .c {font-size:140%;background:green;color:white;font-weight:bold;}
			.rem {background:lightgreen;color:darkgreen;}
			.table {border:2pt solid purple;border-left:10pt solid purple;width:auto;}
                  .tec {font-weight:bold;}
			
                .err-table--pre-7-2 {background:peachpuff;border-top:2pt solid red;}
.err-table--pre-7-2::after {content:'A \\b must precede a \\p or \\b3 paragraph and a Division Box, except at v.1. #7.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--pre-7-3 {background:peachpuff;border-top:2pt solid red;}
.err-table--pre-7-3::after {content:'A \\b must precede a \\p or \\b3 paragraph and a Section Box, except at v.1. #7.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--pre-7-4 {background:peachpuff;border-top:2pt solid red;}
.err-table--pre-7-4::after {content:'A \\b must precede a \\p or \\b3 paragraph and a Part Box, except at v.1. #7.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--pre-7-5 {background:peachpuff;border-top:2pt solid red;}
.err-table--pre-7-5::after {content:'A \\b must precede a \\p \\v and a Paragraph Box, except for verse 1. #7.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--post-7-6 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-7-6::after {content:'A \\s5 must follow a \\tr \\tc1 Division if there is no Section Box below it. #7.6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--post-7-7 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-7-7::after {content:'A \\s5 paragraph must follow a \\tr \\tc1 Section if there is no Paragraph Box below it. #7.7';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--post-7-8 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-7-8::after {content:'A \\s5 paragraph must follow a \\tr \\tc1 Part if there is no Division Box below it. #7.8';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-table--post-7-9 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-7-9::after {content:'A \\tr Paragraph Box needs a \\s5, \\tr, or \\ntn after it. #7.9';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-1::after {content:'The chapter number in this \\s5 should match the current chapter number. #8.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-21 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-21::after {content:'The verse number in this \\s5 should match the current verse number. #8.21';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-21-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-21-2::after {content:'The verse number in this \\s5 should match the current verse number. #8.21.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-23 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-23::after {content:'The first verse number in the range in this \\s5 should match the first number of current verse range. #8.23';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-26 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-26::after {content:'The verse number in this \\s5 must be within the current verse range. #8.26';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-3::after {content:'This \\s5 reference has invalid character(s) (Numbers, colon, en dash, and letters a–j allowed). #8.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-22 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-22::after {content:'The first verse number in the range in this \\s5 should match current verse number. #8.22';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s5-mid-8-25 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s5-mid-8-25::after {content:'This \\s5 must contain a colon between the chapter and verse. #8.25';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-9-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-9-1::after {content:'The hyphen in a verse range in this paragraph should be an en dash. #9.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-23-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-23-1::after {content:'This paragraph type should not be empty. #23.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-26-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-26-1::after {content:'This paragraph contains a straight quote mark. It should be a curly quote mark. #26.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-qp-pre-14-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-qp-pre-14-2::after {content:'Two \\qp paragraphs, one after the other, are not allowed, unless it is one example with two paragraphs #14.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ntn-pre-18-1 {background:peachpuff;border-top:2pt solid red;}
.err-para-ntn-pre-18-1::after {content:'An \\ntn should be preceeded by a \\s3, \\s5, \\tr, \\ntn, \\qp, or \\qns. #18.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ntn-mid-24-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ntn-mid-24-1::after {content:'An \\ntn should not contain a \\tec. #24.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gj-mid-22-9 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gj-mid-22-9::after {content:'This \\gj paragraph is missing a jump link ( \\jmp). #22.9';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gj-mid-22-9-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gj-mid-22-9-1::after {content:'This \\gj paragraph should contain only one \\jmp item, and no other text or markup. #22.9.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gj-pre-22-9-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-gj-pre-22-9-2::after {content:'The paragraph preceding this \\gj paragraph is not a \\gra paragraph. #22.9.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b2-pre-23-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-b2-pre-23-2::after {content:'A \\b2 should not precede a \\b. #23.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b2-mid-23-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b2-mid-23-4::after {content:'A \\b2 paragraph should be empty. #23.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-post-23-3 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b-post-23-3::after {content:'A \\b2 should not follow a \\b. #23.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-mid-23-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b-mid-23-5::after {content:'A \\b paragraph should be empty. #23.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-mid-12-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n1-mid-12-1::after {content:'The contents of this \\n1 \\tec is a portion of the previous \\n1 \\tec. Perhaps this should be an \\n2? #12.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-post-14-1 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-n1-post-14-1::after {content:'Only these paragraphs: \\n1 \\n2 \\n3 \\ntn \\qp \\b \\b2 \\b3 \\p \\s5 \\li1 \\hb1 \\s3 \\gra and \\c are allowed after a \\n1 #14.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-mid-10-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n1-mid-10-1::after {content:'There should be only one \\tec per \\n1 paragraph. #10.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n1-mid-10-1-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n1-mid-10-1-4::after {content:'This paragraph is missing a \\tec ...\\tec* or \\teu #10.1.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-pre-12-8-1 {background:peachpuff;border-top:2pt solid red;}
.err-para-n2-pre-12-8-1::after {content:'There is no \\n1 preceding this \\n2. It should be an \\n1. #12.8.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-10-1-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-10-1-2::after {content:'There not should be two or more \\tec in a \\n2 paragraph. #10.1.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7::after {content:'The contents of this \\n2 \\tec is not found in the preceding  \\n1 \\tec. #12.7';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-7-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-7-1::after {content:'The contents of this \\n2 \\tec is not found in the preceding  \\n1 \\tec. #12.7.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n2-mid-12-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n2-mid-12-2::after {content:'The contents of this \\n2 \\tec is a portion of the previous \\n2 \\tec. Perhaps this should be an \\n3? #12.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-10-1-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-10-1-3::after {content:'There should be only one \\tec per \\n3 paragraph. #10.1.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-10-1-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-10-1-5::after {content:'This paragraph is missing a \\tec ...\\tec* #10.1.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-10-2-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-10-2-2::after {content:'There should be text in \\tec formatting at the beginning of this paragraph #10.2.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-12-6 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-12-6::after {content:'The contents of this \\n3 \\tec is not found in the preceding  \\n2 or preceding \\n1 \\tec. #12.6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-mid-12-6-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-n3-mid-12-6-1::after {content:'The contents of this \\n3 \\tec is not found in the preceding  \\n2 or preceding \\n1 \\tec. #12.6.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-n3-pre-12-8-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-n3-pre-12-8-2::after {content:'The \\n3 occurs before any \\n2 in this \\s5 note group #12.8.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-4::after {content:'The verse number in this \\s3 does not match the preceding \\v number. #19.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-4-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-4-1::after {content:'The verse number in this \\s3 does not match the preceding \\v number. #19.4.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-5::after {content:'The verse number in this \\s3 does not match the preceding \\v number. #19.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-6 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-6::after {content:'The last verse number in the range in this \\s3 does not match the preceding \\v number. #19.6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-8::after {content:'An \\s3 can only be followed by an \\ntn #19.8';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-3::after {content:'The chapter number in this \\s3 does not match the preceding \\c number. #19.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-7 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-7::after {content:'The ending verse part does not match the previous \\s5 verse part. #19.7';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-1::after {content:'An \\s3 paragraph always starts with `General Comment on` #19.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-s3-mid-19-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-s3-mid-19-2::after {content:'This paragraph is missing a valid chapter verse reference, or the colon is missing. #19.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-pre-7-1-1 {background:peachpuff;border-top:2pt solid red;}
.err-para-b3-pre-7-1-1::after {content:'A \\b para should not precede a \\b3 paragraph at the start of a chapter. #7.1.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-post-7-1-3 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b3-post-7-1-3::after {content:'A \\b should not follow a \\b3. #7.1.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-pre-7-10-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-b3-pre-7-10-2::after {content:'When \\tr follows \\b3 then a \\b should precede it (except @ v.1). #7.10.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-mid-1-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b3-mid-1-1::after {content:'A \\b3 paragraph must contain a \\v. #1.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-7-1-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-7-1-2::after {content:'A \\b para should not precede a \\p paragraph at the start of a chapter. #7.1.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-7-1-4 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-7-1-4::after {content:'A \\b should not follow a \\p. #7.1.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-7-10-1 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-7-10-1::after {content:'When \\tr follows \\p then a \\b should precede it (except @ v.1). #7.10.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-mid-1-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-p-mid-1-2::after {content:'A \\p paragraph must contain a \\v. #1.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gra-mid-22-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gra-mid-22-8::after {content:'This \\gra paragraph is missing the copyright footnote (\\f). #22.8';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gra-mid-22-10- {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gra-mid-22-10-::after {content:'This \\gra paragraph is missing a \\fig. #22.10.';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gra-mid-22-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-gra-mid-22-2::after {content:'This \\gra has all the required elements of \\fig, and a footnote but also has some other markup, extra spaces or text. #22.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-pre-22-3 {background:orange;border-left:4pt solid red;}
.err-note-f-pre-22-3::after {content:'The sequence should be \\fig...\\fig*\\f...\\f*. Note no space after \\fig*. #22.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-pre-22-5 {background:orange;border-left:4pt solid red;}
.err-note-f-pre-22-5::after {content:'The caller for the \\f must be * #22.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-pre-22-2-1 {background:orange;border-left:4pt solid red;}
.err-figure-fig-pre-22-2-1::after {content:'The \\fig must be the first item in a \\gra paragraph #22.2.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-7-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-7-2::after {content:'The referenced verse number for the \\fig does not match the preceding \\v number. #22.7';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-8 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-8::after {content:'The reference should be in the form C:V, chapter number, then colon, then verse number. No book code. #22.7.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-6 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-6::after {content:'The referenced chapter number for the \\fig does not match the preceding \\c number. #22.6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-mid-22-6-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-figure-fig-mid-22-6-2::after {content:'The reference in this \\fig should not contain a book code. #22.6.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-figure-fig-pre-22-1 {background:orange;border-left:4pt solid red;}
.err-figure-fig-pre-22-1::after {content:'This is not an \\gra paragraph. A \\fig must only occur in a \\gra paragraph #22.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-link-jmp-pre-22-4 {background:orange;border-left:4pt solid red;}
.err-link-jmp-pre-22-4::after {content:'This \\jmp should occur as the only item in \\gj paragraph, that is immediately after a \\gra paragraph. #22.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-3::after {content:'The first verse of the range in this \\sbx does not match the preceding verse number. #8.4.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-4::after {content:'The verse in this \\sbx does not match the preceding verse number. #8.4.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-5 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-5::after {content:'The chapter in this \\sbx does not match the preceding verse number. #8.4.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-8-4-7 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-8-4-7::after {content:'The chapter in this \\sbx does not match the preceding verse number. #8.4.7';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--mid-9-6 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char--mid-9-6::after {content:'The hyphen in a verse range in this paragraph should be an en dash. #9.6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--mid-26-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char--mid-26-2::after {content:'This character SFM contains a straight quote mark. It should be a curly quote mark. #26.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-10-2-1 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-10-2-1::after {content:'The \\tec ...\\tec* markup should be at the start of the paragraph. #10.2.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-11-1 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-11-1::after {content:'The first character should not be punctuation unless you are specifically talking about that punctuation #11.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-11-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-11-2::after {content:'The last character before the colon should not be punctuation unless it is a question or exclamation mark. #11.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-20-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-20-3::after {content:'A \\tec cannot contain a footnote (\\f ...\\f*). #20.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-10-32 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-10-32::after {content:'The last character of this character markup \\tec should be a colon. #10.32';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-pre-10-2-3 {background:orange;border-left:4pt solid red;}
.err-char-tec-pre-10-2-3::after {content:'This \\tec should not be here. There should be only one \\tec ...\\tec* at the start of this paragraph. #10.2.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tec-mid-10-31 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tec-mid-10-31::after {content:'The last character of this \\tec should be a colon, not a space. #10.31';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-4::after {content:'A \\tec should precede this \\trs in the paragraph. #10.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-6 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-6::after {content:'The word/phrase in this \\trs is not found in the closest preceding \\tec, or is misspelled or has wrong capitalization. #10.6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-trs-mid-10-6-1 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-trs-mid-10-6-1::after {content:'The word/phrase in this \\trs are not found in the closest preceding \\tec #10.6.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tei-mid-10-5 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tei-mid-10-5::after {content:'Any repeat of the words found in the preceding \\tec should be in \\trs not in \\tei. #10.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb--17-1-1 {background:orange;}
.err-char-tbb--17-1-1::after {content:'This \tbb __\tbb* has less than the required 2 underscore characers. #17.1.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-mid-17-1-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-tbb-mid-17-1-2::after {content:'This \tbb __\tbb* has more than 2 underscore characers. #17.1.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-pre-17-2 {background:orange;border-left:4pt solid red;}
.err-char-tbb-pre-17-2::after {content:'There should not be a space before a \tbb SFM #17.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-post-17-3 {background:orange;border-right:4pt solid red;}
.err-char-tbb-post-17-3::after {content:'There should not be a space after a \tbb* SFM #17.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-4-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-4-4::after {content:'A \\tc1 must contain either an \\sbx or the word Paragraph #4.4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-4-7 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-4-7::after {content:'These \\sbx should be separated by \\tbb ...\\tbb* #4.7';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-4-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-4-8::after {content:'The parts of the \\sbx should be separated by a \\+tbb __\\+tbb*. #4.8';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-1::after {content:'The first verse of the range in this Paragraph Box does not match the preceding verse number. #8.4.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-2::after {content:'The verse in this \\tc1 Paragraph Box does not match the preceding verse number. #8.4.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-6 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-6::after {content:'The chapter in this \\tc1 does not match the preceding verse number. #8.4.6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1-mid-8-4-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell-tc1-mid-8-4-8::after {content:'The chapter in this \\tc1 does not match the preceding verse number. #8.4.8';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1--4-9 {background:peachpuff;}
.err-cell-tc1--4-9::after {content:'A \\tc1 can only occur as the first SFM in a \\tr. #4.9';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell--mid-9-5 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell--mid-9-5::after {content:'The hyphen in a verse range in this \\tr \\tc1 should be an en dash. #9.5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell--mid-26-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell--mid-26-3::after {content:'This table cell contains a straight quote mark. It should be a curly quote mark. #26.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-td--4-2 {background:peachpuff;}
.err-row-td--4-2::after {content:'The second column must be a \\tc2 in \\tr #4.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-td--4-3 {background:peachpuff;}
.err-row-td--4-3::after {content:'The first column must be a \\tc1 in \\tr #4.3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-verse-v-mid-9-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-verse-v-mid-9-2::after {content:'The en dash in the verse range in this \\v should be a hyphen. #9.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-verse-v-mid-9-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-verse-v-mid-9-3::after {content:'A \\v cannot have verse parts in it. #9.3';border:2pt solid thistle;border-left:5pt solid tomato;}
</style>
   </xsl:template>
   <xsl:template match="table">
      <xsl:variable name="pos" select="position()"/>
      <xsl:element name="div">
         <xsl:attribute name="class">table<!--ref 7.2 - rank=--><xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Division') and not(preceding-sibling::*[2][name() = 'chapter'])">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'b3' or @style = 'b'])">
                     <xsl:text> err-table--pre-7-2</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Section') and not(preceding-sibling::*[2][name() = 'chapter'])">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'b3' or @style = 'b'])">
                     <xsl:text> err-table--pre-7-3</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7.4 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Part') and not(preceding-sibling::*[2][name() = 'chapter'])">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'b3' or @style = 'b'])">
                     <xsl:text> err-table--pre-7-4</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7.5 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/text(),'Paragraph') and not(preceding-sibling::*[2][name() = 'chapter'])">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'b3' or @style = 'b'])">
                     <xsl:text> err-table--pre-7-5</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Division') and not(following-sibling::*[1][name() = 'chapter'])">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 's5' or name() = 'table' or @style = 'ntn'])">
                     <xsl:text> err-table--post-7-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7.7 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Section') and not(following-sibling::*[1][name() = 'chapter'])">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 's5' or name() = 'table' or @style = 'ntn'])">
                     <xsl:text> err-table--post-7-7</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7.8 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Part') and not(following-sibling::*[1][name() = 'chapter'])">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 's5' or name() = 'table' or @style = 'ntn'])">
                     <xsl:text> err-table--post-7-8</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7.9 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(row[1]/cell[1]/text(),'Paragraph') ">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 's5' or name() = 'table' or @style = 'ntn'])">
                     <xsl:text> err-table--post-7-9</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=s5 -->
   <xsl:template match="para[@style = 's5']">
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="$strlenb4chap"/>
      </xsl:comment>
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="$refcolonv"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:variable name="hasvlet"
                    select="contains(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#$')"/>
      <xsl:comment> hasvlet = <xsl:value-of select="$hasvlet"/>
      </xsl:comment>
      <xsl:variable name="numbfirst"
                    select="substring(translate(.,$numb,$numbsub),1,1) = '#'"/>
      <xsl:comment> numbfirst = <xsl:value-of select="$numbfirst"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="$prechapter"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="$preverse"/>
      </xsl:comment>
      <xsl:variable name="preverser1" select="substring-before($preverse,'-')"/>
      <xsl:comment> preverser1 = <xsl:value-of select="$preverser1"/>
      </xsl:comment>
      <xsl:variable name="prevhyphen" select="contains($preverse,'-')"/>
      <xsl:comment> prevhyphen = <xsl:value-of select="$prevhyphen"/>
      </xsl:comment>
      <xsl:variable name="refchapcolon" select="substring-before(node()[not(self::*)],':')"/>
      <xsl:comment> refchapcolon = <xsl:value-of select="$refchapcolon"/>
      </xsl:comment>
      <xsl:variable name="refcolonvlet"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$letlc,$letsub),'$')"/>
      <xsl:comment> refcolonvlet = <xsl:value-of select="$refcolonvlet"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="$refcolonvr1"/>
      </xsl:comment>
      <xsl:variable name="refvendash" select="contains(node()[not(self::*)],'–')"/>
      <xsl:comment> refvendash = <xsl:value-of select="$refvendash"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 8.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$hascvref and $numbfirst ">
                     <xsl:if test="$refchapcolon != $prechapter">
                        <xsl:text> err-para-s5-mid-8-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.21 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($prevhyphen) and not($refvendash) and not($hasvlet)">
                     <xsl:if test="$refcolonv != $preverse">
                        <xsl:text> err-para-s5-mid-8-21</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.21.2 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($prevhyphen) and not($refvendash) and $hasvlet">
                     <xsl:if test="$refcolonvlet != $preverse">
                        <xsl:text> err-para-s5-mid-8-21-2</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.23 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$prevhyphen and $refvendash">
                     <xsl:if test="$refcolonvr1 != $preverser1">
                        <xsl:text> err-para-s5-mid-8-23</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.26 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains($preverse,'-') and not(contains(.,'–'))">
                     <xsl:if test="not((translate(substring-after(.,':'),$letlc,'') = substring-before($preverse,'-') or  translate(substring-after(.,':'),$letlc,'') &gt; substring-before($preverse,'-')) and ( translate(substring-after(.,':'),$letlc,'') = substring-after($preverse,'-') )or  translate(substring-after(.,':'),$letlc,'') &lt; substring-after($preverse,'-') )">
                        <xsl:text> err-para-s5-mid-8-26</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.3 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(translate(.,$validcvnumbletpunc,'')) &gt; 0">
                     <xsl:text> err-para-s5-mid-8-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.22 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($prevhyphen) and $refvendash and not($hasvlet)">
                     <xsl:if test="$refcolonvr1 != $preverse">
                        <xsl:text> err-para-s5-mid-8-22</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 8.25 - rank=10-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(contains(.,':'))">
                     <xsl:text> err-para-s5-mid-8-25</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style= -->
   <xsl:template match="para">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=qp -->
   <xsl:template match="para[@style = 'qp']">
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 14.2 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="preceding-sibling::*[1][@style = 'qp']">
                     <xsl:text> err-para-qp-pre-14-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=ntn -->
   <xsl:template match="para[@style = 'ntn']">
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 18.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 's3' or @style = 's5' or @style = 'ntn' or name() = 'table' or @style = 'ntn' or @style = 'qp' or @style = 'qns'])">
                     <xsl:text> err-para-ntn-pre-18-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 24.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="char[@style = 'tec']">
                     <xsl:text> err-para-ntn-mid-24-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=gj -->
   <xsl:template match="para[@style = 'gj']">
      <xsl:variable name="countjmp" select="count(*[@style = 'jmp'])"/>
      <xsl:comment> countjmp = <xsl:value-of select="$countjmp"/>
      </xsl:comment>
      <xsl:variable name="countnode" select="count(node())"/>
      <xsl:comment> countnode = <xsl:value-of select="$countnode"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 22.9 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$countjmp = 0">
                     <xsl:text> err-para-gj-mid-22-9</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 22.9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$countnode != 1">
                     <xsl:text> err-para-gj-mid-22-9-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 22.9.2 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'gra'])">
                     <xsl:text> err-para-gj-pre-22-9-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b2 -->
   <xsl:template match="para[@style = 'b2']">
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:variable name="nodecount" select="count(node())"/>
      <xsl:comment> nodecount = <xsl:value-of select="$nodecount"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 23.2 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="following-sibling::*[1][@style = 'b']">
                     <xsl:text> err-para-b2-pre-23-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.4 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="count(node()) &gt; 0">
                     <xsl:text> err-para-b2-mid-23-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b -->
   <xsl:template match="para[@style = 'b']">
      <xsl:variable name="nodecount" select="count(node())"/>
      <xsl:comment> nodecount = <xsl:value-of select="$nodecount"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 23.3 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="following-sibling::*[1][@style = 'b2']">
                     <xsl:text> err-para-b-post-23-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.5 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="count(node()) &gt; 0">
                     <xsl:text> err-para-b-mid-23-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n1 -->
   <xsl:template match="para[@style = 'n1']">
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="$countpren1"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="$countpres5"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="$countpresibnode"/>
      </xsl:comment>
      <xsl:variable name="counttec" select="count(*[@style = 'tec'])"/>
      <xsl:comment> counttec = <xsl:value-of select="$counttec"/>
      </xsl:comment>
      <xsl:variable name="countteu" select="count(*[@style = 'teu'])"/>
      <xsl:comment> countteu = <xsl:value-of select="$countteu"/>
      </xsl:comment>
      <xsl:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
      <xsl:comment> curtec = <xsl:value-of select="$curtec"/>
      </xsl:comment>
      <xsl:variable name="hastecchild" select="boolean(child::*[@style = 'tec'])"/>
      <xsl:comment> hastecchild = <xsl:value-of select="$hastecchild"/>
      </xsl:comment>
      <xsl:variable name="positiontec" select="positiontec"/>
      <xsl:comment> positiontec = <xsl:value-of select="$positiontec"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:comment> pren1tec = <xsl:value-of select="$pren1tec"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 12.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$counttec &gt; 0 and contains($pren1tec,$curtec)">
                     <xsl:if test="$countpres5 &lt; $countpren1">
                        <xsl:text> err-para-n1-mid-12-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 14.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'n1' or @style = 'n2' or @style = 'n3' or @style = 'ntn' or @style = 'qp' or @style = 'b' or @style = 'b2' or @style = 'b3' or @style = 'p' or @style = 's5' or @style = 'li1' or @style = 'hb1' or @style = 's3' or name() = 'chapter' or @style = 'gra'])">
                     <xsl:text> err-para-n1-post-14-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$counttec &gt; 1">
                     <xsl:text> err-para-n1-mid-10-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.1.4 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$counttec + $countteu  = 0 ">
                     <xsl:text> err-para-n1-mid-10-1-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n2 -->
   <xsl:template match="para[@style = 'n2']">
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="$countpren1"/>
      </xsl:comment>
      <xsl:variable name="countpren2"
                    select="count(preceding::*[@style = 'n2'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren2 = <xsl:value-of select="$countpren2"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="$countpres5"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="$countpresibnode"/>
      </xsl:comment>
      <xsl:variable name="counttec" select="count(*[@style = 'tec'])"/>
      <xsl:comment> counttec = <xsl:value-of select="$counttec"/>
      </xsl:comment>
      <xsl:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
      <xsl:comment> curtec = <xsl:value-of select="$curtec"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsis"
                    select="substring-after(translate(*[@style = 'tec'][1],':',''),'…')"/>
      <xsl:comment> curtecpostellipsis = <xsl:value-of select="$curtecpostellipsis"/>
      </xsl:comment>
      <xsl:variable name="curtecpreellipsis"
                    select="substring-before(*[@style = 'tec'][1],'…')"/>
      <xsl:comment> curtecpreellipsis = <xsl:value-of select="$curtecpreellipsis"/>
      </xsl:comment>
      <xsl:variable name="curtei" select="*[@style = 'tei']/text()"/>
      <xsl:comment> curtei = <xsl:value-of select="$curtei"/>
      </xsl:comment>
      <xsl:variable name="hastecchild" select="boolean(child::*[@style = 'tec'])"/>
      <xsl:comment> hastecchild = <xsl:value-of select="$hastecchild"/>
      </xsl:comment>
      <xsl:variable name="hastecellipsis" select="contains(*[@style = 'tec'][1],'…')"/>
      <xsl:comment> hastecellipsis = <xsl:value-of select="$hastecellipsis"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:comment> pren1tec = <xsl:value-of select="$pren1tec"/>
      </xsl:comment>
      <xsl:variable name="pren2tec"
                    select="preceding::*[@style = 'n2'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:comment> pren2tec = <xsl:value-of select="$pren2tec"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 12.8.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$countpres5 &gt; $countpren1">
                     <xsl:if test="child::*[@style = 'tec']">
                        <xsl:text> err-para-n2-pre-12-8-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.1.2 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$counttec &gt; 1">
                     <xsl:text> err-para-n2-mid-10-1-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.7 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(contains($pren1tec,$curtec))">
                     <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and not($hastecellipsis)">
                        <xsl:text> err-para-n2-mid-12-7</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.7.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(contains($pren1tec,$curtecpreellipsis) and contains($pren1tec,$curtecpostellipsis)) ">
                     <xsl:if test="$countpres5 &lt; $countpren1 and $hastecchild and $hastecellipsis">
                        <xsl:text> err-para-n2-mid-12-7-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.2 - rank=8-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="child::*[@style = 'tec'] and contains($pren2tec,$curtec)">
                     <xsl:if test="$countpren1 &lt; $countpren2">
                        <xsl:text> err-para-n2-mid-12-2</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n3 -->
   <xsl:template match="para[@style = 'n3']">
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="$countpren1"/>
      </xsl:comment>
      <xsl:variable name="countpren2"
                    select="count(preceding::*[@style = 'n2'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren2 = <xsl:value-of select="$countpren2"/>
      </xsl:comment>
      <xsl:variable name="countpren3"
                    select="count(preceding::*[@style = 'n3'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren3 = <xsl:value-of select="$countpren3"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="$countpres5"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="$countpresibnode"/>
      </xsl:comment>
      <xsl:variable name="counttec" select="count(*[@style = 'tec'])"/>
      <xsl:comment> counttec = <xsl:value-of select="$counttec"/>
      </xsl:comment>
      <xsl:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
      <xsl:comment> curtec = <xsl:value-of select="$curtec"/>
      </xsl:comment>
      <xsl:variable name="curtecpostellipsis"
                    select="substring-after(translate(*[@style = 'tec'][1],':',''),'…')"/>
      <xsl:comment> curtecpostellipsis = <xsl:value-of select="$curtecpostellipsis"/>
      </xsl:comment>
      <xsl:variable name="curtecpreellipsis"
                    select="substring-before(*[@style = 'tec'][1],'…')"/>
      <xsl:comment> curtecpreellipsis = <xsl:value-of select="$curtecpreellipsis"/>
      </xsl:comment>
      <xsl:variable name="curtei" select="*[@style = 'tei']/text()"/>
      <xsl:comment> curtei = <xsl:value-of select="$curtei"/>
      </xsl:comment>
      <xsl:variable name="hastecchild" select="boolean(child::*[@style = 'tec'])"/>
      <xsl:comment> hastecchild = <xsl:value-of select="$hastecchild"/>
      </xsl:comment>
      <xsl:variable name="hastecellipsis" select="contains(*[@style = 'tec'][1],'…')"/>
      <xsl:comment> hastecellipsis = <xsl:value-of select="$hastecellipsis"/>
      </xsl:comment>
      <xsl:variable name="lenchildtec" select="string-length(*[@style = 'tec']/text())"/>
      <xsl:comment> lenchildtec = <xsl:value-of select="$lenchildtec"/>
      </xsl:comment>
      <xsl:variable name="node1tec" select="node()[1][@style = 'tec']"/>
      <xsl:comment> node1tec = <xsl:value-of select="$node1tec"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:comment> pren1tec = <xsl:value-of select="$pren1tec"/>
      </xsl:comment>
      <xsl:variable name="pren2tec"
                    select="preceding::*[@style = 'n2'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:comment> pren2tec = <xsl:value-of select="$pren2tec"/>
      </xsl:comment>
      <xsl:variable name="pren3tec"
                    select="preceding::*[@style = 'n3'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:comment> pren3tec = <xsl:value-of select="$pren3tec"/>
      </xsl:comment>
      <xsl:variable name="counttrs" select="count(*[@style = 'trs'])"/>
      <xsl:comment> counttrs = <xsl:value-of select="$counttrs"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 10.1.3 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$counttec &gt; 1">
                     <xsl:text> err-para-n3-mid-10-1-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.1.5 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$counttec = 0">
                     <xsl:if test="$counttrs = 0">
                        <xsl:text> err-para-n3-mid-10-1-5</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 10.2.2 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$node1tec and $counttec = 1">
                     <xsl:if test="$lenchildtec &lt; 3">
                        <xsl:text> err-para-n3-mid-10-2-2</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.6 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(contains($pren2tec,$curtec) or contains($pren1tec,$curtec))">
                     <xsl:if test="not($hastecellipsis)">
                        <xsl:text> err-para-n3-mid-12-6</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.6.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not((contains($pren2tec,$curtecpreellipsis) and contains($pren2tec,$curtecpostellipsis)) or (contains($pren1tec,$curtecpreellipsis) and contains($pren1tec,$curtecpostellipsis)))">
                     <xsl:if test="$countpres5 &lt; $countpren2 and $countpres5 &lt; $countpren1 and $hastecellipsis and $hastecchild ">
                        <xsl:text> err-para-n3-mid-12-6-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 12.8.2 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$countpres5 &gt; $countpren2">
                     <xsl:text> err-para-n3-pre-12-8-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=s3 -->
   <xsl:template match="para[@style = 's3']">
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="$strlenb4chap"/>
      </xsl:comment>
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="$refcolonv"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:variable name="hasspacecref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),' #')"/>
      <xsl:comment> hasspacecref = <xsl:value-of select="$hasspacecref"/>
      </xsl:comment>
      <xsl:variable name="hassubvrange"
                    select="contains(translate($refcolonv,$validvlet,$validvletsub),'$–$')"/>
      <xsl:comment> hassubvrange = <xsl:value-of select="$hassubvrange"/>
      </xsl:comment>
      <xsl:variable name="hasvlet"
                    select="contains(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#$')"/>
      <xsl:comment> hasvlet = <xsl:value-of select="$hasvlet"/>
      </xsl:comment>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:comment> lastchar = <xsl:value-of select="$lastchar"/>
      </xsl:comment>
      <xsl:variable name="lastchartype"
                    select="translate(substring(.,string-length(.),1),$validcvnumblet,$validcvnumbletsub)"/>
      <xsl:comment> lastchartype = <xsl:value-of select="$lastchartype"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="$prechapter"/>
      </xsl:comment>
      <xsl:variable name="pres5text" select="preceding::*[@style = 's5'][1]/text()"/>
      <xsl:comment> pres5text = <xsl:value-of select="$pres5text"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="$preverse"/>
      </xsl:comment>
      <xsl:variable name="prevhyphen" select="contains($preverse,'-')"/>
      <xsl:comment> prevhyphen = <xsl:value-of select="$prevhyphen"/>
      </xsl:comment>
      <xsl:variable name="refcolonvlet"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$letlc,$letsub),'$')"/>
      <xsl:comment> refcolonvlet = <xsl:value-of select="$refcolonvlet"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="$refcolonvr1"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr2" select="substring-after($refcolonv,'–')"/>
      <xsl:comment> refcolonvr2 = <xsl:value-of select="$refcolonvr2"/>
      </xsl:comment>
      <xsl:variable name="reftype"
                    select="translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub)"/>
      <xsl:comment> reftype = <xsl:value-of select="$reftype"/>
      </xsl:comment>
      <xsl:variable name="refvendash" select="contains(node()[not(self::*)],'–')"/>
      <xsl:comment> refvendash = <xsl:value-of select="$refvendash"/>
      </xsl:comment>
      <xsl:variable name="refwordschapcolon"
                    select="substring-before(substring(node()[not(self::*)],$strlenb4chap +1),':')"/>
      <xsl:comment> refwordschapcolon = <xsl:value-of select="$refwordschapcolon"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 19.4 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($prevhyphen) and not($refvendash) and not($hasvlet)">
                     <xsl:if test="$refcolonv != $preverse">
                        <xsl:text> err-para-s3-mid-19-4</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.4.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($prevhyphen) and not($refvendash) and $hasvlet">
                     <xsl:if test="$refcolonvlet != $preverse">
                        <xsl:text> err-para-s3-mid-19-4-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.5 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$hassubvrange and $hascvref ">
                     <xsl:if test="$refcolonvlet != $preverse">
                        <xsl:text> err-para-s3-mid-19-5</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.6 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="($refvendash  and ($lastchartype = '#')) or (contains($reftype,'#$–#')  and ($lastchartype = '#'))">
                     <xsl:if test="$refcolonvr2 != $preverse">
                        <xsl:text> err-para-s3-mid-19-6</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.8 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ntn'])">
                     <xsl:text> err-para-s3-mid-19-8</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.3 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$hascvref and $hasspacecref">
                     <xsl:if test="$refwordschapcolon != $prechapter">
                        <xsl:text> err-para-s3-mid-19-3</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.7 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$hascvref and $lastchartype  = '$'">
                     <xsl:if test="$lastchar != substring($pres5text,string-length($pres5text),1)">
                        <xsl:text> err-para-s3-mid-19-7</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.1 - rank=6-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(contains(text(),'General Comment on'))">
                     <xsl:text> err-para-s3-mid-19-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 19.2 - rank=6-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($hascvref )">
                     <xsl:text> err-para-s3-mid-19-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b3 -->
   <xsl:template match="para[@style = 'b3']">
      <xsl:variable name="postsib" select="following-sibling::*[1]/@style"/>
      <xsl:comment> postsib = <xsl:value-of select="$postsib"/>
      </xsl:comment>
      <xsl:variable name="posttable" select="following-sibling::*[1][name() = 'table'] "/>
      <xsl:comment> posttable = <xsl:value-of select="$posttable"/>
      </xsl:comment>
      <xsl:variable name="presib" select="preceding-sibling::*[1]/@style"/>
      <xsl:comment> presib = <xsl:value-of select="$presib"/>
      </xsl:comment>
      <xsl:variable name="presib2" select="preceding-sibling::*[2]/@style"/>
      <xsl:comment> presib2 = <xsl:value-of select="$presib2"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 7.1.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$posttable and $presib2 = 'c'">
                     <xsl:if test="$presib = 'b'">
                        <xsl:text> err-para-b3-pre-7-1-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.1.3 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$postsib = 'b'">
                     <xsl:text> err-para-b3-post-7-1-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.10.2 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($presib = 'c') and $posttable">
                     <xsl:if test="not($presib = 'b' or ( $presib = 'rem' and $presib2 = 'b'))">
                        <xsl:text> err-para-b3-pre-7-10-2</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 1.1 - rank=8-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(verse)">
                     <xsl:text> err-para-b3-mid-1-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=p -->
   <xsl:template match="para[@style = 'p']">
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:variable name="postsib" select="following-sibling::*[1]/@style"/>
      <xsl:comment> postsib = <xsl:value-of select="$postsib"/>
      </xsl:comment>
      <xsl:variable name="posttable" select="following-sibling::*[1][name() = 'table'] "/>
      <xsl:comment> posttable = <xsl:value-of select="$posttable"/>
      </xsl:comment>
      <xsl:variable name="presib" select="preceding-sibling::*[1]/@style"/>
      <xsl:comment> presib = <xsl:value-of select="$presib"/>
      </xsl:comment>
      <xsl:variable name="presib2" select="preceding-sibling::*[2]/@style"/>
      <xsl:comment> presib2 = <xsl:value-of select="$presib2"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 7.1.2 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$posttable and $presib2 = 'c'">
                     <xsl:if test="$presib = 'b'">
                        <xsl:text> err-para-p-pre-7-1-2</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.1.4 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$postsib = 'b'">
                     <xsl:text> err-para-p-post-7-1-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 7.10.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not($presib = 'c') and $posttable">
                     <xsl:if test="not($presib = 'b' or ( $presib = 'rem' and $presib2 = 'b'))">
                        <xsl:text> err-para-p-pre-7-10-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 1.2 - rank=8-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(verse)">
                     <xsl:text> err-para-p-mid-1-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=gra -->
   <xsl:template match="para[@style = 'gra']">
      <xsl:variable name="countf" select="count(*[@style = 'f'])"/>
      <xsl:comment> countf = <xsl:value-of select="$countf"/>
      </xsl:comment>
      <xsl:variable name="countfig" select="count(*[@style = 'fig'])"/>
      <xsl:comment> countfig = <xsl:value-of select="$countfig"/>
      </xsl:comment>
      <xsl:variable name="countnode" select="count(node())"/>
      <xsl:comment> countnode = <xsl:value-of select="$countnode"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 22.8 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$countfig + $countf = 1">
                     <xsl:if test="$countf = 0">
                        <xsl:text> err-para-gra-mid-22-8</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 22.10. - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$countfig + $countf = 1">
                     <xsl:if test="$countfig = 0">
                        <xsl:text> err-para-gra-mid-22-10-</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 22.2 - rank=8-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$countfig + $countf = 2">
                     <xsl:if test="$countnode != 2">
                        <xsl:text> err-para-gra-mid-22-2</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 9.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                     <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                        <xsl:text> err-para--mid-9-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 23.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(@style = 'b') and not(@style = 'b2') ">
                     <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                        <xsl:text> err-para--mid-23-1</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26.1 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                     <xsl:text> err-para--mid-26-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()">
               <xsl:with-param name="embedded" select="0"/>
            </xsl:apply-templates>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <xsl:template match="note[@style = 'f']">
      <xsl:variable name="curpos" select="position()"/>
      <xsl:comment> curpos = <xsl:value-of select="$curpos"/>
      </xsl:comment>
      <xsl:variable name="graparent" select="parent::para[@style = 'gra']"/>
      <xsl:comment> graparent = <xsl:value-of select="$graparent"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$graparent">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'fig'] )">
                     <xsl:text> err-note-f-pre-22-3</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 22.5 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@caller != '*'">
                  <xsl:text> err-note-f-pre-22-5</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="figure[@style = 'fig']">
      <xsl:variable name="curpos" select="position()"/>
      <xsl:comment> curpos = <xsl:value-of select="$curpos"/>
      </xsl:comment>
      <xsl:variable name="graparent" select="parent::para[@style = 'gra']"/>
      <xsl:comment> graparent = <xsl:value-of select="$graparent"/>
      </xsl:comment>
      <xsl:variable name="hascoloncvref" select="contains(@ref,':')"/>
      <xsl:comment> hascoloncvref = <xsl:value-of select="$hascoloncvref"/>
      </xsl:comment>
      <xsl:variable name="hasspaceinref" select="contains(@ref,' ')"/>
      <xsl:comment> hasspaceinref = <xsl:value-of select="$hasspaceinref"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="$prechapter"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="$preverse"/>
      </xsl:comment>
      <xsl:variable name="refattchap" select="substring-before(@ref,':')"/>
      <xsl:comment> refattchap = <xsl:value-of select="$refattchap"/>
      </xsl:comment>
      <xsl:variable name="refattchapdot" select="substring-before(@ref,'.')"/>
      <xsl:comment> refattchapdot = <xsl:value-of select="$refattchapdot"/>
      </xsl:comment>
      <xsl:variable name="refattdotverse" select="substring-after(@ref,'.')"/>
      <xsl:comment> refattdotverse = <xsl:value-of select="$refattdotverse"/>
      </xsl:comment>
      <xsl:variable name="refattverse" select="substring-after(@ref,':')"/>
      <xsl:comment> refattverse = <xsl:value-of select="$refattverse"/>
      </xsl:comment>
      <xsl:variable name="refchapter" select="refchapter"/>
      <xsl:comment> refchapter = <xsl:value-of select="$refchapter"/>
      </xsl:comment>
      <xsl:variable name="refverse" select="refverse"/>
      <xsl:comment> refverse = <xsl:value-of select="$refverse"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.2.1 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$curpos != 1">
                  <xsl:text> err-figure-fig-pre-22-2-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.7 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hascoloncvref and not($hasspaceinref)">
                  <xsl:if test="$refattverse != $preverse">
                     <xsl:text> err-figure-fig-mid-22-7-2</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 22.7.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not($hascoloncvref)">
                  <xsl:text> err-figure-fig-mid-22-8</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.6 - rank=2-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hascoloncvref and not($hasspaceinref)">
                  <xsl:if test="$refattchap != $prechapter">
                     <xsl:text> err-figure-fig-mid-22-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 22.6.2 - rank=2-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hascoloncvref and $hasspaceinref">
                  <xsl:text> err-figure-fig-mid-22-6-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.1 - rank=8-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not($graparent)">
                  <xsl:text> err-figure-fig-pre-22-1</xsl:text>
               </xsl:if>
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
      <xsl:variable name="curpos" select="position()"/>
      <xsl:comment> curpos = <xsl:value-of select="$curpos"/>
      </xsl:comment>
      <xsl:variable name="gjparent" select="parent::para[@style = 'gj']"/>
      <xsl:comment> gjparent = <xsl:value-of select="$gjparent"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.4 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not($gjparent)">
                  <xsl:text> err-link-jmp-pre-22-4</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\jmp </xsl:text>
         <xsl:element name="span">
            <xsl:attribute name="class">fig-attrib</xsl:attribute>
            <xsl:apply-templates select="@*"/>
         </xsl:element>
         <xsl:text>\jmp*</xsl:text>
      </xsl:element>
   </xsl:template>
   <!-- char @style=sbx -->
   <xsl:template match="char[@style = 'sbx']">
      <xsl:param name="embedded"/>
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="$strlenb4chap"/>
      </xsl:comment>
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="$refcolonv"/>
      </xsl:comment>
      <xsl:variable name="chappos"
                    select="string-length(substring-before(translate(node()[not(self::*)],$numb,$numbsub), '#'))+1"/>
      <xsl:comment> chappos = <xsl:value-of select="$chappos"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:variable name="hasspacecref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),' #')"/>
      <xsl:comment> hasspacecref = <xsl:value-of select="$hasspacecref"/>
      </xsl:comment>
      <xsl:variable name="numbfirst"
                    select="substring(translate(.,$numb,$numbsub),1,1) = '#'"/>
      <xsl:comment> numbfirst = <xsl:value-of select="$numbfirst"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="$prechapter"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="$preverse"/>
      </xsl:comment>
      <xsl:variable name="refchapcolon" select="substring-before(node()[not(self::*)],':')"/>
      <xsl:comment> refchapcolon = <xsl:value-of select="$refchapcolon"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="$refcolonvr1"/>
      </xsl:comment>
      <xsl:variable name="refwordschapcolon"
                    select="substring-before(substring(node()[not(self::*)],$strlenb4chap +1),':')"/>
      <xsl:comment> refwordschapcolon = <xsl:value-of select="$refwordschapcolon"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 8.4.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hascvref and not(contains($preverse,'-')) and contains(.,'–')">
                  <xsl:if test="$refcolonvr1 != $preverse">
                     <xsl:text> err-char-sbx-mid-8-4-3</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.4 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hascvref and not(contains($preverse,'-'))  and not(contains(.,'–'))">
                  <xsl:if test="$refcolonv != $preverse">
                     <xsl:text> err-char-sbx-mid-8-4-4</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.5 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hasspacecref  and $hascvref ">
                  <xsl:if test="$refwordschapcolon != $prechapter">
                     <xsl:text> err-char-sbx-mid-8-4-5</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.7 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$numbfirst and $hascvref">
                  <xsl:if test="$refchapcolon != $prechapter">
                     <xsl:text> err-char-sbx-mid-8-4-7</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char">
      <xsl:param name="embedded"/>
      <xsl:variable name="pos" select="position()"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tec -->
   <xsl:template match="char[@style = 'tec']">
      <xsl:param name="embedded"/>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="$countpren1"/>
      </xsl:comment>
      <xsl:variable name="countpren2"
                    select="count(preceding::*[@style = 'n2'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren2 = <xsl:value-of select="$countpren2"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="$countpres5"/>
      </xsl:comment>
      <xsl:variable name="countpresibnode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countpresibnode = <xsl:value-of select="$countpresibnode"/>
      </xsl:comment>
      <xsl:variable name="countpretec" select="count(preceding-sibling::*[@style = 'tec'])"/>
      <xsl:comment> countpretec = <xsl:value-of select="$countpretec"/>
      </xsl:comment>
      <xsl:variable name="hasellipsis" select="contains(node()[not(self::*)],'…')"/>
      <xsl:comment> hasellipsis = <xsl:value-of select="$hasellipsis"/>
      </xsl:comment>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:comment> lastchar = <xsl:value-of select="$lastchar"/>
      </xsl:comment>
      <xsl:variable name="lastchar2" select="substring(.,string-length(.) - 1,1)"/>
      <xsl:comment> lastchar2 = <xsl:value-of select="$lastchar2"/>
      </xsl:comment>
      <xsl:variable name="postellipsisstring"
                    select="substring-after(translate(node()[not(self::*)],':',''),'…')"/>
      <xsl:comment> postellipsisstring = <xsl:value-of select="$postellipsisstring"/>
      </xsl:comment>
      <xsl:variable name="preellipsisstring"
                    select="substring-before(node()[not(self::*)],'…')"/>
      <xsl:comment> preellipsisstring = <xsl:value-of select="$preellipsisstring"/>
      </xsl:comment>
      <xsl:variable name="pretec" select="preceding::*[@style = 'tec'][1]"/>
      <xsl:comment> pretec = <xsl:value-of select="$pretec"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 10.2.1 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$countpresibnode &gt; 0">
                  <xsl:text> err-char-tec-mid-10-2-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 11.1 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="translate(substring(.,1,1),$invalidtecfirstpunc,'%%') = '%'">
                  <xsl:text> err-char-tec-mid-11-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 11.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="translate($lastchar2,$invalidtecendpunc,$invalidtecendpuncsub) = '%'">
                  <xsl:text> err-char-tec-mid-11-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 20.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="*[@style = 'f']">
                  <xsl:text> err-char-tec-mid-20-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 10.32 - rank=3-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not($lastchar = ':')">
                  <xsl:text> err-char-tec-mid-10-32</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 10.2.3 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$countpretec &gt; 0">
                  <xsl:text> err-char-tec-pre-10-2-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 10.31 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$lastchar = ' '">
                  <xsl:text> err-char-tec-mid-10-31</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <!-- char @style=trs -->
   <xsl:template match="char[@style = 'trs']">
      <xsl:param name="embedded"/>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="$countpren1"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="$countpres5"/>
      </xsl:comment>
      <xsl:variable name="hasellipsis" select="contains(node()[not(self::*)],'…')"/>
      <xsl:comment> hasellipsis = <xsl:value-of select="$hasellipsis"/>
      </xsl:comment>
      <xsl:variable name="parent" select="parent::*/@style"/>
      <xsl:comment> parent = <xsl:value-of select="$parent"/>
      </xsl:comment>
      <xsl:variable name="postellipsisstring"
                    select="substring-after(translate(node()[not(self::*)],':',''),'…')"/>
      <xsl:comment> postellipsisstring = <xsl:value-of select="$postellipsisstring"/>
      </xsl:comment>
      <xsl:variable name="preellipsisstring"
                    select="substring-before(node()[not(self::*)],'…')"/>
      <xsl:comment> preellipsisstring = <xsl:value-of select="$preellipsisstring"/>
      </xsl:comment>
      <xsl:variable name="pretec" select="preceding::*[@style = 'tec'][1]"/>
      <xsl:comment> pretec = <xsl:value-of select="$pretec"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 10.4 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(preceding-sibling::*[@style = 'tec']) ">
                  <xsl:if test="not($parent = 'f' or $parent = 'n2' or $parent = 'li1')">
                     <xsl:text> err-char-trs-mid-10-4</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 10.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not($hasellipsis)">
                  <xsl:if test="not(contains($pretec,.))">
                     <xsl:text> err-char-trs-mid-10-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 10.6.1 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hasellipsis">
                  <xsl:if test="not(contains($pretec,$preellipsisstring) and contains($pretec,$postellipsisstring))">
                     <xsl:text> err-char-trs-mid-10-6-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tei -->
   <xsl:template match="char[@style = 'tei']">
      <xsl:param name="embedded"/>
      <xsl:variable name="countpren1"
                    select="count(preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/preceding-sibling::*)"/>
      <xsl:comment> countpren1 = <xsl:value-of select="$countpren1"/>
      </xsl:comment>
      <xsl:variable name="countpres5"
                    select="count(preceding::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:comment> countpres5 = <xsl:value-of select="$countpres5"/>
      </xsl:comment>
      <xsl:variable name="parent" select="parent::*/@style"/>
      <xsl:comment> parent = <xsl:value-of select="$parent"/>
      </xsl:comment>
      <xsl:variable name="parentpresib" select="count(parent::*/preceding-sibling::*)"/>
      <xsl:comment> parentpresib = <xsl:value-of select="$parentpresib"/>
      </xsl:comment>
      <xsl:variable name="pren1tec"
                    select="preceding::*[@style = 'n1'][child::*[@style = 'tec']][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:comment> pren1tec = <xsl:value-of select="$pren1tec"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 10.5 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$countpren1 &gt; $countpres5 or $parentpresib &gt; $countpres5 ">
                  <xsl:if test="contains($pren1tec,text()) and not($parent = 'p') and not($parent = 'f')">
                     <xsl:text> err-char-tei-mid-10-5</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tbb -->
   <xsl:template match="char[@style = 'tbb']">
      <xsl:param name="embedded"/>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 9.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char--mid-9-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-char--mid-26-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 17.1.1 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="text() = '_'">
                  <xsl:text> err-char-tbb--17-1-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 17.1.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="text() = '___' or text() = '____'">
                  <xsl:text> err-char-tbb-mid-17-1-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 17.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1) = ' '">
                  <xsl:text> err-char-tbb-pre-17-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 17.3 - rank=10-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
                  <xsl:text> err-char-tbb-post-17-3</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <!-- cell @style=tc1 -->
   <xsl:template match="cell[@style = 'tc1']">
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:comment> strlenb4chap = <xsl:value-of select="$strlenb4chap"/>
      </xsl:comment>
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:comment> refcolonv = <xsl:value-of select="$refcolonv"/>
      </xsl:comment>
      <xsl:variable name="chappos"
                    select="string-length(substring-before(translate(node()[not(self::*)],$numb,$numbsub), '#'))+1"/>
      <xsl:comment> chappos = <xsl:value-of select="$chappos"/>
      </xsl:comment>
      <xsl:variable name="countprenode" select="count(preceding-sibling::node())"/>
      <xsl:comment> countprenode = <xsl:value-of select="$countprenode"/>
      </xsl:comment>
      <xsl:variable name="countsbx" select="count(*[@style = 'sbx'])"/>
      <xsl:comment> countsbx = <xsl:value-of select="$countsbx"/>
      </xsl:comment>
      <xsl:variable name="counttbb" select="count(*[@style = 'tbb'])"/>
      <xsl:comment> counttbb = <xsl:value-of select="$counttbb"/>
      </xsl:comment>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:comment> hascvref = <xsl:value-of select="$hascvref"/>
      </xsl:comment>
      <xsl:variable name="hasspacecref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),' #')"/>
      <xsl:comment> hasspacecref = <xsl:value-of select="$hasspacecref"/>
      </xsl:comment>
      <xsl:variable name="notsbxchild" select="not(child::*[@style = 'sbx'])"/>
      <xsl:comment> notsbxchild = <xsl:value-of select="$notsbxchild"/>
      </xsl:comment>
      <xsl:variable name="numbfirst"
                    select="substring(translate(.,$numb,$numbsub),1,1) = '#'"/>
      <xsl:comment> numbfirst = <xsl:value-of select="$numbfirst"/>
      </xsl:comment>
      <xsl:variable name="pos" select="pos"/>
      <xsl:comment> pos = <xsl:value-of select="$pos"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="$prechapter"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="$preverse"/>
      </xsl:comment>
      <xsl:variable name="refchapcolon" select="substring-before(node()[not(self::*)],':')"/>
      <xsl:comment> refchapcolon = <xsl:value-of select="$refchapcolon"/>
      </xsl:comment>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:comment> refcolonvr1 = <xsl:value-of select="$refcolonvr1"/>
      </xsl:comment>
      <xsl:variable name="refwordschapcolon"
                    select="substring-before(substring(node()[not(self::*)],$strlenb4chap +1),':')"/>
      <xsl:comment> refwordschapcolon = <xsl:value-of select="$refwordschapcolon"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">cell <xsl:value-of select="@style"/>
            <!--ref 4.4 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="count(following-sibling::cell) = 0 and @style = 'tc1'">
                  <xsl:if test="not(*[@style = 'sbx'] or contains(text(),'Paragraph'))">
                     <xsl:text> err-cell-tc1-mid-4-4</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 4.7 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$countsbx &gt; 1">
                  <xsl:if test="$counttbb + 1 != $countsbx">
                     <xsl:text> err-cell-tc1-mid-4-7</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 4.8 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$countsbx = 1">
                  <xsl:if test="count(*/*[@style = '+tbb']) = 0 and $counttbb = 0">
                     <xsl:text> err-cell-tc1-mid-4-8</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.1 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hasspacecref and $hascvref and not(contains($preverse,'-')) and contains(.,'–') and $notsbxchild">
                  <xsl:if test="$refcolonvr1 != $preverse">
                     <xsl:text> err-cell-tc1-mid-8-4-1</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hascvref and not(contains($preverse,'-'))  and not(contains(.,'–'))">
                  <xsl:if test="substring-after(text(),':') != $preverse">
                     <xsl:text> err-cell-tc1-mid-8-4-2</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.6 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$hasspacecref and $hascvref ">
                  <xsl:if test="$refwordschapcolon != $prechapter">
                     <xsl:text> err-cell-tc1-mid-8-4-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8.4.8 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$numbfirst and $hascvref">
                  <xsl:if test="$refchapcolon != $prechapter">
                     <xsl:text> err-cell-tc1-mid-8-4-8</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 4.9 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="$countprenode &gt; 1">
                  <xsl:text> err-cell-tc1--4-9</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--common cell errors-->
            <!--ref 9.5 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-cell--mid-9-5</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-cell--mid-26-3</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="concat(@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- cell @style= -->
   <xsl:template match="cell">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">cell <xsl:value-of select="@style"/>
            <!--ref 9.5 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-cell--mid-9-5</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 26.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),$sq) or contains(text(),$dq) ">
                  <xsl:text> err-cell--mid-26-3</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="concat(@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- row @style=td -->
   <xsl:template match="row">
      <xsl:variable name="pos" select="position()"/>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 4.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="cell[2]/@style = 'tc1'">
                  <xsl:text> err-row-td--4-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="cell[1]/@style = 'tc2'">
                  <xsl:text> err-row-td--4-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="cell[2]/@style = 'tc1'">
                  <xsl:text> err-row-td--4-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="cell[1]/@style = 'tc2'">
                  <xsl:text> err-row-td--4-3</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse[@style = 'v']">
      <xsl:variable name="parent" select="parent::*/@style"/>
      <xsl:comment> parent = <xsl:value-of select="$parent"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(@number,'–')">
                  <xsl:text> err-verse-v-mid-9-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$-#') or contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$')">
                  <xsl:text> err-verse-v-mid-9-3</xsl:text>
               </xsl:if>
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

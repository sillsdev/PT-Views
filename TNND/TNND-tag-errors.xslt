<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:variable name="numb" select="'1234567890'"/>
   <xsl:variable name="numbsub" select="'##########'"/>
   <xsl:variable name="validvlet" select="'abcdefghij'"/>
   <xsl:variable name="validvletpunc" select="'abcdefghij–'"/>
   <xsl:variable name="validvletsub" select="'$$$$$$$$$$'"/>
   <xsl:variable name="invalidvlet" select="'klmnopqrstuvwxyz'"/>
   <xsl:variable name="validcvnumblet" select="'1234567890abcdefghij'"/>
   <xsl:variable name="validcvnumbletsub" select="'##########$$$$$$$$$$'"/>
   <xsl:variable name="validcvnumbletpunc" select="'1234567890abcdefghij–:'"/>
   <xsl:variable name="letlc" select="'abcdefghijklmnopqrstuvwxyz'"/>
   <xsl:variable name="letuc" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
   <xsl:variable name="letsub" select="'$$$$$$$$$$$$$$$$$$$$$$$$$$'"/>
   <xsl:variable name="letulc"
                 select="'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'"/>
   <xsl:variable name="invalidtecendpunc" select="'.,’”'"/>
   <xsl:variable name="invalidtecendpuncsub" select="'%%%%'"/>
   <xsl:variable name="invalidtecfirstpunc" select="'‘“'"/>
   <xsl:variable name="dq" select="'&#34;'"/>
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
                .err-table---7-2::after {content:'A \\b paragraph must precede a \\tr \\tc1 Division ... #7.2';}
.err-table---7-2 {}
.err-table---7-3::after {content:'A \\b paragraph must precede a \\tr \\tc1 Section ... #7.3';}
.err-table---7-3 {}
.err-table--before-7-4::after {content:'A \\b paragraph must precede a \\tr \\tc1 Part ... #7.4';}
.err-table--before-7-4 {}
.err-table--before-7-5::after {content:'A \\b paragraph must precede a \\tr \\tc1 Paragraph ... #7.5';}
.err-table--before-7-5 {}
.err-para-s5--8-1::after {content:'The Chapter number in \\s5 should match the current chapter number. #8.1';}
.err-para-s5--8-1 {border-bottom:2pt solid red}
.err-para-s5--8-21::after {content:'This verse number in \\s5 should match the current verse number. #8.21';}
.err-para-s5--8-21 {border-bottom:2pt solid red}
.err-para-s5--8-23::after {content:'The verse number before the en dash in \\s5 should match the first number of current verse range. #8.23';}
.err-para-s5--8-23 {border-bottom:2pt solid red}
.err-para-s5--8-26::after {content:'The verse number in this \\s5 must be within the current verse range. #8.26';}
.err-para-s5--8-26 {border-bottom:2pt solid red}
.err-para-s5--8-3::after {content:'This verse part is invalid (a–j allowed). #8.3';}
.err-para-s5--8-3 {border-bottom:2pt solid red}
.err-para-s5--8-22::after {content:'The verse number before the en dash in \\s5 should match current verse number. #8.22';}
.err-para-s5--8-22 {border-bottom:2pt solid red}
.err-para-s5--9-16::after {content:'The hyphen in a range in this paragraph should be an en dash. #9.16';}
.err-para-s5--9-16 {border-bottom:2pt solid red}
.err-para-s5--8-25::after {content:'This \\s5 must contain a colon between the chapter and verse. #8.25';}
.err-para-s5--8-25 {border-bottom:2pt solid red}
.err-para---9-1::after {content:'The hyphen in a verse range in this paragraph should be an en dash. #9.1';}
.err-para---9-1 {border-bottom:2pt solid red}
.err-para---23-1::after {content:'This paragraph type should not be empty. #23.1';}
.err-para---23-1 {border-bottom:2pt solid red}
.err-para-n1--9-13::after {content:'The hyphen in a range in this paragraph should be an en dash. #9.13';}
.err-para-n1--9-13 {border-bottom:2pt solid red}
.err-para-n1--10-2-1::after {content:'The \\tec ...\\tec* markup should be at the start of the \\n3 paragraph. #10.2.1';}
.err-para-n1--10-2-1 {border-bottom:2pt solid red}
.err-para-n1--12-1::after {content:'The contents of this \\n1 \\tec is a portion of the previous \\n1 \\tec. Perhaps this should be an \\n2? #12.1';}
.err-para-n1--12-1 {border-bottom:2pt solid red}
.err-para-n1-post-14-1::after {content:'Only these paragraphs: \\n1 \\n2 \\n3 \\ntn \\qp \\b \\b2 \\b3 \\p \\s5 \\li1 \\hb1 \\s3 are allowed after a \\n1 #14.1';}
.err-para-n1-post-14-1 {border-bottom:2pt solid red}
.err-para-n1--10-1::after {content:'There should be only one \\tec per \\n1 paragraph. #10.1';}
.err-para-n1--10-1 {border-bottom:2pt solid red}
.err-para-n1--10-1-4::after {content:'This paragraph is missing a \\tec ...\\tec* #10.1.4';}
.err-para-n1--10-1-4 {border-bottom:2pt solid red}
.err-para-n2--9-14::after {content:'The hyphen in a range in this paragraph should be an en dash. #9.14';}
.err-para-n2--9-14 {border-bottom:2pt solid red}
.err-para-n2--12-2::after {content:'The contents of this \\n2 \\tec is a portion of the previous \\n2 \\tec. Perhaps this should be an \\n3? #12.2';}
.err-para-n2--12-2 {border-bottom:2pt solid red}
.err-para-n2--12-8-1::after {content:'There is no \\n1 preceding this \\n2. It should be an \\n1. #12.8.1';}
.err-para-n2--12-8-1 {border-bottom:2pt solid red}
.err-para-n2--12-7::after {content:'The contents of this \\n2 \\tec is not found in the preceding  \\n1 \\tec. #12.7';}
.err-para-n2--12-7 {border-bottom:2pt solid red}
.err-para-n3--9-15::after {content:'The hyphen in a range in this paragraph should be an en dash. #9.15';}
.err-para-n3--9-15 {border-bottom:2pt solid red}
.err-para-n3--10-2-2::after {content:'There should be text in \\tec formatting at the beginning of this paragraph #10.2.2';}
.err-para-n3--10-2-2 {border-bottom:2pt solid red}
.err-para-n3--12-8-2::after {content:'The \\n3 occurs before any \\n2 in this \\s5 note group #12.8.2';}
.err-para-n3--12-8-2 {border-bottom:2pt solid red}
.err-para-n3--12-8-3::after {content:'This should be an \\n1 paragraph since the content is not found in the preceding \\n1 \\tec. #12.8.3';}
.err-para-n3--12-8-3 {border-bottom:2pt solid red}
.err-para-n3--10-1-3::after {content:'There should be only one \\tec per \\n3 paragraph. #10.1.3';}
.err-para-n3--10-1-3 {border-bottom:2pt solid red}
.err-para-n3--10-1-5::after {content:'This paragraph is missing a \\tec ...\\tec* #10.1.5';}
.err-para-n3--10-1-5 {border-bottom:2pt solid red}
.err-para-n3--12-3::after {content:'The contents of this \\n3 \\tec should not be in the previous \\n3 \\tec #12.3';}
.err-para-n3--12-3 {border-bottom:2pt solid red}
.err-para-n3--12-6::after {content:'The contents of this \\n3 \\tec is not found in the preceding  \\n2 \\tec. #12.6';}
.err-para-n3--12-6 {border-bottom:2pt solid red}
.err-para-qp-pre-14-2::after {content:'Two \\qp paragraphs, one after the other, are not allowed, unless it is one example with two paragraphs #14.2';}
.err-para-qp-pre-14-2 {border-top:2pt solid red}
.err-para-ntn-pre-18-1::after {content:'An \\ntn should be preceeded by a \\s3 or \\s5 or \\tr or \\ntn. #18.1';}
.err-para-ntn-pre-18-1 {border-top:2pt solid red}
.err-para-ntn--22-8::after {content:'This \\ntn paragraph is missing a \\f. #22.8';}
.err-para-ntn--22-8 {border-bottom:2pt solid red}
.err-para-ntn--22-9::after {content:'This \\ntn paragraph is missing a \\jmp. #22.9';}
.err-para-ntn--22-9 {border-bottom:2pt solid red}
.err-para-ntn--24-1::after {content:'An \\ntn should not contain a \\tec. #24.1';}
.err-para-ntn--24-1 {border-bottom:2pt solid red}
.err-para-b2--23-2::after {content:'A \\b2 should not precede a \\b. #23.2';}
.err-para-b2--23-2 {border-bottom:2pt solid red}
.err-para-b--23-3::after {content:'A \\b2 should not follow a \\b. #23.3';}
.err-para-b--23-3 {border-bottom:2pt solid red}
.err-para-s3--19-4::after {content:'The verse number in this \\s3 does not match the preceding \\v number. #19.4';}
.err-para-s3--19-4 {border-bottom:2pt solid red}
.err-para-s3--19-5::after {content:'The verse number in this \\s3 does not match the preceding \\v number. #19.5';}
.err-para-s3--19-5 {border-bottom:2pt solid red}
.err-para-s3--19-6::after {content:'The last verse number in the range in this \\s3 does not match the preceding \\v number. #19.6';}
.err-para-s3--19-6 {border-bottom:2pt solid red}
.err-para-s3--19-7::after {content:'The ending verse part does not match the previous \\s5 verse part. #19.7';}
.err-para-s3--19-7 {border-bottom:2pt solid red}
.err-para-s3--19-8::after {content:'An \\s3 can only be followed by an \\ntn #19.8';}
.err-para-s3--19-8 {border-bottom:2pt solid red}
.err-para-s3--19-3::after {content:'The chapter number in this \\s3 does not match the preceding \\c number. #19.3';}
.err-para-s3--19-3 {border-bottom:2pt solid red}
.err-para-s3--19-1::after {content:'An \\s3 paragraph always starts with `General Comment on` #19.1';}
.err-para-s3--19-1 {border-bottom:2pt solid red}
.err-para-s3--19-2::after {content:'This paragraph is missing a valid chapter verse reference, or the colon is missing. #19.2';}
.err-para-s3--19-2 {border-bottom:2pt solid red}
.err-para-b3--7-1-1::after {content:'A \\b para should not follow a \\b3 paragraph at the start of a chapter. #7.1.1';}
.err-para-b3--7-1-1 {border-bottom:2pt solid red}
.err-para-b3--7-1-3::after {content:'A \\b should not precede a \\b3, it should be after. #7.1.3';}
.err-para-b3--7-1-3 {border-bottom:2pt solid red}
.err-para-b3--1-1::after {content:'A \\b3 paragraph must contain a \\v. #1.1';}
.err-para-b3--1-1 {border-bottom:2pt solid red}
.err-para-p--7-1-2::after {content:'A \\b para should not follow a \\p paragraph at the start of a chapter. #7.1.2';}
.err-para-p--7-1-2 {border-bottom:2pt solid red}
.err-para-p--7-1-4::after {content:'A \\b should not precede a \\p, it should be after. #7.1.4';}
.err-para-p--7-1-4 {border-bottom:2pt solid red}
.err-para-p--1-2::after {content:'A \\p paragraph must contain a \\v. #1.2';}
.err-para-p--1-2 {border-bottom:2pt solid red}
.err-note-f--22-3::after {content:'This \\f must only have a \\fig before it. There should be no space or text. #22.3';}
.err-note-f--22-3 {}
.err-note-f--22-5::after {content:'The caller for the \\f must be * #22.5';}
.err-note-f--22-5 {}
.err-figure-fig--22-1::after {content:'This is not an \\ntn paragraph. A \\fig must only occur in a \\ntn paragraph #22.1';}
.err-figure-fig--22-1 {}
.err-figure-fig--22-21::after {content:'The \\fig must be the first item in a \\ntn paragraph #22.21';}
.err-figure-fig--22-21 {}
.err-figure-fig--22-6::after {content:'The referenced chapter number for the \\fig does not match the preceding \\c number. #22.6';}
.err-figure-fig--22-6 {}
.err-figure-fig--22-7::after {content:'The referenced verse number for the \\fig does not match the preceding \\v number. #22.7';}
.err-figure-fig--22-7 {}
.err-link-jmp--22-4::after {content:'This \\jmp should occur as the third item, immediately after the \\f*. #22.4';}
.err-link-jmp--22-4 {}
.err-char-sbx--9-12::after {content:'The hyphen in the verse range in this \\sbx should be an en dash. #9.12';}
.err-char-sbx--9-12 {background:orange}
.err-char-trs-mid-10-4::after {content:'A \\tec should precede this \\trs in the paragraph. #10.4';}
.err-char-trs-mid-10-4 {background:orange}
.err-char-tbb--17-1-1::after {content:'This \tbb __\tbb* has less than the required 2 underscore characers. #17.1.1';}
.err-char-tbb--17-1-1 {background:orange}
.err-char-tbb--17-1-2::after {content:'This \tbb __\tbb* has more than 2 underscore characers. #17.1.2';}
.err-char-tbb--17-1-2 {background:orange}
.err-char-tbb-pre-17-2::after {content:'There should not be a space before a \tbb SFM #17.2';}
.err-char-tbb-pre-17-2 {border-left:5pt solid red;background:peachpuff}
.err-char-tbb-post-17-3::after {content:'There should not be a space after a \tbb* SFM #17.3';}
.err-char-tbb-post-17-3 {border-right:5pt solid red;background:peachpuff}
.err-char-tec-mid-11-1::after {content:'The first character should not be punctuation #11.1';}
.err-char-tec-mid-11-1 {background:orange}
.err-char-tec-mid-11-2::after {content:'The last character before the colon should not be punctuation unless it is a question or exclamation mark. #11.2';}
.err-char-tec-mid-11-2 {background:orange}
.err-char-tec-post-20-3::after {content:'A \\tec cannot contain a \\f ...\\f* #20.3';}
.err-char-tec-post-20-3 {border-right:5pt solid red;background:peachpuff}
.err-char-tec-mid-10-32::after {content:'The last character of this character markup \\tec should be a colon. #10.32';}
.err-char-tec-mid-10-32 {background:orange}
.err-char-tec-mid-10-31::after {content:'The last character of this \\tec should not be a space but a colon. #10.31';}
.err-char-tec-mid-10-31 {background:orange}
.err-cell-tc1--4-4::after {content:'A \\tc1 must contain either an \\sbx or the word Paragraph #4.4';}
.err-cell-tc1--4-4 {background:orange}
.err-cell-tc1--4-7::after {content:'These \\sbx should be separated by \\tbb ...\\tbb* #4.7';}
.err-cell-tc1--4-7 {background:orange}
.err-cell-tc1--4-8::after {content:'The parts of the \\sbx should be separated by a \\+tbb __\\+tbb*. #4.8';}
.err-cell-tc1--4-8 {background:orange}
.err-cell-tc1--9-11::after {content:'The hyphen in the verse range in this \\tc1 should be an en dash. #9.11';}
.err-cell-tc1--9-11 {background:orange}
.err-row-td--4-2::after {content:'The second column must be a \\tc2 in \\tr #4.2';}
.err-row-td--4-2 {}
.err-row-td--4-3::after {content:'The first column must be a \\tc1 in \\tr #4.3';}
.err-row-td--4-3 {}
.err-verse-v--9-2::after {content:'The en dash in the verse range in this \\v should be a hyphen. #9.2';}
.err-verse-v--9-2 {background:orange}
.err-verse-v--9-3::after {content:'A \\v cannot have verse parts in it. #9.3';}
.err-verse-v--9-3 {background:orange}
</style>
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
   <xsl:template match="*[@style = 'b' or @style = 'rem']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="table">
      <xsl:variable name="pos" select="position()"/>
      <xsl:element name="div">
         <xsl:attribute name="class">table<!--ref 7.2 - rank=--><xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Division') and not(preceding-sibling::*[2][name() = 'chapter'])">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'b'])">
                  <xsl:text> err-table---7-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 7.3 - rank=-->
            <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Section') and not(preceding-sibling::*[2][name() = 'chapter'])">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'b'])">
                  <xsl:text> err-table---7-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 7.4 - rank=-->
            <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Part') and not(preceding-sibling::*[2][name() = 'chapter'])">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'b'])">
                  <xsl:text> err-table--before-7-4</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 7.5 - rank=-->
            <xsl:if test="contains(row[1]/cell[1]/text(),'Paragraph') and not(preceding-sibling::*[2][name() = 'chapter'])">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'b'])">
                  <xsl:text> err-table--before-7-5</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=s5 -->
   <xsl:template match="para[@style = 's5']">
      <xsl:variable name="cprecolon" select="substring-before(.,':')"/>
      <xsl:variable name="vaftercolon" select="substring-after(.,':')"/>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 8.1 - rank=-->
            <xsl:if test="substring-before(text(),':') != preceding::chapter[1]/@number">
               <xsl:text> err-para-s5--8-1</xsl:text>
            </xsl:if>
            <!--ref 8.21 - rank=-->
            <xsl:if test="not(contains($preverse,'-')) and not(contains(.,'–'))">
               <xsl:if test="translate(substring-after(.,':'),$letlc,'') != $preverse">
                  <xsl:text> err-para-s5--8-21</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.23 - rank=-->
            <xsl:if test="contains($preverse,'-') and contains(.,'–')">
               <xsl:if test="not(translate(substring-before(substring-after(.,':'),'–'),$letlc,'')  = substring-before($preverse,'-'))">
                  <xsl:text> err-para-s5--8-23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.26 - rank=-->
            <xsl:if test="contains($preverse,'-') and not(contains(.,'–'))">
               <xsl:if test="not((translate(substring-after(.,':'),$letlc,'') = substring-before($preverse,'-') or  translate(substring-after(.,':'),$letlc,'') &gt; substring-before($preverse,'-')) and ( translate(substring-after(.,':'),$letlc,'') = substring-after($preverse,'-') )or  translate(substring-after(.,':'),$letlc,'') &lt; substring-after($preverse,'-') )">
                  <xsl:text> err-para-s5--8-26</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.3 - rank=-->
            <xsl:if test="string-length(translate(.,$validcvnumbletpunc,'')) &gt; 0">
               <xsl:text> err-para-s5--8-3</xsl:text>
            </xsl:if>
            <!--ref 8.22 - rank=5-->
            <xsl:if test="not(contains($preverse,'-')) and contains(.,'–')">
               <xsl:if test="not(translate(substring-before(substring-after(.,':'),'–'),$letlc,'')  = $preverse)">
                  <xsl:text> err-para-s5--8-22</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 9.16 - rank=8-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-$') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-#') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'#-#')">
                  <xsl:text> err-para-s5--9-16</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 8.25 - rank=10-->
            <xsl:if test="not(contains(.,':'))">
               <xsl:text> err-para-s5--8-25</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style= -->
   <xsl:template match="para">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#') and contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para---23-1</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n1 -->
   <xsl:template match="para[@style = 'n1']">
      <xsl:variable name="pren1"
                    select="count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pres5"
                    select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pren1tec"
                    select="preceding-sibling::*[@style = 'n1'][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.13 - rank=-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-$') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-#') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'#-#')">
                  <xsl:text> err-para-n1--9-13</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 10.2.1 - rank=-->
            <xsl:if test="not(node()[1][@style = 'tec']) and count(char[@style = 'tec']) = 1">
               <xsl:text> err-para-n1--10-2-1</xsl:text>
            </xsl:if>
            <!--ref 12.1 - rank=-->
            <xsl:if test="child::*[@style = 'tec'] and contains($pren1tec,$curtec)">
               <xsl:if test="$pres5 &lt; $pren1">
                  <xsl:text> err-para-n1--12-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 14.1 - rank=-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'n1' or @style = 'n2' or @style = 'n3' or @style = 'ntn' or @style = 'qp' or @style = 'b' or @style = 'b2' or @style = 'b3' or @style = 'p' or @style = 's5' or @style = 'li1' or @style = 'hb1' or @style = 's3' or name() = 'chapter'])">
               <xsl:text> err-para-n1-post-14-1</xsl:text>
            </xsl:if>
            <!--ref 10.1 - rank=5-->
            <xsl:if test="count(char[@style = 'tec']) &gt; 1">
               <xsl:text> err-para-n1--10-1</xsl:text>
            </xsl:if>
            <!--ref 10.1.4 - rank=5-->
            <xsl:if test="count(*[@style = 'tec']) = 0">
               <xsl:text> err-para-n1--10-1-4</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n2 -->
   <xsl:template match="para[@style = 'n2']">
      <xsl:variable name="pren1"
                    select="count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pres5"
                    select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pren2"
                    select="count(preceding-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pren1tec"
                    select="preceding-sibling::*[@style = 'n1'][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:variable name="pren2tec"
                    select="preceding-sibling::*[@style = 'n2'][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.14 - rank=-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-$') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-#') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'#-#')">
                  <xsl:text> err-para-n2--9-14</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 12.2 - rank=-->
            <xsl:if test="child::*[@style = 'tec'] and contains($pren2tec,$curtec)">
               <xsl:if test="$pres5 &lt; $pren2">
                  <xsl:text> err-para-n2--12-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 12.8.1 - rank=-->
            <xsl:if test="$pres5 &gt; $pren1">
               <xsl:if test="child::*[@style = 'tec']">
                  <xsl:text> err-para-n2--12-8-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 12.7 - rank=5-->
            <xsl:if test="child::*[@style = 'tec'] and not(contains($pren1tec,$curtec))">
               <xsl:if test="$pres5 &lt; $pren1">
                  <xsl:text> err-para-n2--12-7</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n3 -->
   <xsl:template match="para[@style = 'n3']">
      <xsl:variable name="pren1"
                    select="count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pres5"
                    select="count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pren2"
                    select="count(preceding-sibling::*[@style = 'n2'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pren3"
                    select="count(preceding-sibling::*[@style = 'n3'][1]/preceding-sibling::*)"/>
      <xsl:variable name="pren1tec"
                    select="preceding-sibling::*[@style = 'n1'][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:variable name="pren2tec"
                    select="preceding-sibling::*[@style = 'n2'][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:variable name="pren3tec"
                    select="preceding-sibling::*[@style = 'n3'][1]/*[@style = 'tec'][1]/text()"/>
      <xsl:variable name="curtec" select="translate(*[@style = 'tec'][1]/text(), ':','')"/>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.15 - rank=-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-$') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'$-#') or contains(translate(.,$validcvnumblet,$validcvnumbletsub),'#-#')">
                  <xsl:text> err-para-n3--9-15</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 10.2.2 - rank=-->
            <xsl:if test="not(node()[1][@style = 'tec']) and count(char[@style = 'tec']) = 1">
               <xsl:text> err-para-n3--10-2-2</xsl:text>
            </xsl:if>
            <!--ref 12.8.2 - rank=-->
            <xsl:if test="$pres5 &gt; $pren1">
               <xsl:text> err-para-n3--12-8-2</xsl:text>
            </xsl:if>
            <!--ref 12.8.3 - rank=-->
            <xsl:if test="not(contains($pren1tec,$curtec))">
               <xsl:text> err-para-n3--12-8-3</xsl:text>
            </xsl:if>
            <!--ref 10.1.3 - rank=5-->
            <xsl:if test="count(char[@style = 'tec']) &gt; 1">
               <xsl:text> err-para-n3--10-1-3</xsl:text>
            </xsl:if>
            <!--ref 10.1.5 - rank=5-->
            <xsl:if test="count(char[@style = 'tec']) = 0">
               <xsl:text> err-para-n3--10-1-5</xsl:text>
            </xsl:if>
            <!--ref 12.3 - rank=5-->
            <xsl:if test="child::*[@style = 'tec'] and contains($pren3tec,$curtec)">
               <xsl:if test="$pres5 &lt; $pren3">
                  <xsl:text> err-para-n3--12-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 12.6 - rank=5-->
            <xsl:if test="child::*[@style = 'tec'] and not(contains($pren2tec,$curtec))">
               <xsl:if test="$pres5 &lt; $pren2">
                  <xsl:text> err-para-n3--12-6</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=qp -->
   <xsl:template match="para[@style = 'qp']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 14.2 - rank=-->
            <xsl:if test="preceding-sibling::*[1][@style = 'qp']">
               <xsl:text> err-para-qp-pre-14-2</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=ntn -->
   <xsl:template match="para[@style = 'ntn']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 18.1 - rank=-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 's3' or @style = 's5' or @style = 'ntn' or name() = 'table' or @style = 'ntn'])">
               <xsl:text> err-para-ntn-pre-18-1</xsl:text>
            </xsl:if>
            <!--ref 22.8 - rank=-->
            <xsl:if test="*[@style = 'fig']">
               <xsl:if test="not(*[@style = 'f'] )">
                  <xsl:text> err-para-ntn--22-8</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.9 - rank=-->
            <xsl:if test="*[@style = 'fig']">
               <xsl:if test="not(*[@style = 'jmp'] )">
                  <xsl:text> err-para-ntn--22-9</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24.1 - rank=-->
            <xsl:if test="char[@style = 'tec']">
               <xsl:text> err-para-ntn--24-1</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b2 -->
   <xsl:template match="para[@style = 'b2']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 23.2 - rank=-->
            <xsl:if test="following-sibling::*[1][@style = 'b']">
               <xsl:text> err-para-b2--23-2</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b -->
   <xsl:template match="para[@style = 'b']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 23.3 - rank=-->
            <xsl:if test="following-sibling::*[1][@style = 'b2']">
               <xsl:text> err-para-b--23-3</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=s3 -->
   <xsl:template match="para[@style = 's3']">
      <xsl:variable name="vaftercolon" select="substring-after(.,':')"/>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:variable name="lastlet" select="substring(.,string-length(.),1)"/>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 19.4 - rank=-->
            <xsl:if test="not(contains(substring-after(text(),':'),'–')) and not(contains(substring-after(text(),':'),'-'))">
               <xsl:if test="translate($vaftercolon,$validvletpunc,'') != $preverse">
                  <xsl:text> err-para-s3--19-4</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 19.5 - rank=-->
            <xsl:if test="contains(translate($vaftercolon,$validvlet,$validvletsub),'$–$')">
               <xsl:if test="translate($vaftercolon,$validvletpunc,'') != $preverse">
                  <xsl:text> err-para-s3--19-5</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 19.6 - rank=-->
            <xsl:if test="(contains(translate($vaftercolon,$numb,$numbsub),'#–#')  and (translate($lastlet,$numb,$numbsub) = '#')) or (contains(translate($vaftercolon,$validcvnumblet,$validcvnumbletsub),'#$–#')  and (translate($lastlet,$numb,$numbsub) = '#'))">
               <xsl:if test="not(substring-after($vaftercolon,'–') = $preverse)">
                  <xsl:text> err-para-s3--19-6</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 19.7 - rank=-->
            <xsl:if test="translate($lastlet,$validvlet,$validvletsub) = '$'">
               <xsl:if test="substring(text(),string-length(text()),1) != substring(preceding::*[@style = 's5'][1]/text(),string-length(preceding::*[@style = 's5'][1]/text()),1)">
                  <xsl:text> err-para-s3--19-7</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 19.8 - rank=-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ntn'])">
               <xsl:text> err-para-s3--19-8</xsl:text>
            </xsl:if>
            <!--ref 19.3 - rank=5-->
            <xsl:if test="substring-before(translate(text(),concat($letulc,' '),'') ,':') != preceding::chapter[1]/@number">
               <xsl:text> err-para-s3--19-3</xsl:text>
            </xsl:if>
            <!--ref 19.1 - rank=6-->
            <xsl:if test="not(contains(text(),'General Comment on'))">
               <xsl:text> err-para-s3--19-1</xsl:text>
            </xsl:if>
            <!--ref 19.2 - rank=6-->
            <xsl:if test="not(contains(translate(.,$numb,$numbsub),'#:#'))">
               <xsl:text> err-para-s3--19-2</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b3 -->
   <xsl:template match="para[@style = 'b3']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 7.1.1 - rank=-->
            <xsl:if test="following-sibling::*[2][name() = 'table'] and preceding-sibling::*[1][name() = 'chapter']">
               <xsl:if test="following-sibling::*[1][@style = 'b']">
                  <xsl:text> err-para-b3--7-1-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 7.1.3 - rank=-->
            <xsl:if test="preceding-sibling::*[1][@style = 'b']">
               <xsl:text> err-para-b3--7-1-3</xsl:text>
            </xsl:if>
            <!--ref 1.1 - rank=8-->
            <xsl:if test="not(verse)">
               <xsl:text> err-para-b3--1-1</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=p -->
   <xsl:template match="para[@style = 'p']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 7.1.2 - rank=-->
            <xsl:if test="following-sibling::*[2][name() = 'table'] and preceding-sibling::*[1][name() = 'chapter']">
               <xsl:if test="following-sibling::*[1][@style = 'b']">
                  <xsl:text> err-para-p--7-1-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 7.1.4 - rank=-->
            <xsl:if test="preceding-sibling::*[1][@style = 'b']">
               <xsl:text> err-para-p--7-1-4</xsl:text>
            </xsl:if>
            <!--ref 1.2 - rank=8-->
            <xsl:if test="not(verse)">
               <xsl:text> err-para-p--1-2</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <xsl:template match="note[@style = 'f']">
      <xsl:variable name="curpos" select="position()"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 22.3 - rank=-->
            <xsl:if test="parent::para[@style = 'ntn'] and preceding-sibling::*[@style = 'fig']">
               <xsl:if test="$curpos != 2">
                  <xsl:text> err-note-f--22-3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 22.5 - rank=-->
            <xsl:if test="@caller != '*'">
               <xsl:text> err-note-f--22-5</xsl:text>
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
      <xsl:variable name="pos" select="position()"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 22.1 - rank=-->
            <xsl:if test="not(parent::para[@style = 'ntn'])">
               <xsl:text> err-figure-fig--22-1</xsl:text>
            </xsl:if>
            <!--ref 22.21 - rank=-->
            <xsl:if test="not(position() = 1)">
               <xsl:text> err-figure-fig--22-21</xsl:text>
            </xsl:if>
            <!--ref 22.6 - rank=-->
            <xsl:if test="not(substring-before(substring-after(@ref,' '),'.') = preceding::chapter[1]/@number)">
               <xsl:text> err-figure-fig--22-6</xsl:text>
            </xsl:if>
            <!--ref 22.7 - rank=-->
            <xsl:if test="not(substring-after(substring-after(@ref,' '),'.') = preceding::verse[1]/@number)">
               <xsl:text> err-figure-fig--22-7</xsl:text>
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
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 22.4 - rank=-->
            <xsl:if test="parent::para[@style = 'ntn'] and preceding-sibling::*[@style = 'fig'] and preceding-sibling::*[@style = 'f']">
               <xsl:if test="$curpos != 3">
                  <xsl:text> err-link-jmp--22-4</xsl:text>
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
   <xsl:template match="char[@style = 'sbx']">
      <xsl:param name="embedded"/>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:variable name="lastchar2" select="substring(.,string-length(.) - 1,1)"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--style specific errors-->
            <!--ref 9.12 - rank=-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#') and contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
               <xsl:text> err-char-sbx--9-12</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'trs']">
      <xsl:param name="embedded"/>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:variable name="lastchar2" select="substring(.,string-length(.) - 1,1)"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--style specific errors-->
            <!--ref 10.4 - rank=-->
            <xsl:if test="not(preceding-sibling::*[@style = 'tec'])">
               <xsl:text> err-char-trs-mid-10-4</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'tbb']">
      <xsl:param name="embedded"/>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:variable name="lastchar2" select="substring(.,string-length(.) - 1,1)"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--style specific errors-->
            <!--ref 17.1.1 - rank=-->
            <xsl:if test="text() = '_'">
               <xsl:text> err-char-tbb--17-1-1</xsl:text>
            </xsl:if>
            <!--ref 17.1.2 - rank=-->
            <xsl:if test="text() = '___' or text() = '____'">
               <xsl:text> err-char-tbb--17-1-2</xsl:text>
            </xsl:if>
            <!--ref 17.2 - rank=5-->
            <xsl:if test="substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1) = ' '">
               <xsl:text> err-char-tbb-pre-17-2</xsl:text>
            </xsl:if>
            <!--ref 17.3 - rank=10-->
            <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
               <xsl:text> err-char-tbb-post-17-3</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'tec']">
      <xsl:param name="embedded"/>
      <xsl:variable name="lastchar" select="substring(.,string-length(.),1)"/>
      <xsl:variable name="lastchar2" select="substring(.,string-length(.) - 1,1)"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--style specific errors-->
            <!--ref 11.1 - rank=-->
            <xsl:if test="translate(substring(.,1,1),$invalidtecfirstpunc,'%%') = '%'">
               <xsl:text> err-char-tec-mid-11-1</xsl:text>
            </xsl:if>
            <!--ref 11.2 - rank=-->
            <xsl:if test="translate($lastchar2,$invalidtecendpunc,$invalidtecendpuncsub) = '%'">
               <xsl:text> err-char-tec-mid-11-2</xsl:text>
            </xsl:if>
            <!--ref 20.3 - rank=-->
            <xsl:if test="*[@style = 'f']">
               <xsl:text> err-char-tec-post-20-3</xsl:text>
            </xsl:if>
            <!--ref 10.32 - rank=3-->
            <xsl:if test="not($lastchar = ':')">
               <xsl:text> err-char-tec-mid-10-32</xsl:text>
            </xsl:if>
            <!--ref 10.31 - rank=5-->
            <xsl:if test="$lastchar = ' '">
               <xsl:text> err-char-tec-mid-10-31</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:value-of select="concat('\',@style,'*')"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="cell">
      <xsl:variable name="pos" select="position()"/>
      <xsl:element name="span">
         <xsl:attribute name="class">cell <xsl:value-of select="@style"/>
            <!--ref 4.4 - rank=-->
            <xsl:if test="count(following-sibling::cell) = 0 and @style = 'tc1'">
               <xsl:if test="not(*[@style = 'sbx'] or contains(text(),'Paragraph'))">
                  <xsl:text> err-cell-tc1--4-4</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.7 - rank=-->
            <xsl:if test="count(*[@style = 'sbx']) &gt; 1">
               <xsl:if test="not(count(*[@style = 'sbx'])  = count(*[@style = 'tbb']) + 1)">
                  <xsl:text> err-cell-tc1--4-7</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4.8 - rank=-->
            <xsl:if test="count(*[@style = 'sbx']) = 1">
               <xsl:if test="not(*/*[@style = '+tbb'])">
                  <xsl:text> err-cell-tc1--4-8</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 9.11 - rank=8-->
            <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                  <xsl:text> err-cell-tc1--9-11</xsl:text>
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
            <xsl:if test="cell[2]/@style = 'tc1'">
               <xsl:text> err-row-td--4-2</xsl:text>
            </xsl:if>
            <!--ref 4.3 - rank=-->
            <xsl:if test="cell[1]/@style = 'tc2'">
               <xsl:text> err-row-td--4-3</xsl:text>
            </xsl:if>
            <!--ref 4.2 - rank=-->
            <xsl:if test="cell[2]/@style = 'tc1'">
               <xsl:text> err-row-td--4-2</xsl:text>
            </xsl:if>
            <!--ref 4.3 - rank=-->
            <xsl:if test="cell[1]/@style = 'tc2'">
               <xsl:text> err-row-td--4-3</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
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
            <!--ref 9.2 - rank=-->
            <xsl:if test="contains(@number,'–')">
               <xsl:text> err-verse-v--9-2</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$-#') or contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$')">
               <xsl:text> err-verse-v--9-3</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ',@number,' ')"/>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>

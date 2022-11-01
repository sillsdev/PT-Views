<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:variable name="para-like" select="'para table row book'"/>
   <xsl:variable name="dq">"</xsl:variable>
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
                .v {color:forestgreen;font-size:80%;font-weight:bold;}
                .err-table---3-1::after {content:'The \\tr is not followed by a \\s5 after a \\ntn #3.1';}
.err-table---3-1 {border-bottom:2pt solid red}
.err-table---4-1::after {content:'The \\tr should be preceeded by a \\b #4.1';}
.err-table---4-1 {border-bottom:2pt solid red}
.err-table---4-2::after {content:'The paragraph agter a \\tr should be a \\ntn #4.2';}
.err-table---4-2 {border-bottom:2pt solid red}
.err-table---4-3::after {content:'Only one column \\tc1 can occur in \\tr #4.3';}
.err-table---4-3 {border-bottom:2pt solid red}
.err-table--post-6-1::after {content:'When you have a '\\tr \tc1 \\sbx Part ...' the following \\tr should have have '\\tr \tc1 \\sbx Division ...' #6.1';}
.err-table--post-6-1 {border-bottom:2pt solid red}
.err-table--post-6-2::after {content:'When you have a '\\tr \tc1 \\sbx Division ...' the following \\tr should have have '\\tr \tc1 \\sbx Section ...' #6.2';}
.err-table--post-6-2 {border-bottom:2pt solid red}
.err-table--post-6-3::after {content:'When you have a '\\tr \tc1 \\sbx Section ...' the following \\tr should have have '\\tr \tc1 Paragraph ...' #6.3';}
.err-table--post-6-3 {border-bottom:2pt solid red}
.err-para-b3--1-1::after {content:'A \\b3 paragraph must contain a \\v. #1.1';}
.err-para-b3--1-1 {border-bottom:2pt solid red}
.err-para-b3--7-1::after {content:'A \\b para should not follow a  #7.1';}
.err-para-b3--7-1 {border-bottom:2pt solid red}
.err-para-s5-pre-5-1::after {content:'A \\b3 must occur before a \\s5 #5.1';}
.err-para-s5-pre-5-1 {border-top:2pt solid red}
.err-para-s5--8-1::after {content:'The Chapter number in \\s5 should match the preceeding chapter number from \\c  #8.1';}
.err-para-s5--8-1 {border-bottom:2pt solid red}
.err-para-s5--8-2::after {content:'This verse number in \\s5 should match the preceding normallly hidden \\v number in a \\b3 paragraph. #8.2';}
.err-para-s5--8-2 {border-bottom:2pt solid red}
.err-para---9-1::after {content:'This verse range contains a hyphen. #9.1';}
.err-para---9-1 {border-bottom:2pt solid red}
.err-para---9-3::after {content:'This verse range should not start with a letter following the first number #9.3';}
.err-para---9-3 {border-bottom:2pt solid red}
.err-para---23-1::after {content:'This paragraph type should not be empty. #23.1';}
.err-para---23-1 {border-bottom:2pt solid red}
.err-para-n1--10-1::after {content:'There should be one and only one \\tec per \\n1 paragraph. #10.1';}
.err-para-n1--10-1 {border-bottom:2pt solid red}
.err-para-n1--10-5::after {content:'Any repeat of the words found in \\tec should be in \\trs not in \\tei #10.5';}
.err-para-n1--10-5 {border-bottom:2pt solid red}
.err-para-n1--14-1::after {content:'Only these paragraphs: \\n2 \\n3 \\qp are allowed after a \\n1 #14.1';}
.err-para-n1--14-1 {border-bottom:2pt solid red}
.err-para-ni--10-2::after {content:'The first part of a \\n1 paragraph is always the \\tec ...\\tec* character markup. #10.2';}
.err-para-ni--10-2 {border-bottom:2pt solid red}
.err-para-n3--13-1::after {content:'There should be a \\tec character style in this \\n3 paragraph #13.1';}
.err-para-n3--13-1 {border-bottom:2pt solid red}
.err-para-n4--13-2::after {content:'The \\tec should be the first item in the paragraph #13.2';}
.err-para-n4--13-2 {border-bottom:2pt solid red}
.err-para-qp-post-14-2::after {content:'You are not allowed two \\qp paragraphs one after another #14.2';}
.err-para-qp-post-14-2 {border-bottom:2pt solid red}
.err-figure-fig--22-1::after {content:'A \\fig must only occur in a \\ntn paragraph #22.1';}
.err-figure-fig--22-1 {}
.err-figure-fig--22-2::after {content:'There should not be other content #22.2';}
.err-figure-fig--22-2 {}
.err-char-sbx--4-5::after {content:'A \\tbb must follow a \\sbx #4.5';}
.err-char-sbx--4-5 {background:orange}
.err-char-sbx--9-12::after {content:'The verse range in this character markup \\sbx should not contain a hyphen. #9.12';}
.err-char-sbx--9-12 {background:orange}
.err-char-tec--10-31::after {content:'The last character of this character markup \\tec should not be a space. #10.31';}
.err-char-tec--10-31 {background:orange}
.err-char-tec--10-32::after {content:'The last character of this character markup \\tec should be a colon. #10.32';}
.err-char-tec--10-32 {background:orange}
.err-char-tec-pre-11-1::after {content:'The first character should not be a punctuation #11.1';}
.err-char-tec-pre-11-1 {border-left:5pt solid red;background:peachpuff}
.err-char-tec-post-11-2::after {content:'The last character before the colon should not be punctuation unless it is a question mark. #11.2';}
.err-char-tec-post-11-2 {border-right:5pt solid red;background:peachpuff}
.err-char-trs--10-4::after {content:'A \\tec should precede this \\trs in the paragraph. #10.4';}
.err-char-trs--10-4 {background:orange}
.err-cell-tc1--9-11::after {content:'The verse range in this \\tc1 should not contain a hyphen. #9.11';}
.err-cell-tc1--9-11 {background:orange}
.err-verse-v--9-2::after {content:'This verse reference contains an en dash hyphen it should contain a. #9.2';}
.err-verse-v--9-2 {background:orange}
</style>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:text>\c </xsl:text>
         <xsl:value-of select="@number"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse[@number]">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:text>\v </xsl:text>
         <xsl:value-of select="@number"/>
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
   <xsl:template match="table[@style = '']">
      <xsl:element name="div">
         <xsl:attribute name="class">table</xsl:attribute>
         <!--ref 3.1 - rank=-->
         <xsl:if test="not(following-sibling::*[2][@style = 's5'] and following-sibling::*[1][@style = 'ntn'])">
            <xsl:text> err-table---3-1</xsl:text>
         </xsl:if>
         <!--ref 4.1 - rank=-->
         <xsl:if test="not(preceding-sibling::*[1][@style = 'b'])">
            <xsl:text> err-table---4-1</xsl:text>
         </xsl:if>
         <!--ref 4.2 - rank=-->
         <xsl:if test="not(following-sibling::*[1][@style = 'ntn'])">
            <xsl:text> err-table---4-2</xsl:text>
         </xsl:if>
         <!--ref 4.3 - rank=-->
         <xsl:if test="not(count(*) = 1 and count(*/cell) =1 and */cell[1]/@style = 'tc1')">
            <xsl:text> err-table---4-3</xsl:text>
         </xsl:if>
         <!--ref 6.1 - rank=-->
         <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Part ') and not(count(following-sibling::table[1]/row) &gt; 1)">
            <xsl:if test="not(contains(following-sibling::table[1]/row[1]/cell[1]/char[1]/text(),'Division '))">
               <xsl:text> err-table--post-6-1</xsl:text>
            </xsl:if>
         </xsl:if>
         <!--ref 6.2 - rank=-->
         <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Division ')">
            <xsl:if test="not(contains(following-sibling::table[1]/row[1]/cell[1]/char[1]/text(),'Section '))">
               <xsl:text> err-table--post-6-2</xsl:text>
            </xsl:if>
         </xsl:if>
         <!--ref 6.3 - rank=-->
         <xsl:if test="contains(row[1]/cell[1]/char[1]/text(),'Section ')">
            <xsl:if test="not(contains(following-sibling::table[1]/row[1]/cell[1]/text(),'Paragraph '))">
               <xsl:text> err-table--post-6-3</xsl:text>
            </xsl:if>
         </xsl:if>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b3 -->
   <xsl:template match="para[@style = 'b3']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 1.1 - rank=-->
            <xsl:if test="not(verse)">
               <xsl:text> err-para-b3--1-1</xsl:text>
            </xsl:if>
            <!--ref 7.1 - rank=-->
            <xsl:if test="following-sibling::*[2][name() = 'table']">
               <xsl:if test="following-sibling::*[@style = 'b']">
                  <xsl:text> err-para-b3--7-1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=s5 -->
   <xsl:template match="para[@style = 's5']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 5.1 - rank=-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b3'])">
               <xsl:text> err-para-s5-pre-5-1</xsl:text>
            </xsl:if>
            <!--ref 8.1 - rank=-->
            <xsl:if test="substring-before(text(),':') != preceding::chapter[1]/@number">
               <xsl:text> err-para-s5--8-1</xsl:text>
            </xsl:if>
            <!--ref 8.2 - rank=-->
            <xsl:if test="not(translate(substring-after(.,':'),'abcdefg','') = preceding::verse/@number)">
               <xsl:text> err-para-s5--8-2</xsl:text>
            </xsl:if>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n1 -->
   <xsl:template match="para[@style = 'n1']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 10.1 - rank=-->
            <xsl:if test="count(char[@style = 'tec']) != 1">
               <xsl:text> err-para-n1--10-1</xsl:text>
            </xsl:if>
            <!--ref 10.5 - rank=-->
            <xsl:if test="char[@style = 'tei']">
               <xsl:text> err-para-n1--10-5</xsl:text>
            </xsl:if>
            <!--ref 14.1 - rank=-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'n1' or @style = 'n2' or @style = 'n3' or @style = 'qp'])">
               <xsl:text> err-para-n1--14-1</xsl:text>
            </xsl:if>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=ni -->
   <xsl:template match="para[@style = 'ni']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 10.2 - rank=-->
            <xsl:if test="not(node()[1]/@style = 'tec')">
               <xsl:text> err-para-ni--10-2</xsl:text>
            </xsl:if>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n3 -->
   <xsl:template match="para[@style = 'n3']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 13.1 - rank=-->
            <xsl:if test="not(*[@style = 'tec'])">
               <xsl:text> err-para-n3--13-1</xsl:text>
            </xsl:if>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <!-- para @style=n4 -->
   <xsl:template match="para[@style = 'n4']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 13.2 - rank=-->
            <xsl:if test="not(node()[1] = *[@style = 'tec'])">
               <xsl:text> err-para-n4--13-2</xsl:text>
            </xsl:if>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
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
            <xsl:if test="following-sibling::*[1][@style = 'qp']">
               <xsl:text> err-para-qp-post-14-2</xsl:text>
            </xsl:if>
            <!--ref 9.1 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
               <xsl:text> err-para---9-1</xsl:text>
            </xsl:if>
            <!--ref 9.3 - rank=-->
            <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'Xb–X') or contains(translate(.,'1234567890','XXXXXXXXXX'),'Xc–X')">
               <xsl:text> err-para---9-3</xsl:text>
            </xsl:if>
            <!--ref 23.1 - rank=-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not=b">
                  <xsl:text> err-para---23-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <xsl:template match="figure[@style = 'fig']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 22.1 - rank=-->
            <xsl:if test="not(parent::para[@style = 'ntn'])">
               <xsl:text> err-figure-fig--22-1</xsl:text>
            </xsl:if>
            <!--ref 22.2 - rank=-->
            <xsl:if test="string-length(preceding-sibling[1]) &gt; 0">
               <xsl:text> err-figure-fig--22-2</xsl:text>
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
   <xsl:template match="char[@style = 'sbx']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--style specific errors-->
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:if test="$embedded = '1' and name() = 'char'">
            <xsl:text>+</xsl:text>
         </xsl:if>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:if test="$embedded = '1' and name() = 'char'">
               <xsl:text>+</xsl:text>
            </xsl:if>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'tec']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--style specific errors-->
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:if test="$embedded = '1' and name() = 'char'">
            <xsl:text>+</xsl:text>
         </xsl:if>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:if test="$embedded = '1' and name() = 'char'">
               <xsl:text>+</xsl:text>
            </xsl:if>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'trs']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--style specific errors-->
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:if test="$embedded = '1' and name() = 'char'">
            <xsl:text>+</xsl:text>
         </xsl:if>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="1"/>
         </xsl:apply-templates>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:if test="$embedded = '1' and name() = 'char'">
               <xsl:text>+</xsl:text>
            </xsl:if>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="cell">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <!--ref 9.11 - rank=-->
         <xsl:if test="contains(translate(.,'1234567890','XXXXXXXXXX'),'X-X')">
            <xsl:text> err-cell-tc1--9-11</xsl:text>
         </xsl:if>
         <xsl:text>\tc1 </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse[@style = 'v']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">verse-attrib<!--ref 9.2 - rank=--><xsl:if test="contains(@number,'–')">
                  <xsl:text> err-verse-v--9-2</xsl:text>
               </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>

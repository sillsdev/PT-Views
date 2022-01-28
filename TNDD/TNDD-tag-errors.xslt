<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:variable name="para-like" select="'para table row book'"/>
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
		.err-table--pre-70::after {content:'The preceding is not \\p or \\b2 or \\b #70';}
.err-table--pre-70 {border-top:2pt solid red}
.err-table--pre-64::after {content:'The preceding is not \\b or \\b3 #64';}
.err-table--pre-64 {border-top:2pt solid red}
.err-table--post-65::after {content:'The following is not \\p or \\sl1 #65';}
.err-table--post-65 {border-bottom:2pt solid red}
.err-table---46::after {content:'There should only be one \\tr here. #46';}
.err-table---46 {border-bottom:2pt solid red}
.err-para---43::after {content:'This paragraph marker is empty, and may not be allowed here. #43';}
.err-para---43 {border-bottom:2pt solid red}
.err-para-b--25::after {content:'This \\b SFM is not allowed here, After Verse 1 and before a section header in \\tr. #25';}
.err-para-b--25 {border-bottom:2pt solid red}
.err-para-b-post-55::after {content:'The following is not \\p or \\sl1 or \\tr or \\b3 or \\c or \\b or \\mt_ or \\ntn #55';}
.err-para-b-post-55 {border-bottom:2pt solid red}
.err-para-b-pre-58::after {content:'The preceding is not \\p or \\io1 or \\ml1 or \\ntn or \\b or \\mt_ or \\pra or \\tr or \\c #58';}
.err-para-b-pre-58 {border-top:2pt solid red}
.err-para-b-pre-80::after {content:'A \\b is not allowed between a \\c and a \\p #80';}
.err-para-b-pre-80 {border-top:2pt solid red}
.err-para-b--81::after {content:'A \\b is not allowed between a \\p and a \\sl1 or \\tr #81';}
.err-para-b--81 {border-bottom:2pt solid red}
.err-para-pvr-pre-71::after {content:'The preceding is not \\tr or \\sl1 or \\ml1 #71';}
.err-para-pvr-pre-71 {border-top:2pt solid red}
.err-para-pvr-post-50::after {content:'The preceding is not \\p or \\b2 or \\b #50';}
.err-para-pvr-post-50 {border-bottom:2pt solid red}
.err-para-sla-post-52::after {content:'The following is not \\gn or \\ml1 or \\sl1 #52';}
.err-para-sla-post-52 {border-bottom:2pt solid red}
.err-para-sla-pre-63::after {content:'The preceding is not \\sl1 or \\pvr or \\ml1 or \\b2 #63';}
.err-para-sla-pre-63 {border-top:2pt solid red}
.err-para-gn-post-53::after {content:'The following is not \\ml1 #53';}
.err-para-gn-post-53 {border-bottom:2pt solid red}
.err-para-gn-pre-54::after {content:'The preceding is not \\sl1 or \\sla #54';}
.err-para-gn-pre-54 {border-top:2pt solid red}
.err-para-heb-pre-59::after {content:'The preceding is not \\sla #59';}
.err-para-heb-pre-59 {border-top:2pt solid red}
.err-para-heb-post-60::after {content:'The following is not \\ml1 #60';}
.err-para-heb-post-60 {border-bottom:2pt solid red}
.err-para-mlor--37::after {content:'The content of this \\\mlor SFM can only be: -or- #37';}
.err-para-mlor--37 {border-bottom:2pt solid red}
.err-para-mlor-post-35::after {content:'There is no \\ml1 line following this \\mlor. Delete this line or addd a \\ml1 line #35';}
.err-para-mlor-post-35 {border-bottom:2pt solid red}
.err-para-mlor-pre-36::after {content:'A \\ml1 should preceed this \\mlor #36';}
.err-para-mlor-pre-36 {border-top:2pt solid red}
.err-para-sl1--68::after {content:'The verse reference in \\sl1 appears to have a space in it. #68';}
.err-para-sl1--68 {border-bottom:2pt solid red}
.err-para-sl1-pre-69::after {content:'The preceding is not \\ml1 or \\mlor or \\mt9 or \\ntn or \\p or \\pvr or \\sla or \\tr or \\b3 or \\b #69';}
.err-para-sl1-pre-69 {border-top:2pt solid red}
.err-para-sl1--51::after {content:'This paragraph is missing a \\tbb __\\tbb* after the verse reference. #51';}
.err-para-sl1--51 {border-bottom:2pt solid red}
.err-para-sl1-post-41::after {content:'The paragraph following this paragraph should be \\ml1 or \\sla or this should be a \\sla instead. #41';}
.err-para-sl1-post-41 {border-bottom:2pt solid red}
.err-para-ml1-pre-30::after {content:'The paragraph before this paragraph should be \\sl1 or \\mlor #30';}
.err-para-ml1-pre-30 {border-top:2pt solid red}
.err-para-ml1-pre-31::after {content:'The preceding \\ml1 has a ¶\\tbb __\\tbb* so this one should too. #31';}
.err-para-ml1-pre-31 {border-top:2pt solid red}
.err-para-ml1--32::after {content:'There is no ¶\\tbb __\\tbb* in this paragraph. It follows a section header \\tr so it is required. #32';}
.err-para-ml1--32 {border-bottom:2pt solid red}
.err-para-ml1-post-61::after {content:'The following is not \\mlor or \\sl1 or \\p or \\b or \\b3 or \\c #61';}
.err-para-ml1-post-61 {border-bottom:2pt solid red}
.err-para-ml1-post-78::after {content:'There should be a \\b immediately after this \\ml1 #78';}
.err-para-ml1-post-78 {border-bottom:2pt solid red}
.err-para-ml1--26::after {content:'A Pilcrow character ¶ should be followed by a \\tbb at the start of this paragraph #26';}
.err-para-ml1--26 {border-bottom:2pt solid red}
.err-para-ml1--29::after {content:'The \\tbb SFM should be second after a ¶ paragraph marker #29';}
.err-para-ml1--29 {border-bottom:2pt solid red}
.err-para-ml1--33::after {content:'This \\ml1 should not be empty. If there is no content, remove it and the \\mlor preceding it. #33';}
.err-para-ml1--33 {border-bottom:2pt solid red}
.err-para-p-pre-62::after {content:'The preceding is not \\b or \\b3 or \\ml1 or \\c or \\tr or \\sl1 or \\mt2 #62';}
.err-para-p-pre-62 {border-top:2pt solid red}
.err-para-p-post-79::after {content:'There should not be a \\b after this, but it could go before #79';}
.err-para-p-post-79 {border-bottom:2pt solid red}
.err-para-p-pre-40::after {content:'The preceding \\p is not allowed here. #40';}
.err-para-p-pre-40 {border-top:2pt solid red}
.err-para-pra-pre-72::after {content:'The preceding is not \\ntn #72';}
.err-para-pra-pre-72 {border-top:2pt solid red}
.err-para-ntn-pre-73::after {content:'The preceding is not \\tr or \\pra or \\ntn or \\mt_ or \\li1 #73';}
.err-para-ntn-pre-73 {border-top:2pt solid red}
.err-char-fr--76::after {content:'The verse reference is not a number. #76';}
.err-char-fr--76 {background:orange}
.err-char-fr--75::after {content:'The chapter reference is not a number #75';}
.err-char-fr--75 {background:orange}
.err-char-imp-post-12::after {content:'This \\imp SFM should be followed like this \\imp...\\imp*\\bk ⌋\\bk* #12';}
.err-char-imp-post-12 {border-right:5pt solid red;background:peachpuff}
.err-char-imp-pre-13::after {content:'This \\imp...\\imp* should be preceded by \\bk ⌊\\bk* or a \\rgi and a space. #13';}
.err-char-imp-pre-13 {border-left:5pt solid red;background:peachpuff}
.err-char-rgi-pre-15::after {content:'This \\rgi SFM should not be preceeded by a space. #15';}
.err-char-rgi-pre-15 {border-left:5pt solid red;background:peachpuff}
.err-char-rgi-post-47::after {content:'This \\rgi should only be followed by a space or colon  or right double quote or em dash. #47';}
.err-char-rgi-post-47 {border-right:5pt solid red;background:peachpuff}
.err-char-rgi--49::after {content:'This \\rgi SFM should be embedded in a \\imp SFM like this \\+rgi #49';}
.err-char-rgi--49 {background:orange}
.err-char-rgm-pre-16::after {content:'This \\rgm SFM should not be preceeded by a space. #16';}
.err-char-rgm-pre-16 {border-left:5pt solid red;background:peachpuff}
.err-char-rgm-post-48::after {content:'This \\rgm should only be followed by a space or colon or right double quote or em dash. #48';}
.err-char-rgm-post-48 {border-right:5pt solid red;background:peachpuff}
.err-char-tbb--17::after {content:'There should be only two underscore characters in the \tbb __\tbb*. #17';}
.err-char-tbb--17 {background:orange}
.err-char-tbb-pre-18::after {content:'There should not be a space before a \tbb SFM #18';}
.err-char-tbb-pre-18 {border-left:5pt solid red;background:peachpuff}
.err-char-tbb-post-19::after {content:'There should not be a space after a \tbb* SFM #19';}
.err-char-tbb-post-19 {border-right:5pt solid red;background:peachpuff}
.err-char-ros--66::after {content:'There is no embedded \\+brk in this \\ros #66';}
.err-char-ros--66 {background:orange}
.err-char-brk-pre-6::after {content:'This \\brk SFM is not preceded by a space or quotes or left parenthesis #6';}
.err-char-brk-pre-6 {border-left:5pt solid red;background:peachpuff}
.err-char-brk-post-9::after {content:'This \\brk SFM is not followed by a space or punctuation #9';}
.err-char-brk-post-9 {border-right:5pt solid red;background:peachpuff}
.err-char-brk--10::after {content:'This \\brk SFM can contain only ⌊ or ⌋ but this does not match either of those. #10';}
.err-char-brk--10 {background:orange}
.err-char-brk-post-4::after {content:'This \\brk* SFM should only occur immediately before an \\imp SFM. #4';}
.err-char-brk-post-4 {border-right:5pt solid red;background:peachpuff}
.err-char-brk-pre-7::after {content:'This \\brk SFM should only occur immediately after an \\imp* SFM. #7';}
.err-char-brk-pre-7 {border-left:5pt solid red;background:peachpuff}
.err-char-brk-post-5::after {content:'There should not be a space between this \\brk and the following \\imp. #5';}
.err-char-brk-post-5 {border-right:5pt solid red;background:peachpuff}
.err-char---23::after {content:'This character SFM is empty #23';}
.err-char---23 {background:orange}
.err-char---24::after {content:'There is a space before the closing SFM. Best to put the space after the close. #24';}
.err-char---24 {background:orange}
.err-char---20::after {content:'This character SFM is not closed. No end marker was found. #20';}
.err-char---20 {background:orange}
.err-note-f-pre-56::after {content:'The preceding is not \\ros #56';}
.err-note-f-pre-56 {}
.err-note-f-post-57::after {content:'The following is not \\ros #57';}
.err-note-f-post-57 {}
.err-book-id--1::after {content:'Place holder. Impossible error #1';}
.err-book-id--1 {border-bottom:2pt solid red}
.err-cell-tc1--2::after {content:'This \\tc1 SFM should have two \\sbx SFMs #2';}
.err-cell-tc1--2 {background:orange}
.err-cell-tc1--3::after {content:'This \\tc1 SFM should have one \\tbb __\tbb* SFM #3';}
.err-cell-tc1--3 {background:orange}
.err-row-tr--44::after {content:'The SFM \tr must have a \tc1 following. #44';}
.err-row-tr--44 {border-bottom:2pt solid red}
.err-row-tr--45::after {content:'Only one \\tr is allowed in this positions. #45';}
.err-row-tr--45 {border-bottom:2pt solid red}
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
   <xsl:template match="ref">
      <xsl:apply-templates select="*"/>
   </xsl:template>
   <xsl:template match="table[@style = '']">
      <xsl:element name="div">
         <xsl:attribute name="class">table<!--ck-id 70 - rank=3--><xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'b2' or @style = 'b'])">
               <xsl:text> err-table--pre-70</xsl:text>
            </xsl:if>
            <!--ck-id 64 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b' or @style = 'b3'])">
               <xsl:text> err-table--pre-64</xsl:text>
            </xsl:if>
            <!--ck-id 65 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'sl1'])">
               <xsl:text> err-table--post-65</xsl:text>
            </xsl:if>
            <!--ck-id 46 - rank=10-->
            <xsl:if test="not(count(row) = 1)">
               <xsl:text> err-table---46</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'b']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 25 - rank=5-->
            <xsl:if test="following-sibling::*[1][name() = 'table'] or following-sibling::*[1][@style = 'sl1']">
               <xsl:if test="preceding::*[name() = 'verse'][1][@number = 1]">
                  <xsl:text> err-para-b--25</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 55 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'sl1' or name() = 'table' or @style = 'b3' or name() = 'chapter' or @style = 'b' or substring(@style,1,2) = 'mt' or @style = 'ntn'])">
               <xsl:text> err-para-b-post-55</xsl:text>
            </xsl:if>
            <!--ck-id 58 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'io1' or @style = 'ml1' or @style = 'ntn' or @style = 'b' or substring(@style,1,2) = 'mt' or @style = 'pra' or name() = 'table' or name() = 'chapter'])">
               <xsl:text> err-para-b-pre-58</xsl:text>
            </xsl:if>
            <!--ck-id 80 - rank=5-->
            <xsl:if test="preceding-sibling::*[1][@style = 'c']">
               <xsl:if test="following-sibling::*[1][@style = 'p']">
                  <xsl:text> err-para-b-pre-80</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 81 - rank=5-->
            <xsl:if test="preceding-sibling::*[1][@style = 'p'][child::*[@style = 'v']]">
               <xsl:if test="following-sibling::*[1][@style = 'sl1'] or following-sibling::*[1][name() = 'table']">
                  <xsl:text> err-para-b--81</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'pvr']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 71 - rank=3-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or name() = 'table' or @style = 'sl1' or @style = 'ml1'])">
               <xsl:text> err-para-pvr-pre-71</xsl:text>
            </xsl:if>
            <!--ck-id 50 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'sla' or @style = 'b2'])">
               <xsl:text> err-para-pvr-post-50</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'sla']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 52 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'gn' or @style = 'ml1' or @style = 'sl1'])">
               <xsl:text> err-para-sla-post-52</xsl:text>
            </xsl:if>
            <!--ck-id 63 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'pvr' or @style = 'ml1' or @style = 'b2'])">
               <xsl:text> err-para-sla-pre-63</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'gn']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 53 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
               <xsl:text> err-para-gn-post-53</xsl:text>
            </xsl:if>
            <!--ck-id 54 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'sla'])">
               <xsl:text> err-para-gn-pre-54</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'heb']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 59 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sla'])">
               <xsl:text> err-para-heb-pre-59</xsl:text>
            </xsl:if>
            <!--ck-id 60 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
               <xsl:text> err-para-heb-post-60</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'mlor']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 37 - rank=5-->
            <xsl:if test="count(*) = 0">
               <xsl:if test="not(text() = '-or-')">
                  <xsl:text> err-para-mlor--37</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 35 - rank=7-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
               <xsl:text> err-para-mlor-post-35</xsl:text>
            </xsl:if>
            <!--ck-id 36 - rank=7-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
               <xsl:text> err-para-mlor-pre-36</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'sl1']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 68 - rank=3-->
            <xsl:if test="contains(text()[1],' ')">
               <xsl:text> err-para-sl1--68</xsl:text>
            </xsl:if>
            <!--ck-id 69 - rank=3-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'mlor' or @style = 'mt9' or @style = 'ntn' or @style = 'p' or @style = 'pvr' or @style = 'sla' or name() = 'table' or @style = 'b3' or @style = 'b'])">
               <xsl:text> err-para-sl1-pre-69</xsl:text>
            </xsl:if>
            <!--ck-id 51 - rank=5-->
            <xsl:if test="not(*[@style = 'tbb'])">
               <xsl:text> err-para-sl1--51</xsl:text>
            </xsl:if>
            <!--ck-id 41 - rank=7-->
            <xsl:if test="not(child::char[@style = 'tei'])">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'sla' or @style = 'pvr' or @style = 'gn'])">
                  <xsl:text> err-para-sl1-post-41</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'ml1']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 30 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'mlor' or @style = 'sl1' or @style = 'sla' or @style = 'gn'])">
               <xsl:text> err-para-ml1-pre-30</xsl:text>
            </xsl:if>
            <!--ck-id 31 - rank=5-->
            <xsl:if test="(contains( preceding-sibling::*[2][@style = 'ml1']/text(),'¶') or preceding-sibling::*[2][@style = 'ml1']/*[1][@style  = 'tbb']) and preceding-sibling::*[1][@style = 'mlor']">
               <xsl:if test="not(child::node()[@style = 'tbb'])  or not(contains(text(),'¶'))">
                  <xsl:text> err-para-ml1-pre-31</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 32 - rank=5-->
            <xsl:if test="preceding-sibling::*[2][name() = 'table']">
               <xsl:if test="not(child::node()[@style = 'tbb'])">
                  <xsl:text> err-para-ml1--32</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 61 - rank=5-->
            <xsl:if test="count(following-sibling::*) &gt; 0">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'mlor' or @style = 'sl1' or @style = 'p' or @style = 'b' or @style = 'b3' or name() = 'chapter'])">
                  <xsl:text> err-para-ml1-post-61</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 78 - rank=5-->
            <xsl:if test="(contains(following-sibling::*[@style = 'ml1'][1]/text(),'¶') and not(following-sibling::*[2]/@style = 'c') and not(following-sibling::*[1]/@style = 'c')) and  not(following-sibling::*[1]/@style = 'mlor')">
               <xsl:if test=" not(following-sibling::*[1]/@style = 'b')">
                  <xsl:text> err-para-ml1-post-78</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 26 - rank=8-->
            <xsl:if test="(*[@style = 'tbb'] and not(contains(text(),'¶'))) or (contains(text(),'¶') and not(*[@style = 'tbb']))">
               <xsl:text> err-para-ml1--26</xsl:text>
            </xsl:if>
            <!--ck-id 29 - rank=8-->
            <xsl:if test="count(char[@style = 'tbb']) = 1">
               <xsl:if test="not(child::node()[2][@style = 'tbb'])">
                  <xsl:text> err-para-ml1--29</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 33 - rank=10-->
            <xsl:if test="string-length(text()) = 0 and count(*) = 0">
               <xsl:text> err-para-ml1--33</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'p']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 62 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b' or @style = 'b3' or @style = 'ml1' or name() = 'chapter' or name() = 'table' or @style = 'sl1' or @style = 'mt2'])">
               <xsl:text> err-para-p-pre-62</xsl:text>
            </xsl:if>
            <!--ck-id 79 - rank=5-->
            <xsl:if test="count(v) &gt; 0 and following-sibling::*[1][@style = 'b']">
               <xsl:text> err-para-p-post-79</xsl:text>
            </xsl:if>
            <!--ck-id 40 - rank=8-->
            <xsl:if test="preceding-sibling::*[1][@style = 'p'] and child::verse">
               <xsl:text> err-para-p-pre-40</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'pra']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 72 - rank=8-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ntn'])">
               <xsl:text> err-para-pra-pre-72</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="para[@style = 'ntn']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 73 - rank=8-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or name() = 'table' or @style = 'pra' or @style = 'ntn' or substring(@style,1,2) = 'mt' or @style = 'li1'])">
               <xsl:text> err-para-ntn-pre-73</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
   <xsl:template match="char[@style = 'fr']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 76 - rank=2-->
            <xsl:if test="not(translate(substring(substring-after(.,':'),1,1),'123456789','000000000') = '0')">
               <xsl:text> err-char-fr--76</xsl:text>
            </xsl:if>
            <!--ck-id 75 - rank=3-->
            <xsl:if test="not(translate(substring(substring-before(.,':'),string-length(substring-before(.,':')),1),'123456789','000000000') = '0')">
               <xsl:text> err-char-fr--75</xsl:text>
            </xsl:if>
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
   <xsl:template match="char[@style = 'imp']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 12 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
               <xsl:text> err-char-imp-post-12</xsl:text>
            </xsl:if>
            <!--ck-id 13 - rank=8-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
               <xsl:text> err-char-imp-pre-13</xsl:text>
            </xsl:if>
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
   <xsl:template match="char[@style = 'rgi']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 15 - rank=5-->
            <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
               <xsl:if test="substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1) = ' '">
                  <xsl:text> err-char-rgi-pre-15</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 47 - rank=5-->
            <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
               <xsl:if test="not(translate(substring(following-sibling::node()[1],1,1),'+ —’/”','_+++++') = '+')">
                  <xsl:text> err-char-rgi-post-47</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 49 - rank=5-->
            <xsl:if test="not(parent::*[@style = 'imp'] or preceding-sibling::*[1][@style = 'imp'])">
               <xsl:text> err-char-rgi--49</xsl:text>
            </xsl:if>
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
   <xsl:template match="char[@style = 'rgm']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 16 - rank=5-->
            <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
               <xsl:if test="substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1) = ' '">
                  <xsl:text> err-char-rgm-pre-16</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 48 - rank=5-->
            <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
               <xsl:if test="not(translate(substring(following-sibling::node()[1],1,1),'+ —’/”','_+++++') = '+')">
                  <xsl:text> err-char-rgm-post-48</xsl:text>
               </xsl:if>
            </xsl:if>
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
   <xsl:template match="char[@style = 'tbb']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 17 - rank=5-->
            <xsl:if test="not(text() = '__')">
               <xsl:text> err-char-tbb--17</xsl:text>
            </xsl:if>
            <!--ck-id 18 - rank=5-->
            <xsl:if test="substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1) = ' '">
               <xsl:text> err-char-tbb-pre-18</xsl:text>
            </xsl:if>
            <!--ck-id 19 - rank=10-->
            <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
               <xsl:text> err-char-tbb-post-19</xsl:text>
            </xsl:if>
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
   <xsl:template match="char[@style = 'ros']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 66 - rank=5-->
            <xsl:if test="not(count(char[@style = 'brk']) = 1) and not(text())">
               <xsl:text> err-char-ros--66</xsl:text>
            </xsl:if>
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
   <xsl:template match="char[@style = 'brk']">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 6 - rank=0-->
            <xsl:if test="contains(text(),'⌊') and position() &gt; 1 and not(preceding-sibling::node()[1][@style = 'tbb']) and not(substring(following-sibling::char[1][@style = 'imp'],1,1) = '’')">
               <xsl:if test="not(translate(substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1),'+ “/(‘','_+++++') = '+')">
                  <xsl:text> err-char-brk-pre-6</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 9 - rank=5-->
            <xsl:if test="contains(text(),'⌋') and not(position() = last())">
               <xsl:if test="not(translate(substring(following-sibling::node()[1],1,1),'+ ,.?!:;”’)','_++++++++++') = '+')">
                  <xsl:text> err-char-brk-post-9</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 10 - rank=5-->
            <xsl:if test="string-length(text()) != 1">
               <xsl:text> err-char-brk--10</xsl:text>
            </xsl:if>
            <!--ck-id 4 - rank=8-->
            <xsl:if test="contains(text(),'⌊') and not(parent::*[@style = 'ros'])">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'imp'])">
                  <xsl:text> err-char-brk-post-4</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 7 - rank=8-->
            <xsl:if test="contains(text(),'⌋') and not(parent::*[@style = 'ros'])">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'imp' or @style = 'rgi' or @style = ''])">
                  <xsl:text> err-char-brk-pre-7</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 5 - rank=10-->
            <xsl:if test="contains(text(),'⌊')">
               <xsl:if test="following-sibling::node()[1] = ' '">
                  <xsl:text> err-char-brk-post-5</xsl:text>
               </xsl:if>
            </xsl:if>
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
   <xsl:template match="char">
      <xsl:param name="embedded"/>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
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
   <xsl:template match="note[@style = 'f']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ck-id 23 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char---23</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---24</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char---20</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 56 - rank=5-->
            <xsl:if test="parent::*[@style = 'ml1']">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ros'])">
                  <xsl:text> err-note-f-pre-56</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 57 - rank=5-->
            <xsl:if test="parent::*[@style = 'ml1']">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ros'])">
                  <xsl:text> err-note-f-post-57</xsl:text>
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
   <xsl:template match="book[@style = 'id']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 1 - rank=0-->
            <xsl:if test="not(@code)">
               <xsl:text> err-book-id--1</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="@code"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()">
            <xsl:with-param name="embedded" select="0"/>
         </xsl:apply-templates>
      </xsl:element>
   </xsl:template>
   <xsl:template match="cell">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 2 - rank=10-->
            <xsl:if test="not(count(*[@style = 'sbx']) = 2)">
               <xsl:if test="count(preceding-sibling::chapter) &gt; 0">
                  <xsl:text> err-cell-tc1--2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 3 - rank=10-->
            <xsl:if test="not(count(*[@style = 'tbb']) = 1)">
               <xsl:if test="count(preceding-sibling::chapter) &gt; 0">
                  <xsl:text> err-cell-tc1--3</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\tc1 </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="row[@style = 'tr']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 44 - rank=5-->
            <xsl:if test="count(cell) != 1">
               <xsl:if test="count(preceding-sibling::chapter) &gt; 0">
                  <xsl:text> err-row-tr--44</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 45 - rank=10-->
            <xsl:if test="preceding-sibling::*[1][@style = 'tr']">
               <xsl:if test="preceding-sibling::chapter">
                  <xsl:text> err-row-tr--45</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para---43</xsl:text>
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
</xsl:stylesheet>
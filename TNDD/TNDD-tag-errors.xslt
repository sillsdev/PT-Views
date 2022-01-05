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
		.err-table--pre-not-p-b2-b::after {content:'The preceding is not \\p or \\b2 or \\b #70';}
.err-table--pre-not-p-b2-b {border-top:2pt solid red}
.err-table--pre-not-b-b3::after {content:'The preceding is not \\b or \\b3 #64';}
.err-table--pre-not-b-b3 {border-top:2pt solid red}
.err-table--post-not-p-sl1::after {content:'The following is not \\p or \\sl1 #65';}
.err-table--post-not-p-sl1 {border-bottom:2pt solid red}
.err-table--only-1-tr-allowed::after {content:'There should only be one \\tr here. #46';}
.err-table--only-1-tr-allowed {border-bottom:2pt solid red}
.err-para--no-content::after {content:'This paragraph marker is empty, and may not be allowed here. #43';}
.err-para--no-content {border-bottom:2pt solid red}
.err-para-b-not-b4-table::after {content:'This \\b SFM is not allowed here, After Verse 1 and before a section header in \\tr. #25';}
.err-para-b-not-b4-table {border-bottom:2pt solid red}
.err-para-b-post-not-p-sl1-tr-b3-c-b-mt#::after {content:'The following is not \\p or \\sl1 or \\tr or \\b3 or \\c or \\b or \\mt# #55';}
.err-para-b-post-not-p-sl1-tr-b3-c-b-mt# {border-bottom:2pt solid red}
.err-para-b-pre-not-p-io1-ml1-ntn-b-mt#-pra-tr::after {content:'The preceding is not \\p or \\io1 or \\ml1 or \\ntn or \\b or \\mt# or \\pra or \\tr #58';}
.err-para-b-pre-not-p-io1-ml1-ntn-b-mt#-pra-tr {border-top:2pt solid red}
.err-para-pvr-pre-not-tr-sl1-ml1::after {content:'The preceding is not \\tr or \\sl1 or \\ml1 #71';}
.err-para-pvr-pre-not-tr-sl1-ml1 {border-top:2pt solid red}
.err-para-pvr-post-not-sl1-or-sla::after {content:'The preceding is not \\p or \\b2 or \\b #50';}
.err-para-pvr-post-not-sl1-or-sla {border-bottom:2pt solid red}
.err-para-sla-post-not-gn-ml1-sl1::after {content:'The following is not \\gn or \\ml1 or \\sl1 #52';}
.err-para-sla-post-not-gn-ml1-sl1 {border-bottom:2pt solid red}
.err-para-sla-pre-not-sl1-pvr-ml1-b2::after {content:'The preceding is not \\sl1 or \\pvr or \\ml1 or \\b2 #63';}
.err-para-sla-pre-not-sl1-pvr-ml1-b2 {border-top:2pt solid red}
.err-para-gn-post-not-ml1::after {content:'The following is not \\ml1 #53';}
.err-para-gn-post-not-ml1 {border-bottom:2pt solid red}
.err-para-gn-pre-not-sl1-sla::after {content:'The preceding is not \\sl1 or \\sla #54';}
.err-para-gn-pre-not-sl1-sla {border-top:2pt solid red}
.err-para-heb-pre-not-sla::after {content:'The preceding is not \\sla #59';}
.err-para-heb-pre-not-sla {border-top:2pt solid red}
.err-para-heb-post-not-ml1::after {content:'The following is not \\ml1 #60';}
.err-para-heb-post-not-ml1 {border-bottom:2pt solid red}
.err-para-mlor-text-not-lc-or::after {content:'The content of this \\\mlor SFM can only be: -or- #37';}
.err-para-mlor-text-not-lc-or {border-bottom:2pt solid red}
.err-para-mlor-post-not-ml1::after {content:'There is no \\ml1 line following this \\mlor. Delete this line or addd a \\ml1 line #35';}
.err-para-mlor-post-not-ml1 {border-bottom:2pt solid red}
.err-para-mlor-pre-not-ml1::after {content:'A \\ml1 should preceed this \\mlor #36';}
.err-para-mlor-pre-not-ml1 {border-top:2pt solid red}
.err-para-sl1-space-in-ref::after {content:'The verse reference in \\sl1 appears to have a space in it. #68';}
.err-para-sl1-space-in-ref {border-bottom:2pt solid red}
.err-para-sl1-pre-not-ml1-mlor-mt9-ntn-p-pvr-sla-tr::after {content:'The preceding is not \\ml1 or \\mlor or \\mt9 or \\ntn or \\p or \\pvr or \\sla or \\tr #69';}
.err-para-sl1-pre-not-ml1-mlor-mt9-ntn-p-pvr-sla-tr {border-top:2pt solid red}
.err-para-sl1-not-contains-tbb::after {content:'This paragraph is missing a \\tbb __\\tbb* after the verse reference. #51';}
.err-para-sl1-not-contains-tbb {border-bottom:2pt solid red}
.err-para-sl1-post-1-not-ml1::after {content:'The paragraph following this paragraph should be \\ml1 or \\sla or this should be a \\sla instead. #41';}
.err-para-sl1-post-1-not-ml1 {border-bottom:2pt solid red}
.err-para-sl1-looks-like-sla::after {content:'Footnotes are not allowed in the \\sl1 SFM #67';}
.err-para-sl1-looks-like-sla {border-bottom:2pt solid red}
.err-para-ml1-pre-1-not-sl1-or-mlor::after {content:'The paragraph before this paragraph should be \\sl1 or \\mlor #30';}
.err-para-ml1-pre-1-not-sl1-or-mlor {border-top:2pt solid red}
.err-para-ml1-pre-has-tbb::after {content:'The preceding \\ml1 has a ¶\\tbb __\\tbb* so this one should too. #31';}
.err-para-ml1-pre-has-tbb {border-top:2pt solid red}
.err-para-ml1-no-tbb-following-tr::after {content:'There is no ¶\\tbb __\\tbb* in this paragraph. It follows a section header \\tr so it is required. #32';}
.err-para-ml1-no-tbb-following-tr {border-bottom:2pt solid red}
.err-para-ml1-post-not-mlor-sl1-p-b-b3-c::after {content:'The following is not \\mlor or \\sl1 or \\p or \\b or \\b3 or \\c #61';}
.err-para-ml1-post-not-mlor-sl1-p-b-b3-c {border-bottom:2pt solid red}
.err-para-ml1-child-but-no-text::after {content:'This \\ml1 paragraph has only character SFMs but no text. #27';}
.err-para-ml1-child-but-no-text {border-bottom:2pt solid red}
.err-para-ml1-when-tbb-not-node2::after {content:'The \\tbb SFM should be second after a ¶ paragraph marker #29';}
.err-para-ml1-when-tbb-not-node2 {border-bottom:2pt solid red}
.err-para-ml1-no-text-or-child::after {content:'This \\ml1 should not be empty. If there is no content, remove it and the \\mlor preceding it. #33';}
.err-para-ml1-no-text-or-child {border-bottom:2pt solid red}
.err-para-p-pre-not-b-b2-ml1-c-tr-sl1-mt2::after {content:'The preceding is not \\b or \\b2 or \\ml1 or \\c or \\tr or \\sl1 or \\mt2 #62';}
.err-para-p-pre-not-b-b2-ml1-c-tr-sl1-mt2 {border-top:2pt solid red}
.err-para-p-pre-p-para-not-allowed::after {content:'The preceding \\p is not allowed here. #40';}
.err-para-p-pre-p-para-not-allowed {border-top:2pt solid red}
.err-para-pra-pre-not-ntn::after {content:'The preceding is not \\ntn #72';}
.err-para-pra-pre-not-ntn {border-top:2pt solid red}
.err-para-ntn-pre-not-tr-pra-ntn-mt#-li1::after {content:'The preceding is not \\tr or \\pra or \\ntn or \\mt# or \\li1 #73';}
.err-para-ntn-pre-not-tr-pra-ntn-mt#-li1 {border-top:2pt solid red}
.err-char-fr-verse-ref::after {content:'The verse reference is not a number. #76';}
.err-char-fr-verse-ref {background:orange}
.err-char-fr-chapt-ref::after {content:'The chapter reference is not a number #75';}
.err-char-fr-chapt-ref {background:orange}
.err-char-imp-post-not-bk::after {content:'This \\imp SFM should be followed like this \\imp...\\imp*\\bk ⌋\\bk* #12';}
.err-char-imp-post-not-bk {border-right:5pt solid red;background:peachpuff}
.err-char-imp-pre-not-correct-bk-text::after {content:'This \\imp...\\imp* should be preceded by \\bk ⌊\\bk* or a \\rgi and a space. #13';}
.err-char-imp-pre-not-correct-bk-text {border-left:5pt solid red;background:peachpuff}
.err-char-rgi-pre-not-letter-or-punc::after {content:'This \\rgi SFM should not be preceeded by a space. #15';}
.err-char-rgi-pre-not-letter-or-punc {border-left:5pt solid red;background:peachpuff}
.err-char-rgi-post-char-illegal::after {content:'This \\rgi should only be followed by a space or colon  or right double quote or em dash. #47';}
.err-char-rgi-post-char-illegal {border-right:5pt solid red;background:peachpuff}
.err-char-rgi-not-embedded-in-imp::after {content:'This \\rgi SFM should be embedded in a \\imp SFM like this \\+rgi #49';}
.err-char-rgi-not-embedded-in-imp {background:orange}
.err-char-rgm-pre-not-letter-or-punc::after {content:'This \\rgm SFM should not be preceeded by a space. #16';}
.err-char-rgm-pre-not-letter-or-punc {border-left:5pt solid red;background:peachpuff}
.err-char-rgm-post-char-illegal::after {content:'This \\rgm should only be followed by a space or colon or right double quote or em dash. #48';}
.err-char-rgm-post-char-illegal {border-right:5pt solid red;background:peachpuff}
.err-char-tbb-needs-2-underscore::after {content:'There should be only two underscore characters in the \tbb __\tbb*. #17';}
.err-char-tbb-needs-2-underscore {background:orange}
.err-char-tbb-pre-space-not-allowed::after {content:'There should not be a space before a \tbb SFM #18';}
.err-char-tbb-pre-space-not-allowed {border-left:5pt solid red;background:peachpuff}
.err-char-tbb-post-space-not-allowed::after {content:'There should not be a space after a \tbb* SFM #19';}
.err-char-tbb-post-space-not-allowed {border-right:5pt solid red;background:peachpuff}
.err-char-ros-not-contain-brk::after {content:'There is no embedded \\+brk in this \\ros #66';}
.err-char-ros-not-contain-brk {background:orange}
.err-char-brk-pre-text-not-space::after {content:'This \\brk SFM is not preceded by a space or quotes or left parenthesis #6';}
.err-char-brk-pre-text-not-space {border-left:5pt solid red;background:peachpuff}
.err-char-brk-post-text-not-space-or-punc::after {content:'This \\brk SFM is not followed by a space or punctuation #9';}
.err-char-brk-post-text-not-space-or-punc {border-right:5pt solid red;background:peachpuff}
.err-char-brk-illegal-char::after {content:'This \\brk SFM can contain only ⌊ or ⌋ but this does not match either of those. #10';}
.err-char-brk-illegal-char {background:orange}
.err-char-brk-post-not-imp::after {content:'This \\brk* SFM should only occur immediately before an \\imp SFM. #4';}
.err-char-brk-post-not-imp {border-right:5pt solid red;background:peachpuff}
.err-char-brk-pre-not-imp::after {content:'This \\brk SFM should only occur immediately after an \\imp* SFM. #7';}
.err-char-brk-pre-not-imp {border-left:5pt solid red;background:peachpuff}
.err-char-brk-post-is-space::after {content:'There should not be a space between this \\brk and the following \\imp. #5';}
.err-char-brk-post-is-space {border-right:5pt solid red;background:peachpuff}
.err-char--empty-text::after {content:'This character SFM is empty #23';}
.err-char--empty-text {background:orange}
.err-char--space-b4-close-sfm::after {content:'There is a space before the closing SFM. Best to put the space after the close. #24';}
.err-char--space-b4-close-sfm {background:orange}
.err-char--not-closed::after {content:'This character SFM is not closed. No end marker was found. #20';}
.err-char--not-closed {background:orange}
.err-note-f-pre-not-ros::after {content:'The preceding is not \\ros #56';}
.err-note-f-pre-not-ros {}
.err-note-f-post-not-ros::after {content:'The following is not \\ros #57';}
.err-note-f-post-not-ros {}
.err-book-id-no-code-att::after {content:'Place holder. Impossible error #1';}
.err-book-id-no-code-att {border-bottom:2pt solid red}
.err-cell-tc1-needs-2-sbx::after {content:'This \\tc1 SFM should have two \\sbx SFMs #2';}
.err-cell-tc1-needs-2-sbx {background:orange}
.err-cell-tc1-needs-1-tbb::after {content:'This \\tc1 SFM should have one \\tbb __\tbb* SFM #3';}
.err-cell-tc1-needs-1-tbb {background:orange}
.err-row-tr-only-tc1-allowed::after {content:'The SFM \tr must have a \tc1 following. #44';}
.err-row-tr-only-tc1-allowed {border-bottom:2pt solid red}
.err-row-tr-2nd-not-allowed::after {content:'Only one \\tr is allowed in this positions. #45';}
.err-row-tr-2nd-not-allowed {border-bottom:2pt solid red}
</style>
      <xsl:element name="div">
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
               <xsl:text> err-table--pre-not-p-b2-b</xsl:text>
            </xsl:if>
            <!--ck-id 64 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b' or @style = 'b3'])">
               <xsl:text> err-table--pre-not-b-b3</xsl:text>
            </xsl:if>
            <!--ck-id 65 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'sl1'])">
               <xsl:text> err-table--post-not-p-sl1</xsl:text>
            </xsl:if>
            <!--ck-id 46 - rank=10-->
            <xsl:if test="not(count(row) = 1)">
               <xsl:text> err-table--only-1-tr-allowed</xsl:text>
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
                  <xsl:text> err-para--no-content</xsl:text>
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
            <xsl:if test="following-sibling::*[1][name() = 'table'] and preceding::*[name() = 'verse'][1][@number = 1]">
               <xsl:text> err-para-b-not-b4-table</xsl:text>
            </xsl:if>
            <!--ck-id 55 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'sl1' or name() = 'table' or @style = 'b3' or name() = 'chapter' or @style = 'b' or substring(@style,1,2) = 'mt'])">
               <xsl:text> err-para-b-post-not-p-sl1-tr-b3-c-b-mt#</xsl:text>
            </xsl:if>
            <!--ck-id 58 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'io1' or @style = 'ml1' or @style = 'ntn' or @style = 'b' or substring(@style,1,2) = 'mt' or @style = 'pra' or name() = 'table'])">
               <xsl:text> err-para-b-pre-not-p-io1-ml1-ntn-b-mt#-pra-tr</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-pvr-pre-not-tr-sl1-ml1</xsl:text>
            </xsl:if>
            <!--ck-id 50 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'sla' or @style = 'b2'])">
               <xsl:text> err-para-pvr-post-not-sl1-or-sla</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-sla-post-not-gn-ml1-sl1</xsl:text>
            </xsl:if>
            <!--ck-id 63 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'pvr' or @style = 'ml1' or @style = 'b2'])">
               <xsl:text> err-para-sla-pre-not-sl1-pvr-ml1-b2</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-gn-post-not-ml1</xsl:text>
            </xsl:if>
            <!--ck-id 54 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'sla'])">
               <xsl:text> err-para-gn-pre-not-sl1-sla</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-heb-pre-not-sla</xsl:text>
            </xsl:if>
            <!--ck-id 60 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
               <xsl:text> err-para-heb-post-not-ml1</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
                  <xsl:text> err-para-mlor-text-not-lc-or</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 35 - rank=7-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
               <xsl:text> err-para-mlor-post-not-ml1</xsl:text>
            </xsl:if>
            <!--ck-id 36 - rank=7-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
               <xsl:text> err-para-mlor-pre-not-ml1</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-sl1-space-in-ref</xsl:text>
            </xsl:if>
            <!--ck-id 69 - rank=3-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'mlor' or @style = 'mt9' or @style = 'ntn' or @style = 'p' or @style = 'pvr' or @style = 'sla' or name() = 'table'])">
               <xsl:text> err-para-sl1-pre-not-ml1-mlor-mt9-ntn-p-pvr-sla-tr</xsl:text>
            </xsl:if>
            <!--ck-id 51 - rank=5-->
            <xsl:if test="not(*[@style = 'tbb'])">
               <xsl:text> err-para-sl1-not-contains-tbb</xsl:text>
            </xsl:if>
            <!--ck-id 41 - rank=7-->
            <xsl:if test="not(child::char[@style = 'tei'])">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'sla' or @style = 'pvr' or @style = 'gn'])">
                  <xsl:text> err-para-sl1-post-1-not-ml1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 67 - rank=8-->
            <xsl:if test="count(*[@style = 'f']) &gt; 0">
               <xsl:text> err-para-sl1-looks-like-sla</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-ml1-pre-1-not-sl1-or-mlor</xsl:text>
            </xsl:if>
            <!--ck-id 31 - rank=5-->
            <xsl:if test="preceding-sibling::*[2][@style = 'ml1']/*[1][@style  = 'tbb'] and preceding-sibling::*[1][@style = 'mlor']">
               <xsl:if test="not(child::node()[@style = 'tbb'])">
                  <xsl:text> err-para-ml1-pre-has-tbb</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 32 - rank=5-->
            <xsl:if test="preceding-sibling::*[2][name() = 'table']">
               <xsl:if test="not(child::node()[@style = 'tbb'])">
                  <xsl:text> err-para-ml1-no-tbb-following-tr</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 61 - rank=5-->
            <xsl:if test="count(following-sibling::*) &gt; 0">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'mlor' or @style = 'sl1' or @style = 'p' or @style = 'b' or @style = 'b3' or name() = 'chapter'])">
                  <xsl:text> err-para-ml1-post-not-mlor-sl1-p-b-b3-c</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 27 - rank=8-->
            <xsl:if test="count(node()) = count(char)">
               <xsl:text> err-para-ml1-child-but-no-text</xsl:text>
            </xsl:if>
            <!--ck-id 29 - rank=8-->
            <xsl:if test="count(char[@style = 'tbb']) = 1">
               <xsl:if test="not(child::node()[2][@style = 'tbb'])">
                  <xsl:text> err-para-ml1-when-tbb-not-node2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 33 - rank=10-->
            <xsl:if test="string-length(text()) = 0 and count(*) = 0">
               <xsl:text> err-para-ml1-no-text-or-child</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b' or @style = 'b2' or @style = 'ml1' or name() = 'chapter' or name() = 'table' or @style = 'sl1' or @style = 'mt2'])">
               <xsl:text> err-para-p-pre-not-b-b2-ml1-c-tr-sl1-mt2</xsl:text>
            </xsl:if>
            <!--ck-id 40 - rank=8-->
            <xsl:if test="preceding-sibling::*[1][@style = 'p'] and child::verse">
               <xsl:text> err-para-p-pre-p-para-not-allowed</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-pra-pre-not-ntn</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-para-ntn-pre-not-tr-pra-ntn-mt#-li1</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 76 - rank=2-->
            <xsl:if test="not(translate(substring(substring-after(.,':'),1,1),'123456789','000000000') = '0')">
               <xsl:text> err-char-fr-verse-ref</xsl:text>
            </xsl:if>
            <!--ck-id 75 - rank=3-->
            <xsl:if test="not(translate(substring(substring-before(.,':'),'123456789','000000000'),string-length(substring-before(.,':')),1) = '0')">
               <xsl:text> err-char-fr-chapt-ref</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 12 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
               <xsl:text> err-char-imp-post-not-bk</xsl:text>
            </xsl:if>
            <!--ck-id 13 - rank=8-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
               <xsl:text> err-char-imp-pre-not-correct-bk-text</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 15 - rank=5-->
            <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
               <xsl:if test="substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1) = ' '">
                  <xsl:text> err-char-rgi-pre-not-letter-or-punc</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 47 - rank=5-->
            <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
               <xsl:if test="not(translate(substring(following-sibling::node()[1],1,1),'+ —’/”','_+++++') = '+')">
                  <xsl:text> err-char-rgi-post-char-illegal</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 49 - rank=5-->
            <xsl:if test="not(parent::*[@style = 'imp'] or preceding-sibling::*[1][@style = 'imp'])">
               <xsl:text> err-char-rgi-not-embedded-in-imp</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 16 - rank=5-->
            <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
               <xsl:if test="substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1) = ' '">
                  <xsl:text> err-char-rgm-pre-not-letter-or-punc</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 48 - rank=5-->
            <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
               <xsl:if test="not(translate(substring(following-sibling::node()[1],1,1),'+ —’/”','_+++++') = '+')">
                  <xsl:text> err-char-rgm-post-char-illegal</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 17 - rank=5-->
            <xsl:if test="not(text() = '__')">
               <xsl:text> err-char-tbb-needs-2-underscore</xsl:text>
            </xsl:if>
            <!--ck-id 18 - rank=5-->
            <xsl:if test="substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1) = ' '">
               <xsl:text> err-char-tbb-pre-space-not-allowed</xsl:text>
            </xsl:if>
            <!--ck-id 19 - rank=10-->
            <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
               <xsl:text> err-char-tbb-post-space-not-allowed</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 66 - rank=5-->
            <xsl:if test="not(count(char[@style = 'brk']) = 1) and not(text())">
               <xsl:text> err-char-ros-not-contain-brk</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 6 - rank=0-->
            <xsl:if test="contains(text(),'⌊') and position() &gt; 1 and not(preceding-sibling::node()[1][@style = 'tbb']) and not(substring(following-sibling::char[1][@style = 'imp'],1,1) = '’')">
               <xsl:if test="not(translate(substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1),'+ “/(‘','_+++++') = '+')">
                  <xsl:text> err-char-brk-pre-text-not-space</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 9 - rank=5-->
            <xsl:if test="contains(text(),'⌋') and not(position() = last())">
               <xsl:if test="not(translate(substring(following-sibling::node()[1],1,1),'+ ,.?!:;”’)','_++++++++++') = '+')">
                  <xsl:text> err-char-brk-post-text-not-space-or-punc</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 10 - rank=5-->
            <xsl:if test="string-length(text()) != 1">
               <xsl:text> err-char-brk-illegal-char</xsl:text>
            </xsl:if>
            <!--ck-id 4 - rank=8-->
            <xsl:if test="contains(text(),'⌊') and not(parent::*[@style = 'ros'])">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'imp'])">
                  <xsl:text> err-char-brk-post-not-imp</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 7 - rank=8-->
            <xsl:if test="contains(text(),'⌋') and not(parent::*[@style = 'ros'])">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'imp' or @style = 'rgi' or @style = ''])">
                  <xsl:text> err-char-brk-pre-not-imp</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 5 - rank=10-->
            <xsl:if test="contains(text(),'⌊')">
               <xsl:if test="following-sibling::node()[1] = ' '">
                  <xsl:text> err-char-brk-post-is-space</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
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
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 20 - rank=11-->
            <xsl:if test="@closed = 'false'">
               <xsl:if test="substring(@style,1,1) != 'f'">
                  <xsl:text> err-char--not-closed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 56 - rank=5-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ros'])">
               <xsl:text> err-note-f-pre-not-ros</xsl:text>
            </xsl:if>
            <!--ck-id 57 - rank=5-->
            <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ros'])">
               <xsl:text> err-note-f-post-not-ros</xsl:text>
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
               <xsl:text> err-book-id-no-code-att</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
                  <xsl:text> err-cell-tc1-needs-2-sbx</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 3 - rank=10-->
            <xsl:if test="not(count(*[@style = 'tbb']) = 1)">
               <xsl:if test="count(preceding-sibling::chapter) &gt; 0">
                  <xsl:text> err-cell-tc1-needs-1-tbb</xsl:text>
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
                  <xsl:text> err-row-tr-only-tc1-allowed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 45 - rank=10-->
            <xsl:if test="preceding-sibling::*[1][@style = 'tr']">
               <xsl:if test="preceding-sibling::chapter">
                  <xsl:text> err-row-tr-2nd-not-allowed</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                  <xsl:text> err-para--no-content</xsl:text>
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
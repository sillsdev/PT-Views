<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:variable name="para-like" select="'para table row book'"/>
   <xsl:template match="chapter">
      <style type="text/css">
            	.sl1 {border-left:10pt solid green;padding-left:3pt;font-size:120%}
            	.ml1 {border-left:20pt solid lightblue;padding-left:3pt;padding-left:1em}
            	.mlor {border-left:30pt solid yellow;padding-left:3pt;padding-left:1em}
		.tr {border-left:10pt solid blue;padding-left:3pt}
            	.error-pre {border-left:5pt solid red;}
            	.error-post {border-right:5pt solid red;}
		::after {background:thistle;padding-left:4pt;}
            	.v {color:forestgreen;font-size:80%;font-weight:bold;}
		.err-book-id-no-code-att::after {content:'Place holder. Impossible error #1';}
.err-book-id-no-code-att {border-bottom:2pt solid red}
.err-cell-tc1-needs-2-sbx::after {content:'This \\tc1 SFM should have two \\sbx SFMs #2';}
.err-cell-tc1-needs-2-sbx {background:orange}
.err-cell-tc1-needs-1-tbb::after {content:'This \\tc1 SFM should have one \\tbb __\tbb* SFM #3';}
.err-cell-tc1-needs-1-tbb {background:orange}
.err-char--empty-text::after {content:'This character SFM is empty #23';}
.err-char--empty-text {background:orange}
.err-char--space-b4-close-sfm::after {content:'There is a space before the closing SFM. Best to put the space after the close. #24';}
.err-char--space-b4-close-sfm {background:orange}
.err-char--not-closed::after {content:'This character SFM is not closed. No end marker was found. #20';}
.err-char--not-closed {background:orange}
.err-char-brk-pre-text-not-space::after {content:'This \\brk SFM is not preceded by a space or quotes #6';}
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
.err-char-imp-post-not-bk::after {content:'This \\imp SFM should be followed like this \\imp...\\imp*\\bk ⌋\\bk* #12';}
.err-char-imp-post-not-bk {border-right:5pt solid red;background:peachpuff}
.err-char-imp-pre-not-correct-bk-text::after {content:'This \\imp...\\imp* should be preceded by \\bk ⌊\\bk* or a \\rgi and a space. #13';}
.err-char-imp-pre-not-correct-bk-text {border-left:5pt solid red;background:peachpuff}
.err-char-rgi-pre-not-letter-or-punc::after {content:'This \\rgi SFM should not be preceeded by a space. #15';}
.err-char-rgi-pre-not-letter-or-punc {border-left:5pt solid red;background:peachpuff}
.err-char-rgi-post-char-illegal::after {content:'This \\rgi should only be followed by a space or colon or hyphen. #47';}
.err-char-rgi-post-char-illegal {border-right:5pt solid red;background:peachpuff}
.err-char-rgi-not-embedded-in-imp::after {content:'This \\rgi SFM should be embedded in a \\imp SFM like this \\+rgi #49';}
.err-char-rgi-not-embedded-in-imp {background:orange}
.err-char-rgm-pre-not-letter-or-punc::after {content:'This \\rgm SFM should not be preceeded by a space. #16';}
.err-char-rgm-pre-not-letter-or-punc {border-left:5pt solid red;background:peachpuff}
.err-char-rgm-post-char-illegal::after {content:'This \\rgm should only be followed by a space or colon or hyphen or right double quote. #48';}
.err-char-rgm-post-char-illegal {border-right:5pt solid red;background:peachpuff}
.err-char-tbb-needs-2-underscore::after {content:'There should be only two underscore characters in the \tbb __\tbb*. #17';}
.err-char-tbb-needs-2-underscore {background:orange}
.err-char-tbb-pre-space-not-allowed::after {content:'There should not be a space before a \tbb SFM #18';}
.err-char-tbb-pre-space-not-allowed {border-left:5pt solid red;background:peachpuff}
.err-char-tbb-post-space-not-allowed::after {content:'There should not be a space after a \tbb* SFM #19';}
.err-char-tbb-post-space-not-allowed {border-right:5pt solid red;background:peachpuff}
.err-para--no-content::after {content:'This paragraph marker is empty, and may not be allowed here. #43';}
.err-para--no-content {border-bottom:2pt solid red}
.err-para-b-not-b4-table::after {content:'This \\b SFM is not allowed here, After Verse 1 and before a section header in \\tr. #25';}
.err-para-b-not-b4-table {border-bottom:2pt solid red}
.err-para-ml1-pre-1-not-sl1-or-mlor::after {content:'The paragraph before this paragraph should be \\sl1 or \\mlor #30';}
.err-para-ml1-pre-1-not-sl1-or-mlor {border-top:2pt solid red}
.err-para-ml1-pre-has-tbb::after {content:'The preceding \\ml1 has a ¶\\tbb __\\tbb* so this one should too. #31';}
.err-para-ml1-pre-has-tbb {border-top:2pt solid red}
.err-para-ml1-no-tbb-following-tr::after {content:'There is no ¶\\tbb __\\tbb* in this paragraph. It follows a section header \\tr so it is required. #32';}
.err-para-ml1-no-tbb-following-tr {border-bottom:2pt solid red}
.err-para-ml1-child-but-no-text::after {content:'This \\ml1 paragraph has only character SFMs but no text. #27';}
.err-para-ml1-child-but-no-text {border-bottom:2pt solid red}
.err-para-ml1-when-tbb-not-node2::after {content:'The \\tbb SFM should be second after a ¶ paragraph marker #29';}
.err-para-ml1-when-tbb-not-node2 {border-bottom:2pt solid red}
.err-para-ml1-no-text-or-child::after {content:'This \\ml1 should not be empty. If there is no content, remove it and the \\mlor preceding it. #33';}
.err-para-ml1-no-text-or-child {border-bottom:2pt solid red}
.err-para-mlor-text-not-lc-or::after {content:'The content of this \\\mlor SFM can only be: -or- #37';}
.err-para-mlor-text-not-lc-or {border-bottom:2pt solid red}
.err-para-mlor-post-not-ml1::after {content:'There is no \\ml1 line following this \\mlor. Delete this line or addd a \\ml1 line #35';}
.err-para-mlor-post-not-ml1 {border-bottom:2pt solid red}
.err-para-mlor-pre-not-ml1::after {content:'A \\ml1 should preceed this \\mlor #36';}
.err-para-mlor-pre-not-ml1 {border-top:2pt solid red}
.err-para-p-not-allowed-here::after {content:'This paragraph SFM is not allowed here. #39';}
.err-para-p-not-allowed-here {border-bottom:2pt solid red}
.err-para-p-pre-p-para-not-allowed::after {content:'The preceding \\p is not allowed here. #40';}
.err-para-p-pre-p-para-not-allowed {border-top:2pt solid red}
.err-para-pvr-post-not-sl1-or-sla::after {content:'The following paragraph is not \\sl1 or \\sla #50';}
.err-para-pvr-post-not-sl1-or-sla {border-bottom:2pt solid red}
.err-para-sl1-not-contains-tbb::after {content:'This paragraph is missing a \\tbb __\\tbb* after the verse reference. #51';}
.err-para-sl1-not-contains-tbb {border-bottom:2pt solid red}
.err-para-sl1-post-1-not-ml1::after {content:'The paragraph following this paragraph should be \\ml1 or \\sla #41';}
.err-para-sl1-post-1-not-ml1 {border-bottom:2pt solid red}
.err-para-sla-post-not-sl1-following::after {content:'The following paragraph is not \\sl1 #52';}
.err-para-sla-post-not-sl1-following {border-bottom:2pt solid red}
.err-row-tr-only-tc1-allowed::after {content:'The SFM \tr must have a \tc1 following. #44';}
.err-row-tr-only-tc1-allowed {border-bottom:2pt solid red}
.err-row-tr-2nd-not-allowed::after {content:'Only one \\tr is allowed in this positions. #45';}
.err-row-tr-2nd-not-allowed {border-bottom:2pt solid red}
.err-table--only-1-tr-allowed::after {content:'There should only be one \\tr here. #46';}
.err-table--only-1-tr-allowed {border-bottom:2pt solid red}
</style>
      <xsl:element name="div">
         <xsl:text>\c </xsl:text>
         <xsl:value-of select="@number"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse">
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
   <xsl:template match="book[@style = 'id']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--1-->
            <xsl:if test="not(@code)">
               <xsl:text> err-book-id-no-code-att</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="@code"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="cell">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--2-->
            <xsl:if test="not(count(*[@style = 'sbx']) = 2)">
               <xsl:text> err-cell-tc1-needs-2-sbx</xsl:text>
            </xsl:if>
            <!--3-->
            <xsl:if test="not(count(*[@style = 'tbb']) = 1)">
               <xsl:text> err-cell-tc1-needs-1-tbb</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\tc1 </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--23-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--20-->
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'brk']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--23-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--20-->
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 6 - rank=0-->
            <xsl:if test="contains(text(),'⌊') and position() &gt; 1 and not(preceding-sibling::node()[1][@style = 'tbb']) and not(substring(following-sibling::char[1][@style = 'imp'],1,1) = '’')">
               <xsl:if test="not(translate(substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]) ,1),'“/‘','   ') = ' ')">
                  <xsl:text> err-char-brk-pre-text-not-space</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 9 - rank=5-->
            <xsl:if test="contains(text(),'⌋') and not(position() = last())">
               <xsl:if test="not(translate(substring(following-sibling::text()[1],1,1),' ,.?!:’;”’','+++++++++') = '+') ">
                  <xsl:text> err-char-brk-post-text-not-space-or-punc</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--10-->
            <xsl:if test="string-length(text()) != 1">
               <xsl:text> err-char-brk-illegal-char</xsl:text>
            </xsl:if>
            <!--ck-id 4 - rank=8-->
            <xsl:if test="contains(text(),'⌊')">
               <xsl:if test="not(following-sibling::node()[1]/@style = 'imp')">
                  <xsl:text> err-char-brk-post-not-imp</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 7 - rank=8-->
            <xsl:if test="contains(text(),'⌋')">
               <xsl:if test="not(preceding-sibling::node()[1]/@style = 'imp' or preceding-sibling::node()[1]/@style = 'rgi')">
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
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'imp']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--23-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--20-->
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <!--12-->
            <xsl:if test="not(following-sibling::node()[1]/@style = 'brk' or following-sibling::node()[1]/@style = 'rgi' )">
               <xsl:text> err-char-imp-post-not-bk</xsl:text>
            </xsl:if>
            <!--13-->
            <xsl:if test="not(preceding-sibling::node()[1][@style = 'brk'] or preceding-sibling::node()[2][@style = 'rgi'])">
               <xsl:text> err-char-imp-pre-not-correct-bk-text</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'rgi']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--23-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--20-->
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 15 - rank=5-->
            <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
               <xsl:if test="not(translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1),'+ ','_+') != '+')">
                  <xsl:text> err-char-rgi-pre-not-letter-or-punc</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 47 - rank=5-->
            <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
               <xsl:if test="not(translate(substring(following-sibling::text()[1],1,1),'+ -–—’/”','_+++++++') = '+')">
                  <xsl:text> err-char-rgi-post-char-illegal</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--49-->
            <xsl:if test="not(parent::*[@style = 'imp'] or preceding-sibling::*[1][@style = 'imp'])">
               <xsl:text> err-char-rgi-not-embedded-in-imp</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'rgm']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--23-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--20-->
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <!--ck-id 16 - rank=5-->
            <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
               <xsl:if test="not(translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1),'+ ','_+') != '+')">
                  <xsl:text> err-char-rgm-pre-not-letter-or-punc</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 48 - rank=5-->
            <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
               <xsl:if test="not(translate(substring(following-sibling::text()[1],1,1),'+ -–—’/”','_+++++++') = '+')">
                  <xsl:text> err-char-rgm-post-char-illegal</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'tbb']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--23-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--ck-id 24 - rank=0-->
            <xsl:if test="substring(node()[last()],string-length(text()),1) = ' '">
               <xsl:if test="count(following-sibling::node()) &gt; 0">
                  <xsl:text> err-char--space-b4-close-sfm</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--20-->
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <!--17-->
            <xsl:if test="not(text() = '__')">
               <xsl:text> err-char-tbb-needs-2-underscore</xsl:text>
            </xsl:if>
            <!--18-->
            <xsl:if test="substring(preceding-sibling::node()[1],string-length(preceding-sibling::node()[1]),1) = ' '">
               <xsl:text> err-char-tbb-pre-space-not-allowed</xsl:text>
            </xsl:if>
            <!--19-->
            <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
               <xsl:text> err-char-tbb-post-space-not-allowed</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'b']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--25-->
            <xsl:if test="following-sibling::*[1][name() = 'table'] and preceding::*[name() = 'verse'][1][@number = 1]">
               <xsl:text> err-para-b-not-b4-table</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'ml1']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--30-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'mlor'] or preceding-sibling::*[1][@style = 'sl1'] or preceding-sibling::*[1][@style = 'sla'])">
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
            <!--27-->
            <xsl:if test="count(node()) = count(char)">
               <xsl:text> err-para-ml1-child-but-no-text</xsl:text>
            </xsl:if>
            <!--ck-id 29 - rank=8-->
            <xsl:if test="count(char[@style = 'tbb']) = 1">
               <xsl:if test="not(child::node()[2][@style = 'tbb'])">
                  <xsl:text> err-para-ml1-when-tbb-not-node2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--33-->
            <xsl:if test="string-length(text()) = 0 and count(*) = 0">
               <xsl:text> err-para-ml1-no-text-or-child</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
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
            <!--35-->
            <xsl:if test="not(following-sibling::*[1][@style = 'ml1']) and not(following-sibling::*[1][@style = 'rem'])">
               <xsl:text> err-para-mlor-post-not-ml1</xsl:text>
            </xsl:if>
            <!--36-->
            <xsl:if test="not(preceding-sibling::*[1][@style = 'ml1'])">
               <xsl:text> err-para-mlor-pre-not-ml1</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'p']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--39-->
            <xsl:if test="not(following-sibling::*[1]/@style = 'sl1' or following-sibling::table[1])">
               <xsl:text> err-para-p-not-allowed-here</xsl:text>
            </xsl:if>
            <!--40-->
            <xsl:if test="preceding-sibling::*[1][@style = 'p'] and child::verse">
               <xsl:text> err-para-p-pre-p-para-not-allowed</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'pvr']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--50-->
            <xsl:if test="not(following-sibling::para[1] [@style = 'sl1' or @style = 'sla'])">
               <xsl:text> err-para-pvr-post-not-sl1-or-sla</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'sl1']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--51-->
            <xsl:if test="not(*[@style = 'tbb'])">
               <xsl:text> err-para-sl1-not-contains-tbb</xsl:text>
            </xsl:if>
            <!--ck-id 41 - rank=10-->
            <xsl:if test="not(child::char[@style = 'tei'])">
               <xsl:if test="not(following-sibling::*[1][@style = 'ml1' or @style = 'sla' or @style = 'pvr'] )">
                  <xsl:text> err-para-sl1-post-1-not-ml1</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'sla']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--52-->
            <xsl:if test="not(following-sibling::para[1] [@style = 'sl1' or @style = 'ml1'])">
               <xsl:text> err-para-sla-post-not-sl1-following</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="row[@style = 'tr']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--44-->
            <xsl:if test="count(cell) != 1">
               <xsl:text> err-row-tr-only-tc1-allowed</xsl:text>
            </xsl:if>
            <!--45-->
            <xsl:if test="preceding-sibling::*[1][@style = 'tr']">
               <xsl:text> err-row-tr-2nd-not-allowed</xsl:text>
            </xsl:if>
            <!--ck-id 43 - rank=0-->
            <xsl:if test="string-length(text()) = 0 and not(*)">
               <xsl:if test="not(@style = 'b' or @style = 'ntn' or @style = 'mt9')">
                  <xsl:text> err-para--no-content</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="table">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--46-->
            <xsl:if test="not(count(row) = 1)">
               <xsl:text> err-table--only-1-tr-allowed</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>
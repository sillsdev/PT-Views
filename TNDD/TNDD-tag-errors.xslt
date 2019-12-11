<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:variable name="para-like" select="'para table row book'"/>
   <xsl:template match="para[@style = 'ml1']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="preceding-sibling::*[2][@style = 'ml1']">
               <xsl:if test="preceding-sibling::*[3][@style = 'ml1']">
                  <xsl:text> err-para-ml1-pre-1-not-ml3</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="count(char) = count(node())">
               <xsl:text> err-para-ml1-no-text-in-node</xsl:text>
            </xsl:if>
            <xsl:if test="not(preceding-sibling::*[1][@style = 'mlor'] or preceding-sibling::*[1][@style = 'sl1'])">
               <xsl:text> err-para-ml1-pre-1-not-sl1-or-mlor</xsl:text>
            </xsl:if>
            <xsl:if test="preceding-sibling::*[2][name() = 'table']">
               <xsl:if test="not(child::node()[@style = 'tbb'])">
                  <xsl:text> err-para-ml1-no-tbb-following-tr</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="preceding-sibling::*[2][@style = 'ml1']/*[1]/@style  = 'tbb' and preceding-sibling::*[1][@style = 'mlor']">
               <xsl:if test="not(child::node()[@style = 'tbb'])">
                  <xsl:text> err-para-ml1-pre-has-tbb</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="preceding-sibling::*[2][@style = 'ml1']/*[1]/@style  = 'tbb' and preceding-sibling::*[1][@style = 'mlor']">
               <xsl:if test="not(child::node()[1][@style = 'tbb'])">
                  <xsl:text> err-para-ml1-not-first-node</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
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
            <xsl:if test="not(following-sibling::*[1][@style = 'ml1'])">
               <xsl:text> err-para-sl1-post-1-not-ml1</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
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
            <xsl:if test="not(preceding-sibling::*[1][@style = 'ml1'])">
               <xsl:text> err-para-mlor-pre-not-ml1</xsl:text>
            </xsl:if>
            <xsl:if test="not(following-sibling::*[1][@style = 'ml1'])">
               <xsl:text> err-para-mlor-post-not-ml1</xsl:text>
            </xsl:if>
            <xsl:if test="not(text() = '-or-')">
               <xsl:text> err-para-mlor-text-not-lc-or</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
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
            <xsl:if test="not(following-sibling::*[1]/@style = 'sl1' or following-sibling::table[1])">
               <xsl:text> err-para-p-not-allowed-here</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
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
            <xsl:if test="following-sibling::*[1][name() = 'table']">
               <xsl:text> err-para-b-not-b4-table</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="book[@style = 'id']">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="not(@code)">
               <xsl:text> err-book-id-no-code-att</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
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
            <xsl:if test="not(count(*[@style = 'tbb']) = 1)">
               <xsl:text> err-cell-tc1-needs-1-tbb</xsl:text>
            </xsl:if>
            <xsl:if test="not(count(*[@style = 'sbx']) = 2)">
               <xsl:text> err-cell-tc1-needs-2-sbx</xsl:text>
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
            <xsl:if test="preceding-sibling::*[1][@style = 'tr']">
               <xsl:text> err-row-tr-2nd-not-allowed</xsl:text>
            </xsl:if>
            <xsl:if test="count(cell) != 1">
               <xsl:text> err-row-tr-only-tc1-allowed</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-para--no-content</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'tbb']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <xsl:if test="substring(text(),string-length(text()) - 1,1) = ' '">
               <xsl:text> err-char--space-b4-close-sfm</xsl:text>
            </xsl:if>
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <xsl:if test="not(text() = '__')">
               <xsl:text> err-char-tbb-needs-2-underscore</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
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
            <xsl:if test="substring(text(),string-length(text()) - 1,1) = ' '">
               <xsl:text> err-char--space-b4-close-sfm</xsl:text>
            </xsl:if>
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <xsl:if test="preceding-sibling::node[1] = preceding-sibling::text()[1]">
               <xsl:if test="translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]) - 1,1),'+,.?!:;','_++++++') != '+'">
                  <xsl:text> err-char-rgm-pre-not-punc</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
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
            <xsl:if test="substring(text(),string-length(text()) - 1,1) = ' '">
               <xsl:text> err-char--space-b4-close-sfm</xsl:text>
            </xsl:if>
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <xsl:if test="preceding-sibling::node[1] = preceding-sibling::text()[1]">
               <xsl:if test="translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]) - 1,1),'+,.?!:;','_++++++') != '+'">
                  <xsl:text> err-char-rgi-pre-not-punc</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="substring(text(),string-length(text()) - 1,1) = ' '">
               <xsl:text> err-char--space-b4-close-sfm</xsl:text>
            </xsl:if>
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
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
            <xsl:if test="substring(text(),string-length(text()) - 1,1) = ' '">
               <xsl:text> err-char--space-b4-close-sfm</xsl:text>
            </xsl:if>
            <xsl:if test="@closed = 'false'">
               <xsl:text> err-char--not-closed</xsl:text>
            </xsl:if>
            <xsl:if test="string-length(text()) = 0">
               <xsl:text> err-char--empty-text</xsl:text>
            </xsl:if>
            <!--style specific errors-->
            <xsl:if test="contains(text(),'⌋')">
               <xsl:if test="not(preceding-sibling::node()[1]/@style = 'imp')">
                  <xsl:text> err-char-brk-pre-not-imp</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="contains(text(),'⌊')">
               <xsl:if test="not(following-sibling::node()[1]/@style = 'imp')">
                  <xsl:text> err-char-brk-post-not-imp</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="string-length(text()) != 1">
               <xsl:text> err-char-brk-illegal-char</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
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
		.err-para-ml1-pre-1-not-ml3::after {content:'The paragraph before this paragraph should be \\sl1 or \\mlor';}
.err-para-ml1-pre-1-not-ml3 {border-bottom:2pt solid red}
.err-para-ml1-no-text-in-node::after {content:'There is no plain text in this paragraph.';}
.err-para-ml1-no-text-in-node {border-bottom:2pt solid red}
.err-para-ml1-pre-1-not-sl1-or-mlor::after {content:'The paragraph before this paragraph should be \\sl1 or \\mlor';}
.err-para-ml1-pre-1-not-sl1-or-mlor {border-bottom:2pt solid red}
.err-para-ml1-no-tbb-following-tr::after {content:'There is no \\tbb __\\tbb* in this paragraph. It follows a section header \\tr so it is required.';}
.err-para-ml1-no-tbb-following-tr {border-bottom:2pt solid red}
.err-para-ml1-pre-has-tbb::after {content:'The preceding \\ml1 has a \\tbb __\\tbb* so this one should too.';}
.err-para-ml1-pre-has-tbb {border-bottom:2pt solid red}
.err-para-ml1-not-first-node::after {content:'There is some text before this node.';}
.err-para-ml1-not-first-node {border-bottom:2pt solid red}
.err-para--no-content::after {content:'This paragraph mark is empty, and may not be allowed here.';}
.err-para--no-content {border-bottom:2pt solid red}
.err-para-sl1-post-1-not-ml1::after {content:'The paragraph following this paragraph should be \\ml1';}
.err-para-sl1-post-1-not-ml1 {border-bottom:2pt solid red}
.err-para-mlor-pre-not-ml1::after {content:'A \\ml1 should preceed this \\mlor';}
.err-para-mlor-pre-not-ml1 {border-bottom:2pt solid red}
.err-para-mlor-post-not-ml1::after {content:'A \\ml1 should follow this \\mlor';}
.err-para-mlor-post-not-ml1 {border-bottom:2pt solid red}
.err-para-mlor-text-not-lc-or::after {content:'The content of this field can only be: -or-';}
.err-para-mlor-text-not-lc-or {border-bottom:2pt solid red}
.err-para-p-not-allowed-here::after {content:'This paragraph type is not allowed here.';}
.err-para-p-not-allowed-here {border-bottom:2pt solid red}
.err-para-b-not-b4-table::after {content:'This paragraph type is not allowed here.';}
.err-para-b-not-b4-table {border-bottom:2pt solid red}
.err-book-id-no-code-att::after {content:'Place holder. Impossible error';}
.err-book-id-no-code-att {border-bottom:2pt solid red}
.err-cell-tc1-needs-1-tbb::after {content:'This style should have one \\tbb __\tbb* SFM';}
.err-cell-tc1-needs-1-tbb {background:orange}
.err-cell-tc1-needs-2-sbx::after {content:'This style should have two \\sbx SFMs';}
.err-cell-tc1-needs-2-sbx {background:orange}
.err-row-tr-2nd-not-allowed::after {content:'Only one \\tr is allowed in this positions.';}
.err-row-tr-2nd-not-allowed {border-bottom:2pt solid red}
.err-row-tr-only-tc1-allowed::after {content:'Must have only one child \\tc1';}
.err-row-tr-only-tc1-allowed {border-bottom:2pt solid red}
.err-char-tbb-needs-2-underscore::after {content:'This SFM has invalid content it should only be \\tbb __\\tbb* with two underscore characters as text.';}
.err-char-tbb-needs-2-underscore {background:orange}
.err-char-rgm-pre-not-punc::after {content:'This SFM should only occur after a punctuation character.';}
.err-char-rgm-pre-not-punc {background:orange}
.err-char-rgi-pre-not-punc::after {content:'This SFM should only occur after a punctuation character.';}
.err-char-rgi-pre-not-punc {background:orange}
.err-char--space-b4-close-sfm::after {content:'There is a space before the closing SFM \xx*';}
.err-char--space-b4-close-sfm {background:orange}
.err-char--not-closed::after {content:'This character markup is not closed with \\xx*';}
.err-char--not-closed {background:orange}
.err-char--empty-text::after {content:'This character markup is empty';}
.err-char--empty-text {background:orange}
.err-char-brk-pre-not-imp::after {content:'This \\brk should only occur immediately after an \\imp* SFM.';}
.err-char-brk-pre-not-imp {background:orange}
.err-char-brk-post-not-imp::after {content:'This \\brk should only occur before an \\imp SFM.';}
.err-char-brk-post-not-imp {background:orange}
.err-char-brk-illegal-char::after {content:'This \\brk contains non-allowed characters';}
.err-char-brk-illegal-char {background:orange}
.err-chapter-c-needs-number-attrib::after {content:'This style needs a number attribute';}
.err-chapter-c-needs-number-attrib {}
.err-table--only-1-tr-allowed::after {content:'There should only be one \\tr here.';}
.err-table--only-1-tr-allowed {border-bottom:2pt solid red}
</style>
      <xsl:element name="div">
         <xsl:text>\c </xsl:text>
         <xsl:value-of select="@number"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="table">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
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
   <xsl:template match="verse">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:text>\v </xsl:text>
         <xsl:value-of select="@number"/>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>
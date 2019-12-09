<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:f="myfunctions"
                version="1.0">
   <xsl:template match="para[@style = 'p']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="text() = ''">
               <xsl:text> error-p-no-content</xsl:text>
            </xsl:if>
            <xsl:if test="not(following-sibling::*[1]/@style = 'sl1' or following-sibling::table[1])">
               <xsl:text> error-p-not-allowed-here</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\p</xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'b']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="following-sibling::*[1][name() = 'table']">
               <xsl:text> error-b-not-allowed-here</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\b</xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'sl1']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="not(following-sibling::*[1][@style = 'ml1'])">
               <xsl:text> error-sl1-post-1-not-ml1</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\sl1</xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'ml1']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="not(preceding-sibling::*[1][@style = 'mlor'] or preceding-sibling::*[1][@style = 'sl1'])">
               <xsl:text> error-ml1-post-1-not-ml2</xsl:text>
            </xsl:if>
            <xsl:if test="preceding-sibling::*[2][@style = 'ml1']">
               <xsl:if test="preceding-sibling::*[3][@style = 'ml1']">
                  <xsl:text> error-ml1-post-1-not-ml3</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\ml1</xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="para[@style = 'mlor']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="not(text() = '-or-')">
               <xsl:text> error-mlor-text-not-lc-or</xsl:text>
            </xsl:if>
            <xsl:if test="not(preceding-sibling::*[1][@style = 'ml1'])">
               <xsl:text> error-mlor-pre-not-ml1</xsl:text>
            </xsl:if>
            <xsl:if test="not(following-sibling::*[1][@style = 'ml1'])">
               <xsl:text> error-mlor-post-not-ml1</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\mlor</xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="char[@style = 'brk']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="contains(text(),'⌋')">
               <xsl:if test="not(preceding-sibling::node()[1]/@style = 'imp')">
                  <xsl:text> error-brk-pre-not-imp</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="contains(text(),'⌊')">
               <xsl:if test="not(following-sibling::node()[1]/@style = 'imp')">
                  <xsl:text> error-brk-post-not-imp</xsl:text>
               </xsl:if>
            </xsl:if>
            <xsl:if test="string-length(text()) != 1">
               <xsl:text> error-brk-illegal-char</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text/>
         <xsl:apply-templates/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text>*</xsl:text>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="cell">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <xsl:if test="not(count(*[@style = 'tbb']) = 1)">
               <xsl:text> error-tc1-no-1-tbb</xsl:text>
            </xsl:if>
            <xsl:if test="not(count(*[@style = 'sbx']) = 2)">
               <xsl:text> error-tc1-no-2-sbx</xsl:text>
            </xsl:if>
         </xsl:attribute>
         <xsl:text>\tc1</xsl:text>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="chapter">
      <style type="text/css">
            	.sl1 {border-left:10pt solid green;padding-left:3pt;font-size:120%}
            	.ml1 {border-left:10pt solid orange;padding-left:3pt;padding-left:1em}
            	.mlor {border-left:10pt solid yellow;padding-left:3pt;padding-left:1em}
		.tr {border-left:10pt solid blue;padding-left:3pt}
            	.error-pre {border-left:5pt solid red;}
            	.error-post {border-right:5pt solid red;}
		::after {background:thistle;padding-left:4pt;}
            	.v {color:forestgreen;font-size:80%;font-weight:bold;}
.error-p-no-content::after {'This paragraph mark is empty, and may not be allowed here.';}
.error-p-no-content {background:orange}
.error-p-not-allowed-here::after {'This paragraph mark is not be allowed here.';}
.error-p-not-allowed-here {background:orange}
.error-b-not-allowed-here::after {'This paragraph mark is not be allowed here.';}
.error-b-not-allowed-here {background:orange}
.error-sl1-post-1-not-ml1::after {'The paragraph following this paragraph should be \ml1';}
.error-sl1-post-1-not-ml1 {background:orange}
.error-ml1-post-1-not-ml2::after {'The paragraph before this paragraph should be \sl1 or \mlor';}
.error-ml1-post-1-not-ml2 {background:orange}
.error-ml1-post-1-not-ml3::after {'The paragraph before this paragraph should be \sl1 or \mlor';}
.error-ml1-post-1-not-ml3 {background:orange}
.error-mlor-text-not-lc-or::after {'The content of this field can only be -or-';}
.error-mlor-text-not-lc-or {background:orange}
.error-mlor-pre-not-ml1::after {'A \ml1 should preceed this \mlor';}
.error-mlor-pre-not-ml1 {background:orange}
.error-mlor-post-not-ml1::after {'A \ml1 should follow this \mlor';}
.error-mlor-post-not-ml1 {background:orange}
.error-brk-pre-not-imp::after {'This \brk should only occur immediately after an \imp* SFM.';}
.error-brk-pre-not-imp {background:orange}
.error-brk-post-not-imp::after {'This \brk should only occur before an \imp SFM.';}
.error-brk-post-not-imp {background:orange}
.error-brk-illegal-char::after {'This \brk has some extra non-allowed characters';}
.error-brk-illegal-char {background:orange}
.::after {'';}
. {background:orange}
.error-tr-2nd-not-allowed::after {'Only one \tr is allowed in this positions.';}
.error-tr-2nd-not-allowed {background:orange}
.error-tr-needs-one-tc1::after {'Must have one child \tc1';}
.error-tr-needs-one-tc1 {background:orange}
.error-tc1-no-1-tbb::after {'This style should have one \tbb __\tbb* sfm';}
.error-tc1-no-1-tbb {background:orange}
.error-tc1-no-2-sbx::after {'This style should have two \sbx sfms';}
.error-tc1-no-2-sbx {background:orange}
.error-c-needs-number-attrib::after {'This style needs a number attribute';}
.error-c-needs-number-attrib {background:orange}
</style>
      <xsl:element name="span">
         <xsl:text>\c </xsl:text>
         <xsl:value-of select="@number"/>
         <xsl:text/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="text()">
      <xsl:element name="span">
         <xsl:value-of select="."/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="*">
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:text>\</xsl:text>
         <xsl:value-of select="@style"/>
         <xsl:text/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse">
      <xsl:element name="span">
         <xsl:text>\v </xsl:text>
         <xsl:value-of select="@number"/>
         <xsl:text/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="table">
      <xsl:apply-templates select="*"/>
   </xsl:template>
</xsl:stylesheet>

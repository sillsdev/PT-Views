<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:variable name="sq">'</xsl:variable>
   <xsl:variable name="dq">"</xsl:variable>
   <xsl:variable name="numb">1234567890</xsl:variable>
   <xsl:variable name="numbsub">##########</xsl:variable>
   <xsl:variable name="validvlet">abcdefghij</xsl:variable>
   <xsl:variable name="validvletsub">$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validvletpunc">abcdefghij–</xsl:variable>
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
   <xsl:template match="chapter[@number]">
      <xsl:if test="count(preceding::chapter[@number]) = 0">
         <xsl:element name="h4">
            <xsl:text>Version: TNDD </xsl:text>
            <xsl:value-of select="$version"/>
         </xsl:element>
         <xsl:call-template name="style"/>
      </xsl:if>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ',@number)"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="ref">
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
.usx {line-height:1.8;}
.mt, .mt2, .mt3, .mt3n, .mt4, .mt4n, .mt5, .mt6, .mt7, .mt8, .mt9, .mt10 {text-align:center}
.sl1 {border-left:10pt solid green;padding-left:3pt;font-size:120%}
.sla, .pvr {border-left:10pt solid orange;padding-left:3pt;font-size:120%}
.ml1 {border-left:20pt solid lightblue;padding-left:3pt;padding-left:1em}
.mlor {border-left:30pt solid yellow;padding-left:3pt;padding-left:1em}
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
.err-table--post-65 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-65::after {content:'The following is not \\sl1 or \\pvr #65';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-fr--75-2 {background:orange;}
.err-char-fr--75-2::after {content:'The \\fr and verse reference are not used in TNDD. #75.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-imp-post-12 {background:orange;border-right:4pt solid red;}
.err-char-imp-post-12::after {content:'This \\imp SFM should be followed like this \\imp...\\imp*\\bk ⌋\\bk* #12';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-imp-pre-13 {background:orange;border-left:4pt solid red;}
.err-char-imp-pre-13::after {content:'This \\imp...\\imp* should be preceded by \\bk ⌊\\bk* or a \\rgi and a space. #13';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi-pre-15 {background:orange;border-left:4pt solid red;}
.err-char-rgi-pre-15::after {content:'The \\rgi should be immediately after the word it modifies. #15';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi-post-47 {background:orange;border-right:4pt solid red;}
.err-char-rgi-post-47::after {content:'A letter should not immediately follow an \\rgi*. #47';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi--49 {background:orange;}
.err-char-rgi--49::after {content:'This \\rgi SFM should be embedded in a \\imp SFM like this \\+rgi #49';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgm-pre-16 {background:orange;border-left:4pt solid red;}
.err-char-rgm-pre-16::after {content:'The \\rgm should be immediately after the word it modifies. #16';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgm-post-48 {background:orange;border-right:4pt solid red;}
.err-char-rgm-post-48::after {content:'A letter should not immediately follow an \\rgm*. #48';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb--17 {background:orange;}
.err-char-tbb--17::after {content:'There should be only two underscore characters in the \tbb __\tbb*. #17';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-pre-18 {background:orange;border-left:4pt solid red;}
.err-char-tbb-pre-18::after {content:'There should not be a space before a \tbb SFM #18';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-post-19 {background:orange;border-right:4pt solid red;}
.err-char-tbb-post-19::after {content:'There should not be a space after a \tbb* SFM #19';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ros--66 {background:orange;}
.err-char-ros--66::after {content:'There is no embedded \\+brk in this \\ros #66';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-pre-6 {background:orange;border-left:4pt solid red;}
.err-char-brk-pre-6::after {content:'This \\brk SFM is not preceded by a space or quotes or left parenthesis #6';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-post-9 {background:orange;border-right:4pt solid red;}
.err-char-brk-post-9::after {content:'This \\brk SFM is not followed by a space or punctuation #9';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk--10 {background:orange;}
.err-char-brk--10::after {content:'This \\brk SFM can contain only ⌊ or ⌋ but this does not match either of those. #10';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-post-4 {background:orange;border-right:4pt solid red;}
.err-char-brk-post-4::after {content:'This \\brk* SFM should only occur immediately before an \\imp SFM. #4';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-pre-7 {background:orange;border-left:4pt solid red;}
.err-char-brk-pre-7::after {content:'This \\brk SFM should only occur immediately after an \\imp* or \\rgi* SFM. Except if in a \\ros ...\\ros*. #7';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-pre-8 {background:orange;border-left:4pt solid red;}
.err-char-brk-pre-8::after {content:'There should not be a space between \\brk* and \\imp #8';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-post-5 {background:orange;border-right:4pt solid red;}
.err-char-brk-post-5::after {content:'There should not be a space between this \\brk and the following \\imp. #5';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---23 {background:orange;}
.err-char---23::after {content:'This character SFM is empty #23';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---24 {background:orange;}
.err-char---24::after {content:'There is a space before the closing SFM. Best to put the space after the close. #24';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---20 {background:orange;}
.err-char---20::after {content:'This character SFM is not closed. No end marker was found. #20';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-pre-56 {background:orange;border-left:4pt solid red;}
.err-note-f-pre-56::after {content:'The preceding is not \\ros #56';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-post-57 {background:orange;border-right:4pt solid red;}
.err-note-f-post-57::after {content:'The following is not \\ros #57';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para---43 {background:peachpuff;}
.err-para---43::after {content:'This paragraph marker is empty, and may not be allowed here. #43';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-pvr-pre-71 {background:peachpuff;border-top:2pt solid red;}
.err-para-pvr-pre-71::after {content:'The preceding is not \\tr or \\sl1 #71';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-pvr-post-50 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-pvr-post-50::after {content:'A \\pvr must occur before an \\sl1 or a \\b2 \\sla combination. #50';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sla-post-52 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-sla-post-52::after {content:'The following is not \\gn or \\ml1 or \\sl1 #52';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sla-pre-63 {background:peachpuff;border-top:2pt solid red;}
.err-para-sla-pre-63::after {content:'The preceding is not \\sl1 #63';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gn-post-53 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-gn-post-53::after {content:'The following is not \\ml1 #53';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gn-pre-54 {background:peachpuff;border-top:2pt solid red;}
.err-para-gn-pre-54::after {content:'The preceding is not \\sl1 or \\sla #54';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-post-55 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b-post-55::after {content:'The following is not \\p or \\sl1 or \\tr or \\b3 or \\c or \\b or \\mt_ or \\ntn #55';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-pre-58 {background:peachpuff;border-top:2pt solid red;}
.err-para-b-pre-58::after {content:'The preceding is not \\p or \\io1 or \\ml1 or \\ntn or \\b or \\mt_ or \\pra or \\tr or \\c #58';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-pre-80 {background:peachpuff;border-top:2pt solid red;}
.err-para-b-pre-80::after {content:'A \\b is not allowed between a \\c and a \\p #80';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b--81 {background:peachpuff;}
.err-para-b--81::after {content:'A \\b is not allowed between a \\p and a \\sl1 or \\tr #81';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-mlor--37 {background:peachpuff;}
.err-para-mlor--37::after {content:'The content of this \\\mlor SFM can only be: -or- #37';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-mlor-post-35 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-mlor-post-35::after {content:'There is no \\ml1 line following this \\mlor. Delete this line or addd a \\ml1 line #35';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-mlor-pre-36 {background:peachpuff;border-top:2pt solid red;}
.err-para-mlor-pre-36::after {content:'A \\ml1 should preceed this \\mlor #36';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--82-1 {background:peachpuff;}
.err-para-sl1--82-1::after {content:'The chapter number in this \\sl1 is incorrect. #82.1';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--82-2 {background:peachpuff;}
.err-para-sl1--82-2::after {content:'The verse number in this \\sl1 is incorrect. #82.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--68 {background:peachpuff;}
.err-para-sl1--68::after {content:'The verse reference in \\sl1 appears to have a space in it. #68';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1-pre-69 {background:peachpuff;border-top:2pt solid red;}
.err-para-sl1-pre-69::after {content:'Before an \\sl1 can only be a \\p, \\b3, \\ml1, \\mt9 (Psalm 119 only), \\ntn (Only for a note to the MTT about the following text), \\pvr (short note to the MTT), \\sla (only to show a whole verse in an alternate source text). #69';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--51 {background:peachpuff;}
.err-para-sl1--51::after {content:'This paragraph is missing a \\tbb __\\tbb* after the verse reference. #51';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1-post-41 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-sl1-post-41::after {content:'The paragraph following this paragraph should be \\ml1 or \\sla or this should be a \\sla instead. #41';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-pre-30 {background:peachpuff;border-top:2pt solid red;}
.err-para-ml1-pre-30::after {content:'The paragraph before this paragraph should be \\sl1 or \\mlor #30';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-pre-31 {background:peachpuff;border-top:2pt solid red;}
.err-para-ml1-pre-31::after {content:'The preceding \\ml1 has a ¶\\tbb __\\tbb* so this one should too. #31';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--32 {background:peachpuff;}
.err-para-ml1--32::after {content:'There is no ¶\\tbb __\\tbb* in this paragraph. It follows a section header \\tr so it is required. #32';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-post-61 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-ml1-post-61::after {content:'The following is not \\mlor or \\sl1 or \\p or \\b or \\b3 or \\c #61';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--26 {background:peachpuff;}
.err-para-ml1--26::after {content:'A Pilcrow character ¶ should be followed by a \\tbb at the start of this paragraph #26';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--29 {background:peachpuff;}
.err-para-ml1--29::after {content:'The \\tbb SFM should be second after a ¶ paragraph marker #29';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--33 {background:peachpuff;}
.err-para-ml1--33::after {content:'This \\ml1 should not be empty. If there is no content, remove it and the \\mlor preceding it. #33';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-62 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-62::after {content:'The preceding is not \\b or \\b3 or \\ml1 or \\c or \\tr or \\sl1 or \\mt2 #62';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-78-2 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-78-2::after {content:'There should be a \\b above this \\p before a section heading. #78.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-79 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-79::after {content:'There should not be a \\b after this, but it could go before #79';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-40 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-40::after {content:'The preceding \\p is not allowed here. #40';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1--2 {background:peachpuff;}
.err-cell-tc1--2::after {content:'This \\tc1 SFM should have two \\sbx SFMs #2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1--3 {background:peachpuff;}
.err-cell-tc1--3::after {content:'This \\tc1 SFM should have one \\tbb __\tbb* SFM #3';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--44 {background:peachpuff;}
.err-row-tr--44::after {content:'The SFM \\tr must have a \\tc1 following. #44';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--44-2 {background:peachpuff;}
.err-row-tr--44-2::after {content:'The SFM \\tr must have one \\tc1 following. #44.2';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--44-3 {background:peachpuff;}
.err-row-tr--44-3::after {content:'The SFM \\tr must have only one \\tc1 following. #44.3';border:2pt solid thistle;border-left:5pt solid tomato;}
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
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">table<!--ref 65 - rank=5--><xsl:if test="preceding::chapter">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'pvr'])">
                  <xsl:if test="$prechapter != 119">
                     <xsl:text> err-table--post-65</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- char @style=fr -->
   <xsl:template match="char[@style = 'fr']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 75.2 - rank=-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="self::*">
                  <xsl:text> err-char-fr--75-2</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
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
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 12 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
                  <xsl:text> err-char-imp-post-12</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 13 - rank=8-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
                  <xsl:text> err-char-imp-pre-13</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=rgi -->
   <xsl:template match="char[@style = 'rgi']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 15 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
                  <xsl:if test="translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1),' ,.?!):”’','#########') = '#'">
                     <xsl:text> err-char-rgi-pre-15</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 47 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
                  <xsl:if test="translate(substring(following-sibling::text()[1],1,1),'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$') = '$'">
                     <xsl:text> err-char-rgi-post-47</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 49 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(parent::*[@style = 'imp'] or preceding-sibling::*[1][@style = 'imp'])">
                  <xsl:text> err-char-rgi--49</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=rgm -->
   <xsl:template match="char[@style = 'rgm']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 16 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
                  <xsl:if test="translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1),' ,.?!):”’','#########') = '#'">
                     <xsl:text> err-char-rgm-pre-16</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 48 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
                  <xsl:if test="translate(substring(following-sibling::text()[1],1,1),'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$') = '$'">
                     <xsl:text> err-char-rgm-post-48</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
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
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 17 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(text() = '__')">
                  <xsl:text> err-char-tbb--17</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 18 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="preceding-sibling::node()[1]/text() != preceding-sibling::*[1]/text()">
                  <xsl:text> err-char-tbb-pre-18</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 19 - rank=10-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
                  <xsl:text> err-char-tbb-post-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=ros -->
   <xsl:template match="char[@style = 'ros']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 66 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(count(char[@style = 'brk']) = 1) and not(text())">
                  <xsl:text> err-char-ros--66</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
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
            <xsl:value-of select="@style"/>
            <!--common char errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--style specific errors-->
            <!--ref 6 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),'⌊') and position() &gt; 1 and not(preceding-sibling::node()[1][@style = 'tbb']) and not(substring(following-sibling::char[1][@style = 'imp'],1,1) = '’')">
                  <xsl:if test="not(translate(substring($presibnode1,string-length($presibnode1),1),'+ “/(‘','_+++++') = '+')">
                     <xsl:text> err-char-brk-pre-6</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 9 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),'⌋') and not(position() = last())">
                  <xsl:if test="not(translate(substring($postsibnode1,1,1),'+ ,.?!:;”’)','_++++++++++') = '+')">
                     <xsl:text> err-char-brk-post-9</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 10 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) != 1">
                  <xsl:text> err-char-brk--10</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 4 - rank=8-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),'⌊') and not(parent::*[@style = 'ros'])">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'imp'])">
                     <xsl:text> err-char-brk-post-4</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 7 - rank=8-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),'⌋') and not(parent::*[@style = 'ros'])">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'imp' or @style = 'rgi'])">
                     <xsl:text> err-char-brk-pre-7</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 8 - rank=9-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),'⌋')">
                  <xsl:if test="preceding-sibling::node()[1]/text() != preceding-sibling::*[1]/text()">
                     <xsl:text> err-char-brk-pre-8</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 5 - rank=10-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="contains(text(),'⌊')">
                  <xsl:if test="following-sibling::node()[1] = ' '">
                     <xsl:text> err-char-brk-post-5</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
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
            <xsl:value-of select="@style"/>
            <!--style specific errors-->
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="note[@style = 'f']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 23 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:text> err-char---23</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 24 - rank=0-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '">
                  <xsl:if test="count(following-sibling::node()) &gt; 0 and substring(@style,1,1) != 'f' and not(*[@style = 'ros'])">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 20 - rank=11-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---20</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 56 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="parent::*[@style = 'ml1']">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ros'])">
                     <xsl:text> err-note-f-pre-56</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 57 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="parent::*[@style = 'ml1']">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ros'])">
                     <xsl:text> err-note-f-post-57</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:value-of select="@caller"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:value-of select="concat('\',@style,'*')"/>
         </xsl:if>
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
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=pvr -->
   <xsl:template match="para[@style = 'pvr']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 71 - rank=3-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or name() = 'table' or @style = 'sl1'])">
                     <xsl:text> err-para-pvr-pre-71</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 50 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'sla']) and not(following-sibling::*[1][@style] = 'b2' and following-sibling::*[2][@style] = 'sla')">
                     <xsl:text> err-para-pvr-post-50</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=sla -->
   <xsl:template match="para[@style = 'sla']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 52 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'gn' or @style = 'ml1' or @style = 'sl1'])">
                     <xsl:text> err-para-sla-post-52</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 63 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1'])">
                     <xsl:text> err-para-sla-pre-63</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=gn -->
   <xsl:template match="para[@style = 'gn']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 53 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
                     <xsl:text> err-para-gn-post-53</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 54 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'sla'])">
                     <xsl:text> err-para-gn-pre-54</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=b -->
   <xsl:template match="para[@style = 'b']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 55 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'sl1' or name() = 'table' or @style = 'b3' or name() = 'chapter' or @style = 'b' or substring(@style,1,2) = 'mt' or @style = 'ntn'])">
                     <xsl:text> err-para-b-post-55</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 58 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'io1' or @style = 'ml1' or @style = 'ntn' or @style = 'b' or substring(@style,1,2) = 'mt' or @style = 'pra' or name() = 'table' or name() = 'chapter'])">
                     <xsl:text> err-para-b-pre-58</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 80 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="preceding-sibling::*[1][@style = 'c']">
                     <xsl:if test="following-sibling::*[1][@style = 'p']">
                        <xsl:text> err-para-b-pre-80</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 81 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="preceding-sibling::*[1][@style = 'p'][child::*[@style = 'v']]">
                     <xsl:if test="following-sibling::*[1][@style = 'sl1'] or following-sibling::*[1][name() = 'table']">
                        <xsl:text> err-para-b--81</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=mlor -->
   <xsl:template match="para[@style = 'mlor']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 37 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="count(*) = 0">
                     <xsl:if test="not(text() = '-or-')">
                        <xsl:text> err-para-mlor--37</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 35 - rank=7-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
                     <xsl:text> err-para-mlor-post-35</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 36 - rank=7-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
                     <xsl:text> err-para-mlor-pre-36</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=sl1 -->
   <xsl:template match="para[@style = 'sl1']">
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 82.1 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$prechapter != substring-before(text()[1],':')">
                     <xsl:text> err-para-sl1--82-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 82.2 - rank=-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="$preverse != translate(substring-after(text()[1],':'),$validvletpunc,'')">
                     <xsl:text> err-para-sl1--82-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 68 - rank=3-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="contains(text()[1],' ')">
                     <xsl:text> err-para-sl1--68</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 69 - rank=3-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'mt9' or @style = 'ntn' or @style = 'p' or @style = 'pvr' or @style = 'sla' or name() = 'table' or @style = 'b3'])">
                     <xsl:text> err-para-sl1-pre-69</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 51 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(*[@style = 'tbb'])">
                     <xsl:text> err-para-sl1--51</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 41 - rank=7-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(child::char[@style = 'tei'])">
                     <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'sla' or @style = 'pvr' or @style = 'gn'])">
                        <xsl:text> err-para-sl1-post-41</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=ml1 -->
   <xsl:template match="para[@style = 'ml1']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 30 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'mlor' or @style = 'sl1' or @style = 'sla' or @style = 'gn'])">
                     <xsl:text> err-para-ml1-pre-30</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 31 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="(contains( preceding-sibling::*[2][@style = 'ml1']/text(),'¶') or preceding-sibling::*[2][@style = 'ml1']/*[1][@style  = 'tbb']) and preceding-sibling::*[1][@style = 'mlor']">
                     <xsl:if test="not(child::node()[@style = 'tbb'])  or not(contains(text(),'¶'))">
                        <xsl:text> err-para-ml1-pre-31</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 32 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="preceding-sibling::*[2][name() = 'table']">
                     <xsl:if test="not(child::node()[@style = 'tbb'])">
                        <xsl:text> err-para-ml1--32</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 61 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="count(following-sibling::*) &gt; 0">
                     <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'mlor' or @style = 'sl1' or @style = 'p' or @style = 'b' or @style = 'b3' or name() = 'chapter'])">
                        <xsl:text> err-para-ml1-post-61</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 26 - rank=8-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="(*[@style = 'tbb'] and not(contains(text(),'¶'))) or (contains(text(),'¶') and not(*[@style = 'tbb']))">
                     <xsl:text> err-para-ml1--26</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 29 - rank=8-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="count(char[@style = 'tbb']) = 1">
                     <xsl:if test="not(child::node()[2][@style = 'tbb'])">
                        <xsl:text> err-para-ml1--29</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 33 - rank=10-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                     <xsl:text> err-para-ml1--33</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- para @style=p -->
   <xsl:template match="para[@style = 'p']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="@style"/>
               <!--ref 62 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b' or @style = 'b3' or @style = 'ml1' or name() = 'chapter' or name() = 'table' or @style = 'sl1' or @style = 'mt2'])">
                     <xsl:text> err-para-p-pre-62</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 78.2 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="following-sibling::*[1][name() = 'table'] and not( preceding-sibling::*[1][@style = 'c'] or preceding-sibling::*[2][@style = 'c'])">
                     <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b'])">
                        <xsl:text> err-para-p-post-78-2</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
               <!--ref 79 - rank=5-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="count(verse) &gt; 0 and following-sibling::*[1][@style = 'b']">
                     <xsl:text> err-para-p-post-79</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 40 - rank=8-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="preceding-sibling::*[1][@style = 'p'] and child::verse">
                     <xsl:text> err-para-p-pre-40</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common para errors-->
               <!--ref 43 - rank=0-->
               <xsl:if test="preceding::chapter">
                  <xsl:if test="string-length(text()) = 0 and not(*)">
                     <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                        <xsl:text> err-para---43</xsl:text>
                     </xsl:if>
                  </xsl:if>
               </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
            <xsl:apply-templates select="node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- cell @style=tc1 -->
   <xsl:template match="cell[@style = 'tc1']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">cell <xsl:value-of select="@style"/>
            <!--ref 2 - rank=10-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(count(*[@style = 'sbx']) = 2)">
                  <xsl:if test="count(preceding::chapter) &gt; 0">
                     <xsl:text> err-cell-tc1--2</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 3 - rank=10-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="not(count(*[@style = 'tbb']) = 1)">
                  <xsl:if test="count(preceding::chapter) &gt; 0">
                     <xsl:text> err-cell-tc1--3</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--common cell errors-->
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- row @style=tr -->
   <xsl:template match="row[@style = 'tr']">
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 44 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="count(cell) != 1">
                  <xsl:if test="preceding::chapter">
                     <xsl:text> err-row-tr--44</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 44.2 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="count(cell) = 1 and cell[1][@style != 'tc1']">
                  <xsl:if test="preceding::chapter">
                     <xsl:text> err-row-tr--44-2</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
            <!--ref 44.3 - rank=5-->
            <xsl:if test="preceding::chapter">
               <xsl:if test="count(cell) &gt; 1">
                  <xsl:if test="preceding::chapter">
                     <xsl:text> err-row-tr--44-3</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>

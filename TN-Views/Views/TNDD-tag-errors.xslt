<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="xml"
               version="1.0"
               encoding="utf-8"
               omit-xml-declaration="yes"
               indent="yes"/>
   <xsl:param name="debug"/>
   <xsl:variable name="sq">'</xsl:variable>
   <xsl:variable name="dq">"</xsl:variable>
   <xsl:variable name="project">TNDD</xsl:variable>
   <xsl:variable name="translatetextswitch">1</xsl:variable>
   <xsl:variable name="translatefind"> </xsl:variable>
   <xsl:variable name="translatereplace">˽</xsl:variable>
   <xsl:variable name="ellipsis">…</xsl:variable>
   <xsl:variable name="invalidpuncpost-f">.,?!’”</xsl:variable>
   <xsl:variable name="invalidpuncpost-f-sub">%%%%%%</xsl:variable>
   <xsl:variable name="invalidtecendpunc">.,’”</xsl:variable>
   <xsl:variable name="invalidtecendpuncsub">%%%%</xsl:variable>
   <xsl:variable name="invalidtecfirstpunc">‘“</xsl:variable>
   <xsl:variable name="invalidvlet">klmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="ldq">“</xsl:variable>
   <xsl:variable name="letlc">abcdefghijklmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="letsub">$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="letuc">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
   <xsl:variable name="letucnumb">ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789</xsl:variable>
   <xsl:variable name="letucnumbsub">$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="letulc">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz</xsl:variable>
   <xsl:variable name="letulcendpunc">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789[(…)]/:–-“‘.?!  ” ’˽</xsl:variable>
   <xsl:variable name="letulcnumb">ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890</xsl:variable>
   <xsl:variable name="letulcnumbsub">$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="letulcsub">$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$</xsl:variable>
   <xsl:variable name="letulcsub2">UUUUUUUUUUUUUUUUUUUUUUUUUULLLLLLLLLLLLLLLLLLLLLLLLLL</xsl:variable>
   <xsl:variable name="letulcendpuncsub">$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$%%%</xsl:variable>
   <xsl:variable name="lsq">‘</xsl:variable>
   <xsl:variable name="moddate">2025-06-28</xsl:variable>
   <xsl:variable name="modified"> Modified: </xsl:variable>
   <xsl:variable name="numb">1234567890</xsl:variable>
   <xsl:variable name="numbsub">##########</xsl:variable>
   <xsl:variable name="postrsq">”,.</xsl:variable>
   <xsl:variable name="puncreplace">,….“‘’”!?:—-</xsl:variable>
   <xsl:variable name="puncreplacespace"/>
   <xsl:variable name="rdq">”</xsl:variable>
   <xsl:variable name="rsq">’</xsl:variable>
   <xsl:variable name="validcvnumblet">1234567890abcdefghij</xsl:variable>
   <xsl:variable name="validcvnumbletendash">1234567890abcdefghij–</xsl:variable>
   <xsl:variable name="validcvnumbletendashsub">##########$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validcvnumbletpunc">1234567890abcdefghij–:</xsl:variable>
   <xsl:variable name="validcvnumbletsub">##########$$$$$$$$$$</xsl:variable>
   <xsl:variable name="validreorderedcvnumbletpunc">1234567890abcdefghij–:,</xsl:variable>
   <xsl:variable name="validrsqcontext">’ </xsl:variable>
   <xsl:variable name="validvlet">abcdefghij</xsl:variable>
   <xsl:variable name="validvletcomma">abcdefghij,</xsl:variable>
   <xsl:variable name="validvletendash">abcdefghij–,</xsl:variable>
   <xsl:variable name="validvletpunc">–abcdefghij,</xsl:variable>
   <xsl:variable name="validvletsub">$$$$$$$$$$</xsl:variable>
   <xsl:variable name="version">9.5</xsl:variable>
   <xsl:variable name="view"> tag errors view </xsl:variable>
   <xsl:variable name="test">+ </xsl:variable>
   <xsl:variable name="N29-2find">+ …</xsl:variable>
   <xsl:variable name="N29-2replace">_++</xsl:variable>
   <xsl:template match="chapter[@number]">
      <xsl:if test="count(preceding::chapter[@number]) = 0">
         <xsl:call-template name="style"/>
      </xsl:if>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:text>build</xsl:text>
         </xsl:attribute>
         <xsl:value-of select="concat('Version: ',$version,' ',$project,$view,$modified,$moddate)"/>
         <br/>
         <xsl:value-of select="concat('In this view, the ',substring($translatereplace,1,1),' character represents the narrow no-break space.')"/>
      </xsl:element>
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
div {white-space: normal;}
.build {font-weight:bold;line-height:1.1;padding-bottom:6pt;}
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
.err-table--post-65 {background:peachpuff;border-bottom:2pt solid red;}
.err-table--post-65::after {content:'The following is not \\sl1 or \\pvr. In Psalms 119, \\mt9 is allowed.  [D65]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx--82-3 {background:orange;}
.err-char-sbx--82-3::after {content:'The chapter number in this \\sbx is incorrect.  [D82.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-83-5 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-83-5::after {content:'The hyphen in the \\sbx verse range in this paragraph should be an en dash.  [D83.5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-85-1 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-85-1::after {content:'The first verse of the range in this \\sbx does not match the current verse number in \\v above.  [D85.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-85-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-85-2::after {content:'The verse in this \\sbx does not match the current verse number in \\v above. (Or you maybe using an em dash rather than an en dash.)  [D85.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-85-3 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-85-3::after {content:'The chapter in this \\sbx does not match the current chapter number.  [D85.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-sbx-mid-85-4 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-sbx-mid-85-4::after {content:'The chapter in this \\sbx does not match the current chapter number.  [D85.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-fr-mid-83-8 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-fr-mid-83-8::after {content:'The hyphen in the verse range in this \\fr should be an en dash.  [D83.8]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-fr-mid-83-9 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-fr-mid-83-9::after {content:'The hyphen in the verse range in this \\fr should be an en dash.  [D83.9]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ft-mid-83-11 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-ft-mid-83-11::after {content:'The hyphen in the verse range in this \\ft should be an en dash.  [D83.11]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ft-mid-83-12 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char-ft-mid-83-12::after {content:'The hyphen in the verse range in this \\ft should be an en dash.  [D83.12]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---24 {background:orange;}
.err-char---24::after {content:'There is a space before the closing SFM. The space must be after the closing SFM, unless you are connecting underining between words while changing to another SFM.  [D24]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---C05-1 {background:orange;}
.err-char---C05-1::after {content:'This character SFM is empty  [DC05.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--mid-87-2 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-char--mid-87-2::after {content:'This character SFM contains a straight quote mark. It should be a curly quote mark.  [D87.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--pre-C01 {background:orange;border-left:4pt solid red;}
.err-char--pre-C01::after {content:'There is an erroneous \\xxx* \\xxx, where ‘xxx’ is the same in both cases.  [DC01]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char---C04 {background:orange;}
.err-char---C04::after {content:'This character SFM is not closed. No end marker was found.  [DC04]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char--post-C08-19 {background:orange;border-right:4pt solid red;}
.err-char--post-C08-19::after {content:'There should be a space before the ellipsis following this character markup.  [DC08.19]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-imp-post-12 {background:orange;border-right:4pt solid red;}
.err-char-imp-post-12::after {content:'This implied bracket sequence is incomplete or incorrect (it should be: \\brk ⌊\\brk*\\imp...\\imp*\\brk ⌋\\brk*)  [D12]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-imp-pre-13 {background:orange;border-left:4pt solid red;}
.err-char-imp-pre-13::after {content:'This \\imp...\\imp* should be preceded by \\bk ⌊\\bk* or a \\rgi and a space.  [D13]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi-pre-15 {background:orange;border-left:4pt solid red;}
.err-char-rgi-pre-15::after {content:'The \\rgi should be immediately after the word it modifies.  [D15]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi-post-47 {background:orange;border-right:4pt solid red;}
.err-char-rgi-post-47::after {content:'A letter should not immediately follow an \\rgi*.  [D47]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgi--49 {background:orange;}
.err-char-rgi--49::after {content:'This \\rgi SFM should be embedded in a \\imp SFM like this \\+rgi  [D49]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgm-pre-16 {background:orange;border-left:4pt solid red;}
.err-char-rgm-pre-16::after {content:'The \\rgm should be immediately after the word it modifies.  [D16]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-rgm-post-48 {background:orange;border-right:4pt solid red;}
.err-char-rgm-post-48::after {content:'A letter should not immediately follow an \\rgm*.  [D48]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb--17 {background:orange;}
.err-char-tbb--17::after {content:'There should be only two underscore characters in the \tbb __\tbb*.  [D17]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-pre-18 {background:orange;border-left:4pt solid red;}
.err-char-tbb-pre-18::after {content:'There should not be a space before a \tbb SFM  [D18]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-tbb-post-19 {background:orange;border-right:4pt solid red;}
.err-char-tbb-post-19::after {content:'There should not be a space after a \tbb* SFM  [D19]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ros--66 {background:orange;}
.err-char-ros--66::after {content:'There is no embedded \\+brk in this \\ros  [D66]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-ros-post-83-2 {background:orange;border-right:4pt solid red;}
.err-char-ros-post-83-2::after {content:'There should be a narrow no-break-space (\\u202F) after the \\ros*. Delete the current space after the \\ros* and type in a normal space. Autocorrect will change it to the right character.  [D83.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-pre-6 {background:orange;border-left:4pt solid red;}
.err-char-brk-pre-6::after {content:'This \\brk SFM is not preceded by a space or quotes or left parenthesis  [D6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-post-9 {background:orange;border-right:4pt solid red;}
.err-char-brk-post-9::after {content:'This \\brk SFM is not followed by a space or punctuation  [D9]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk--10 {background:orange;}
.err-char-brk--10::after {content:'This \\brk SFM can contain only ⌊ or ⌋ but this does not match either of those.  [D10]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-post-4 {background:orange;border-right:4pt solid red;}
.err-char-brk-post-4::after {content:'This \\brk* SFM should only occur immediately before an \\imp SFM.  [D4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-pre-7 {background:orange;border-left:4pt solid red;}
.err-char-brk-pre-7::after {content:'This \\brk SFM should only occur immediately after an \\imp* or \\rgi* SFM, except if in a \\ros ...\\ros*.  [D7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-char-brk-post-5 {background:orange;border-right:4pt solid red;}
.err-char-brk-post-5::after {content:'There should not be a space between this \\brk and the following \\imp.  [D5]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f--C06-1 {background:orange;}
.err-note-f--C06-1::after {content:'Footnotes must end with sentence-final punctuation and no space before the \\f*.  [DC06.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-mid-C08-20 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-note-f-mid-C08-20::after {content:'There should be a space between the ellipsis and the following word.  [DC08.20]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-pre-56 {background:orange;border-left:4pt solid red;}
.err-note-f-pre-56::after {content:'This footnote is not in the standard example footnote formatting for TNDD (\\ros \\+brk...).  [D56]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-post-57 {background:orange;border-right:4pt solid red;}
.err-note-f-post-57::after {content:'This footnote is not in the standard example footnote formatting for TNDD (\\ros \\+brk...).  [D57]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-mid-C08-21 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-note-f-mid-C08-21::after {content:'Between words, the ellipsis must have spaces on either side.  [DC08.21]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-mid-C08-22 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-note-f-mid-C08-22::after {content:'There should be a space between the ellipsis and opening round bracket.  [DC08.22]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-mid-C08-23 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-note-f-mid-C08-23::after {content:'There is no sentence ending punctuation after the ellipsis.  [DC08.23]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note-f-mid-C08-24 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-note-f-mid-C08-24::after {content:'There is no sentence ending punctuation after the ellipsis and before the end quotes.  [DC08.24]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note---C05-3 {background:orange;}
.err-note---C05-3::after {content:'This note SFM has text but no caller. The text should be in an \\ft.  [DC05.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-note---C05-2 {background:orange;}
.err-note---C05-2::after {content:'This note SFM is empty  [DC05.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C07-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C07-1::after {content:'Right single quotes should be separated from right double quotes by a narrow no-break space. Retype the space and second quote mark and Autocorrect will turn it into a narrow no-break space.  [DC07.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C07-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C07-2::after {content:'Right double quotes should be separated from right single quotes by a \\u202F narrow no-break space. Retype the space and second quote mark and Autocorrect will turn it into a narrow no-break space.  [DC07.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C07-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C07-3::after {content:'Left double quotes should be separated from left single quotes by a \\u202F narrow no-break space. Retype the space and second quote mark and Autocorrect will turn it into a narrow no-break space.  [DC07.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C07-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C07-4::after {content:'Left single quotes should be separated from left double quotes by a \\u202F narrow no-break space. Retype the space and second quote mark and Autocorrect will turn it into a narrow no-break space.  [DC07.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para---43 {background:peachpuff;}
.err-para---43::after {content:'This paragraph marker is empty, and may not be allowed here.  [D43]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-1::after {content:'The three full stops should be the ellipsis character. Retype them and Autocorrect will make it the ellipsis.  [DC08.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-15 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-15::after {content:'There should be a space between the ellipsis and the following word.  [DC08.15]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-2::after {content:'The three full stops separated by spaces should be the ellipsis character. Retype them without the spaces and Autocorrect will make it the ellipsis.  [DC08.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-3::after {content:'The three full stops separated by narrow spaces should be an ellipsis. Retype them without the spaces and Autocorrect will make it the ellipsis.  [DC08.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-4::after {content:'Between words, the ellipsis must have spaces on either side.  [DC08.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-87-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-87-1::after {content:'This paragraph contains a straight quote mark. It should be a curly quote mark.  [D87.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-6 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-6::after {content:'There should not be a space before this ellipsis.  [DC08.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-7 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-7::after {content:'There should not be a space before this ellipsis.  [DC08.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-8 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-8::after {content:'There should not be a space before this ellipsis.  [DC08.8]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-9 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-9::after {content:'There should not be a space before this ellipsis.  [DC08.9]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-10 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-10::after {content:'There should not be a space before this ellipsis.  [DC08.10]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-11 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-11::after {content:'There should not be a space before this ellipsis.  [DC08.11]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-12 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-12::after {content:'An ellipsis cannot follow a comma. Insert a space between the two.  [DC08.12]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-13 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-13::after {content:'There should not be a space between the left opening quote and the ellipsis.  [DC08.13]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-16 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-16::after {content:'There should be a space between the ellipsis and opening round bracket.  [DC08.16]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-17 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-17::after {content:'There is no sentence ending punctuation after the ellipsis.  [DC08.17]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para--mid-C08-18 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para--mid-C08-18::after {content:'There is no sentence ending punctuation after the ellipsis and before the end quotes.  [DC08.18]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-pvr-pre-71 {background:peachpuff;border-top:2pt solid red;}
.err-para-pvr-pre-71::after {content:'The preceding is not \\tr or \\sl1 or \\p or \\b3  [D71]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-pvr-post-50-1 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-pvr-post-50-1::after {content:'A \\pvr must occur before an \\sl1 or a \\b2 \\sla combination or a \\b \\tr (section) combination.  [D50.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-pvr-post-50-2 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-pvr-post-50-2::after {content:'A \\pvr must occur before an \\sl1 or a \\b2 \\sla combination or a \\b \\tr (section) combination.  [D50.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-pvr-post-50-3 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-pvr-post-50-3::after {content:'A \\pvr must occur before an \\sl1 or a \\b2 \\sla combination or a \\b \\tr (section) combination.  [D50.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-pvr-post-50-4 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-pvr-post-50-4::after {content:'A \\pvr must occur before an \\sl1 or a \\b2 \\sla combination or a \\b \\tr (section) combination.  [D50.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sla-post-52 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-sla-post-52::after {content:'The following is not \\gn or \\ml1 or \\sl1  [D52]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sla-pre-63 {background:peachpuff;border-top:2pt solid red;}
.err-para-sla-pre-63::after {content:'The preceding is not \\sl1 or \\b2  [D63]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gn-post-53 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-gn-post-53::after {content:'The following is not \\ml1  [D53]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-gn-pre-54 {background:peachpuff;border-top:2pt solid red;}
.err-para-gn-pre-54::after {content:'The preceding is not \\sl1 or \\sla  [D54]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-mid-86 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b-mid-86::after {content:'A \\b paragraph should be empty.  [D86]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-post-55 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-b-post-55::after {content:'The following is not \\p or \\sl1 or \\tr or \\b3 or \\c or \\b or \\mt_ or \\ntn  [D55]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-pre-80 {background:peachpuff;border-top:2pt solid red;}
.err-para-b-pre-80::after {content:'A \\b is not allowed between a \\c and a \\p  [D80]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-pre-80-2 {background:peachpuff;border-top:2pt solid red;}
.err-para-b-pre-80-2::after {content:'A \\b is not allowed between a \\c and a \\b3  [D80.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b--81 {background:peachpuff;}
.err-para-b--81::after {content:'A \\b is not allowed between a \\p and a \\sl1 or \\tr  [D81]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b-pre-58 {background:peachpuff;border-top:2pt solid red;}
.err-para-b-pre-58::after {content:'The preceding is not \\p or \\io1 or \\ml1 or \\ntn or \\b or \\mt_ or \\pvr or \\tr or \\c  [D58]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-mlor--37 {background:peachpuff;}
.err-para-mlor--37::after {content:'The content of this \\\mlor SFM can only be: -or-  [D37]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-mlor-post-35 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-mlor-post-35::after {content:'There is no \\ml1 line following this \\mlor. Delete this line or addd a \\ml1 line  [D35]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-mlor-pre-36 {background:peachpuff;border-top:2pt solid red;}
.err-para-mlor-pre-36::after {content:'A \\ml1 should preceed this \\mlor  [D36]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--82-1 {background:peachpuff;}
.err-para-sl1--82-1::after {content:'The chapter number in this \\sl1 is incorrect.  [D82.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--82-2 {background:peachpuff;}
.err-para-sl1--82-2::after {content:'The verse number in this \\sl1 is incorrect, unless you are covering a span of verses.  [D82.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--83-3 {background:peachpuff;}
.err-para-sl1--83-3::after {content:'The hyphen in the verse range in this \\sl1 should be an en dash.  [D83.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--83-32 {background:peachpuff;}
.err-para-sl1--83-32::after {content:'The hyphen in the verse range in this \\sl1 should be an en dash.  [D83.32]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--68 {background:peachpuff;}
.err-para-sl1--68::after {content:'The verse reference in \\sl1 appears to have a space in it.  [D68]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1-pre-69 {background:peachpuff;border-top:2pt solid red;}
.err-para-sl1-pre-69::after {content:'Before an \\sl1 can only be a \\p, \\b3, \\ml1, \\mt9 (Psalm 119 only), \\ntn (only for a note to the MTT about the following text), \\pvr (short note to the MTT), \\sla (only to show a whole verse in an alternate source text), or a \\b (above a new paragraph mark in the \\ml1 line).  [D69]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1--51 {background:peachpuff;}
.err-para-sl1--51::after {content:'This paragraph is missing a \\tbb __\\tbb* after the verse reference.  [D51]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-sl1-post-41 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-sl1-post-41::after {content:'The paragraph following this paragraph should be \\ml1 or \\sla or this should be a \\sla instead.  [D41]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-11 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-11::after {content:'This \\ml1 does not start with a left double quote like the \\sl1, or you have changed it to an indirect quote.  [D88.11]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-31 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-31::after {content:'This \\ml1 does not start with a left single quote like the \\sl1, or you have changed it to an indirect quote.  [D88.31]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-32 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-32::after {content:'This \\ml1 starts with a left single quote when the \\sl1 does not, or you have changed it to a direct quote.  [D88.32]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-33 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-33::after {content:'This \\ml1 has no left single quote when the \\sl1 starts with one, or you have changed it to an indirect quote.  [D88.33]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-34 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-34::after {content:'This \\ml1 starts with a left single quote but the \\sl1 has none, or you have changed it to a direct quote.  [D88.34]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-53 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-53::after {content:'This \\ml1 starts with a left single quote when the \\sl1 ends with a left double quote.  [D88.53]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-12 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-12::after {content:'This \\ml1 does not start with a left double quote like the \\sl1, or you have changed it to an indirect quote.  [D88.12]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-14 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-14::after {content:'This \\ml1 starts with a left double quote when the \\sl1 does not.  [D88.14]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-13 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-13::after {content:'This \\ml1 starts with a left double quote when the \\sl1 does not.  [D88.13]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-pre-30 {background:peachpuff;border-top:2pt solid red;}
.err-para-ml1-pre-30::after {content:'The paragraph before this paragraph should be \\sl1 or \\mlor  [D30]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-pre-31 {background:peachpuff;border-top:2pt solid red;}
.err-para-ml1-pre-31::after {content:'The preceding \\ml1 has a ¶\\tbb __\\tbb* so this one should too.  [D31]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--32 {background:peachpuff;}
.err-para-ml1--32::after {content:'There is no ¶\\tbb __\\tbb* in this paragraph. It follows a section header \\tr so it is required.  [D32]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-post-61 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-ml1-post-61::after {content:'The following is not \\mlor or \\sl1 or \\p or \\b or \\b3 or \\c  [D61]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-41 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-41::after {content:'This \\ml1 does not have a right single quote like the \\sl1, or you have changed it to an indirect quote.  [D88.41]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-42 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-42::after {content:'This \\ml1 has a right  single quote when the \\sl1 does not, or you have changed it to a direct quote.  [D88.42]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-43 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-43::after {content:'This \\ml1 does not have a right single quote like the \\sl1, or you have changed it to an indirect quote.  [D88.43]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-44 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-44::after {content:'This \\ml1 has a right  single quote when the \\sl1 does not, or you have changed it to a direct quote.  [D88.44]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-21 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-21::after {content:'This \\ml1 does not end with a right double quote like the \\sl1, or you have changed it to an indirect quote.  [D88.21]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-23 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-23::after {content:'This \\ml1 does not end with a right double quote like the \\sl1, or you have changed it to an indirect quote.  [D88.23]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--26 {background:peachpuff;}
.err-para-ml1--26::after {content:'A Pilcrow character ¶ should be followed by a \\tbb at the start of this paragraph  [D26]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--29 {background:peachpuff;}
.err-para-ml1--29::after {content:'The \\tbb SFM should be second after a ¶ paragraph marker  [D29]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-22 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-22::after {content:'This \\ml1 ends with a right double quote when the \\sl1 does not, or you have changed it to a direct quote.  [D88.22]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-24 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-24::after {content:'This \\ml1 ends with a right double quote when the \\sl1 does not, or you have changed it to a direct quote.  [D88.24]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-51 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-51::after {content:'This \\ml1 starts with a left double quote when the \\sl1 starts with a left double single quote.  [D88.51]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-52 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-52::after {content:'This \\ml1 starts with a left double quote when the \\sl1 starts with a left single quote.  [D88.52]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-54 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-54::after {content:'This \\ml1 starts with a left single quote when the \\sl1 starts with a left double quote.  [D88.54]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-55 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-55::after {content:'This \\ml1 ends with a right double quote when the \\sl1 ends with a right single quote.  [D88.55]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-56 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-56::after {content:'This \\ml1 ends with a right single quote when the \\sl1 ends with a right double quote.  [D88.56]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-57 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-57::after {content:'This \\ml1 ends with a right double quote when the \\sl1 ends with a right single quote.  [D88.57]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1-mid-88-58 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-ml1-mid-88-58::after {content:'This \\ml1 ends with a right single quote when the \\sl1 ends with a right double quote.  [D88.58]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-ml1--33 {background:peachpuff;}
.err-para-ml1--33::after {content:'This \\ml1 should not be empty. If there is no content, remove it and the \\mlor preceding it.  [D33]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-62 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-62::after {content:'The preceding is not \\b or \\b3 or \\ml1 or \\c or \\tr or \\sl1 or \\mt2  [D62]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-78-2 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-78-2::after {content:'There should be a \\b above this \\p before a section heading.  [D78.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-post-79 {background:peachpuff;border-bottom:2pt solid red;}
.err-para-p-post-79::after {content:'There should not be a \\b after this, but it could go before  [D79]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-pre-40 {background:peachpuff;border-top:2pt solid red;}
.err-para-p-pre-40::after {content:'The preceding \\p is not allowed here.  [D40]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-p-mid-84-2 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-p-mid-84-2::after {content:'A \\p paragraph must contain a \\v.  [D84.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-para-b3-mid-84-1 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-para-b3-mid-84-1::after {content:'A \\b3 paragraph must contain a \\v.  [D84.1]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell--mid-83-4 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell--mid-83-4::after {content:'The hyphen in a verse range in this \\tr \\tc1 should be an en dash.  [D83.4]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell--mid-87-3 {background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;}
.err-cell--mid-87-3::after {content:'This table cell contains a straight quote mark. It should be a curly quote mark.  [D87.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1--2 {background:peachpuff;}
.err-cell-tc1--2::after {content:'This \\tc1 SFM should have two \\sbx SFMs  [D2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-cell-tc1--3 {background:peachpuff;}
.err-cell-tc1--3::after {content:'This \\tc1 SFM should have one \\tbb __\tbb* SFM  [D3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--44 {background:peachpuff;}
.err-row-tr--44::after {content:'The SFM \\tr must have a \\tc1 following the \\tr.  [D44]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--44-2 {background:peachpuff;}
.err-row-tr--44-2::after {content:'The SFM \\tr must have a \\tc1 following the \\tr.  [D44.2]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-row-tr--44-3 {background:peachpuff;}
.err-row-tr--44-3::after {content:'The SFM \\tr must have only one \\tc(1) following the \\tr.  [D44.3]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-verse-v-mid-83-6 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-verse-v-mid-83-6::after {content:'The en dash in the verse range in this \\v must be a hyphen.  [D83.6]';border:2pt solid thistle;border-left:5pt solid tomato;}
.err-verse-v-mid-83-7 {border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;}
.err-verse-v-mid-83-7::after {content:'A \\v cannot have verse parts in it.  [D83.7]';border:2pt solid thistle;border-left:5pt solid tomato;}
</style>
   </xsl:template>
   <xsl:template match="text()">
      <xsl:choose>
         <xsl:when test="$translatetextswitch = '1'">
            <xsl:value-of select="translate(.,$translatefind,$translatereplace)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="."/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="text()" mode="paratxt">
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="char" mode="paratxt">
      <xsl:apply-templates select="node()" mode="paratxt"/>
   </xsl:template>
   <xsl:template match="note" mode="paratxt"/>
   <xsl:template match="text()" mode="fntext">
      <xsl:choose>
         <xsl:when test="$translatetextswitch = '1'">
            <xsl:value-of select="translate(.,$translatefind,$translatereplace)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="."/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="*" mode="fntext">
      <xsl:apply-templates select="node()" mode="fntext"/>
   </xsl:template>
   <xsl:template match="*[@style = 'tec']" mode="fntext"/>
   <xsl:template match="table">
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">table<!--ref 65 - rank=5--><xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'pvr'])">
               <xsl:if test="$prechapter != 119">
                  <xsl:text> err-table--post-65</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- char @style=sbx -->
   <xsl:template match="char[@style = 'sbx']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:variable name="refcolonv" select="substring-after(node()[not(self::*)],':')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> refcolonv = <xsl:value-of select="concat($sq,$refcolonv,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="strlenb4chap"
                    select="string-length(substring-before(translate(node()[not(self::*)],$validcvnumblet,$validcvnumbletsub),'#'))"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> strlenb4chap = <xsl:value-of select="concat($sq,$strlenb4chap,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="sbxc"
                    select="normalize-space(translate(substring-before(text(),':'),$letulc,''))"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> sbxc = <xsl:value-of select="concat($sq,$sbxc,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="sbxv"
                    select="translate(substring-after(text(),':'),$validvletpunc,'')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> sbxv = <xsl:value-of select="concat($sq,$sbxv,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="chappos"
                    select="string-length(substring-before(translate(node()[not(self::*)],$numb,$numbsub), '#'))+1"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> chappos = <xsl:value-of select="concat($sq,$chappos,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="hascvref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),'#:#')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> hascvref = <xsl:value-of select="concat($sq,$hascvref,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="hasspacecref"
                    select="contains(translate(node()[not(self::*)],$numb,$numbsub),' #')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> hasspacecref = <xsl:value-of select="concat($sq,$hasspacecref,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="numbfirst"
                    select="substring(translate(.,$numb,$numbsub),1,1) = '#'"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> numbfirst = <xsl:value-of select="concat($sq,$numbfirst,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="refchapcolon" select="substring-before(node()[not(self::*)],':')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> refchapcolon = <xsl:value-of select="concat($sq,$refchapcolon,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="refcolonvr1"
                    select="substring-before(translate(substring-after(node()[not(self::*)],':'),$validvlet,''),'–')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> refcolonvr1 = <xsl:value-of select="concat($sq,$refcolonvr1,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="refwordschapcolon"
                    select="substring-before(substring(node()[not(self::*)],$strlenb4chap +1),':')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> refwordschapcolon = <xsl:value-of select="concat($sq,$refwordschapcolon,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 82.3 - rank=-->
               <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
                  <xsl:if test="$prechapter != $sbxc">
                     <xsl:text> err-char-sbx--82-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 83.5 - rank=-->
               <xsl:if test="contains(translate(.,$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char-sbx-mid-83-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 85.1 - rank=-->
               <xsl:if test="$hascvref and not(contains($preverse,'-')) and contains(.,'–')">
                  <xsl:if test="$refcolonvr1 != $preverse">
                     <xsl:text> err-char-sbx-mid-85-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 85.2 - rank=-->
               <xsl:if test="$hascvref and not(contains($preverse,'-'))  and not(contains(.,'–'))">
                  <xsl:if test="$refcolonv != $preverse">
                     <xsl:text> err-char-sbx-mid-85-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 85.3 - rank=-->
               <xsl:if test="$hasspacecref  and $hascvref ">
                  <xsl:if test="$refwordschapcolon != $prechapter">
                     <xsl:text> err-char-sbx-mid-85-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 85.4 - rank=-->
               <xsl:if test="$numbfirst and $hascvref">
                  <xsl:if test="$refchapcolon != $prechapter">
                     <xsl:text> err-char-sbx-mid-85-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=fr -->
   <xsl:template match="char[@style = 'fr']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 83.8 - rank=-->
               <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$numb,''),$validvlet,$validvletsub),'$-$')">
                     <xsl:text> err-char-fr-mid-83-8</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 83.9 - rank=-->
               <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char-fr-mid-83-9</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=ft -->
   <xsl:template match="char[@style = 'ft']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 83.11 - rank=-->
               <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-char-ft-mid-83-11</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 83.12 - rank=-->
               <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(text(),$numb,$numbsub),$validvlet,$validvletsub),'#$-$')">
                     <xsl:text> err-char-ft-mid-83-12</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style= -->
   <xsl:template match="char">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
               <!--common char errors-->
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=imp -->
   <xsl:template match="char[@style = 'imp']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 12 - rank=5-->
               <xsl:if test="not(following-sibling::node()[1][@style = 'rem' or @style = 'brk' or @style = 'rgi' or @style = 'rgm'])">
                  <xsl:text> err-char-imp-post-12</xsl:text>
               </xsl:if>
               <!--ref 13 - rank=8-->
               <xsl:if test="not(preceding-sibling::node()[1][@style = 'rem' or @style = 'brk' or @style = 'rgi'])">
                  <xsl:text> err-char-imp-pre-13</xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=rgi -->
   <xsl:template match="char[@style = 'rgi']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 15 - rank=5-->
               <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
                  <xsl:if test="translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1),' ,.?!):”’','#########') = '#'">
                     <xsl:text> err-char-rgi-pre-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 47 - rank=5-->
               <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
                  <xsl:if test="translate(substring(following-sibling::text()[1],1,1),$letulc,$letulcsub) = '$'">
                     <xsl:text> err-char-rgi-post-47</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 49 - rank=5-->
               <xsl:if test="not(parent::*[@style = 'imp'] or preceding-sibling::*[1][@style = 'imp'])">
                  <xsl:text> err-char-rgi--49</xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=rgm -->
   <xsl:template match="char[@style = 'rgm']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 16 - rank=5-->
               <xsl:if test="preceding-sibling::node()[1] = preceding-sibling::text()[1]">
                  <xsl:if test="translate(substring(preceding-sibling::text()[1],string-length(preceding-sibling::text()[1]),1),' ,.?!):”’','#########') = '#'">
                     <xsl:text> err-char-rgm-pre-16</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 48 - rank=5-->
               <xsl:if test="following-sibling::node()[1] = following-sibling::text()[1]">
                  <xsl:if test="translate(substring(following-sibling::text()[1],1,1),$letulc,$letulcsub) = '$'">
                     <xsl:text> err-char-rgm-post-48</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=tbb -->
   <xsl:template match="char[@style = 'tbb']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 17 - rank=5-->
               <xsl:if test="not(text() = '__')">
                  <xsl:text> err-char-tbb--17</xsl:text>
               </xsl:if>
               <!--ref 18 - rank=5-->
               <xsl:if test="preceding-sibling::node()[1]/text() != preceding-sibling::*[1]/text()">
                  <xsl:text> err-char-tbb-pre-18</xsl:text>
               </xsl:if>
               <!--ref 19 - rank=10-->
               <xsl:if test="substring(following-sibling::node()[1],1,1) = ' '">
                  <xsl:text> err-char-tbb-post-19</xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=ros -->
   <xsl:template match="char[@style = 'ros']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:variable name="posttext" select="following::text()[1]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> posttext = <xsl:value-of select="concat($sq,$posttext,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="style" select="@style"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> style = <xsl:value-of select="concat($sq,$style,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="postnodechar1" select="substring($posttext,1,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> postnodechar1 = <xsl:value-of select="concat($sq,$postnodechar1,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 66 - rank=5-->
               <xsl:if test="not(count(char[@style = 'brk']) = 1) and not(text())">
                  <xsl:text> err-char-ros--66</xsl:text>
               </xsl:if>
               <!--ref 83.2 - rank=5-->
               <xsl:if test="$postnodechar1 != ' '">
                  <xsl:text> err-char-ros-post-83-2</xsl:text>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <!-- char @style=brk -->
   <xsl:template match="char[@style = 'brk']">
      <xsl:variable name="embed">
         <xsl:if test="parent::*[name() = 'char']">
            <xsl:text>+</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:variable name="postsibnode1" select="following-sibling::node()[1]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> postsibnode1 = <xsl:value-of select="concat($sq,$postsibnode1,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presibnode1" select="preceding-sibling::node()[1]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presibnode1 = <xsl:value-of select="concat($sq,$presibnode1,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter">
               <!--specific char errors--><!--ref 6 - rank=0-->
               <xsl:if test="contains(text(),'⌊') and position() &gt; 1 and not(preceding-sibling::node()[1][@style = 'tbb']) and not(substring(following-sibling::char[1][@style = 'imp'],1,1) = '’')">
                  <xsl:if test="not(translate(substring($presibnode1,string-length($presibnode1),1),'+ “/(‘','_+++++') = '+')">
                     <xsl:text> err-char-brk-pre-6</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 9 - rank=5-->
               <xsl:if test="contains(text(),'⌋') and not(position() = last())">
                  <xsl:if test="not(translate(substring($postsibnode1,1,1),'+ ,.?!:;”’)','_++++++++++') = '+')">
                     <xsl:text> err-char-brk-post-9</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 10 - rank=5-->
               <xsl:if test="string-length(text()) != 1">
                  <xsl:text> err-char-brk--10</xsl:text>
               </xsl:if>
               <!--ref 4 - rank=8-->
               <xsl:if test="contains(text(),'⌊') and not(parent::*[@style = 'ros'])">
                  <xsl:if test="not(following-sibling::node()[1][@style = 'rem' or @style = 'imp'])">
                     <xsl:text> err-char-brk-post-4</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 7 - rank=8-->
               <xsl:if test="contains(text(),'⌋') and not(parent::*[@style = 'ros'])">
                  <xsl:if test="not(preceding-sibling::node()[1][@style = 'rem' or @style = 'imp' or @style = 'rgi' or @style = 'rgm'])">
                     <xsl:text> err-char-brk-pre-7</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 5 - rank=10-->
               <xsl:if test="contains(text(),'⌊')">
                  <xsl:if test="following-sibling::node()[1]/text() = ' ' and following-sibling::node()[2]/@style = 'imp'">
                     <xsl:text> err-char-brk-post-5</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--common char errors-->
               <!--ref 24 - rank=0-->
               <xsl:if test="not(@closed)">
                  <xsl:if test="substring(node()[last()],string-length(text()[last()]),1) = ' '   and not(count(following-sibling::node()) = 0) ">
                     <xsl:text> err-char---24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C05.1 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@closed = 'false')">
                     <xsl:text> err-char---C05-1</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 87.2 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-char--mid-87-2</xsl:text>
               </xsl:if>
               <!--ref C01 - rank=9-->
               <xsl:if test="preceding-sibling::*[1]/@style = @style and preceding-sibling::*[1]/@style != 'brk'">
                  <xsl:if test="preceding::text()[1] = ' '">
                     <xsl:text> err-char--pre-C01</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C04 - rank=11-->
               <xsl:if test="@closed = 'false'">
                  <xsl:if test="substring(@style,1,1) != 'f'">
                     <xsl:text> err-char---C04</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.19 - rank=19-->
               <xsl:if test="substring(following-sibling::text()[1],1,1) = '…'">
                  <xsl:text> err-char--post-C08-19</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',$embed,@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
         <xsl:if test="not(@closed = 'false')">
            <xsl:element name="span">
               <xsl:attribute name="class">
                  <xsl:value-of select="concat(@style,' ',name())"/>
               </xsl:attribute>
               <xsl:value-of select="concat('\',$embed,@style,'*')"/>
            </xsl:element>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   <xsl:template match="note[@style = 'f']">
      <xsl:variable name="fnstringmod"
                    select="translate(.,$letulcendpunc,$letulcendpuncsub)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> fnstringmod = <xsl:value-of select="concat($sq,$fnstringmod,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="fnstringmod2" select="translate($fnstringmod,'˽','')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> fnstringmod2 = <xsl:value-of select="concat($sq,$fnstringmod2,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="fnstringmodlastchar"
                    select="substring($fnstringmod2,string-length($fnstringmod2),1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> fnstringmodlastchar = <xsl:value-of select="concat($sq,$fnstringmodlastchar,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref C05.3 - rank=5-->
            <xsl:if test="string-length(@caller) &gt; 1">
               <xsl:text> err-note---C05-3</xsl:text>
            </xsl:if>
            <!--ref C05.2 - rank=10-->
            <xsl:if test="string-length(.) = 0 and not(*) and string-length(@caller) = 0">
               <xsl:text> err-note---C05-2</xsl:text>
            </xsl:if>
            <!--ref C06.1 - rank=-->
            <xsl:if test="$fnstringmodlastchar != '%'">
               <xsl:text> err-note-f--C06-1</xsl:text>
            </xsl:if>
            <!--ref C08.20 - rank=4-->
            <xsl:if test="contains(translate(.,$letulc,$letulcsub),' …$')">
               <xsl:text> err-note-f-mid-C08-20</xsl:text>
            </xsl:if>
            <!--ref 56 - rank=5-->
            <xsl:if test="parent::*[@style = 'ml1']">
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ros'])">
                  <xsl:text> err-note-f-pre-56</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 57 - rank=5-->
            <xsl:if test="parent::*[@style = 'ml1']">
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ros'])">
                  <xsl:text> err-note-f-post-57</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref C08.21 - rank=15-->
            <xsl:if test="contains(translate(.,$letulc,$letulcsub),'$…$')">
               <xsl:text> err-note-f-mid-C08-21</xsl:text>
            </xsl:if>
            <!--ref C08.22 - rank=16-->
            <xsl:if test="contains(.,'…(')">
               <xsl:text> err-note-f-mid-C08-22</xsl:text>
            </xsl:if>
            <!--ref C08.23 - rank=17-->
            <xsl:if test="contains(translate(.,$letulc,$letulcsub2),'L… U') or contains(translate(translate(.,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
               <xsl:text> err-note-f-mid-C08-23</xsl:text>
            </xsl:if>
            <!--ref C08.24 - rank=18-->
            <xsl:if test="contains(translate(translate(.,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
               <xsl:text> err-note-f-mid-C08-24</xsl:text>
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
   </xsl:template>
   <xsl:template match="note">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref C05.3 - rank=5-->
            <xsl:if test="string-length(@caller) &gt; 1">
               <xsl:text> err-note---C05-3</xsl:text>
            </xsl:if>
            <!--ref C05.2 - rank=10-->
            <xsl:if test="string-length(.) = 0 and not(*) and string-length(@caller) = 0">
               <xsl:text> err-note---C05-2</xsl:text>
            </xsl:if>
            <!--ref C05.3 - rank=5-->
            <xsl:if test="string-length(@caller) &gt; 1">
               <xsl:text> err-note---C05-3</xsl:text>
            </xsl:if>
            <!--ref C05.2 - rank=10-->
            <xsl:if test="string-length(.) = 0 and not(*) and string-length(@caller) = 0">
               <xsl:text> err-note---C05-2</xsl:text>
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
   </xsl:template>
   <!-- para @style= -->
   <xsl:template match="para">
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="alltext" select="."/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> alltext = <xsl:value-of select="concat($sq,$alltext,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--specific para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=pvr -->
   <xsl:template match="para[@style = 'pvr']">
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 71 - rank=3-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or name() = 'table' or @style = 'sl1' or @style = 'p' or @style = 'b3'])">
                  <xsl:text> err-para-pvr-pre-71</xsl:text>
               </xsl:if>
               <!--ref 50.1 - rank=5-->
               <xsl:if test="not(following-sibling::*[1][@style = 'sl1' or @style = 'rem' or @style = 'b2' or @style = 'b'])">
                  <xsl:text> err-para-pvr-post-50-1</xsl:text>
               </xsl:if>
               <!--ref 50.2 - rank=6-->
               <xsl:if test="following-sibling::*[1][@style = 'rem']">
                  <xsl:if test="not(following-sibling::*[2][@style = 'sl1' or @style = 'b2' or @style = 'b'])">
                     <xsl:text> err-para-pvr-post-50-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 50.3 - rank=6-->
               <xsl:if test="following-sibling::*[1][@style = 'b2']">
                  <xsl:if test="not(following-sibling::*[2][@style = 'sla'])">
                     <xsl:text> err-para-pvr-post-50-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 50.4 - rank=6-->
               <xsl:if test="following-sibling::*[1][@style = 'b']">
                  <xsl:if test="not(following-sibling::*[2][name() = 'table'])">
                     <xsl:text> err-para-pvr-post-50-4</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=sla -->
   <xsl:template match="para[@style = 'sla']">
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 52 - rank=5-->
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'gn' or @style = 'ml1' or @style = 'sl1'])">
                  <xsl:text> err-para-sla-post-52</xsl:text>
               </xsl:if>
               <!--ref 63 - rank=5-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'b2'])">
                  <xsl:text> err-para-sla-pre-63</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=gn -->
   <xsl:template match="para[@style = 'gn']">
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 53 - rank=5-->
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
                  <xsl:text> err-para-gn-post-53</xsl:text>
               </xsl:if>
               <!--ref 54 - rank=5-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'sl1' or @style = 'sla'])">
                  <xsl:text> err-para-gn-pre-54</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
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
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 86 - rank=-->
               <xsl:if test="count(node()) &gt; 0">
                  <xsl:text> err-para-b-mid-86</xsl:text>
               </xsl:if>
               <!--ref 55 - rank=5-->
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'sl1' or name() = 'table' or @style = 'b3' or name() = 'chapter' or @style = 'b' or substring(@style,1,2) = 'mt' or @style = 'ntn'])">
                  <xsl:text> err-para-b-post-55</xsl:text>
               </xsl:if>
               <!--ref 80 - rank=5-->
               <xsl:if test="preceding-sibling::*[1][@style = 'c']">
                  <xsl:if test="following-sibling::*[1][@style = 'p']">
                     <xsl:text> err-para-b-pre-80</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 80.2 - rank=5-->
               <xsl:if test="preceding-sibling::*[1][@style = 'c']">
                  <xsl:if test="following-sibling::*[1][@style = 'b3']">
                     <xsl:text> err-para-b-pre-80-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 81 - rank=5-->
               <xsl:if test="preceding-sibling::*[1][@style = 'p'][child::*[@style = 'v']]">
                  <xsl:if test="following-sibling::*[1][@style = 'sl1'] or following-sibling::*[1][name() = 'table']">
                     <xsl:text> err-para-b--81</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 58 - rank=6-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'p' or @style = 'io1' or @style = 'ml1' or @style = 'ntn' or @style = 'b' or substring(@style,1,2) = 'mt' or @style = 'pvr' or name() = 'table' or name() = 'chapter'])">
                  <xsl:text> err-para-b-pre-58</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=mlor -->
   <xsl:template match="para[@style = 'mlor']">
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 37 - rank=5-->
               <xsl:if test="count(*) = 0">
                  <xsl:if test="not(text() = '-or-')">
                     <xsl:text> err-para-mlor--37</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 35 - rank=7-->
               <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
                  <xsl:text> err-para-mlor-post-35</xsl:text>
               </xsl:if>
               <!--ref 36 - rank=7-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1'])">
                  <xsl:text> err-para-mlor-pre-36</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=sl1 -->
   <xsl:template match="para[@style = 'sl1']">
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> preverse = <xsl:value-of select="concat($sq,$preverse,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="sl1v"
                    select="translate(substring-after(text()[1],':'),$validvletpunc,'')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> sl1v = <xsl:value-of select="concat($sq,$sl1v,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="sl1c" select="substring-before(text()[1],':')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> sl1c = <xsl:value-of select="concat($sq,$sl1c,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="precleanverse"
                    select="translate($preverse,concat($validvletpunc,'-—'),'')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> precleanverse = <xsl:value-of select="concat($sq,$precleanverse,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 82.1 - rank=-->
               <xsl:if test="$prechapter != $sl1c">
                  <xsl:text> err-para-sl1--82-1</xsl:text>
               </xsl:if>
               <!--ref 82.2 - rank=-->
               <xsl:if test="$precleanverse != translate($sl1v,'-','')">
                  <xsl:text> err-para-sl1--82-2</xsl:text>
               </xsl:if>
               <!--ref 83.3 - rank=-->
               <xsl:if test="contains(translate(text()[1],$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(text()[1],$letlc,''),$numb,$numbsub),'#-#')">
                     <xsl:text> err-para-sl1--83-3</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 83.32 - rank=-->
               <xsl:if test="contains(translate(text()[1],$numb,$numbsub),'#:#')">
                  <xsl:if test="contains(translate(translate(text()[1],$numb,$numbsub),$letlc,$letsub),'#$-$')">
                     <xsl:text> err-para-sl1--83-32</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 68 - rank=3-->
               <xsl:if test="contains(text()[1],' ')">
                  <xsl:text> err-para-sl1--68</xsl:text>
               </xsl:if>
               <!--ref 69 - rank=3-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'mt9' or @style = 'ntn' or @style = 'p' or @style = 'pvr' or @style = 'sla' or name() = 'table' or @style = 'b3' or @style = 'b'])">
                  <xsl:text> err-para-sl1-pre-69</xsl:text>
               </xsl:if>
               <!--ref 51 - rank=5-->
               <xsl:if test="not(*[@style = 'tbb'])">
                  <xsl:text> err-para-sl1--51</xsl:text>
               </xsl:if>
               <!--ref 41 - rank=7-->
               <xsl:if test="not(child::char[@style = 'tei'])">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'ml1' or @style = 'sla' or @style = 'pvr' or @style = 'gn'])">
                     <xsl:text> err-para-sl1-post-41</xsl:text>
                  </xsl:if>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
         <xsl:element name="span">
            <xsl:attribute name="class">
               <xsl:value-of select="concat('sfm-',@style,' sfm')"/>
            </xsl:attribute>
            <xsl:value-of select="concat('\',@style,' ')"/>
         </xsl:element>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <!-- para @style=ml1 -->
   <xsl:template match="para[@style = 'ml1']">
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:variable name="presl1text" select="presl1text"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1text = <xsl:value-of select="concat($sq,$presl1text,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="postRsqchar1sub"
                    select="translate(substring(substring-after(.,$rsq),1,1),$letulc,$letulcsub)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> postRsqchar1sub = <xsl:value-of select="concat($sq,$postRsqchar1sub,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="Rsqmodstring" select="translate(.,$postrsq,'')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> Rsqmodstring = <xsl:value-of select="concat($sq,$Rsqmodstring,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1textlast"
                    select="preceding-sibling::*[@style = 'sl1'][1]/node()[last()]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1textlast = <xsl:value-of select="concat($sq,$presl1textlast,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1textposttbb"
                    select="preceding-sibling::*[@style = 'sl1'][1]/node()[3]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1textposttbb = <xsl:value-of select="concat($sq,$presl1textposttbb,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="lasttext" select="text()[last()]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> lasttext = <xsl:value-of select="concat($sq,$lasttext,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curlastnodetext" select="node()[last()]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curlastnodetext = <xsl:value-of select="concat($sq,$curlastnodetext,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1postRsqchar1sub"
                    select="translate(substring(substring-after($presl1text,$rsq),1,1),$letulc,$letulcsub)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1postRsqchar1sub = <xsl:value-of select="concat($sq,$presl1postRsqchar1sub,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1textlastlen" select="string-length($presl1textlast)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1textlastlen = <xsl:value-of select="concat($sq,$presl1textlastlen,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curlasttextlen" select="string-length($curlastnodetext)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curlasttextlen = <xsl:value-of select="concat($sq,$curlasttextlen,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curlastnodetextb4lb"
                    select="substring-before($curlastnodetext,' (')"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curlastnodetextb4lb = <xsl:value-of select="concat($sq,$curlastnodetextb4lb,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curRsqcount"
                    select="string-length(.) - string-length(translate(., $rsq, ''))"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curRsqcount = <xsl:value-of select="concat($sq,$curRsqcount,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1postRsqcount"
                    select="string-length($presl1text) - string-length(translate($presl1text, $rsq, ''))"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1postRsqcount = <xsl:value-of select="concat($sq,$presl1postRsqcount,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="pesib1sty" select="preceding-sibling::*[1]/@style"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> pesib1sty = <xsl:value-of select="concat($sq,$pesib1sty,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="precedingtext" select="preceding::text()[1]"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> precedingtext = <xsl:value-of select="concat($sq,$precedingtext,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1textchar1" select="substring($presl1textlast,1,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1textchar1 = <xsl:value-of select="concat($sq,$presl1textchar1,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1textposttbbchar1"
                    select="substring($presl1textposttbb,1,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1textposttbbchar1 = <xsl:value-of select="concat($sq,$presl1textposttbbchar1,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="presl1textcharlast"
                    select="substring($presl1textlast,$presl1textlastlen,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> presl1textcharlast = <xsl:value-of select="concat($sq,$presl1textcharlast,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curfirstchar" select="substring(text()[1],1,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curfirstchar = <xsl:value-of select="concat($sq,$curfirstchar,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curfirstcharposttab" select="substring(node()[3],1,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curfirstcharposttab = <xsl:value-of select="concat($sq,$curfirstcharposttab,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curlastchar"
                    select="substring($curlastnodetext,$curlasttextlen,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curlastchar = <xsl:value-of select="concat($sq,$curlastchar,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curlastnodetextb4lblen"
                    select="string-length($curlastnodetextb4lb)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curlastnodetextb4lblen = <xsl:value-of select="concat($sq,$curlastnodetextb4lblen,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:variable name="curlastcharb4lb"
                    select="substring($curlastnodetext,$curlastnodetextb4lblen,1)"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> curlastcharb4lb = <xsl:value-of select="concat($sq,$curlastcharb4lb,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 88.11 - rank=0-->
               <xsl:if test="$curfirstchar = '¶' and $presl1textposttbbchar1 = $ldq">
                  <xsl:if test="$curfirstcharposttab != $ldq and $curfirstcharposttab != $lsq">
                     <xsl:text> err-para-ml1-mid-88-11</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.31 - rank=0-->
               <xsl:if test="$curfirstchar = '¶' and $presl1textposttbbchar1 = $lsq">
                  <xsl:if test="$curfirstcharposttab != $lsq and $curfirstcharposttab != $ldq">
                     <xsl:text> err-para-ml1-mid-88-31</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.32 - rank=0-->
               <xsl:if test="$curfirstchar = '¶' and $curfirstcharposttab = $lsq">
                  <xsl:if test="$presl1textposttbbchar1 != $lsq and $presl1textposttbbchar1 != $ldq">
                     <xsl:text> err-para-ml1-mid-88-32</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.33 - rank=0-->
               <xsl:if test="$curfirstchar != '¶' and $presl1textposttbbchar1 = $lsq">
                  <xsl:if test="$curfirstchar != $lsq and $curfirstchar != $ldq">
                     <xsl:text> err-para-ml1-mid-88-33</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.34 - rank=0-->
               <xsl:if test="$curfirstchar != '¶' and $curfirstchar = $lsq">
                  <xsl:if test="$presl1textposttbbchar1 != $lsq and $presl1textposttbbchar1 != $ldq">
                     <xsl:text> err-para-ml1-mid-88-34</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.53 - rank=0-->
               <xsl:if test="$curfirstchar = '¶' and $curfirstcharposttab = $lsq">
                  <xsl:if test="$presl1textposttbbchar1 = $ldq">
                     <xsl:text> err-para-ml1-mid-88-53</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.12 - rank=1-->
               <xsl:if test="$curfirstchar != '¶' and $presl1textposttbbchar1 = $ldq">
                  <xsl:if test="$curfirstchar != $ldq and $curfirstchar != $lsq">
                     <xsl:text> err-para-ml1-mid-88-12</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.14 - rank=2-->
               <xsl:if test="$curfirstchar != '¶' and $curfirstchar = $ldq">
                  <xsl:if test="$presl1textposttbbchar1 != $ldq and $presl1textposttbbchar1 != $lsq">
                     <xsl:text> err-para-ml1-mid-88-14</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.13 - rank=3-->
               <xsl:if test="$curfirstchar = '¶' and $curfirstcharposttab = $ldq">
                  <xsl:if test="$presl1textposttbbchar1 != $ldq and $presl1textposttbbchar1 != $lsq">
                     <xsl:text> err-para-ml1-mid-88-13</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 30 - rank=5-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'mlor' or @style = 'sl1' or @style = 'sla' or @style = 'gn'])">
                  <xsl:text> err-para-ml1-pre-30</xsl:text>
               </xsl:if>
               <!--ref 31 - rank=5-->
               <xsl:if test="(contains( preceding-sibling::*[2][@style = 'ml1']/text(),'¶') or preceding-sibling::*[2][@style = 'ml1']/*[1][@style  = 'tbb']) and preceding-sibling::*[1][@style = 'mlor']">
                  <xsl:if test="not(child::node()[@style = 'tbb'])  or not(contains(text(),'¶'))">
                     <xsl:text> err-para-ml1-pre-31</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 32 - rank=5-->
               <xsl:if test="preceding-sibling::*[2][name() = 'table']">
                  <xsl:if test="not(child::node()[@style = 'tbb'])">
                     <xsl:text> err-para-ml1--32</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 61 - rank=5-->
               <xsl:if test="count(following-sibling::*) &gt; 0">
                  <xsl:if test="not(following-sibling::*[1][@style = 'rem' or @style = 'mlor' or @style = 'sl1' or @style = 'p' or @style = 'b' or @style = 'b3' or name() = 'chapter'])">
                     <xsl:text> err-para-ml1-post-61</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.41 - rank=5-->
               <xsl:if test="$presl1textcharlast = $rsq">
                  <xsl:if test="$curlastchar != $rsq and $curlastchar != $rdq and $curlastchar != ')'">
                     <xsl:text> err-para-ml1-mid-88-41</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.42 - rank=5-->
               <xsl:if test="$curlastchar = $rsq">
                  <xsl:if test="$presl1textcharlast != $rsq and $presl1textcharlast != $rdq and $curlastchar != ')'">
                     <xsl:text> err-para-ml1-mid-88-42</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.43 - rank=5-->
               <xsl:if test="$curlastchar = ')' and $presl1textcharlast = $rsq">
                  <xsl:if test="$curlastcharb4lb != $rsq and $curlastcharb4lb != $rdq">
                     <xsl:text> err-para-ml1-mid-88-43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.44 - rank=5-->
               <xsl:if test="$curlastchar = ')' and $curlastcharb4lb = $rsq">
                  <xsl:if test="$presl1textcharlast != $rsq and $presl1textcharlast != $rdq">
                     <xsl:text> err-para-ml1-mid-88-44</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.21 - rank=6-->
               <xsl:if test="$presl1textcharlast = $rdq">
                  <xsl:if test="$curlastchar != $rdq and $curlastchar != $rsq and $curlastchar != ')'">
                     <xsl:text> err-para-ml1-mid-88-21</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.23 - rank=6-->
               <xsl:if test="$curlastchar = ')' and $presl1textcharlast = $rdq">
                  <xsl:if test="$curlastcharb4lb != $rdq and $curlastcharb4lb != $rsq">
                     <xsl:text> err-para-ml1-mid-88-23</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 26 - rank=8-->
               <xsl:if test="(*[@style = 'tbb'] and not(contains(text(),'¶'))) or (contains(text(),'¶') and not(*[@style = 'tbb']))">
                  <xsl:text> err-para-ml1--26</xsl:text>
               </xsl:if>
               <!--ref 29 - rank=8-->
               <xsl:if test="count(char[@style = 'tbb']) = 1">
                  <xsl:if test="not(child::node()[2][@style = 'tbb'])">
                     <xsl:text> err-para-ml1--29</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.22 - rank=8-->
               <xsl:if test="$curlastchar = $rdq">
                  <xsl:if test="$presl1textcharlast != $rdq and $presl1textcharlast != $rsq and $curlastchar != ')'">
                     <xsl:text> err-para-ml1-mid-88-22</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.24 - rank=8-->
               <xsl:if test="$curlastchar = ')' and $curlastcharb4lb = $rdq">
                  <xsl:if test="$presl1textcharlast != $rdq and $presl1textcharlast != $rsq">
                     <xsl:text> err-para-ml1-mid-88-24</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.51 - rank=8-->
               <xsl:if test="$curfirstchar = '¶' and $curfirstcharposttab = $ldq">
                  <xsl:if test="$presl1textposttbbchar1 = $lsq">
                     <xsl:text> err-para-ml1-mid-88-51</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.52 - rank=8-->
               <xsl:if test="$curfirstchar = $ldq">
                  <xsl:if test="$presl1textposttbbchar1 = $lsq">
                     <xsl:text> err-para-ml1-mid-88-52</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.54 - rank=8-->
               <xsl:if test="$curfirstchar = $lsq">
                  <xsl:if test="$presl1textposttbbchar1 = $ldq">
                     <xsl:text> err-para-ml1-mid-88-54</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.55 - rank=8-->
               <xsl:if test="$curlastchar = $rdq">
                  <xsl:if test="$presl1textcharlast = $rsq">
                     <xsl:text> err-para-ml1-mid-88-55</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.56 - rank=8-->
               <xsl:if test="$curlastchar = $rsq">
                  <xsl:if test="$presl1textcharlast = $rdq">
                     <xsl:text> err-para-ml1-mid-88-56</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.57 - rank=8-->
               <xsl:if test="$curlastchar = ')' and $curlastcharb4lb = $rdq">
                  <xsl:if test="$presl1textcharlast = $rsq">
                     <xsl:text> err-para-ml1-mid-88-57</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 88.58 - rank=8-->
               <xsl:if test="$curlastchar = ')' and $curlastcharb4lb = $rsq">
                  <xsl:if test="$presl1textcharlast = $rdq">
                     <xsl:text> err-para-ml1-mid-88-58</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 33 - rank=10-->
               <xsl:if test="string-length(text()) = 0 and count(*) = 0">
                  <xsl:text> err-para-ml1--33</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
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
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 62 - rank=5-->
               <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b' or @style = 'b3' or @style = 'ml1' or name() = 'chapter' or name() = 'table' or @style = 'sl1' or @style = 'mt2'])">
                  <xsl:text> err-para-p-pre-62</xsl:text>
               </xsl:if>
               <!--ref 78.2 - rank=5-->
               <xsl:if test="following-sibling::*[1][name() = 'table'] and not( preceding-sibling::*[1][@style = 'c'] or preceding-sibling::*[2][@style = 'c'])">
                  <xsl:if test="not(preceding-sibling::*[1][@style = 'rem' or @style = 'b'])">
                     <xsl:text> err-para-p-post-78-2</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref 79 - rank=5-->
               <xsl:if test="count(verse) &gt; 0 and following-sibling::*[1][@style = 'b']">
                  <xsl:text> err-para-p-post-79</xsl:text>
               </xsl:if>
               <!--ref 40 - rank=8-->
               <xsl:if test="preceding-sibling::*[1][@style = 'p'] and child::verse">
                  <xsl:text> err-para-p-pre-40</xsl:text>
               </xsl:if>
               <!--ref 84.2 - rank=8-->
               <xsl:if test="not(verse)">
                  <xsl:text> err-para-p-mid-84-2</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
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
      <xsl:variable name="paratxt">
         <xsl:choose>
            <xsl:when test="note">
               <xsl:apply-templates select="node()" mode="paratxt"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:comment>
paratxt = <xsl:value-of select="concat($sq,$paratxt,$sq,' ')"/>
      </xsl:comment>
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <xsl:if test="preceding::chapter"><!--common para errors--><!--ref C07.1 - rank=-->
               <xsl:if test="contains(.,'’”') or contains(.,'’ ”') ">
                  <xsl:text> err-para--mid-C07-1</xsl:text>
               </xsl:if>
               <!--ref C07.2 - rank=-->
               <xsl:if test="contains(.,'”’') or contains(.,'” ’') ">
                  <xsl:text> err-para--mid-C07-2</xsl:text>
               </xsl:if>
               <!--ref C07.3 - rank=-->
               <xsl:if test="contains(.,'“‘')  or contains(.,'“ ‘') ">
                  <xsl:text> err-para--mid-C07-3</xsl:text>
               </xsl:if>
               <!--ref C07.4 - rank=-->
               <xsl:if test="contains(.,'‘“') or contains(.,'‘ “') ">
                  <xsl:text> err-para--mid-C07-4</xsl:text>
               </xsl:if>
               <!--ref 43 - rank=0-->
               <xsl:if test="string-length(text()) = 0 and not(*)">
                  <xsl:if test="not(@style = 'b' or @style = 'b2' or @style = 'ntn' or @style = 'mt9' or @style = 'rem')">
                     <xsl:text> err-para---43</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.1 - rank=1-->
               <xsl:if test="contains(.,'...')">
                  <xsl:text> err-para--mid-C08-1</xsl:text>
               </xsl:if>
               <!--ref C08.15 - rank=1-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),' …$')">
                  <xsl:if test="not(  contains(translate(.,'“‘','@@'),'@ …') ) ">
                     <xsl:text> err-para--mid-C08-15</xsl:text>
                  </xsl:if>
               </xsl:if>
               <!--ref C08.2 - rank=2-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-2</xsl:text>
               </xsl:if>
               <!--ref C08.3 - rank=3-->
               <xsl:if test="contains(.,'. . .')">
                  <xsl:text> err-para--mid-C08-3</xsl:text>
               </xsl:if>
               <!--ref C08.4 - rank=4-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub),'$…$')">
                  <xsl:text> err-para--mid-C08-4</xsl:text>
               </xsl:if>
               <!--ref 87.1 - rank=5-->
               <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
                  <xsl:text> err-para--mid-87-1</xsl:text>
               </xsl:if>
               <!--ref C08.6 - rank=6-->
               <xsl:if test="contains(.,' ….')">
                  <xsl:text> err-para--mid-C08-6</xsl:text>
               </xsl:if>
               <!--ref C08.7 - rank=7-->
               <xsl:if test="contains(.,' …,')">
                  <xsl:text> err-para--mid-C08-7</xsl:text>
               </xsl:if>
               <!--ref C08.8 - rank=8-->
               <xsl:if test="contains(.,' …?')">
                  <xsl:text> err-para--mid-C08-8</xsl:text>
               </xsl:if>
               <!--ref C08.9 - rank=9-->
               <xsl:if test="contains(.,' …!')">
                  <xsl:text> err-para--mid-C08-9</xsl:text>
               </xsl:if>
               <!--ref C08.10 - rank=10-->
               <xsl:if test="contains(.,' …”')">
                  <xsl:text> err-para--mid-C08-10</xsl:text>
               </xsl:if>
               <!--ref C08.11 - rank=11-->
               <xsl:if test="contains(.,' …’')">
                  <xsl:text> err-para--mid-C08-11</xsl:text>
               </xsl:if>
               <!--ref C08.12 - rank=12-->
               <xsl:if test="contains(.,',…')">
                  <xsl:text> err-para--mid-C08-12</xsl:text>
               </xsl:if>
               <!--ref C08.13 - rank=13-->
               <xsl:if test="contains(translate(.,'“‘','@@'),'@ …')">
                  <xsl:text> err-para--mid-C08-13</xsl:text>
               </xsl:if>
               <!--ref C08.16 - rank=16-->
               <xsl:if test="contains($paratxt,'…(')">
                  <xsl:text> err-para--mid-C08-16</xsl:text>
               </xsl:if>
               <!--ref C08.17 - rank=17-->
               <xsl:if test="contains(translate($paratxt,$letulc,$letulcsub2),'L… U') or contains(translate(translate($paratxt,'“‘','@@'),$letulc,$letulcsub2),'L… @U')">
                  <xsl:text> err-para--mid-C08-17</xsl:text>
               </xsl:if>
               <!--ref C08.18 - rank=18-->
               <xsl:if test="contains(translate(translate($paratxt,'’”','@@'),$letulc,$letulcsub2),'L…@ U')">
                  <xsl:text> err-para--mid-C08-18</xsl:text>
               </xsl:if>
               <!--specific para errors-->
               <!--ref 84.1 - rank=8-->
               <xsl:if test="not(verse)">
                  <xsl:text> err-para-b3-mid-84-1</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:variable name="closed" select="''"/>
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
            <!--ref 83.4 - rank=-->
            <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                  <xsl:text> err-cell--mid-83-4</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 87.3 - rank=5-->
            <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
               <xsl:text> err-cell--mid-87-3</xsl:text>
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
   <!-- cell @style=tc1 -->
   <xsl:template match="cell[@style = 'tc1']">
      <xsl:comment>
         <xsl:value-of select="concat(' ',preceding::chapter[1]/@number,':',preceding::verse[1]/@number,' ')"/>
      </xsl:comment>
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref 2 - rank=10-->
            <xsl:if test="not(count(*[@style = 'sbx']) = 2)">
               <xsl:if test="count(preceding::chapter) &gt; 0">
                  <xsl:text> err-cell-tc1--2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 3 - rank=10-->
            <xsl:if test="not(count(*[@style = 'tbb']) = 1)">
               <xsl:if test="count(preceding::chapter) &gt; 0">
                  <xsl:text> err-cell-tc1--3</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--common cell errors-->
            <!--ref 83.4 - rank=-->
            <xsl:if test="contains(translate(text(),$numb,$numbsub),'#:#')">
               <xsl:if test="contains(translate(translate(.,$letlc,''),$numb,$numbsub),'#-#')">
                  <xsl:text> err-cell--mid-83-4</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 87.3 - rank=5-->
            <xsl:if test="contains(.,$sq) or contains(.,$dq) ">
               <xsl:text> err-cell--mid-87-3</xsl:text>
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
      <xsl:variable name="prechapter" select="preceding::chapter[1]/@number"/>
      <xsl:if test="$debug = 'on'">
         <xsl:comment> prechapter = <xsl:value-of select="concat($sq,$prechapter,$sq,' ')"/>
         </xsl:comment>
      </xsl:if>
      <xsl:element name="div">
         <xsl:attribute name="class">
            <xsl:value-of select="concat(@style,' ',name())"/>
            <!--ref 44 - rank=5-->
            <xsl:if test="count(cell) != 1">
               <xsl:if test="preceding::chapter">
                  <xsl:text> err-row-tr--44</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 44.2 - rank=5-->
            <xsl:if test="count(cell) = 1 and cell[1][@style != 'tc1']">
               <xsl:if test="preceding::chapter">
                  <xsl:text> err-row-tr--44-2</xsl:text>
               </xsl:if>
            </xsl:if>
            <!--ref 44.3 - rank=5-->
            <xsl:if test="count(cell) &gt; 1">
               <xsl:if test="preceding::chapter">
                  <xsl:text> err-row-tr--44-3</xsl:text>
               </xsl:if>
            </xsl:if>
         </xsl:attribute>
         <xsl:value-of select="concat('\',@style,' ')"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="verse[@style = 'v']">
      <xsl:element name="span">
         <xsl:attribute name="class">
            <xsl:value-of select="@style"/>
            <!--ref 83.6 - rank=-->
            <xsl:if test="contains(@number,'–')">
               <xsl:text> err-verse-v-mid-83-6</xsl:text>
            </xsl:if>
            <!--ref 83.7 - rank=-->
            <xsl:if test="contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$-#') or contains(translate(@number,$validcvnumblet,$validcvnumbletsub),'#$')">
               <xsl:text> err-verse-v-mid-83-7</xsl:text>
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

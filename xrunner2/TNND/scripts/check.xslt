<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
countf	count(*[@style = 'f'])
  <xsl:variable name="countfig">count(*[@style = 'fig'])</xsl:variable>
  <xsl:variable name="countjmp">count(*[@style = 'jmp'])</xsl:variable>
  <xsl:variable name="countsbx">count(*[@style = 'sbx'])</xsl:variable>
  <xsl:variable name="countnode">count(node())</xsl:variable>
  <xsl:variable name="countpren1">count(preceding-sibling::*[@style = 'n1'][1]/preceding-sibling::*)</xsl:variable>
  <xsl:variable name="countpren2">count(preceding-sibling::*[@style = 'n2'][1]/preceding-sibling::*)</xsl:variable>
  <xsl:variable name="countpren3">count(preceding-sibling::*[@style = 'n3'][1]/preceding-sibling::*)</xsl:variable>
  <xsl:variable name="countpres5">count(preceding-sibling::*[@style = 's5'][1]/preceding-sibling::*)</xsl:variable>
  <xsl:variable name="curpos">position()</xsl:variable>
  <xsl:variable name="curtec">translate(*[@style = 'tec'][1]/text(), ':','')</xsl:variable>
  <xsl:variable name="gjparent">parent::para[@style = 'gj']</xsl:variable>
  <xsl:variable name="graparent">parent::para[@style = 'gra']</xsl:variable>
  <xsl:variable name="lastchar">substring(.,string-length(.),1)</xsl:variable>
  <xsl:variable name="lastchar2">substring(.,string-length(.) - 1,1)</xsl:variable>
  <xsl:variable name="postsib">following-sibling::*[1]/@style</xsl:variable>
  <xsl:variable name="posttable">following-sibling::*[1][name() = 'table'] </xsl:variable>
  <xsl:variable name="prechapter">preceding::chapter[1]/@number</xsl:variable>
  <xsl:variable name="pren1tec">preceding-sibling::*[@style = 'n1'][1]/*[@style = 'tec'][1]/text()</xsl:variable>
  <xsl:variable name="pren2tec">preceding-sibling::*[@style = 'n2'][1]/*[@style = 'tec'][1]/text()</xsl:variable>
  <xsl:variable name="pren3tec">preceding-sibling::*[@style = 'n3'][1]/*[@style = 'tec'][1]/text()</xsl:variable>
  <xsl:variable name="presib">preceding-sibling::*[1]/@style</xsl:variable>
  <xsl:variable name="presib2">preceding-sibling::*[2]/@style</xsl:variable>
  <xsl:variable name="preverse">preceding::verse[1]/@number</xsl:variable>
  <xsl:variable name="refattchap">substring-before(@ref,':')</xsl:variable>
  <xsl:variable name="refattverse">substring-after(@ref,':')</xsl:variable>
  <xsl:variable name="refchapcolon">substring-before(.,':')</xsl:variable>
  <xsl:variable name="refcolonv">substring-after(.,':')</xsl:variable>
  <xsl:variable name="refcolonvr1">substring-before(substring-after(text(),':'),'–')</xsl:variable>
  <xsl:variable name="refspacechapcolon">substring-after(substring-before(text(),':'),' ')</xsl:variable>
  <xsl:variable name="parent">parent::*/@style</xsl:variable>
  <xsl:variable name="counttbb">count(*[@style = 'tbb'])</xsl:variable>
  <xsl:variable name="counttec">count(*[@style = 'tec'])</xsl:variable>
</xsl:stylesheet>
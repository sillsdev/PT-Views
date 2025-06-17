<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:f="myfunctions"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="f"><!-- Static variables -->
   <xsl:include href="inc-file2uri.xslt"/>
   <xsl:include href="inc-lookup.xslt"/>
   <xsl:param name="USERPROFILE" select="'C:\Users\india'"/>
   <xsl:variable name="projectpath"
                 select="'D:/All-SIL-Publishing/_xrunner2_projects/_cur/ParatextViews/TN-Views'"/>
   <xsl:variable name="sq">'</xsl:variable>
   <xsl:variable name="dq">"</xsl:variable>
   <xsl:variable name="true" select="tokenize('true yes on 1','\s+')"/>
   <!--  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ project.txt variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
   <xsl:param name="title" select="'Paratext Bamboo Views'"/>
   <xsl:param name="debugfunc" select="'makex'"/>
   <xsl:param name="echofunc" select="'updatedl'"/>
   <xsl:param name="outputxml" select="'true'"/>
   <xsl:param name="tnxx" select="'TNND'"/>
   <xsl:param name="view" select="'TNviews'"/>
   <xsl:param name="paratextexe" select="'C:\Program Files\Paratext 9\Paratext.exe'"/>
   <xsl:param name="bamboopdf" select="'TN-Views-Documentation.pdf'"/>
   <xsl:param name="paratexttitle" select="'Paratext 9.4'"/>
   <xsl:param name="projcode_list" select="'TNND=N TNDD=D'"/>
   <xsl:variable name="projcode" select="tokenize($projcode_list,' ')"/>
   <xsl:variable name="projcode-key" select="tokenize($projcode_list,'=[^ ]*[ ]?')"/>
   <xsl:param name="rowname" select="'item'"/>
   <xsl:param name="data-dl"
              select="concat($USERPROFILE,'\Downloads\TNND Views for Paratext - check_data.tsv','')"/>
   <xsl:param name="data_file-list"
              select="concat($projectpath,'\source\check_data.tsv','')"/>
   <xsl:variable name="data" select="f:file2lines($data_file-list)"/>
   <xsl:param name="data-xml"
              select="concat($projectpath,'\output\check_data.xml','')"/>
   <xsl:param name="static-var-dl"
              select="concat($USERPROFILE,'\Downloads\TNND Views for Paratext - static-var.tsv','')"/>
   <xsl:param name="static-var_file-list"
              select="concat($projectpath,'\source\static-var.tsv','')"/>
   <xsl:variable name="static-var" select="f:file2lines($static-var_file-list)"/>
   <xsl:param name="sfm-var-dl"
              select="concat($USERPROFILE,'\Downloads\TNND Views for Paratext - sfm-var.tsv','')"/>
   <xsl:param name="sfm-var_file-list"
              select="concat($projectpath,'\source\sfm-var.tsv','')"/>
   <xsl:variable name="sfm-var" select="f:file2lines($sfm-var_file-list)"/>
   <xsl:param name="static-var-xml"
              select="concat($projectpath,'\output\static-var.xml','')"/>
   <xsl:param name="sfm-var-xml"
              select="concat($projectpath,'\output\sfm-var.xml','')"/>
   <xsl:param name="kv-dl"
              select="concat($USERPROFILE,'\Downloads\TNND Views for Paratext - keyvalue.tsv','')"/>
   <xsl:param name="kvlist" select="concat($projectpath,'\keyvalue.tsv','')"/>
   <xsl:param name="varstring-dl"
              select="concat($USERPROFILE,'\Downloads\TNND Views for Paratext - var-string.tsv','')"/>
   <xsl:param name="varstring"
              select="concat($projectpath,'\source\var-string.tsv','')"/>
   <xsl:param name="tagerrors"
              select="concat($projectpath,'\scripts\',$tnxx,'-tag-errors.xslt','')"/>
   <xsl:param name="para-like_list" select="'para cell row table'"/>
   <xsl:variable name="para-like" select="tokenize($para-like_list,' ')"/>
   <xsl:param name="char-like_list" select="'char figure verse note link'"/>
   <xsl:variable name="char-like" select="tokenize($char-like_list,' ')"/>
   <xsl:param name="lev" select="'003LEV'"/>
   <xsl:param name="quotecheck_list" select="'f n1 n2 n3 ntn'"/>
   <xsl:variable name="quotecheck" select="tokenize($quotecheck_list,' ')"/>
   <xsl:param name="mypt8" select="'D:\My Paratext 9 Projects'"/>
   <xsl:param name="ptviewssvn" select="concat($gitproject,'')"/>
   <xsl:param name="include-book_list"
              select="'GEN EXO LEV NUM DEU JOS JDG RUT 1SA 2SA 1KI 2KI 1CH 2CH EZR NEH EST JOB PSA PRO ECC SNG ISA JER LAM EZK DAN HOS JOL AMO OBA JON MIC NAM HAB ZEP HAG ZEC MAL MAT MRK LUK JHN ACT ROM 1CO 2CO GAL EPH PHP COL 1TH 2TH 1TI 2TI TIT PHM HEB JAS 1PE 2PE 1JN 2JN 3JN JUD REV'"/>
   <xsl:variable name="include-book" select="tokenize($include-book_list,' ')"/>
   <xsl:param name="usxpath" select="'D:\usx-collection'"/>
   <xsl:param name="usxpath-TNDD" select="'D:\usx-collection\TNDD'"/>
   <xsl:param name="usxpath-TNND" select="'D:\usx-collection\TNND'"/>
   <xsl:param name="collectionfile" select="'*.usx'"/>
   <xsl:param name="groupnode_list" select="'id sl1 c'"/>
   <xsl:variable name="groupnode" select="tokenize($groupnode_list,' ')"/>
   <xsl:param name="bookorderfile"
              select="'D:\My Paratext Projects\cms\book-chaps.txt'"/>
   <xsl:param name="para_list" select="'para table book'"/>
   <xsl:variable name="para" select="tokenize($para_list,' ')"/>
   <xsl:param name="usxdata_list"
              select="'table para note figure link char cell row verse'"/>
   <xsl:variable name="usxdata" select="tokenize($usxdata_list,' ')"/>
   <xsl:param name="xslt" select="''"/>
   <xsl:param name="showref" select="'1'"/>
   <xsl:param name="combinemd_list"
              select="'Bamboo-Views Bamboo-Views-install Bamboo-Views-custom TNDD-info TNND-info USX-info SFM-info created'"/>
   <xsl:variable name="combinemd" select="tokenize($combinemd_list,' ')"/>
   <xsl:param name="cms-dl"
              select="concat($USERPROFILE,'\Downloads\',$tnxx,' Views - CMS-py-data.tsv','')"/>
   <xsl:param name="cms-data-file"
              select="concat($projectpath,'\source\',$tnxx,' Views - CMS-py-data.tsv','')"/>
   <xsl:param name="documentationcss" select="'documentation.css'"/>
   <xsl:param name="usxelem_list" select="'book cell char note para row table'"/>
   <xsl:variable name="usxelem" select="tokenize($usxelem_list,' ')"/>
   <xsl:param name="debug" select="'on'"/>
   <xsl:param name="gitproject"
              select="'D:\All-SIL-Publishing\Github-sillsdev\PT-Views'"/>
   <xsl:param name="fn_file-list"
              select="'D:\All-SIL-Publishing\_xrunner2_projects\Bible\ParatextViews\TNND\notes\all-footnotes.txt'"/>
   <xsl:variable name="fn" select="f:file2lines($fn_file-list)"/>
   <!--  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ lists.xml not available  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
   <!--  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ keyvalue.xml  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
   <xsl:param name="para-css_underscore-list"
              select="'pre=background:peachpuff;border-top:2pt solid red;_post=background:peachpuff;border-bottom:2pt solid red;_mid=background:peachpuff;border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;_default=background:peachpuff;'"/>
   <xsl:variable name="para-css" select="tokenize($para-css_underscore-list,'_')"/>
   <xsl:variable name="para-css-key"
                 select="tokenize($para-css_underscore-list,'=[^_]*[_]?')"/>
   <xsl:param name="char-css_underscore-list"
              select="'pre=background:orange;border-left:4pt solid red;_post=background:orange;border-right:4pt solid red;_mid=border-left:2pt dotted red;border-top:2pt dotted red;border-bottom:2pt dotted red;background:orange;_default=background:orange;'"/>
   <xsl:variable name="char-css" select="tokenize($char-css_underscore-list,'_')"/>
   <xsl:variable name="char-css-key"
                 select="tokenize($char-css_underscore-list,'=[^_]*[_]?')"/>
   <xsl:param name="element-map_list"
              select="'para=div cell=span row=div table=div char=span figure=span link=span verse=span'"/>
   <xsl:variable name="element-map" select="tokenize($element-map_list,' ')"/>
   <xsl:variable name="element-map-key"
                 select="tokenize($element-map_list,'=[^ ]*[ ]?')"/>
   <xsl:param name="usxseq_list"
              select="'FRT=0 GEN=1 EXO=2 LEV=3 NUM=4 DEU=5 JOS=6 JDG=7 RUT=8 1SA=9 2SA=10 1KI=11 2KI=12 1CH=13 2CH=14 EZR=15 NEH=16 EST=17 JOB=18 PSA=19 PRO=20 ECC=21 SNG=22 ISA=23 JER=24 LAM=25 EZK=26 DAN=27 HOS=28 JOL=29 AMO=30 OBA=31 JON=32 MIC=33 NAM=34 HAB=35 ZEP=36 HAG=37 ZEC=38 MAL=39 MAT=41 MRK=42 LUK=43 JHN=44 ACT=45 ROM=46 1CO=47 2CO=48 GAL=49 EPH=50 PHP=51 COL=52 1TH=53 2TH=54 1TI=55 2TI=56 TIT=57 PHM=58 HEB=59 JAS=60 1PE=61 2PE=62 1JN=63 2JN=64 3JN=65 JUD=66 REV=67 TOB=68 JDT=69 ESG=70 WIS=71 SIR=72 BAR=73 LJE=74 S3Y=75 SUS=76 BEL=77 1MA=78 2MA=79 3MA=80 4MA=81 1ES=82 2ES=83 MAN=84 PS2=85 ODA=86 PSS=87 GLO=109'"/>
   <xsl:variable name="usxseq" select="tokenize($usxseq_list,' ')"/>
   <xsl:variable name="usxseq-key" select="tokenize($usxseq_list,'=[^ ]*[ ]?')"/>
   <xsl:param name="usxchap_list"
              select="'FRT=0 GEN=50 EXO=40 LEV=27 NUM=36 DEU=34 JOS=24 JDG=21 RUT=4 1SA=31 2SA=36 1KI=22 2KI=24 1CH=29 2CH=36 EZR=10 NEH=13 EST=10 JOB=42 PSA=150 PRO=31 ECC=12 SNG=8 ISA=66 JER=52 LAM=5 EZK=48 DAN=12 HOS=14 JOL=3 AMO=9 OBA=1 JON=4 MIC=7 NAM=3 HAB=3 ZEP=3 HAG=2 ZEC=14 MAL=4 MAT=28 MRK=16 LUK=24 JHN=21 ACT=28 ROM=16 1CO=16 2CO=13 GAL=6 EPH=6 PHP=4 COL=4 1TH=5 2TH=3 1TI=6 2TI=4 TIT=3 PHM=1 HEB=13 JAS=5 1PE=5 2PE=3 1JN=5 2JN=1 3JN=1 JUD=1 REV=22 TOB=14 JDT=16 ESG=16 WIS=19 SIR=51 BAR=5 LJE=6 S3Y=1 SUS=1 BEL=1 1MA=16 2MA=15 3MA=7 4MA=18 1ES=9 2ES=16 MAN=1 PS2=151 ODA=1 PSS=1 GLO=0'"/>
   <xsl:variable name="usxchap" select="tokenize($usxchap_list,' ')"/>
   <xsl:variable name="usxchap-key" select="tokenize($usxchap_list,'=[^ ]*[ ]?')"/>
   <xsl:param name="style2element_list"
              select="'f=footnote n1=paragraph n2=paragraph n3=paragraph ntn=paragraph'"/>
   <xsl:variable name="style2element" select="tokenize($style2element_list,' ')"/>
   <xsl:variable name="style2element-key"
                 select="tokenize($style2element_list,'=[^ ]*[ ]?')"/>
   <xsl:param name="metalang_semicolon-list"
              select="'pre=preceding-sibling;post=following-sibling;post-inline=following-sibling;pre-inline=preceding-sibling'"/>
   <xsl:variable name="metalang" select="tokenize($metalang_semicolon-list,';')"/>
   <xsl:variable name="metalang-key"
                 select="tokenize($metalang_semicolon-list,'=[^;]*[;]?')"/>
</xsl:stylesheet>

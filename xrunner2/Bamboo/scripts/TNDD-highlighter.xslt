<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
        <style type="text/css">
char {background:khaki;}
link [style|="jmp"] {color:blue;}
.sbx {color:red;}
.tec {color:blueviolet;}
.teu {color:blue;}
.trs {color:fuchsia;}
.ros {color:darkred;}
.imp {color:darkgreen;}
.ppl {color:blueviolet;}
.f {background:#ccff99;}
.ft {background:#ccff99;}
.tbb {background:paleturquoise;}
.brk {background:chartreuse;}
.sfm {color:grey;font-size:60%;}

</style>
      <xsl:template match="@*|node()">
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>

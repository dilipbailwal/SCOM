<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:ms="urn:schemas-microsoft-com:xslt"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:fn="http://www.w3.org/2004/07/xpath-functions"
      xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes"
      xmlns:DataTypeTransformer="urn:DatatypeTransformer"
	  >

  <xsl:template match="DataItem">
    <div align="left">
      <table border="0" width="100%" id="table1" style="border-collapse: collapse">
       
        <!-- Transform WSMan Data -->
        <xsl:apply-templates select="SSHCommandData/*" />

        <tr/>
      </table>
    </div>
  </xsl:template>

  <!-- WSMan template -->
  <xsl:template match="node()">
       <xsl:apply-templates select="." mode="SSHCommandData"/>
  </xsl:template>

  <xsl:template match="node()" mode="SSHCommandData">
	  <tr>
		  <td align="left" valign="top" width="150" style='font:bold;color:blue'>
				<xsl:value-of select="local-name(.)"/>:
		  </td>
		  <td align="left" valign="top" width="300" style='color:blue'>
			  <pre>
				  <xsl:value-of select='.'/>
			  </pre>
		  </td>
	  </tr>
  </xsl:template>

  </xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:aws="http://webservices.amazon.com/AWSECommerceService/2011-08-01">
<xsl:output method="html" encoding="UTF-8" />

<xsl:template match="/">
  <table>
    <tr>
      <xsl:apply-templates select="aws:ItemLookupResponse/aws:Items/aws:Item"/>
    </tr>
  </table>
</xsl:template>

<xsl:template match="/aws:ItemLookupResponse/aws:Items/aws:Item">
  <th>
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="aws:DetailPageURL"/>
      </xsl:attribute>
      <xsl:element name="img">
        <xsl:attribute name="src">
          <xsl:value-of select="aws:MediumImage/aws:URL" />
        </xsl:attribute>
      </xsl:element>
    </xsl:element>
  </th>
  <td>
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="aws:DetailPageURL"/>
      </xsl:attribute>
      <xsl:value-of select="aws:ItemAttributes/aws:Title"/>
    </xsl:element>
    <br />
    <xsl:if test="aws:ItemAttributes/aws:Author">
      <xsl:value-of select="aws:ItemAttributes/aws:Author"/>
      著<br />
    </xsl:if>
    <xsl:if test="aws:ItemAttributes/aws:Artist">
      <xsl:value-of select="aws:ItemAttributes/aws:Artist"/>
      <br />
    </xsl:if>
    （
      <xsl:value-of select="aws:ItemAttributes/aws:Manufacturer"/>
     ）
    <br />
    <xsl:value-of select="aws:OfferSummary/aws:LowestNewPrice/aws:FormattedPrice"/>
  </td>
</xsl:template>

</xsl:stylesheet>

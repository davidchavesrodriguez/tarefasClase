<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    
    <xsl:output method="html" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/*">
        <html>
            <table>
                <tr>
                    <th>Course</th>
                    <th>Lecturer</th>
                </tr>
                <xsl:apply-templates select="teaches-tuple"/>
            </table>    
        </html>
    </xsl:template>
    
    <xsl:template match="teaches-tuple">
        <tr>
            <td><xsl:value-of select="./@course"/></td>
            <td><xsl:value-of select="./@lecturer"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
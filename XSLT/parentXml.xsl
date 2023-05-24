<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <people>
            <person>
                <xsl:value-of select="parent/son"/>
            </person>
            <person>
                <xsl:value-of select="parent/daughter"/>
            </person>
        </people>
    </xsl:template>
    
</xsl:stylesheet>
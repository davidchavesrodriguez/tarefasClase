<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <xsl:template match="/">
        Son´s name: <xsl:value-of select="parent/son"/>
        Daughter´s name: <xsl:value-of select="parent/daughter"/>
    </xsl:template>
    
</xsl:stylesheet>
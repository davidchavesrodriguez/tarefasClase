<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
    <html>
        <head>
            <title>
                People!
            </title>
        </head>
        <body>
            <h3>
                Son´s name: <xsl:value-of select="parent/son"/>
            </h3>
                        <h3>
                Daughter´s name: <xsl:value-of select="parent/daughter"/>
            </h3>
        </body>
    </html>

    </xsl:template>
    
</xsl:stylesheet>
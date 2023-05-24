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

    <xsl:template match="/*" mode="#all">
        <html>
            <head>
                <title>
                    Juliño
                </title>
            </head>
            <body>
                <h1>
                    Our loving customer:
                </h1>
                <p>
                    The name of the client is <xsl:value-of select="//first"/> 
                    and his surname is <xsl:value-of select="//middle"/> 
                    &#160;<xsl:value-of select="//last"/>.
                    He lives at <xsl:value-of select="//street"/> in <xsl:value-of select="//state"/>
                </p>
            </body>
        </html>
    </xsl:template>

    

</xsl:stylesheet>
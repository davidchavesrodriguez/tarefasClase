<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Books</title>
        <style type="text/css">
          table {
          border-collapse: collapse;
          width: 100%;
          }
          th, td {
          border: 1px solid black;
          padding: 8px;
          text-align: left;
          }
          th {
          background-color: dodgerblue;
          color: white;
          }
          .aquamarine {
          background-color: aquamarine;
          }
          .gold {
          background-color: gold;
          }
          .crimson {
          background-color: crimson;
          color: white;
          }
        </style>
      </head>
      <body>
        <h1>Books</h1>
        <table>
          <caption>Number of rows: <xsl:value-of select="count(books/book)"/></caption>
          <tr>
            <th>Author</th>
            <th>Title</th>
          </tr>
          <xsl:for-each select="books/book">
            <xsl:choose>
              <xsl:when test="price &lt;= 10">
                <tr class="aquamarine">
                  <td><xsl:value-of select="author"/></td>
                  <td><xsl:value-of select="title"/></td>
                </tr>
              </xsl:when>
              <xsl:when test="price &gt; 10 and price &lt;= 15">
                <tr class="gold">
                  <td><xsl:value-of select="author"/></td>
                  <td><xsl:value-of select="title"/></td>
                </tr>
              </xsl:when>   
              <xsl:otherwise>
                <tr class="crimson">
                  <td><xsl:value-of select="author"/></td>
                  <td><xsl:value-of select="title"/></td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

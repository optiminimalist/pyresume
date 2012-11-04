<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="resume">
<html>
<head>
  <title></title>

    <style type="text/css">
      /* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/
/*@page{
    margin-left: 5pt;
    margin-right: 5pt;
    margin-top: 5pt;
    margin-bottom: 5pt;
}*/
/*@font-face {
  font-family: 'Droid Sans';
  font-style: normal;
  font-weight: 400;
  src: url('/fonts/s-BiyweUPV0v-yRb-cjciL3hpw3pgy2gAi-Ip7WPMi0.woff') format('woff');
}*/
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
  display: block;
}
body {
  line-height: 1;
}
ol, ul {
  list-style: none;
}
blockquote, q {
  quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

    html {
      margin:0;
      padding:0;
      width:100%;
      height:100%;
    }
    div /*section, .subsection*/
    {
      width:100%;
    }
    body {

      font-family: LucidaGrande;
        font-size:8.5pt;
        line-height:11.5pt;
        width:100%;

    }
    #page {
      width:206mm;
/*      height:279mm;
*/      /*width:216mm;
      height:279mm;*/
      /*border:1px solid black;*/

    }

    header {
      text-align: center;
      margin-bottom:10pt;
    }

    header h1 {
      line-height:16pt;
      font-size: 16pt;
      margin-bottom: 3pt;
      font-weight:bold;
    }
    header p{

    }

    section {
      border-bottom:1pt solid #000;
      margin:0 40pt;
      margin-bottom:8pt;
    }

    section:last-child { border:0;}

    section h2 {
      font-weight:bolder;
      margin-bottom:5pt;
    }

    .subsection {
      margin-bottom:5pt;
    }
    .subsection h3 {
      margin-bottom:3pt;

    }
    .subsection h3 strong {
      font-weight:bold;
    }

    .subsection p, .subsection ul {
      margin:0 30pt;
      margin-bottom:0pt;
    }

    .subsection ul {
      margin-top:3pt;
    }

    .subsection ul {
      list-style-type: disc;
    }</style>

</head>
<body>
  <div id="page">
    <header id="header">
      <h1><xsl:value-of select="personal/name"/></h1>
      <p><xsl:value-of select="personal/address"/> | <xsl:value-of select="personal/phone"/> | <xsl:value-of select="personal/email"/></p>
      <p>
        <xsl:for-each select="personal/urls/url">
          <xsl:value-of select="."/>                    
          <xsl:choose>
            <xsl:when test="position() != last()"> | </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </p>
    </header>


      

      <xsl:for-each select="section">
            <section>
              <h2><xsl:value-of select="name"/></h2>
          <xsl:for-each select="subsection">
             <div class="subsection">
                <h3>
                  <strong><xsl:value-of select="name"/></strong>
                  <xsl:if test="location">
                    ,<xsl:value-of select="location"/>
                  </xsl:if>
                  <xsl:if test="time">
                    ,<xsl:value-of select="time"/>
                  </xsl:if>
                </h3>

               <xsl:for-each select="description/*">
                <xsl:copy-of select="." />
               </xsl:for-each>

             </div>
          </xsl:for-each>
              </section>

      </xsl:for-each>

  </div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:variable name="lang">cs</xsl:variable>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Zoo">
        <html>
            <head>
                <title>Zoo</title>
            </head>
            <body>
                <h1>Zoo</h1>
                <xsl:apply-templates select="Pavilon"/>

                <h2>Typy zvířat</h2>
                <p>
                    <ul>
                        <xsl:apply-templates select="TypyZvířat/ZvířeTyp"/>
                    </ul>
                </p>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Pavilon">
        <p>
            <h2>
                <xsl:value-of select="název/text()"/>
            </h2>
            <p>
                <b>ldatum Výstavby:</b>
                <xsl:value-of select="datumVýstavby/text()"/>
                <br></br>
                <b>ldatum poslední rekonstrukce:</b>
                <xsl:value-of select="datumPosledníRekonstrukce/text()"/>
            </p>
            <ul>
                <xsl:apply-templates select="Výběh"/>
            </ul>
        </p>
    </xsl:template>
    
    <xsl:template match="Výběh">
        <li>
            <h3>
                <xsl:value-of select="název/text()"/>
            </h3>
            <p>
                <b>lokace na mapě:</b>
                <xsl:value-of select="lokaceNaMapě/text()"/>
                <br></br>
                <b>datum výstavby:</b>
                <xsl:value-of select="datumVýstavby/text()"/>
                <br></br>
                <b>popis:</b>
                <p>
                    <xsl:value-of select="popis[@xml:lang=$lang]/text()"/>
                </p>
            </p>

            <ul>
                <xsl:apply-templates select="Zvíře"/>
            </ul>        
        </li>
        
    </xsl:template>

    <xsl:template match="Zvíře">
        <li>
            <h4>
                <xsl:value-of select="jméno/text()"/>
            </h4>
            <p>
                <b>typ:</b>
                <xsl:value-of select="ZvířeTyp/@ref"/>
                <br></br>
                <b>datum narození:</b>
                <xsl:value-of select="datumNarození/text()"/>
                <br></br>
                <b>popis zdravotního stavu:</b>
                <p>
                    <xsl:value-of select="popisZdravotníhoStavu[@xml:lang=$lang]/text()"/>
                </p>
            </p>
        </li>
        
    </xsl:template>


    <xsl:template match="ZvířeTyp">
        <li>
            <h3>
                <xsl:value-of select="název/text()"/>
            </h3>
            <p>
                <b>popis:</b>
                <p>
                    <xsl:value-of select="popis[@xml:lang=$lang]/text()"/>
                </p>
                <b>popis chovu:</b>
                <p>
                    <xsl:value-of select="popisChovu[@xml:lang=$lang]/text()"/>
                </p>
                <b>typ stravy:</b>
                <xsl:value-of select="TypStravy/@ref"/>
            </p>
        </li>
        
    </xsl:template>
    <xsl:template match="text()"/>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<xsl:output method="text" encoding="UTF-8" />

    <xsl:template match="Zoo">
        @prefix ex: &lt;http://example.org/vocabulary/&gt; .
        @prefix zoo: &lt;http://mojezoo.cz/&gt; .
        @prefix skos: &lt;http://www.w3.org/2004/02/skos/core#&gt; .
        @prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
        @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
        @prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
        @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
        @prefix w3c: &lt;http://www.w3.org/ns/org#&gt; .
        @prefix dbo: &lt;http://dbpedia.org/ontology/&gt; .
        @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
        @prefix vcard: &lt;http://www.w3.org/2006/vcard/ns#&gt; .
        @prefix gr: &lt;http://purl.org/goodrelations/v1#&gt; .

        
        <xsl:apply-templates select="Pavilon"/>
        <xsl:apply-templates select="TypyZvířat/ZvířeTyp"/>
        <xsl:apply-templates select="TypyStrav/TypStravy"/>
        <xsl:apply-templates select="Zaměstnanci/Uklízeč"/>
        <xsl:apply-templates select="Zaměstnanci/Pečovatel"/>
        <xsl:apply-templates select="Zaměstnanci/Veterinář"/>
        <xsl:apply-templates select="Zaměstnanci/PrůvodcePavilonem"/>
        <xsl:apply-templates select="Výběhy/Výběh"/>

    </xsl:template>

	<xsl:template match="Pavilon">
        zoo:<xsl:value-of select="název"/> a ex:Pavilon ;
            rdfs:label "<xsl:value-of select="název"/>"@cs;
            ex:datumVzniku "<xsl:value-of select="datumVýstavby"/>"^^xsd:dataTime ;
            dcterms:modified "<xsl:value-of select="datumPosledníRekonstrukce"/>"^^xsd:dataTime .
            <xsl:apply-templates select="Výběh"/>
    </xsl:template>

    <xsl:template match="Výběh">
        zoo:<xsl:value-of select="název"/> a ex:Výběh ;
            skos:inScheme zoo:<xsl:value-of select="../název"/> ;
            rdfs:label "<xsl:value-of select="názevProČtení"/>"@cs ;
            ex:popisLokace "<xsl:value-of select="lokaceNaMapě"/>" ;
            dcterms:description "<xsl:value-of select="popis"/>"@cs ;
	          ex:datumVýstavby "<xsl:value-of select="datumVýstavby"/>"^^xsd:dataTime .
        <xsl:apply-templates select="Zvíře"/>
    </xsl:template>
    

    <xsl:template match="Zvíře">
        zoo:<xsl:value-of select="jméno"/> a dbo:Animal ;
            rdfs:label "<xsl:value-of select="jméno"/>"@cs ;
            dcterms:type zoo:<xsl:value-of select="ZvířeTyp/@ref"/> ;
	          ex:domovem zoo:<xsl:value-of select="../název"/> ;
            ex:popisZdavotníhoStavu "<xsl:value-of select="popisZdravotníhoStavu"/>"@cs ;
            ex:datumNarození "<xsl:value-of select="datumNarození"/>"^^xsd:dateTime ;
            ex:datumPříchoduDoZoo "<xsl:value-of select="datumPříchoduDoZoo"/>"^^xsd:dateTime .
    </xsl:template>

    <xsl:template match="ZvířeTyp">
        zoo:<xsl:value-of select="název"/> a ex:ZvířeTyp ;
            skos:inScheme zoo:TypyZvířat ;<xsl:apply-templates select="názevProČtení"/> <xsl:apply-templates select="./Výběh"/>        dcterms:description "<xsl:value-of select="popis"/>"@cs ;
            ex:popisChovu "<xsl:value-of select="popisChovu"/>"@cs ;
            ex:stravuje zoo:<xsl:value-of select="TypStravy/@ref"/> .
    </xsl:template>
    
    <xsl:template match="ZvířeTyp/Výběh">
            ex:lzeSpatřit zoo:<xsl:value-of select="@ref"/> ;        
    </xsl:template>

    <xsl:template match="názevProČtení">
            skos:prefLabel "<xsl:value-of select="text()"/>"@<xsl:value-of select="@xml:lang"/> ;        
    </xsl:template>

	<xsl:template match="TypyStrav">
        zoo:typyStravy a skos:ConceptScheme .
        <xsl:apply-templates select="TypStravy"/>        
    </xsl:template>

	<xsl:template match="TypStravy">
        zoo:<xsl:value-of select="@název"/> a ex:TypStravy ;
            skos:inScheme zoo:typyStravy ;
            rdfs:label "<xsl:value-of select="@název"/>"@cs ;
            ex:cena <xsl:value-of select="cena"/> ;
            ex:kalorie "<xsl:value-of select="kalorie"/>"  .
    </xsl:template>
	
    <xsl:template match="Uklízeč">
        zoo:<xsl:value-of select="@název"/> a ex:Uklízeč ;
            foaf:givenName"<xsl:value-of select="givenName"/>"@cs ;
            foaf:familyName"<xsl:value-of select="familyName"/>"@cs ;
            gr:hasPriceSpecification zoo:<xsl:value-of select="plat/@název"/> ;
            vcard:hasTelephone &lt;<xsl:value-of select="telefonníČíslo"/>&gt;  .
        
            zoo:<xsl:value-of select="plat/@název"/> a gr:UnitPriceSpecification ;
                rdfs:label "Plat"@cs ;
                gr:hasCurrency "<xsl:value-of select="plat/@currency"/>"^^xsd:string ;
                gr:hasCurrencyValue "<xsl:value-of select="plat/text()"/>"^^xsd:float .
    </xsl:template>
    <xsl:template match="Pečovatel">
        zoo:<xsl:value-of select="@název"/> a ex:Pečovatel ;
            foaf:givenName "<xsl:value-of select="givenName"/>"@cs ;
            foaf:familyName "<xsl:value-of select="familyName"/>"@cs ;
            gr:hasPriceSpecification zoo:<xsl:value-of select="plat/@název"/> ;
            <xsl:apply-templates select="./spravuje/Výběh"/>
            vcard:hasTelephone &lt;<xsl:value-of select="telefonníČíslo"/>&gt;  .
        
            zoo:<xsl:value-of select="plat/@název"/> a gr:UnitPriceSpecification ;
                rdfs:label "Plat"@cs ;
                gr:hasCurrency "<xsl:value-of select="plat/@currency"/>"^^xsd:string ;
                gr:hasCurrencyValue "<xsl:value-of select="plat/text()"/>"^^xsd:float .
    </xsl:template>
    
    <xsl:template match="spravuje/Výběh">
            ex:spravuje zoo:<xsl:value-of select="@ref"/> ;        
    </xsl:template>

    <xsl:template match="Veterinář">
        zoo:<xsl:value-of select="@název"/> a ex:Veterinář ;
            foaf:givenName "<xsl:value-of select="givenName"/>"@cs ;
            foaf:familyName "<xsl:value-of select="familyName"/>"@cs ;
            gr:hasPriceSpecification zoo:<xsl:value-of select="plat/@název"/> ;
            <xsl:apply-templates select="./pečuje/Výběh"/>
            vcard:hasTelephone &lt;<xsl:value-of select="telefonníČíslo"/>&gt;  .
        
            zoo:<xsl:value-of select="plat/@název"/> a gr:UnitPriceSpecification ;
                rdfs:label "Plat"@cs ;
                gr:hasCurrency "<xsl:value-of select="plat/@currency"/>"^^xsd:string ;
                gr:hasCurrencyValue "<xsl:value-of select="plat/text()"/>"^^xsd:float .
    </xsl:template>
    <xsl:template match="pečuje/Výběh">
            ex:pečuje zoo:<xsl:value-of select="@ref"/> ;        
    </xsl:template>
    <xsl:template match="PrůvodcePavilonem">
        zoo:<xsl:value-of select="@název"/> a ex:PrůvodcePavilonem ;
            foaf:givenName "<xsl:value-of select="givenName"/>"@cs ;
            foaf:familyName "<xsl:value-of select="familyName"/>"@cs ;
            gr:hasPriceSpecification zoo:<xsl:value-of select="plat/@název"/> ;
            <xsl:apply-templates select="./provádí/Pavilon"/>
            vcard:hasTelephone &lt;<xsl:value-of select="telefonníČíslo"/>&gt;  .
        
            zoo:<xsl:value-of select="plat/@název"/> a gr:UnitPriceSpecification ;
                rdfs:label "Plat"@cs ;
                gr:hasCurrency "<xsl:value-of select="plat/@currency"/>"^^xsd:string ;
                gr:hasCurrencyValue "<xsl:value-of select="plat/text()"/>"^^xsd:float .
    </xsl:template>
    
    <xsl:template match="provádí/Pavilon">
            ex:prováděníPavilonem zoo:<xsl:value-of select="@ref"/> ;        
    </xsl:template>    
</xsl:stylesheet>
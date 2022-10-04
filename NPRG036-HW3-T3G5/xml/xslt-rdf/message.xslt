<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:output method="text" encoding="UTF-8" indent="yes" />

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
        
        ex:Výběh a rdfs:Class ; 
            rdf:subClassOf skos:Concept ;
    	    rdfs:label "Výběh"@cs ;
    	    rdfs:comment "Libovolný prostor, ve kterém žije nějaké zvíře."@cs .

    		ex:popisLokace a rdf:Property ;
    			rdfs:label "Popis lokace"@cs ;
    			rdfs:domain ex:Výběh;
    			rdfs:range xsd:string .
    
    		ex:datumVýstavby a rdf:Property ;
    			rdfs:label "Datum výstavby"@cs ;
    			rdfs:domain ex:Výběh;
    			rdfs:range xsd:date .
    
    		ex:průměrnáTeplota a rdf:Property ;
    			rdfs:label "Průměrná teplota"@cs ;
    			rdfs:domain ex:Zaměstnanec ;
    			rdfs:range xsd:integer .
			
    	ex:ZvířeTyp a rdfs:Class ; 
    		rdf:subClassOf skos:Concept ;
    		rdfs:label "Typ zvířete"@cs ;
    		rdfs:comment "Označuje konkrétní druh zvířete"@cs .
    
    		ex:popisChovu a rdf:Property ;
    			rdfs:label "Popis chovu"@cs ;
    			rdfs:domain  ex:Concept ;
    			rdfs:range xsd:string .
    
    	zoo:TypyZvířat a skos:ConceptScheme ;
    		rdfs:label "Typy zvířat"@cs ;
    		skos:prefLabel "Typy zvířat"@cs .
    
    		ex:popisZdravotníhoStavu a rdf:Property ;
    			rdfs:label "Popis zdravotního stavu"@cs ;
    			rdfs:domain dbo:Animal ;
    			rdfs:range xsd:string .
    
    		ex:datumNarození a rdf:Property ;
    			rdfs:label "Datum narození"@cs ;
    			rdfs:domain dbo:Animal ;
    			rdfs:range xsd:date .
    
    		ex:datumPříchoduDoZoo a rdf:Property ;
    			rdfs:label "Datum příchodu do zoo"@cs ;
    			rdfs:domain dbo:Animal ;
    			rdfs:range xsd:date .
    			
    	ex:Pavilon a rdfs:Class; 		
    		rdf:subClassOf skos:ConceptScheme;
    		rdfs:label "Pavilon"@cs ;
    		rdfs:comment "Pavilon obsahuje výběhy."@cs .
    
    		ex:datumVzniku a rdf:Property ;
    			rdfs:label "Datum vzniku"@cs ;
    			rdfs:domain ex:Pavilon ;
    			rdfs:range xsd:date .
    	
    
    	ex:TypStravy a rdfs:Class ; 
    		rdf:subClassOf skos:Concept ;
    		rdfs:label "Typ Stravy"@cs .
    
    		ex:cena a rdf:Property ;
    			rdfs:label "Cena"@cs ;
    			rdfs:domain  ex:TypStravy ;
    			rdfs:range xsd:integer .
    
    		ex:kalorie a rdf:Property ;
    			rdfs:label "Kalorie"@cs ;
    			rdfs:domain  ex:TypStravy ;
    			rdfs:range xsd:integer .
    
    
    
    	ex:Pavilon a rdfs:Class; 
    		rdf:subClassOf skos:ConceptScheme;
    		rdfs:label "Pavilon"@cs ;
    		rdfs:comment "Pavilon obsahuje výběhy."@cs .
    
    		ex:datumVzniku a rdf:Property ;
    			rdfs:label "Datum vzniku"@cs ;
    			rdfs:domain ex:Pavilon ;
    			rdfs:range xsd:date .
    
    
    	ex:Zaměstnanec a skos:Concept ;
    		rdfs:subClassOf foaf:Person;	
    		rdfs:label "Zaměstnanec"@cs .
    		
    	ex:Uklízeč a rdfs:Class ;
    		rdfs:subClassOf ex:Zaměstnanec;	
    		rdfs:label "Uklízeč"@cs ;
    			rdfs:comment "Uklízeč zajišťuje čistotu prostor."@cs .
    
    
    	ex:Veterinář a rdfs:Class ;
    		rdfs:subClassOf ex:Zaměstnanec;	
    		rdfs:label "Veterinář"@cs ;
    			rdfs:comment "Stará se o zdravotní stav zvířat."@cs .
    
    	ex:Pečovatel a rdfs:Class ;
    		rdfs:subClassOf ex:Zaměstnanec;	
    		rdfs:label "Pečovatel"@cs, "Employee"@en ;
    			rdfs:comment "Zajišťuje údržbu výběhů zvířat."@cs .
    
    	ex:PrůvodcePavilonem a rdfs:Class ;
    		rdfs:subClassOf ex:Zaměstnanec;	
    		rdfs:label "Průvodce pavilonem"@cs, "Employee"@en ;
    			rdfs:comment "Provádí návštěvníky pavilonem."@cs .
    
    		ex:plat a rdf:Property ;
    			rdfs:label "Plat"@cs ;
    			rdfs:domain ex:Zaměstnanec;
    			rdfs:range xsd:integer .
    
    		ex:telefonníČíslo a rdf:Property ;
    			rdfs:label "Telefonní číslo"@cs ;
    			rdfs:domain ex:Zaměstnanec;
    			rdfs:range xsd:string .
    
    
    
    	ex:spravuje a rdf:Property ;
    		rdfs:label "Správa někoho nad něčím"@cs ;
    		rdfs:domain ex:Pečovatel .
    
    	ex:stravuje a rdf:Property ;
    		rdfs:label "Strava zvířete"@cs ;
    		rdfs:domain ex:ZvířeTyp .
    
    	ex:lzeSpatřit a rdf:Property ;
    		rdfs:label "Kde lze spatřit daný typ zvířete"@cs ;
    		rdfs:domain ex:ZvířeTyp .
    
    	ex:domovem a rdf:Property ;
    		rdfs:label "Je domovem"@cs ;
    		rdfs:domain ex:Animal .
    
    	ex:pečuje a rdf:Property ;
    		rdfs:label "Strava zvířete"@cs ;
    		rdfs:domain ex:Veterinář .
    
    	ex:prováděníPavilonem a rdf:Property ;
    		rdfs:label "Prodvádí pavilonem"@cs ;
    		rdfs:domain ex:PrůvodcePavilonem .
        <xsl:apply-templates select="Pavilon"/>
        <xsl:apply-templates select="Výběh"/>
        <xsl:apply-templates select="TypyZvířat/ZvířeTyp"/>
        <xsl:apply-templates select="TypyStrav/TypStravy"/>
    </xsl:template>

    <xsl:template match="Pavilon">
        zoo:<xsl:value-of select="název/text()"/> a ex:Pavilon ;
            rdfs:label <xsl:value-of select="název"/>@cs;
            ex:datumVzniku <xsl:value-of select="datumVýstavby"/> ^^xsd:dataTime;
            ex:datumVzniku <xsl:value-of select="datumPosledníRekonstrukce"/> ^^xsd:dataTime .
    		<xsl:apply-templates select="Výběh"/>
    </xsl:template>

    <xsl:template match="Výběh">
        <xsl:value-of select="název"/>:Vybeh a ex:Výběh ;
            skos:inScheme <xsl:value-of select="parent::název"/>;
            rdfs:label <xsl:value-of select="název"/>@cs ;
            ex:popisLokace <xsl:value-of select="lokaceNaMapě"/> ;
            dcterms:description <xsl:value-of select="popis"/>@cs .
			<xsl:apply-templates select="Zvíře"/>
    </xsl:template>
    

    <xsl:template match="Zvíře">
        zoo:<xsl:value-of select="jméno"/> a dbo:Animal ;
            rdfs:label <xsl:value-of select="jméno"/>@cs ;
			dcterms:type zoo:<xsl:value-of select="TypStravy[@názevTypu='názevTypu']"/> ;
			ex:domovem zoo:<xsl:value-of select="parent::název"/> ;
            ex:popisZdavotníhoStavu <xsl:value-of select="popisZdravotníhoStavu"/>@cs ;
            ex:datumNarození <xsl:value-of select="datumNarození"/>^^xsd:dateTime ;
            ex:datumPříchoduDoZoo <xsl:value-of select="datumPříchoduDoZoo"/>^^xsd:dateTime .
    </xsl:template>

    <xsl:template match="ZvířeTyp">
        zoo:<xsl:value-of select="@název"/> a ex:ZvířeTyp;
            skos:inScheme zoo:TypyZvířat
            skos:prefLabel <xsl:value-of select="název/text()"/>@cs ;
            dcterms:description <xsl:value-of select="popis"/>@cs ;
            ex:popisChovu <xsl:value-of select="popisChovu"/>@cs ;
            ex:stravuje zoo:<xsl:value-of select="TypStravy/@názevTypu"/> .
    </xsl:template>

	<xsl:template match="TypStravy">
        zoo:<xsl:value-of select="TypStravy[@názevTypu='název']"/> a ex:TypStravy ;
            skos:inScheme zoo:typyStravy
            rdfs:label<xsl:value-of select="TypStravy/@názevTypu"/>@cs ;
            ex:cena <xsl:value-of select="TypStravy/cena"/>@cs ;
            ex:kalorie <xsl:value-of select="TypStravy/kalorie"/>@cs  .
            
    </xsl:template>
</xsl:stylesheet>
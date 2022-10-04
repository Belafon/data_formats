// PAVILONY -------------------------------------------------------
CREATE (Afrika:Pavilon {
        název: 'Afrika',
        datumVzniku: '2004-06-01',
        datumVosledníRekonstrukce: '2020-02-05'
    })

CREATE (Plazy:Pavilon {
        název: 'Plazy',
        datumVzniku: '2004-06-01',
        datumVosledníRekonstrukce: '2019-02-15'
    })
CREATE (Prales:Pavilon {
        název: 'Prales',
        datumVzniku: '2004-06-01',
        datumVosledníRekonstrukce: '2018-04-08'
    })


// VYBEHY -------------------------------------------------------

CREATE (Savana:Výběh {
        název: 'Savana',
        popisLokace: 'S1',
        datumVýstavby: '2002-09-24',
        popis: '1200 m^2 rovinné travnaté plochy,  na okrajích s velkými rozestupy rostou baobaby a blahovičníky.'
    })
CREATE (Poušť:Výběh {
        název: 'Pouštní krajina',
        popisLokace: 'S2',
        datumVýstavby: '2003-08-19',
        popis: '1500 m^2 rovinné písčité plochy,  na levém okraji roste mix listnatých stromů.'
    })
CREATE (Hory:Výběh {
        název: 'Hornatá krajina',
        popisLokace: 'S3',
        datumVýstavby: '2005-06-02',
        popis: '1000 m^2 plochy strmitých skalisek.'
    })
CREATE (TeráriumKober:Výběh {
        název: 'Terárium kober',
        popisLokace: 'PL1',
        datumVýstavby: '2011-04-01',
        popis: '4 m^2 plochy, prosklenné terrárium s umělým jezírkem a starými dubovými větvemi.'
    })
CREATE (VýběhGoril:Výběh {
        název: 'Výběh goril',
        popisLokace: 'PR2',
        datumVýstavby: '2010-04-12',
        popis: '100 m^2 plochy, prosklenný plot, nerovný travnatý povrch, roste zde několik dubů.'
    })

CREATE (Savana)-[:SEKCÍ]->(Afrika)
CREATE (Poušť)-[:SEKCÍ]->(Afrika)
CREATE (Hory)-[:SEKCÍ]->(Afrika)
CREATE (TeráriumKober)-[:SEKCÍ]->(Plazy)
CREATE (VýběhGoril)-[:SEKCÍ]->(Prales)

CREATE (Savana)<-[:SEKCÍ]-(Afrika)
CREATE (Poušť)<-[:SEKCÍ]-(Afrika)
CREATE (Hory)<-[:SEKCÍ]-(Afrika)
CREATE (TeráriumKober)<-[:SEKCÍ]-(Plazy)
CREATE (VýběhGoril)<-[:SEKCÍ]-(Prales)


// Zvíře typ -----------------------------------------------------------

CREATE (Zebra:ZvířeTyp {
        název: 'Zebra',
        popis: 'Bílý kůň s černýma pruhama',
        popisChovu: 'Zebry mají rády slunné teplé travnaté pláně, živí se trávou, senem. Zimu tráví ve stájích'
    })
CREATE (VelbloudDvouhrbý:ZvířeTyp {
        název: 'Velbloud dvouhrbý',
        popis: 'Hnědý kůň s dvouma hrbama',
        popisChovu: 'Velbloud je velmi nenáročné zvíře, živí se trávou, senem. Zimu tráví ve stájích. Když jednou zapomenete dodat vodu, nic se nestane.'
    })
CREATE (PaovceHřivnatá:ZvířeTyp {
        název: 'Paovce hřivnatá',
        popis: 'Jedná se o druh z podčeledi kozy a ovce původem ze skal hor v Severní Africe.',
        popisChovu: 'Živí se trávou, senem. Zimu tráví ve stájích.'
    })
CREATE (KobraKrálovská:ZvířeTyp {
        název: 'Kobra královská',
        popis: 'Je druhem jedovatého hada z čeledi korálovcovitých, který žije v oblasti jižní a jihovýchodní Asie.',
        popisChovu: 'Živí se myšmi, nutné je být opatrný, jedná se o jednovatého hada.'
    })
CREATE (GorilaNížnná:ZvířeTyp {
        název: 'Gorila',
        popis: 'Domovem goril jsou tropické lesy v rovníkové Africe, kde se vyskytují ve dvou oblastech oddělených deštným lesem konžské pánve.',
        popisChovu: 'Živí se částí rostlin, ovoce, mravenci.'
    })

CREATE (Savana)-[:LZE_SPATŘIT]->(Zebra)
CREATE (Poušť)-[:LZE_SPATŘIT]->(VelbloudDvouhrbý)
CREATE (Hory)-[:LZE_SPATŘIT]->(PaovceHřivnatá)
CREATE (TeráriumKober)-[:LZE_SPATŘIT]->(KobraKrálovská)
CREATE (VýběhGoril)-[:LZE_SPATŘIT]->(GorilaNížnná)

CREATE (Savana)<-[:LZE_SPATŘIT]-(Zebra)
CREATE (Poušť)<-[:LZE_SPATŘIT]-(VelbloudDvouhrbý)
CREATE (Hory)<-[:LZE_SPATŘIT]-(PaovceHřivnatá)
CREATE (TeráriumKober)<-[:LZE_SPATŘIT]-(KobraKrálovská)
CREATE (VýběhGoril)<-[:LZE_SPATŘIT]-(GorilaNížnná)

// Zvíře -----------------------------------------------------------------

CREATE (Černobíl:Zvíře {
        jméno: 'Černobíl',
        popisZdavotníhoStavu: 'Zdravý jedinec',
        datumNarození: '2012-04-02',
        datumPříchoduDoZoo: '2012-04-02'
    })
CREATE (Erin:Zvíře {
        jméno: 'Erin',
        popisZdavotníhoStavu: 'Zdravý jedinec',
        datumNarození: '2010-01-10',
        datumPříchoduDoZoo: '2010-01-10'
    })
CREATE (Bessie:Zvíře {
        jméno: 'Bessie',
        popisZdavotníhoStavu: 'Zdravý jedinec',
        datumNarození: '2009-05-12',
        datumPříchoduDoZoo: '2010-01-08'
    })
CREATE (George:Zvíře {
        jméno: 'George',
        popisZdavotníhoStavu: 'Zdravý jedinec',
        datumNarození: '1995-05-12',
        datumPříchoduDoZoo: '2005-01-08'
    })
CREATE (Lenka:Zvíře {
        jméno: 'Lenka',
        popisZdavotníhoStavu: 'Zdravý jedinec',
        datumNarození: '2015-03-01',
        datumPříchoduDoZoo: '2018-05-10'
    })

CREATE (Černobíl)-[:JE]->(Zebra)
CREATE (Erin)-[:JE]->(Zebra)
CREATE (Bessie)-[:JE]->(Zebra)
CREATE (Lenka)-[:JE]->(KobraKrálovská)
CREATE (George)-[:JE]->(GorilaNížnná)

CREATE (Černobíl)-[:DOMOV]->(Savana)
CREATE (Erin)-[:DOMOV]->(Savana)
CREATE (Bessie)-[:DOMOV]->(Savana)
CREATE (Lenka)-[:DOMOV]->(TeráriumKober)
CREATE (George)-[:DOMOV]->(VýběhGoril)

CREATE (Černobíl)<-[:JE_DOMOVEM]-(Savana)
CREATE (Erin)<-[:JE_DOMOVEM]-(Savana)
CREATE (Bessie)<-[:JE_DOMOVEM]-(Savana)
CREATE (Lenka)<-[:JE_DOMOVEM]-(TeráriumKober)
CREATE (George)<-[:JE_DOMOVEM]-(VýběhGoril)

// Měny
CREATE (CZK:Měna {
        název: 'CZK'
    })

CREATE (EUR:Měna {
        název: 'EUR'
    })

// Typ Stravy ----------------------------------------------------------------------

CREATE (Seno:TypStravy {
        název: 'Seno',
        kalorie: 3160
    })
CREATE (Myš:TypStravy {
        název: 'Myš',
        kalorie: 50
    })
CREATE (Meloun:TypStravy {
        název: 'Meloun',
        kalorie: 28
    })
CREATE (Seno)-[:CENA {množství: 65}]->(CZK)
CREATE (Myš)-[:CENA {množství: 80}]->(CZK)
CREATE (Meloun)-[:CENA {množství: 28}]->(CZK)

CREATE (Zebra)-[:STRAVUJE]->(Seno)
CREATE (VelbloudDvouhrbý)-[:STRAVUJE]->(Seno)
CREATE (PaovceHřivnatá)-[:STRAVUJE]->(Seno)
CREATE (KobraKrálovská)-[:STRAVUJE]->(Myš)
CREATE (GorilaNížnná)-[:STRAVUJE]->(Meloun)
//  Zaměstnanci --------------------------------------------------------------------

CREATE (Uklízeč_1:Uklízeč {
        jméno: 'Petr Novotný',
        telefoníČíslo: 'tel:+420111222333'
    })
CREATE (Pečovatel_1:Pečovatel {
        jméno: 'Marie Novotná',
        telefoníČíslo: 'tel:+420111222334'
    })
CREATE (Veterinář_1:Veterinář {
        jméno: 'Marek Novotný',
        telefoníČíslo: 'tel:+420111222335'
    })
CREATE (Průvodce_pavilonem_1:PrůvodcePavilonem {
        jméno: 'Anna Novotná',
        telefoníČíslo: 'tel:+420111222336'
    })

CREATE (Uklízeč_1)-[:MÁ_PLAT {množství: 25000.0}]->(CZK)
CREATE (Pečovatel_1)-[:MÁ_PLAT {množství: 38000.0}]->(CZK)
CREATE (Veterinář_1)-[:MÁ_PLAT {množství: 48000.0}]->(CZK)
CREATE (Průvodce_pavilonem_1)-[:MÁ_PLAT {množství: 35000.0}]->(CZK)

CREATE (Průvodce_pavilonem_1)-[:PROVÁDÍ]->(Afrika)
CREATE (Průvodce_pavilonem_1)-[:PROVÁDÍ]->(Plazy)
CREATE (Průvodce_pavilonem_1)-[:PROVÁDÍ]->(Prales)

CREATE (Průvodce_pavilonem_1)<-[:PROVÁDÍ]-(Afrika)
CREATE (Průvodce_pavilonem_1)<-[:PROVÁDÍ]-(Plazy)
CREATE (Průvodce_pavilonem_1)<-[:PROVÁDÍ]-(Prales)

CREATE (Veterinář_1)-[:PEČUJE]->(Poušť)
CREATE (Veterinář_1)-[:PEČUJE]->(Savana)
CREATE (Veterinář_1)-[:PEČUJE]->(Hory)
CREATE (Veterinář_1)-[:PEČUJE]->(TeráriumKober)
CREATE (Veterinář_1)-[:PEČUJE]->(VýběhGoril)

CREATE (Veterinář_1)<-[:PEČUJE]-(Poušť)
CREATE (Veterinář_1)<-[:PEČUJE]-(Savana)
CREATE (Veterinář_1)<-[:PEČUJE]-(Hory)
CREATE (Veterinář_1)<-[:PEČUJE]-(TeráriumKober)
CREATE (Veterinář_1)<-[:PEČUJE]-(VýběhGoril)

CREATE (Pečovatel_1)-[:SPRAVUJE]->(Poušť)
CREATE (Pečovatel_1)-[:SPRAVUJE]->(Savana)
CREATE (Pečovatel_1)-[:SPRAVUJE]->(Hory)
CREATE (Pečovatel_1)-[:SPRAVUJE]->(TeráriumKober)
CREATE (Pečovatel_1)-[:SPRAVUJE]->(VýběhGoril)

CREATE (Pečovatel_1)<-[:SPRAVUJE]-(Poušť)
CREATE (Pečovatel_1)<-[:SPRAVUJE]-(Savana)
CREATE (Pečovatel_1)<-[:SPRAVUJE]-(Hory)
CREATE (Pečovatel_1)<-[:SPRAVUJE]-(TeráriumKober)
CREATE (Pečovatel_1)<-[:SPRAVUJE]-(VýběhGoril)

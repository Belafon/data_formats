// vypočítá výdaje zoo za měsíc, konkrétně jídla pro každé zvíře a platy pro každého zaměstnance
WITH 0 AS output

// nejprve počítáme platy v korunách
OPTIONAL MATCH ()-[platCZK:MÁ_PLAT]->(:Měna{název: 'CZK'})
WITH CASE // pokud se žádný plat v datech nenachází, match přiřadí null
        WHEN platCZK IS NOT NULL THEN sum(platCZK.množství)
        ELSE 0
    END AS output, collect(platCZK) AS plat // collect() je potřeba abychom zamezili kartézskému součinu

// nyní jdem počítat jídla v korunách
OPTIONAL MATCH (:Zvíře)-[:JE]->(:ZvířeTyp)-[:STRAVUJE]->()-[cenaCZK:CENA]->(:Měna{název: 'CZK'})
WITH CASE
        // vynásobí se 30, protože cena je v datech uložena jako porce na den pro zvíře
        WHEN cenaCZK IS NOT NULL THEN sum(cenaCZK.množství) * 30 + output 
        ELSE 0
    END AS output, collect(cenaCZK) AS cena

// nyní to samé pro eura, cena se převede na koruny vynásobením 25
OPTIONAL MATCH ()-[platEUR:MÁ_PLAT]->(:Měna{název: 'EUR'})
WITH CASE
        WHEN platEUR IS NOT NULL THEN sum(platEUR.množství) * 25 + output
        ELSE output
    END AS output, collect(platEUR) AS plat2

OPTIONAL MATCH (:Zvíře)-[:JE]->(:ZvířeTyp)-[:STRAVUJE]->()-[cenaEUR:CENA]->(:Měna{název: 'EUR'})
WITH CASE
        WHEN cenaEUR IS NOT NULL THEN sum(cenaEUR.množství) * 30 * 25 + output
        ELSE output
    END AS output, collect(cenaEUR) AS cena2

RETURN output 

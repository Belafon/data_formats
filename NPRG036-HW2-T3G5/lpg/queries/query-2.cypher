// vybere zvíře, které se narodilo v zoo a k tomu vybere všechny pečovatele a veterináře, kteří se o takové zvíře starají
MATCH (typ:ZvířeTyp)<-[:JE]-(zvire:Zvíře)-[:DOMOV]->(:Výběh)-[SPRAVUJE]->(pecovatel:Pečovatel)
WHERE zvire.datumNarození = zvire.datumPříchoduDoZoo
WITH typ, zvire, pecovatel
MATCH (typ)<-[:JE]-(zvire)-[:DOMOV]->(:Výběh)-[PEČUJE]->(veterinar:Veterinář)
RETURN typ.název AS TypZvířete, zvire.jméno, pecovatel.jméno, veterinar.jméno
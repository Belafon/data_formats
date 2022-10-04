// vypočítá nejbližší narozeniny zvířat a seřadí je od nejbližších a vypoičte za jak dlouho nastanou
MATCH (zvíře:Zvíře)
// vezmeme si dobu mezi dnešním dnem a datumem narození, zkrátíme dobu na roky a 
// přičteme výsledek k datumu narození a přidáme 1 rok, tím získáme datum nejbližších narozenin
WITH duration.between(date(zvíře.datumNarození), date()) AS stáří, zvíře
WITH date.truncate('year', date("0000-01-01") + stáří) AS datumStáříVLetechOdNuly, zvíře, stáří 
WITH duration.between(date("0000-01-01"), datumStáříVLetechOdNuly) AS stáříVLetech, zvíře, stáří 

WITH stáříVLetech + duration('P1Y') AS dobaKNasledujicimNarozkam, zvíře, stáří 
WITH date(zvíře.datumNarození) + dobaKNasledujicimNarozkam AS datumNejbližšíchNarozenin, zvíře, stáří
WITH duration.between(date(), datumNejbližšíchNarozenin) AS dobaDoNarozenin, zvíře, stáří, datumNejbližšíchNarozenin

RETURN zvíře.jméno, date(zvíře.datumNarození) AS datumNarození, 
    datumNejbližšíchNarozenin, 
    dobaDoNarozenin ORDER BY dobaDoNarozenin

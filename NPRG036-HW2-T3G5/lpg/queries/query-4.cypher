// vyhledá s kým se zvíře, jehož jméno začíná na B, dostává do kokntaktu
MATCH (v:Zvíře)
WHERE v.jméno =~ 'B.*'
MATCH (v)-[:LZE_SPATŘIT|PEČUJE|SPRAVUJE|JE_DOMOVEM*2]-(entitaSeJménem)
WHERE entitaSeJménem.jméno =~ '.*'
RETURN DISTINCT v.jméno, entitaSeJménem.jméno
[[."@graph"[] | select(."@id" == "zoo:typyStravy")."seznamTypuStrav"[]
    | select(."@type" == "ex:TypStravy")

]as $typyStravy
| $typyStravy[] as $typStravy
| {
    "název": $typStravy."názevProČtení"."cs" ,
    "kalorie":  ([$typStravy."kalorie"|tostring,  "cal"] | join("")),
    "cena": ([$typStravy."cena"."value"|tostring,  $typStravy."cena"."currency"] | join("")), 
}]

| sort_by(."cena"[0:-3] | tonumber) | reverse
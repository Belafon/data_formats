[
    ."@graph"[]    
    |
        [
            select(."@type" == "ex:Pavilon") 
            | ."výběhy"[] 
            | ."zvířata"[] 
            | select(."@id" != "zoo:Lenka")
            |   {
                    "typ": ."zvířeTyp"."@id"
                } 
        ]
        
        | group_by(."typ")[]
        | {"pocet": length} + add
] as $eg 

| [."@graph"[] 
    | select(."TypyZvířat" != null)."TypyZvířat"[]
] as $zv

| $zv[] as $zvRoz
| $eg[] as $egRoz

| if $zvRoz."@id" == $egRoz."typ" 
    then {
        "typStravy": $zvRoz."typStravy"[0], 
        "typZvirete": $zvRoz."@id"
    }
    else null end | select(. != null) as $typyStravyProTypyZviratKtereZooObsahuje
| if $typyStravyProTypyZviratKtereZooObsahuje."typZvirete" == $egRoz."typ"
    then {
        "typStravy": $typyStravyProTypyZviratKtereZooObsahuje."typStravy", 
        "typZvirete": $zvRoz."@id",
        "pocet": $egRoz."pocet"
    }
    else null end | select(. != null)







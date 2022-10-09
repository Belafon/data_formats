[
    ."@graph"[] 
        | select(."@type" == "ex:Pavilon") 
        | ."výběhy"[] 
        | ."zvířata"[] 
        |   {
                "typ": ."zvířeTyp"."@id"
            } 
]
| group_by(."typ")[]
|  {"pocet": length} + add


[."@graph"[] | select(."familyName" != null)] as $rootZamest
|
[."@graph"[] | select(."@type" == "ex:Pavilon")."výběhy"[]
    | select(."@type" == "ex:Výběh")."Veterináři"[]
    | select(."@type" == "ex:Veterinář")] as $veterinari
|
[."@graph"[] | select(."@type" == "ex:Pavilon")."výběhy"[]
    | select(."@type" == "ex:Výběh")."Pečovatelé"[]
    | select(."@type" == "ex:Pečovatel")] as $pecovatele
|
[."@graph"[] | select(."@type" == "ex:Pavilon")."PrůvodcePavilonem"[]
    | select(."@type" == "ex:PrůvodcePavilonem")] as $pruvodcePavilonem
|
$rootZamest + $veterinari + $pecovatele + $pruvodcePavilonem
| length



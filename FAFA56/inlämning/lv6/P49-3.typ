#import "../template.typ": m, e, p, planck, light, rinf, me
#import "@preview/unify:0.6.0": qty, num
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/physica:0.9.3": *

#show: doc => p(ch: 49, n: "3", doc)

Pauliprincipen säger att två elektroner inte kan befinna sig i samma kvanttillstånd, och är anledningen till att inte alla elektroner befinner sig i materialets lägsta energitillstånd. Om Pauliprincipen avaktiverades skulle alla elektroner hoppa ner till grundtillståndet, $E=0$ och i genomsnitt frigöra energin $3/5 E_F$.

Koppar har densiteten $rho=qty("8,96", "g/cm^3")$ och molmassan $M=qty("63,546", "g/mol")$, så Fermienergin $E_F$ ges av

$ E_F=h^2/(8 m_e) ((3 rho)/(pi M))^(2 slash 3)=(planck)^2/(8 dot me)(3 dot qty("8,96e6", "g/m^3")/(pi dot qty("63,546", "g/mol") dot qty("6,022e23", "mol^-1")))^(2 slash 3)\
=qty("7,05", "eV"). $

Notera att varje kopparatom bidrar med _en_ ledningselektron.

+ #[
  Myntet har massan $m=qty("3,1e-3", "kg")$, så det innehåller $n=m/M=qty("48,8", "umol")=qty("2,94e19", "")$ ledningselektroner.

  Den sammanlagda frigjorda energin är således $ E=3/5 E_F n=qty("33,2", "J"). $
]
+ #[
  $ t=E/P=qty("33,2", "J")/qty("100", "W")=qty("332", "ms"). $
]

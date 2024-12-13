#import "../template.typ": m, e, planck, light, rinf, me
#import "@preview/unify:0.6.0": qty, num
#import "@preview/cetz:0.3.1": canvas, draw

#show: doc => e(ch: 49, n: "9", doc)

Vi har (från s. 90 i Concepts-boken) en formel för Fermienergin $ E_F=h^2/(8 m) ((3n)/pi)^(2 slash 3) $

där $m=me$ är elektronernas massa och $n$, ledningselektrondensiteten, beräknas från densiteten $rho=qty("19,3", "g/cm^3")$ och molmassan $M=qty("196,967", "g/mol")$:

$ n=underbracket(1, "elektroner per atom") dot rho/M=qty("19,3e6", "m^-3")/(qty("196,967", "mol") dot qty("6,022e23", "mol^-1"))=qty("5,900e28", "m^-3"). $

Därmed ges Fermienergin av

$ E_F=(planck)^2/(8 dot me) ((3 dot qty("19,3e6", "m^-3"))/(pi dot qty("196,967", "mol") dot qty("6,022e23", "mol^-1")))^(2 slash 3)=qty("5,53", "eV"). $

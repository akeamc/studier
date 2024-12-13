#import "../template.typ": m, e, planck, light, rinf, me
#import "@preview/unify:0.6.0": qty, num
#import "@preview/cetz:0.3.1": canvas, draw

#show: doc => e(ch: 49, n: "27", doc)

Sannolikheten att ett tillstånd med energin $E$ är upptaget ges av $ p(E)=1/(1+exp((E-E_F) slash k T) $

där $E_F$ är Fermienergin, $T$ är temperaturen och $k$ är Boltzmanns konstant. Enligt uppgiften är $T=qty("290", "K")$.

Låt $E_1$ vara energin vid toppen av valensbandet och $E_2$ vara energin vid botten av ledningsbandet. Om vi antar att $E_F$ ligger mitt emellan $E_1$ och $E_2$ så är

$ E_1&=E_F-qty("0,67", "eV")/2\
E_2&=E_F+qty("0,67", "eV")/2. $

+ #[
  Vi söker $ p(E_2)=1/(1+exp((E_2-E_F) slash k T))\
  =1/(1+exp(qty("0,335", "eV") slash (qty("1,38e-23", "J/K") dot qty("290", "K"))))=num("1,5e-6"). $
]
+ #[
  Ett tillstånd är ledigt precis då det inte är upptaget, så vi söker $ 1-p(E_1)=1-1/(1+exp((E_1-E_F) slash k T))\
  =1-1/(1+exp(qty("-0,335", "eV") slash (qty("1,38e-23", "J/K") dot qty("290", "K"))))=num("1,5e-6"). $
]

// Vi har $E_G=qty("")$

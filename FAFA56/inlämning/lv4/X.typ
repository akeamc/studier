#import "../template.typ": assignment, planck, light
#import "@preview/unify:0.6.0": qty, num

#show: doc => assignment(answer: doc, book: none, no: "X")

Partiklar möter ett negativt potentialsteg ($V(x) = 0$ för $x < 0$; $V(x) = -V_0$ för $x >0$). Välj $E$ och $V_0$ så att $R = 81%$.

Sannolikheten för reflektans vid ett negativt potentialsprång med höjden $V$ ges av

$ R=((k-K) / (k+K))^2 $

där $k$ är vågtalet för $x<0$; $K$ för $x>0$, dvs

$
  k&=sqrt(2m E) / h\
  K&=sqrt(2m(E+V_0)) / h.
$

Vi vill att $R=81%$, så

$
  num("0,81")&=((k-K) / (k+K))^2\
  num("0,9")&=abs((k-K)/(k+K)).
$

Vi vet att $K>k>=0$ så

$
  num("0,9")&=(K-k) / (k+K)\
  num("0,9")k+num("0,9")K&=K-k\
  num("1,9")k&=num("0,1")K\
  19k&=K
$

och nu kan vi beräkna energierna med

$
  19k=K <=> 19sqrt(cancel(2m) E) / cancel(h)&=sqrt(cancel(2m) (E+V_0)) / cancel(h)\
  19^2 E&=E+V_0\
  360 E &= V_0.
$

Partikelns energi $E$ måste vara $360$ gånger potentialstegets, så $E=qty("3,6", "eV")$ och $V_0=qty("0,1", "eV")$ duger.

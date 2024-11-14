#import "../template.typ": m, e, planck, light
#import "@preview/unify:0.6.0": qty
#show: doc => e(ch: 46, n: "6", doc)
#set enum(numbering: "(a)")

Envärt laddade natriumjoner har massan $m=qty("23,00", "u")$ och laddningen $q=qty("1,602e-19", "C")$. När de accelereras genom en spänning $U$ tillförs en elektrisk energi $q U$, där $U=qty("325", "V")$.

+ #[
  All elektrisk energi omvandlas till kinetisk energi; vi söker $v$ för att kunna beräkna rörelsemängden $p=m v$. Vi har

  $ 1/2m v^2=&q U\
  => v=&sqrt((2q U)/m)\
  => p=m v=& sqrt(2 q U m)\
  =& sqrt(2 dot qty("1,602e-19", "C") dot qty("325", "V") dot qty("23,00", "u") dot qty("1,66e-27", "kg/u"))\
  =& qty("1,99e-21", "kg m/s"). $
]
+ #[
  de Broglievåglängden för en partikel är $lambda=h/(m v)$ så natriumjonerna har våglängden

  $ lambda=h/(m v)=planck/(qty("1,99e-21", "kg m/s"))=qty("3,32e-13", "m")=qty("0,332", "pm"). $
]
 
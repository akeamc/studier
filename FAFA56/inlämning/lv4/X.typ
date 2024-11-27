#import "../template.typ": assignment, planck, light
#import "@preview/unify:0.6.0": qty, num

#show: doc => assignment(answer: doc, book: none, no: "X")

Partiklar möter ett negativt potentialsteg ($V(x) = 0$ för $x < 0$; $V(x) = -V_0$ för $x >0$). Välj $E$ och $V_0$ så att $R = 81%$.

+ #[
    Sannolikheten för reflektans vid ett negativt potentialsprång med höjden $V$ ges av

    $ R=((k-K)/(k+K))^2 $

    där $k$ är vågtalet för $x<0$; $K$ för $x>0$, dvs

    $ k&=sqrt(2m E)/h\
    K&=sqrt(2m(E+V_0))/h. $

    Vi vill att $R=81%$, så

    $ num("0,81")&=((k-K)/(k+K))^2\
    num("0,9")&=(k-K)/(k+K)\
    num("0,9")k+num("0,9")K&=k-K\
    num("1,9")K&=num("0,1")k\
    19K&=k
    
     $
  ]

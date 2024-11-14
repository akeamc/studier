#import "../template.typ": o
#import "@preview/unify:0.6.0": qty
#import "@preview/physica:0.9.3": *

#show: doc => o(ch: 1, n: "9", doc)

2. #[
    Från uppgift (a) vet vi att $|N|^2=kappa$.

    Sannolikhetstätheten ges av

    $
      rho(x)=abs(psi(x,0))^2=abs(N exp(-kappa|x|))^2
      =underbracket(abs(N)^2, =kappa) abs(exp(-kappa|x|))^2
      =kappa abs(exp(-kappa|x|))^2.
    $

    Absolutbeloppet av $x$ gör $rho$ symmetrisk kring $x=0$. Dessutom är $rho$ strängt avtagande (för vår $exp$ är det), så $rho$ är maximal vid $x=0$. Därmed är sannolikheten att hitta partikeln som störst när detektorn placeras i mitten.

    Sannolikheten beräknas enligt $ integral_(-a/2)^(a/2) rho(x) dd(x)=& 2integral_0^(a/2) rho(x) dd(x)\
    =& 2 integral_0^(a/2) kappa abs(exp(-kappa|x|))^2 dd(x)\
    =& 2 integral_0^(a/2) kappa exp(-2 kappa x) dd(x)\
    =& eval(-exp(-2 kappa x))_0^(a/2)\
    =& 1-exp(-kappa a). $
  ]

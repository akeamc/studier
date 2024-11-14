#import "../template.typ": o
#import "@preview/unify:0.6.0": qty
#import "@preview/physica:0.9.3": *

#show: doc => o(ch: 1, n: "9", doc)

#set enum(numbering: "(a)")

1. #[
    Vi har vågfunktionen

    $ psi(x,0)=exp(-kappa|x|) $

    och söker $N$ så att $psi$ är normaliserad, dvs

    $ integral_(-infinity)^infinity |psi(x,0)|^2=1. $

    Funktionen som integreras är jämn (ty $psi$ bryr sig endast om beloppet av $x$) och integrerings-?intervallet $(-infinity, infinity)$ är symmetriskt, så vi kan byta intervall till något trevligare på så sätt bli av med det inre absolutbeloppet. Vi får

    $
      integral_(-infinity)^(infinity) abs(N exp(-kappa|x|))^2 dd(x)
      =& 2 integral_(0)^(infinity) abs(N exp(-kappa x))^2 dd(x)\
      =& 2|N|^2 integral_0^(infinity) abs(exp(-kappa x))^2 dd(x)\
      =& 2|N|^2 integral_0^(infinity) exp(-2 kappa x) dd(x) \
      =& 2|N|^2 eval(exp(-2 kappa x)/(-2 kappa))_0^infinity \
      =& 2|N|^2 (0 / (-2 kappa)-1 / (-2 kappa)) \
      =& (|N|^2) / (kappa)
    $

    Normeringsvillkoret säger att $ (|N|^2)/kappa=1<=>|N|^2=kappa. $
  ]

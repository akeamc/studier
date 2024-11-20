#import "../template.typ": assignment, planck, light, infint
#import "@preview/unify:0.6.0": qty
#import "@preview/physica:0.9.3": *

#show: doc => assignment(answer: doc, book: none, no: "1.1")

+ #[
    Låt $psi(x)=N/abs(x)$. Eftersom $psi(x)=psi(-x)$ kan integralen $infint(abs(N/abs(x))^2)$ skrivas som
    $2integral_0^infinity abs(N/abs(x))^2 dd(x)$, och på det nya integreringsintervallet är $abs(x)=x$ vilket innebär att integralen kan skrivas om som

    $
      2 N^2 integral_0^infinity 1 / x^2 dd(x)=2N^2(integral_0^1 1 / x^2 dd(x)+integral_1^infinity 1 / x^2 dd(x))=2N^2(
        underbracket([-1/x]_0^1, -> space infinity)+underbracket([-1/x]_1^infinity, -> space 1)
      ).
    $

    Integralen divergerar alltså (oavsett $N$) och vågfunktionen $psi(x)$ är inte normaliserbar.
  ]
+ #[
    Låt $psi(x)=N sin (x) slash x^3$. Omm $infint(abs(psi(x)))$ är konvergent går det att normalisera $psi$ genom att välja ett lämpligt $N$.

    Notera att en integral på intervallet $I$ måste konvergera på alla delintervall till $I$ för att integralen över hela intervallet ska vara konvergent.

    // #rect(stroke: none, fill: gray.lighten(90%))[
    //   *Jämförelsesatsen:* För två funktioner $f$ och $g$ sådana att $f>=g>=0$ på intervallet $[a,b]$ gäller det att $ integral_a^b g(x) dd(x) "divergent" => integral_a^b f(x) dd(x) "divergent". $
    // ]

    Låt $ f(x)&=abs(psi(x))^2 "och"\
    g(x)&=abs((N x slash 2)/x^3)^2. $

    På intervallet $[0, 1]$ är $f>=g>=0$, så om $integral_0^1 g(x) dd(x)$ är divergent så är $integral_0^1 f(x) dd(x)$ också divergent enligt jämförelsesatsen. Vi har

    $
      integral_0^1 abs((N x slash 2)/x^3)^2 dd(x)=N^2 / 4 integral_0^1 1 / x^4 dd(x)=N^2 / 4 [
        -1 / (3 x^3)
      ]_0^1-> infinity
    $

    så $integral_(-infinity)^infinity g(x) dd(x)$, och därmed $integral_(-infinity)^infinity f(x) dd(x)$, divergerar vilket innebär att $psi$ inte är normaliserbar.
  ]


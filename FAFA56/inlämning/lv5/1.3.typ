#import "../template.typ": assignment, planck, light, infint, conj
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => assignment(answer: doc, book: none, no: "1.3")

En elektron befinner sig i tillstånd $n = 2$ i en oändlig kvantbrunn med bredd $L$. Vad är sannolikheten att man hittar elektronen vid en mätning inom kvantbrunnens centrala tredjedel?

Inuti kvantbrunnen (dvs då $0<x<L$) kommer $psi$ vara en stående våg, så

$
  psi(x)&=sqrt(2/L) sin((n pi x)/L)\
  <=> rho(x)=abs(psi(x))^2&=2 / L sin^2((n pi x) / L)
$

Den centrala tredjedelen begränsas av $x=L/3$ och $x=2L/3$, så sannolikheten att hitta elektronen där är

$
  integral_(L slash 3)^(2L slash 3) rho(x) dd(x)&=2 / L integral_(L slash 3)^(2L slash 3) sin^2((n pi x) / L).
$

Vi integrerar $sin^2(k x)$:

$
  integral sin^2(k x) dd(x)&=integral (1-cos(2 k x)) / 2 dd(x)=x / 2 - sin(2 k x) / (4k)+C.
$

så sannolikheten (med insättning av $n=2$) är

$
  2 / L [x / 2 - (L sin(2n pi x slash L)) / (4n pi)]_(L slash 3)^(2L slash 3)
  = 2 / cancel(L) ((2cancel(L)) / 6 - (cancel(L) sin(8 pi slash 3)) / (8pi) - cancel(L) / 6 + (cancel(L) sin(4 pi slash 3)) / (8pi))
  = 1 / 3-(sqrt(3)) / (4pi) approx num("0,196").
$

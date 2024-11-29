#import "../template.typ": m, e, planck, light
#import "@preview/unify:0.6.0": qty, num
#import "@preview/cetz:0.3.1": canvas, draw
#show: doc => e(ch: 46, n: "28", doc)

Eftersom $1%=num("0,01")<<1$ kan vi använda sambandet

$ T=16 E/V_0 (1-E/V_0) e^(-2 k a) $

där $T=num("0,01")$ är transmittansen, $E=qty("5,0", "eV")$ är elektronernas energi, $V_0=qty("6,0", "eV")$ är barriärens höjd, $k=2pi sqrt(2 m (V_0-E)) slash h$ är vågtalet i barriären, $m=qty("9,109e-31", "kg")$ är elektronens massa och $a$ är barriärens (sökta) tjocklek.

Vi löser ut $a$:

$ a=ln(T/(16 E slash V_0)(1-E/V_0))/(-2 dot 2pi sqrt(2 m (V_0-E)) slash h))\
= ln(num("0,01")/(16 qty("5", "eV")/qty("6", "eV"))(1-qty("5", "eV")/qty("6", "eV")))/(-2 dot 2pi sqrt(2 dot qty("9,109e-31", "kg")((qty("6", "eV")-qty("5", "eV")) dot qty("1,602e-19", "J/eV"))) slash planck)\
=qty("2,5", "nm") $

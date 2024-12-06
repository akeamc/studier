#import "../template.typ": m, e, planck, light, rinf, me
#import "@preview/unify:0.6.0": qty, num
#import "@preview/cetz:0.3.1": canvas, draw

#show: doc => e(ch: 47, n: "4", doc)

Vi har $E=qty("2,6", "eV")$ och $n=1$. I grundtillståndet gäller $ E=(h^2 n^2)/(8 m L^2) $

så om vi sätter in $4L$ som brunnens längd får vi

$ (h^2 n^2)/(8 m (2L)^2)=1/4 E. $

Så elektronen har en fjärdedel av energin i grundtillståndet, dvs $qty("0,65", "eV")$.

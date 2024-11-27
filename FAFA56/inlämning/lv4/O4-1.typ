#import "../template.typ": o, planck
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => o(ch: 3, n: "7", doc)

#let I = $upright("I")$
#let II = $upright("II")$

+ #[
    För en partikel i en oändlig potentialbrunn gäller det att

    $ E_n=(h^2 n^2) / (8 m a^2). $

    Vi vet att $n=1$ (grundtillståndet) och $m=#qty("9,109e-31", "kg")$, och söker $a$ så att $E_1=qty("0,1", "eV")$. Så

    $ a=(h n)/sqrt(8 m E_n)=(planck)/(sqrt(8 dot qty("9,109e-31", "kg") dot qty("0,1", "eV") dot qty("1,602e-19", "J/eV")))=qty("1,939", "nm"). $
  ]
+ #[
  Vi söker
  
  $ E_2-E_1=h^2/(8 m a^2)(2^2-1^2)=(3 h^2)/(8 m a^2)=3E_1=qty("0,3", "eV"). $
]
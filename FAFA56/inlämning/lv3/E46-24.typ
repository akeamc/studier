#import "../template.typ": m, e, planck, light
#import "@preview/unify:0.6.0": qty
#import "@preview/cetz:0.3.1": canvas, draw
#show: doc => e(ch: 46, n: "24", doc)

Vi har $m=qty("0,50", "kg")$, $Delta v=qty("1,2", "m/s")$ och $h=qty("0,60", "J s")$ (!).

Enligt Heisenbergs osäkerhetsprincip är

$ Delta x Delta p>=h/(4 pi) $

vilket ger osäkerheten i position $ Delta x>= h/(4 pi Delta p)=h/(4 pi m Delta v)=qty("0,60", "J s")/(4 pi dot qty("0,50", "kg") dot qty("1,2", "m/s"))=qty("8,0", "cm"). $

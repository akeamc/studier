#import "../template.typ": e, nm_to_ev, planck, light
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *

#show: doc => e(ch: 45, n: "7", doc)

En foton med våglängden $lambda$ har energin $(h c)/lambda$, så $n$ fotoner har den sammanlagda energin $E=(n h c)/lambda$. Effekten ges av $P=E/t$ och vi söker $n/t$:

$ P=E/t=(n h c)/(lambda t) <=> n/t=(P lambda)/(h c). $

För båda lamporna gäller $P=qty("130", "W")$ och $t=qty("1", "s")$ (ty vi är ute efter antalet fotoner per sekund).

Den ultravioletta lampan emitterar

$ n_1/qty("1", "s")=(qty("130", "W") dot qty("400e-9", "m"))/(planck dot light)=num("2,6e20") "fotoner per sekund" $

medan den infraröda emitterar

$ n_2/qty("1", "s")=(qty("130", "W") dot qty("700e-9", "m"))/(planck dot light)=num("4,6e20") "fotoner per sekund". $

#set enum(numbering: "a)")

1. Den infraröda lampan emitterar fler fotoner per sekund.
2. $ (n_2-n_1)/qty("1", "s")=(qty("130", "W") (qty("700e-9", "m")-qty("400e-9", "m")) )/(planck dot light)=num("2,0e20") "fotoner per sekund". $

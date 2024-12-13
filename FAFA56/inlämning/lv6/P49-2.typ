#import "../template.typ": m, e, p, planck, light, rinf, me
#import "@preview/unify:0.6.0": qty, num
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/physica:0.9.3": *

#show: doc => p(ch: 49, n: "2", doc)

Vid $T=qty("0", "K")$ är energitillstånden till och med $E_F$ upptagna, så

$ E_F = h^2/(8m) ((3n)/pi)^(2 slash 3). $

Den genomsnittliga energin beräknas enligt

$ E_"av"=1/n integral_0^E_F E n(E) dd(E)=1/n (8 sqrt(2) pi m^(3 slash 2))/(h^3) integral_0^E_F E^(3 slash 2) dd(E)=(8 sqrt(2) pi m^(3 slash 2))/(n h^3)2/5E_F^(5 slash 2). $

Förhållandet mellan energierna ges av

$ E_"av"/E_F&=E_"av" E_F^(-1)=(8 sqrt(2) pi cancel(m^(3 slash 2), stroke: #red))/(n cancel(h^3, stroke: #blue)) 2/5 cancel(h^5, stroke: #blue)/(8^(5 slash 2)cancel(m^(5 slash 2), stroke: #red)) ((3n)/pi)^(5 slash 3) (8cancel(m, stroke: #red))/cancel(h^2, stroke: #blue) (pi/(3n))^(2 slash 3)\
&=(8 sqrt(2) cancel(pi, stroke: #red) dot 2 dot 3^(5 slash 3) cancel(n^(5 slash 3), stroke: #blue) dot 8 dot cancel(pi^(2 slash 3), stroke: #red))/(cancel(n, stroke: #blue) dot 5 dot 8^(5 slash 2) dot cancel(pi^(5 slash 3), stroke: #red) dot 3^(2 slash 3) dot cancel(n^(2 slash 3), stroke: #blue))=(2^(15 slash 2) dot 3^(5 slash 3))/(5 dot 2^(15 slash 2) dot 3^(2 slash 3))=3/5 quad qed $

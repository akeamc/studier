#import "../template.typ": m, e, planck, light
#import "@preview/unify:0.6.0": qty
#import "@preview/cetz:0.3.1": canvas, draw
#show: doc => e(ch: 46, n: "15", doc)
#set enum(numbering: "(a)")

#canvas({
  import draw: *

  let atom(p) = circle(p, radius: 2pt, fill: black);

  line(stroke: gray, (-6,0), (-6,2), name: "d")
  content("d.mid", anchor: "east", padding: 3pt, $d$)

  for x in range(-3, 3) {
    for y in (0, 1, 2) {
      atom((x * 2, y * 2));
    }
  }
})

Braggs villkor för reflektion lyder $ 2 d sin theta=n lambda. $

Vi söker vinkeln $theta$ för första ordningen, alltså $n=1$. Kristallavståndet är $d=qty("73,2", "pm")$ och $lambda=h/(m v)$ är neutronernas de Broglievåglängd. Neutronerna har massan $m=qty("1,67e-27", "kg")$.

Vi vet att neutronerna har rörelseenergin $K=1/2 m v^2=qty("4,2", "eV")$, och beräknar därför rörelsemängden $m v$ och sedan våglängden $lambda$ enligt

$ v=sqrt((2K)/m) <=> m v=sqrt(2 K m) <=> lambda=h/sqrt(2 K m). $

Slutligen kan $theta$ beräknas enligt Braggs villkor. Vi har

$ 2 d sin theta=n lambda <=>
theta=&arcsin((n lambda)/(2 d))=arcsin((n h)/(2 d sqrt(2 K m)))\
=&arcsin((1 dot planck)/(2 dot qty("73,2e-12", "m") dot sqrt(2 dot qty("4,2", "eV") dot qty("1,602e-19", "J/eV") dot qty("1,67e-27", "kg")))) \
=&qty("5,5", "d") $

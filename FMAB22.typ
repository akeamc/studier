#import "@preview/cetz:0.2.2": canvas, draw, vector, matrix

#set text(lang: "sv")
#set page(numbering: "1", header: align(center, smallcaps[FMAB22: Lineär algebra]))

#let hr = line(length: 100%, stroke: 0.5pt)

#let e1 = $overline(e_1)$
#let e2 = $overline(e_2)$
#let e3 = $overline(e_3)$
#let en = $overline(e_n)$

#let u1 = $overline(u_1)$
#let u2 = $overline(u_2)$
#let u3 = $overline(u_3)$
#let un = $overline(u_n)$

#let vu = $overline(u)$
#let v1 = $overline(v_1)$
#let v2 = $overline(v_2)$
#let v3 = $overline(v_3)$
#let vv = $overline(v)$

#let zv = $overline(0)$

#outline(indent: 1em)
#pagebreak(weak: true)

#let important(content) = rect(fill: red.lighten(90%), stroke: red, content)

#let lecture = (month, day, content) => [
  == #datetime(year: 2024, month: month, day: day).display()

  #content
]

// #outline(indent: 1em)
// #pagebreak(weak: true)

= Den stora ekvivalensen

$F$ är en linjär avbildning $RR^n->RR^n$ som ges av matrisen $A$ i bas $(e1,e2,dots.c,en)$. Följande påståenden är ekvivalenta:

- $F$ är injektiv
- $F$ är surjektiv
- $F$ är bijektiv
- $F(vu)=zv "omm" vu=zv$
- $(F(e1),F(e2),dots.c,F(en))$ är en bas för $RR^n$
- $dim N(F)=0$
- $dim V(F)=n$
- Kolonnvektorer i $A$ är linjärt oberoende
- Radvektorer i $A$ är linjärt oberoende
- $A$ är inverterbar
- $det A!=0$
- $A$ kan reduceras till $E$ genom elementära radoperationer
- $A X=Y$ har unik lösning för alla $Y$
- $A X=zv$ har endast den triviala lösningen
- $F^(-1)$ existerar och har matris $A^(-1)$
- $0$ är inte ett egenvärde till $A$

= Föreläsningar

#lecture(9, 2)[
Ett homogent linjärt ekvationssystem med fler variabler än ekvationer har oändligt många lösningar.

Ett homogent system med 1 ekvation och minst 2 variabler har oändligt många lösningar:

$x_1+x_2=0$

Om ett homogent system med $p-1$ ekvationer har oändligt många lösningar, har också ett system med $p$ ekvationer det.

$ cases(
  a_(1,1) x_1 + a_(1,2) x_2 + dots.c + a_(1,n)x_n = 0,
  a_(2,1) x_2 + dots.c + a_(2,n) x_n = 0,
  dots.v
) $

Givet ekvationssystemet

$ mat(
  a_(1,1), a_(1,2), ..., a_(1,n), y_1;
  a_(2,1), a_(2,2), ..., a_(2,n), y_2;
  dots.v, dots.v, dots.down, dots.v, dots.v;
  a_(p_1), a_(p_2), ..., a_(p,n), y_p;
  augment: #4;
), $

antag att $a_(1,1) != 0$. Gausseliminera så att $a_(2,1)dots.c a_(p,1)=0$:

$ mat(
  a_(1,1), a_(1,2), ..., a_(1,n), y_1;
  0, a_(2,2), ..., a_(2,n), y_2;
  dots.v, dots.v, dots.down, dots.v, dots.v;
  0, a_(p_2), ..., a_(p,n), y_p;
  augment: #4;
) $

Vi har ett nytt ekvationssystem med $p-1$ ekvationer och $n-1$ obekanta.
]

#lecture(9, 3)[
Givet basen $(e1, e2)$ och vektorn $u$ med koordinaterna $(x_1, x_2)$, är $x_1 e1$ $u$:s projektion på $e1$ i riktning $e2$.

#hr

Vektorerna $u1, u2, dots.c, un$ kallas linjärt beroende om

$ zv = x_1 u1 + x_2 u2+dots.c+x_n un $ där minst en av $x_1, x_2, dots.c, x_n$ är nollskild.

#hr

Om
$ u=x_1 e1+x_2 e2+x_3 e3=y_1 e1+y_2 e2+y_3 e3 $
i basen $(e1,e2,e3)$ där
$ (x_1,x_2,x_3)!=(y_1,y_2,y_3) $
så är
$ (y_1-x_1)e1+(y_2-x_2)e2+(y_3-x_3)e3=zv $
men då finns det minst en nollskild skalär, så $(e1,e2,e3)$ är linjärt beroende och ej en bas. #emoji.sparkles

#hr

#important[Ett homogent linjärt ekvationssystem kan bara ha en (den triviala) eller oändligt många lösningar:

Antag att det finns _en_ lösning $L=(x_1, x_2, dots.c, x_n)$ till systemet
$ cases(a_(1,1)x_1+a_(1,2)x_2+dots.c+a_(1,p)=0,
 a_(2,1)x_1+a_(2,2)x_2+dots.c+a_(2,p)=0,
 dots.v,
 a_(n,1)x_1+a_(n,2)x_2+dots.c+a_(n,p)=0,
). $
Om $L$ gör så att varje ekvation blir $0$, måste $lambda L$ (där $lambda$ är ett godtyckligt tal) också göra det, eftersom $0 lambda=0$. Det finns oändligt många $lambda$, så det finns oändligt många lösningar. #emoji.sparkles
]
]

#lecture(9,4)[
=== Linjer och plan i rummet på parameterform

Givet en linje $L$ och två olika punkter på linjen, $P$ och $P_0$, kan linjen beskrivas på parameterform -- en startpunkt plus en riktningsvektor som skalas för att peka någonstans på linjen.

Ortsvektor $overline(O P_0)$ pekar på linjens startpunkt, och vektorn $overline(P_0 P)$ avgör linjens riktning.

Alla punkter på $L$ ges av
$ overline(O P_0) + t overline(P_0 P) $ där $t in RR$.

På ett liknande sätt kan ett plan $M$ i rummet skrivas på parameterform givet en godtycklig punkt på planet $P_0$ samt två nollskilda vektorer $vu$ och $vv$ och två parametrar $s, t in RR$:

$ overline(O P_0) + t vu + s vv $

=== Skärning mellan plan och linje i rummet

En linje och ett plan kan skära varandra i noll, en eller oändligt många punkter.

#important[Varje sak (linje, plan) på parameterform har _egna_, unika parametrar $s, t, dots.c$. Det går inte att använda samma parameter till flera olika saker.]

=== Plan på affin form

Varje plan i rummet kan skrivas på affin form#footnote[Affin form kallas även för normalform.]:

$ A x+B y+C z+D=0 $
där $A,B,C,D in RR.$
]

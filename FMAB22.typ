#set text(lang: "sv")
#set page(numbering: "1", header: align(center, smallcaps[FMAB22: Lineär algebra]))

#let hr = line(length: 100%, stroke: 0.5pt)

// #outline(indent: 1em)
// #pagebreak(weak: true)

= Den stora ekvivalensen

$F$ är en linjär avbildning $RR^n->RR^n$ som ges av matrisen $A$ i bas $(e_1,e_2,dots.c,e_n)$. Följande påståenden är ekvivalenta:

- $F$ är injektiv
- $F$ är surjektiv
- $F$ är bijektiv
- $F(u)=0 "omm" u=0$
- $(F(e_1),F(e_2),dots.c,F(e_n))$ är en bas för $RR^n$
- $dim N(F)=0$
- $dim V(F)=n$
- Kolonnvektorer i $A$ är linjärt oberoende
- Radvektorer i $A$ är linjärt oberoende
- $A$ är inverterbar
- $det A!=0$
- $A$ kan reduceras till $E$ genom elementära radoperationer
- $A X=Y$ har unik lösning för alla $Y$
- $A X=0$ har endast den triviala lösningen
- $F^(-1)$ existerar och har matris $A^(-1)$
- $0$ är inte ett egenvärde till $A$

= Föreläsningar

== 2024-09-02

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

== 2024-09-03

Givet basen $(e_1, e_2)$ och vektorn $u$ med koordinaterna $(x_1, x_2)$, är $x_1 e_1$ $u$:s projektion på $e_1$ i riktning $e_2$.

#hr

Vektorerna $u_1, u_2, dots.c, u_n$ kallas linjärt beroende om

$ arrow(0) = x_1 u_1 + x_2 u_2+dots.c+x_n u_n $ där minst en av $x_1, x_2, dots.c, x_n$ är nollskild.

#hr

Om
$ u=x_1 e_1+x_2 e_2+x_3 e_3=y_1 e_1+y_2 e_2+y_3 e_3 $
i basen $(e_1,e_2,e_3)$ där
$ (x_1,x_2,x_3)!=(y_1,y_2,y_3) $
så är
$ (y_1-x_1)e_1+(y_2-x_2)e_2+(y_3-x_3)e_3=arrow(0) $
men då finns det minst en nollskild skalär, så $(e_1,e_2,e_3)$ är linjärt beroende och ej en bas. #emoji.sparkles

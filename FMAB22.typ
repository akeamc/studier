#import "template.typ": conf, lecture
#import "@preview/physica:0.9.3": *

#show: doc => conf("FMAB22", "Lineär algebra", doc)

#let hr = line(length: 100%, stroke: 0.5pt)

#let bold_vector(name) = $bold(name)$

#let ve = $overline(e)$
#let e1 = $overline(e_1)$
#let e2 = $overline(e_2)$
#let e3 = $overline(e_3)$
#let en = $overline(e_n)$
#let ei = $overline(e_i)$
#let ej = $overline(e_j)$

#let u1 = $overline(u_1)$
#let u2 = $overline(u_2)$
#let u3 = $overline(u_3)$
#let un = $overline(u_n)$

#let vu = $overline(u)$
#let vup = $overline(u')$
#let v1 = $overline(v_1)$
#let v2 = $overline(v_2)$
#let v3 = $overline(v_3)$
#let vv = $overline(v)$
#let vw = $overline(w)$

#let zv = $overline(0)$
#let zm = $bold(0)$

#let scalar(u, v) = $(#u | #v)$

#let important(content) = rect(fill: red.lighten(90%), stroke: red, content, width: 100%)

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

= Räkneregler

#columns(2)[
  == Vektorprodukt

  $(vu + vv) times vw = vu times vw + vv times vw$

  $(vu times vv) times vw underbrace(!=, "I allmänhet") vu times (vv times vw)$

  == Determinant

  $det A det B=det(A B)$

  == Matriser

  $(A B)^(-1)=B^(-1) A^(-1)$
]

= Föreläsningar

#lecture(2024, 9, 2, [Gausseliminering])[
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

#lecture(2024, 9, 3, [Linjärt beroende])[
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

#lecture(2024, 9, 4, [Linjer och plan])[
= Parameterform

Givet en linje $L$ och två olika punkter på linjen, $P$ och $P_0$, kan linjen beskrivas på parameterform -- en startpunkt plus en riktningsvektor som skalas för att peka någonstans på linjen.

Ortsvektor $overline(O P_0)$ pekar på linjens startpunkt, och vektorn $overline(P_0 P)$ avgör linjens riktning.

Alla punkter på $L$ ges av
$ overline(O P_0) + t overline(P_0 P) $ där $t in RR$.

På ett liknande sätt kan ett plan $M$ i rummet skrivas på parameterform givet en godtycklig punkt på planet $P_0$ samt två nollskilda vektorer $vu$ och $vv$ och två parametrar $s, t in RR$:

$ overline(O P_0) + t vu + s vv $

= Skärning mellan plan och linje i rummet

En linje och ett plan kan skära varandra i noll, en eller oändligt många punkter.

#important[Varje sak (linje, plan) på parameterform har _egna_, unika parametrar $s, t, dots.c$. Det går inte att använda samma parameter till flera olika saker.]

= Plan på affin form

Varje plan i rummet kan skrivas på affin form#footnote[Affin form kallas även för normalform.]:

$ A x+B y+C z+D=0 $
där $A,B,C,D in RR.$ Planet har normalvektorn $(A,B,C)$.
]

#lecture(2024, 9, 9, [Skalärprodukt])[
  $ scalar(vu, vv) = vu dot vv = |vu| |vv| cos theta $

  - kommutativ
  - distributiv

  = Ortogonal projektion

  $vu$ projiceras på $ve$ (där $|ve|=1$) och ger $vup$.

  $ cos theta=(|vup|)/(|vu|) <=> |vup|=|vu|cos theta=scalar(vu, ve) <=> vup = scalar(vu, ve) ve $

  = Koordinatform

  I planet givet $vu=x_1 e_1+x_2 e_2$ och $vv=y_1 e_1+x_2 e_2$:

  $ scalar(vu,vv)=scalar(x_1 e1+x_2 e2, y_1 e1+y_2 e2) \ =x_1 y_1 scalar(e1,e1)+x_1 y_2 scalar(e1,e2)+x_2 y_1 scalar(e2,e1)+x_2 y_2 scalar(e2,e2) $

  Allt blir lättare om baserna är ortonormerade, dvs. $scalar(ei,ej)=delta_(i j)$ där $delta_(i j)$ är Kroneckerdeltat som definieras som

  $ delta_(i j)=cases(0 "om" i!=j, 1 "om" i=j) space . $ <kronecker>

  = "Roliga trigonometriska formler"

  Två vektorer $vu=(cos beta, sin beta)$ och $vv=(cos alpha, sin alpha)$ ligger på enhetscirkelns rand med varsin vinkel $alpha$ respektive $beta$. Vinkeln mellan dem är $alpha-beta$.

  $ scalar(vu,vv)=1dot 1 dot cos(alpha-beta)=cos alpha cos beta + sin alpha sin beta quad #emoji.sparkles $
]

#lecture(2024, 9, 10, [Ellipser, hyberbler och parabler])[
  "Cirkel" -- perfekt rundning

  $ < approx > $
]

#lecture(2024, 9, 11, [Vektor- och volymsprodukt])[
  = Vektorprodukt
  
  Maxwells ekvationer:
  
  $ cases(
    nabla times E = -pdv(B,t),
    nabla times H = J + pdv(D, t),
    nabla dot D = rho,
    nabla times B = 0
  ) $

  $ F = q v times B $

  "_En_ parallellogram och _ett_ prisma." Vad i hela friden, Svenska Akademien?

  I en HON-bas:

  $ (x_1, x_2, x_3) times (y_1, y_2, y_3) = mat(
    delim: "|",
    x_1, y_1, e1;
    x_2, y_2, e2;
    x_3, y_3, e3;
  )\ 
  =x_1 y_2 e3+y_1 e2 x_3+e1 x_2 y_3-x_3 y_2 e1-y_3 e2 x_1-e3 x_2 y_1\
  =(x_2 y_3-x_3 y_2)e1+(x_3 y_3-x_1 y_3)e2+(x_1 y_2-x_2 y_1)e3
  $

  = Volymsprodukt (_parallellepiped_)

  Volymsprodukten ges av $ V = plus.minus "basarea" dot "höjd" $ så $ V=(vu times vv) dot vw . $

  Den kan beräknas med determinanten:

  $ V(vu,vv,vw)=mat(delim: "|",
    x_1,y_1,z_1;
    x_2,y_2,z_2;
    x_3,y_3,z_3;
  ) V(e1,e2,e3) $
]

#lecture(2024, 9, 12, [Matriser])[
  $ A = mat(
    a_(1,1), a_(1,2), a_(1,3), dots.c, a_(1,n);
    a_(2,1), a_(2,2), a_(2,3), dots.c, a_(2,n);
    a_(3,1), a_(3,2), a_(3,3), dots.c, a_(3,n);
    dots.v, dots.v, dots.v, dots.down, dots.v;
    a_(p,1), a_(p,2), a_(p,3), dots.c, a_(p,n);
  ) $

  = Matrismultiplikation

  Givet $A=(a_(i,j))_(p times m)$, $B=(b_(i,j))_(m times n)$ och $C=(c_(i,j))_(p times n)=A B$ är
  $ c_(i,j)=sum_(k=1)^m a_(i,k) b_(k,j). $

  Notera att $ 2 != 1. $

  I domkyrkans krypta finns kolonner#footnote[Se även #link("https://web.archive.org/web/20240912090440/https://sv.wiktionary.org/wiki/kolonnett")[_kolonnett_].]. De har ett cirkulärt tvärsnitt och bär upp taket. Jätten Finn står och omfamnar en av dem. Lägg märke till att

  $ "Kolonnetter" subset.eq "Kolonner" subset.eq "Pelare". $

  = Invers av matriser

  $ E=(delta_(i,j))_(p times n)=mat(
    1, 0, dots.c, 0;
    0, 1, dots.c, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.c, 1;
  ) $

  $delta$: se @kronecker.

  #hr

  Det finns exakt en invers per inverterbar matris $A$. Antag att det finns två inverser $B$ och $C$. Då är

  $ B = B E = B(A C)=(B A)C=E C=C $

  så $B=C$ och det finns sålunda exakt en invers.

  $ A "inverterbar" <=> A X=Y "har entydig lösning för något" Y $

  #hr

  Om $A X=Y$ har mer än en lösning så finns oändligt många lösningar:

  Antag att $X_1$ och $X_2$ är två olika lösningar. Sätt $X=t X_1+(1-t)X_2$. Då är

  $ A X=A(t X_1 + (1-t)X_2)=t A X_1+(1-t)A X_2=t Y+(1-t)Y=Y $

  så $X$ är en lösning. Det finns oändligt många $X$.
]

#lecture(2024, 9, 16, [Linjära rum])[
  Mängden $V$ kallas för ett linjärt rum#footnote[Eller vektorrum.] om addition av element (vektorer) i $V$ och multiplikation med skalär är definierade och att dessa uppfyller följande:
  - $vu, vv in V => vu + vv in V$
  - $vu in V, alpha in RR => alpha vu in V$
  - $vu + vv = vv + vu$
  - $vu + (vv + vw)=(vu + vv) + vw$
  - $1 vu = vu$
  - $(alpha + beta) vu = alpha vu + beta vu$
  - $alpha(vu + vv)=alpha vu + alpha vv$
  - $exists space zv in V; space zv vu = zv => vu + zv = vu, space vu + (-1 vu)=zv$

  = Exempel på linjära rum

  - vektorerna i rummet
  - mängden $p times n$-matriser
  - $PP_n$, alla polynom av grad $<= n$
  - $PP_infinity$, alla polynom
  - $C[a,b]={"alla kontinuerliga funktioner" f:[a,b] -> RR}$
  - $L^2[a,b]={"alla" f:[a,b]->RR "så att" integral_a^b f(x)^2 dd(x) != plus.minus infinity}$
  - $RR^n={x_1, dots.c, x_n in RR : (x_1, dots.c, x_n)}$

  = Linjärt underrum

  $U subset.eq V$ är ett underrum till det linjära rummet $V$ om $U$ är ett linjärt rum. Framför allt viktigt att
  - $vu, vv in U => vu+vv in U$
  - $vu in U, alpha in RR => alpha vu in U$
  - $exists space zv in U$

  "Det är en oändlig linje men eftersom kritan är ändlig så ritar jag den så."

  Det heter _subspace_, inte _underroom_ på engelska. På samma sätt heter det _Unterraum_, inte _Nebenzimmer_ på tyska.
]

#pagebreak(weak: true)

= Redovisningsuppgift

Låt $U$ vara det linjära rummet av $n times n$-matriser. Matrisen $A$ är en okänd $n times n$-matris. Definiera den linjära avbildningen $F: U -> U$ genom $F(X)=A X A$.

Visa att följande påståenden är ekvivalenta!

1. $N(F)={zm}$.
2. $V(F)=U$.
3. Det finns en matris $X_0$ i $U$ sådan att $F(X_0)=E$.
4. Matrisen $A$ är inverterbar.

#hr

Visa att $3 <=> 4$:

$ F(X_0)=A X_0 A=(A X_0)A=A(X_0 A)=E\
=> A^(-1)=A X_0=X_0 A\
=> X_0=A^(-1) A^(-1) $

Ta-da!

$ V(A)={Y in RR^n:A X=Y "har lösning"} $

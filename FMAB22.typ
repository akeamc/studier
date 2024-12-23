#import "template.typ": conf, lecture, hr
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty
#import "@preview/cetz:0.2.2": canvas, draw, plot

#set math.mat(delim: "[")

#show: doc => conf("FMAB22", "Lineär algebra", doc)

#let bold_vector(name) = $bold(name)$

#let ve = $overline(e)$
#let e1 = $overline(e_1)$
#let e2 = $overline(e_2)$
#let e3 = $overline(e_3)$
#let en = $overline(e_n)$
#let ei = $overline(e_i)$
#let ej = $overline(e_j)$
#let ek = $overline(e_k)$
#let ek1 = $overline(e_(k+1))$

#let u1 = $overline(u_1)$
#let u2 = $overline(u_2)$
#let u3 = $overline(u_3)$
#let un = $overline(u_n)$
#let uk = $overline(u_k)$

#let vu = $overline(u)$
#let vup = $overline(u')$
#let v1 = $overline(v_1)$
#let v2 = $overline(v_2)$
#let v3 = $overline(v_3)$
#let vv = $overline(v)$
#let vw = $overline(w)$

#let w1 = $overline(w_1)$
#let w2 = $overline(w_2)$
#let w3 = $overline(w_3)$
#let wk = $overline(w_k)$
#let wn = $overline(w_n)$

#let zv = $overline(0)$
#let zm = $bold(0)$
#let scalar(u, v) = $(#u | #v)$

#let important(content) = rect(fill: red.lighten(90%), stroke: red, content, width: 100%)

// #outline(indent: 1em)
// #pagebreak(weak: true)

= Den stora ekvivalensen

$F$ är en linjär avbildning $RR^n->RR^n$ som ges av matrisen $A$ i bas $(e1,e2,dots.c,en)$.
Följande påståenden är ekvivalenta:

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

  == Determinant

  $det A det B=det(A B)$

  == Matriser

  $(A B)^(-1)=B^(-1) A^(-1)$
]

= Föreläsningar

#lecture(
  2024,
  9,
  2,
  [Gausseliminering],
)[
  Ett homogent linjärt ekvationssystem med fler variabler än ekvationer har
  oändligt många lösningar.

  Ett homogent system med 1 ekvation och minst 2 variabler har oändligt många
  lösningar:

  $x_1+x_2=0$

  Om ett homogent system med $p-1$ ekvationer har oändligt många lösningar, har
  också ett system med $p$ ekvationer det.

  $ cases(
    a_(1,1) x_1 + a_(1,2) x_2 + dots.c + a_(1,n)x_n = 0,
    a_(2,1) x_2 + dots.c + a_(2,n) x_n = 0,
    dots.v,

  ) $

  Givet ekvationssystemet

  $ mat(
    a_(1,1), a_(1,2), ..., a_(1,n), y_1;a_(2,1), a_(2,2), ..., a_(2,n), y_2;dots.v, dots.v, dots.down, dots.v, dots.v;a_(p_1), a_(p_2), ..., a_(p,n), y_p;augment: #4;
  ), $

  antag att $a_(1,1) != 0$. Gausseliminera så att $a_(2,1)dots.c a_(p,1)=0$:

  $ mat(
    a_(1,1), a_(1,2), ..., a_(1,n), y_1;0, a_(2,2), ..., a_(2,n), y_2;dots.v, dots.v, dots.down, dots.v, dots.v;0, a_(p_2), ..., a_(p,n), y_p;augment: #4;
  ) $

  Vi har ett nytt ekvationssystem med $p-1$ ekvationer och $n-1$ obekanta.
]

#lecture(
  2024,
  9,
  3,
  [Linjärt beroende],
)[
  Givet basen $(e1, e2)$ och vektorn $u$ med koordinaterna $(x_1, x_2)$, är $x_1 e1$ $u$:s
  projektion på $e1$ i riktning $e2$.

  #hr

  Vektorerna $u1, u2, dots.c, un$ kallas linjärt beroende om

  $ zv = x_1 u1 + x_2 u2+dots.c+x_n un $ där minst en av $x_1, x_2, dots.c, x_n$ är
  nollskild.

  #hr

  Om
  $ u=x_1 e1+x_2 e2+x_3 e3=y_1 e1+y_2 e2+y_3 e3 $
  i basen $(e1,e2,e3)$ där
  $ (x_1,x_2,x_3)!=(y_1,y_2,y_3) $
  så är
  $ (y_1-x_1)e1+(y_2-x_2)e2+(y_3-x_3)e3=zv $
  men då finns det minst en nollskild skalär, så $(e1,e2,e3)$ är linjärt beroende
  och ej en bas. #emoji.sparkles

  #hr

  #important[Ett homogent linjärt ekvationssystem kan bara ha en (den triviala) eller
    oändligt många lösningar:

    Antag att det finns _en_ lösning $L=(x_1, x_2, dots.c, x_n)$ till systemet
    $ cases(
      a_(1,1)x_1+a_(1,2)x_2+dots.c+a_(1,p)=0,
      a_(2,1)x_1+a_(2,2)x_2+dots.c+a_(2,p)=0,
      dots.v,
      a_(n,1)x_1+a_(n,2)x_2+dots.c+a_(n,p)=0,

    ). $
    Om $L$ gör så att varje ekvation blir $0$, måste $lambda L$ (där $lambda$ är ett
    godtyckligt tal) också göra det, eftersom $0 lambda=0$. Det finns oändligt många $lambda$,
    så det finns oändligt många lösningar. #emoji.sparkles
  ]
]

#lecture(
  2024,
  9,
  4,
  [Linjer och plan],
)[
  = Parameterform

  Givet en linje $L$ och två olika punkter på linjen, $P$ och $P_0$, kan linjen
  beskrivas på parameterform -- en startpunkt plus en riktningsvektor som skalas
  för att peka någonstans på linjen.

  Ortsvektor $overline(O P_0)$ pekar på linjens startpunkt, och vektorn $overline(P_0 P)$ avgör
  linjens riktning.

  Alla punkter på $L$ ges av
  $ overline(O P_0) + t overline(P_0 P) $ där $t in RR$.

  På ett liknande sätt kan ett plan $M$ i rummet skrivas på parameterform givet en
  godtycklig punkt på planet $P_0$ samt två nollskilda vektorer $vu$ och $vv$ och
  två parametrar $s, t in RR$:

  $ overline(O P_0) + t vu + s vv $

  = Skärning mellan plan och linje i rummet

  En linje och ett plan kan skära varandra i noll, en eller oändligt många
  punkter.

  #important[Varje sak (linje, plan) på parameterform har _egna_, unika parametrar $s, t, dots.c$.
    Det går inte att använda samma parameter till flera olika saker.]

  = Plan på affin form

  Varje plan i rummet kan skrivas på affin form#footnote[Affin form kallas även för normalform.]:

  $ A x+B y+C z+D=0 $
  där $A,B,C,D in RR.$ Planet har normalvektorn $(A,B,C)$.
]

#lecture(
  2024,
  9,
  9,
  [Skalärprodukt],
)[
  $ scalar(vu, vv) = vu dot vv = |vu| |vv| cos theta $

  - kommutativ
  - distributiv

  = Ortogonal projektion

  $vu$ projiceras på $ve$ (där $|ve|=1$) och ger $vup$.

  $ cos theta=(|vup|)/(|vu|) <=> |vup|=|vu|cos theta=scalar(vu, ve) <=> vup = scalar(vu, ve) ve $

  = Koordinatform

  I planet givet $vu=x_1 e_1+x_2 e_2$ och $vv=y_1 e_1+x_2 e_2$:

  $ scalar(vu, vv)=scalar(x_1 e1+x_2 e2, y_1 e1+y_2 e2) \ =x_1 y_1 scalar(e1, e1)+x_1 y_2 scalar(e1, e2)+x_2 y_1 scalar(e2, e1)+x_2 y_2 scalar(e2, e2) $

  Allt blir lättare om baserna är ortonormerade, dvs. $scalar(ei, ej)=delta_(i j)$ där $delta_(i j)$ är
  Kroneckerdeltat som definieras som

  $ delta_(i j)=cases(0 "om" i!=j, 1 "om" i=j) space . $ <kronecker>

  = "Roliga trigonometriska formler"

  Två vektorer $vu=(cos beta, sin beta)$ och $vv=(cos alpha, sin alpha)$ ligger på
  enhetscirkelns rand med varsin vinkel $alpha$ respektive $beta$. Vinkeln mellan
  dem är $alpha-beta$.

  $ scalar(vu, vv)=1dot 1 dot cos(alpha-beta)=cos alpha cos beta + sin alpha sin beta quad #emoji.sparkles $
]

#lecture(2024, 9, 10, [Ellipser, hyberbler och parabler])[
  "Cirkel" -- perfekt rundning

  $ < approx > $
]

#lecture(
  2024,
  9,
  11,
  [Vektor- och volymsprodukt],
)[
  = Vektorprodukt

  Maxwells ekvationer:

  $ cases(
    nabla times E = -pdv(B, t),
    nabla times H = J + pdv(D, t),
    nabla dot D = rho,
    nabla times B = 0,

  ) $

  $ F = q v times B $

  "_En_ parallellogram och _ett_ prisma." Vad i hela friden, Svenska Akademien?

  I en HON-bas:

  $ (x_1, x_2, x_3) times (y_1, y_2, y_3) = mat(delim: "|", x_1, y_1, e1;x_2, y_2, e2;x_3, y_3, e3;)\
  =x_1 y_2 e3+y_1 e2 x_3+e1 x_2 y_3-x_3 y_2 e1-y_3 e2 x_1-e3 x_2 y_1\
  =(x_2 y_3-x_3 y_2)e1+(x_3 y_3-x_1 y_3)e2+(x_1 y_2-x_2 y_1)e3 $

  = Volymsprodukt (_parallellepiped_)

  Volymsprodukten ges av $ V = plus.minus "basarea" dot "höjd" $ så $ V=(vu times vv) dot vw . $

  Den kan beräknas med determinanten:

  $ V(vu,vv,vw)=mat(delim: "|", x_1, y_1, z_1;x_2, y_2, z_2;x_3, y_3, z_3;) V(e1,e2,e3) $
]

#lecture(
  2024,
  9,
  12,
  [Matriser],
)[
  $ A = mat(
    a_(1,1), a_(1,2), a_(1,3), dots.c, a_(1,n);a_(2,1), a_(2,2), a_(2,3), dots.c, a_(2,n);a_(3,1), a_(3,2), a_(3,3), dots.c, a_(3,n);dots.v, dots.v, dots.v, dots.down, dots.v;a_(p,1), a_(p,2), a_(p,3), dots.c, a_(p,n);
  ) $

  = Matrismultiplikation

  Givet $A=(a_(i,j))_(p times m)$, $B=(b_(i,j))_(m times n)$ och $C=(c_(i,j))_(p times n)=A B$ är
  $ c_(i,j)=sum_(k=1)^m a_(i,k) b_(k,j). $

  Notera att $ 2 != 1. $

  I domkyrkans krypta finns kolonner#footnote[Se även #link(
      "https://web.archive.org/web/20240912090440/https://sv.wiktionary.org/wiki/kolonnett",
    )[_kolonnett_].]. De har ett cirkulärt tvärsnitt och bär upp taket. Jätten
  Finn står och omfamnar en av dem. Lägg märke till att

  $ "Kolonnetter" subset.eq "Kolonner" subset.eq "Pelare". $

  #figure(
    image("finn.jpeg", width: 10%),
    caption: [Jätten Finn kramar sin kolonn.],
  )

  = Invers av matriser

  $ E=(delta_(i,j))_(p times n)=mat(
    1, 0, dots.c, 0;0, 1, dots.c, 0;dots.v, dots.v, dots.down, dots.v;0, 0, dots.c, 1;
  ) $

  $delta$: se @kronecker.

  #hr

  Det finns exakt en invers per inverterbar matris $A$. Antag att det finns två
  inverser $B$ och $C$. Då är

  $ B = B E = B(A C)=(B A)C=E C=C $

  så $B=C$ och det finns sålunda exakt en invers.

  $ A "inverterbar" <=> A X=Y "har entydig lösning för något" Y $

  #hr

  Om $A X=Y$ har mer än en lösning så finns oändligt många lösningar:

  Antag att $X_1$ och $X_2$ är två olika lösningar. Sätt $X=t X_1+(1-t)X_2$. Då är

  $ A X=A(t X_1 + (1-t)X_2)=t A X_1+(1-t)A X_2=t Y+(1-t)Y=Y $

  så $X$ är en lösning. Det finns oändligt många $X$.
]

#lecture(
  2024,
  9,
  16,
  [Linjära rum],
)[
  Mängden $V$ kallas för ett linjärt rum#footnote[Eller vektorrum.] om addition av
  element (vektorer) i $V$ och multiplikation med skalär är definierade och att
  dessa uppfyller följande:
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
  - $cal(L)^2[a,b]={"alla" f:[a,b]->RR "så att" integral_a^b f(x)^2 dd(x) != plus.minus infinity}$
  - $RR^n={x_1, dots.c, x_n in RR : (x_1, dots.c, x_n)}$

  = Linjärt underrum

  $U subset.eq V$ är ett underrum till det linjära rummet $V$ om $U$ är ett
  linjärt rum. Framför allt viktigt att
  - $vu, vv in U => vu+vv in U$
  - $vu in U, alpha in RR => alpha vu in U$
  - $exists space zv in U$

  "Det är en oändlig linje men eftersom kritan är ändlig så ritar jag den så."

  Det heter _subspace_, inte _underroom_ på engelska. På samma sätt heter det _Unterraum_,
  inte _Nebenzimmer_ på tyska.
]

#lecture(
  2024,
  9,
  17,
  [Nollrum och värderum],
)[
  $A$ är en $p times n$-matris. Värderummet ges av

  $ N(A)={X in RR^n : A X=0} $

  och nollrummet av

  $ V(A)=(Y in RR^p : A X=Y "har en lösning"). $

  #hr

  Mängden av alla linjärkombinationer av $u1, u2, dots.c, uk$ betecknas $[u1, u2, dots.c, uk]$ och
  kallas för det linjära höljet till $u1, u2, dots.c, uk$. Vektorerna är inte
  nödvändigtvis linjärt oberoende.

  Om $A=mat(A_1, A_2, dots.c, A_n)$ så är $ V(A)=[A_1, A_2, dots.c, A_n] $ ty $ A mat(x_1;dots.v;x_n)=x_1 A_1+x_2 A_2 + dots.c + x_n A_n $ som
  är en linjärkombination av kolonnerna i $A$.

  #figure(
    image("MazurGes.jpeg"),
    caption: [Per Enflo får en gås av Stanisław Mazur.],
  )

  = Baser

  I $RR^n$ har vi standardbasen $ (1, 0, dots.c, 0)\ (0, 1, 0, dots.c, 0)\ dots.v\ (0, dots.c, 0, 1). $

  I $PP_n$ har vi basen $ 1, x, x^2, dots.c, x^n. $

  Om $e1, dots.c, en$ är en bas till $V$ och $k>n$ så är $u1, dots.c, uk$ linjärt
  beroende.
]

#lecture(2024, 9, 18, [Uppgiftslösningar])[
  $ qty("440", "Hz") $

  #smallcaps[Ellipsanalys på industriell skala]
]

#lecture(
  2024,
  9,
  19,
  [Dimensionssatsen är dagens höjdpunkt],
)[
  $ 1, dots.c, 2 $

  $F:U->V$ kallas för en linjär avbildning om det för $lambda in RR$ och $vu, vv in U$ gäller
  att
  - $F(vu+vv)=F(vu)+F(vv)$
  - $F(lambda vu)=lambda F(vu)$

  #hr

  "Det välvilliga universitetet har nämligen tillhandahållit pinnar av
  erforderligt antal." _Tomas demonstrerar vektorsumma i $RR^3$._

  #hr

  Givet $p times n$-matrisen $A$ är $ dim N(A)+dim V(A)=n. $

  Enligt dimensionssatsen är
  - $2+1=3$
  - $1+2=3$
  - $1+1=2$

  == Bevis med den linjära avbildningen $F:U -> V$.

  Låt $dim U=n$.

  Antag att $k=dim N(F)$. Det finns en bas $e1, dots.c, ek$ för $N(F)$.

  Lägg till vektorer $ek1, dots.c, en$ så att $e1, dots.c, ek, dots.c, en$ är en
  bas för $U$.

  Vi vill visa att $F(ek1), dots.c, F(en)$ är en bas för $V(F)$ -- att $ek1, dots.c, en$ 1)
  är linjärt oberoende och 2) genererar $V(F)$.

  1. #[
      $F(ek1), dots.c, F(en)$ är linjärt oberoende:

      $   &x_(k+1)F(ek1)+dots.c+x_n F(en)=zv\ <=>&F(x_(k+1)ek1+dots.c+x_n en)=zv\ <=>&x_(k+1)ek1+dots.c+x_n en in N(F)\ <=>& x_(k+1)=dots.c=x_n=0 $
    ]
  2. #[
      $F(ek1), dots.c, F(en)$ genererar $V(F)$.

      $vv in V(F) => vv=F)vu "för något" vu in U$.

      Vi skriver $vu=x_1 e1+dots.c+x_n en$.

      Då är $ vv=&F(vu)=F(x_1 e_1+dots.c+x_n en)\ =&x_1 underbrace(F(e1), =zv)+dots.c+x_k underbrace(F(ek), =zv)+x_(k+1)F(ek1)+dots.c+x_n F(en)\ =&x_(k+1)F(ek1)+dots.c+x_n F(en). $

      Färdigt #emoji.face.happy
    ]

  == Bevis med matrisen $A_(p times n)$

  $ A=mat(A_1, dots.c, A_n) quad V(A)={"linjärkombination av" A_1, dots.c, A_n} $

  Vi vill undersöka om $A_1, dots.c, A_n$ är linjärt oberoende.

  $   &A X=0 <=> A mat(x_1;dots.v;x_n)=mat(0;dots.v;0) $

  Antag att vi Gausseliminerar. Vi får $k$ överhoppade trappsteg, så $dim N(A)=k$.
  Om vi tar ut $n-k$ kolonner med trappsteg, så är dessa linjärt oberoende. Leder
  till att $dim V(A)=n-k$.

  #hr

  Den kanoniska basen är kanon.
]

#lecture(
  2024,
  9,
  23,
  [Euklidiska rum med mera],
)[
  Antag att det finns $V$ och $H$ så att $ V A&=E\ A H&=E. $

  Existens av $V$ ger $ A X=0 => V A X=E X=0 <=> X=0. $

  Existens av $H$ ger $ A X=Y arrow.double.l X = H Y. $

  #hr

  $V$ kallas för ett euklidiskt rum om det är linjärt och om det finns en
  skalärprodukt.

  $scalar(dot, dot)$ kallas för #underline[en] skalärprodukt om det uppfyller
  - $scalar(vu+vv, vw)=scalar(vu, vw)+scalar(vv, vw)$
  - $scalar(alpha vu, vv)=alpha scalar(vu, vv)$
  - $scalar(vu, vv)=scalar(vv, vu)$
  - $scalar(vu, vu)>=0$ med likhet om och endast om $vu=zv$

  #figure(image("lemongrab.png", width: 20%), caption: [$scalar(dot, dot)$])

  I $RR^n$ är $ scalar((x_1,dots.c,x_n), (y_1,dots.c,y_n))=mat(x_1;dots.v;x_n)^t mat(y_1;dots.v;y^n). $

  Om $A$ är en $n times n$-matris så definierar $ scalar(X, Y)=X^t A Y $ #text(size: 100pt, fill: gradient.linear(..color.map.rainbow))[ibland] en
  skalärprodukt. I så fall kallas $A$ för en positivt definit matris.

  = Pythagoras sats

  $ |vu+vv|^2=&scalar(vu+vv, vu+vv)\ =&scalar(vu, vu)+scalar(vu, vv)+scalar(vu, vu)+scalar(vv, vv)\ =&|vu|^2+|vv|^2+2scalar(vu, vv). $

  = Cauchy--Bunjakovskij--Schwarz olikhet

  $ |scalar(vu, vv)|<=|vu| |vv| $

  Cauchy visade olikheten för $RR^n$, Bunjakovski för knasiga $cal(L)$-rum och
  Schwarz gjorde samma sak en gång till.

  #hr

  Vektorerna $e1,dots.c,en$ kallas för en ortonormerad mängd om $ scalar(ei, ej)=delta_(i j). $

  Om de dessutom är en bas så kallas de, otroligt nog, för en ortonormerad bas.

  = Det gram--schmidtska ortogonaliseringsförfarandet

  "Om man inte har en ortonormerad bas kan man kan skaffa sig en sådan på
  postnorder från Gram--Schmidt."

  Antag att $w1,dots.c,wn$ är en bas. Vi söker en ON-bas för samma rum.

  $ e1'=&w1\ e2'=&w2+s_(1,2)w1 $

  Välj $s_(1,2)$ så att $scalar(e1', e2')=0$.

  Därefter

  $ e3'=w3+s_(2,3)w2+s_(1,3)w1. $

  Välj $s_(2,3)$ och $s_(1,3)$ så att $scalar(e3', e1')=scalar(e3', e2')=0$.

  Och så vidare. Slutligen normeras $e1',dots.c,en'$.

  "$e3'$ är tydligt ortogonal mot $e1'$." ($e3'=(1/3,-1/3,1/3,1)$ och $e1'=(1,1,0,0)$). _\~TP senses._

  = Ortogonala (egentligen ortonormerade) matriser

  #figure(
    image("grannysmith.jpeg", width: 50%),
    caption: [Äppelsorten Granny Smith.],
  )

  Om $A$ är $n times n$ så kallas $A$ för ortogonal om kolonnerna är en O#underline[N]-bas.
  De kallas ofta för $Q$ av någon anledning.

  Observation:

  $ Q "ortogonal" <=> Q^t Q=E <=> Q^(-1)=Q^t $

  eftersom $Q^t Q$ innehåller alla kombinationer av skalärprodukter av kolonnerna
  i $Q$, som ju per definition är antingen 0 eller 1 beroende på om kolonnerna
  skalärmultipliceras med sig själva (det gör de endast på diagonalen).

  = QR-faktorisering

  Om $A$ är inverterbar så är kolonnerna en bas. Då kan man göra Gram-Schmidt på
  kolonnerna och få en ortogonal matris $Q$.

  $ A=Q R $

  där $R$ är en högertriangulär/övertriangulär matris. Detta är en naturlig följd
  av Gram-Schmidts process.
]

#lecture(
  2024,
  9,
  24,
  [Mer om QR],
)[
  "Detta har vi i närvarande [sic] tillstånd ingen nytta av."

  $ cal(L)^p ([0,1]) ={f: integral_0^1 underbrace(
    |f(x)|,
    "Se"#footnote(
      "Vi tar absolutbeloppet för att det är så obehagligt att upphöja negativa tal till icke-heltal."
    ),

  )^p dd(x) < infinity } $ är ett icke-euklidiskt rum.

  _Utläggning om $cal(L)^p$-normer._ "... och det förekommer i verkligheten."

  "Manhattan är ett exempel på ett icke-euklidiskt rum."

  = Ortogonala komplement

  Antag att $U$ är ett underrrum till $V$. Det ortogonala komplementet till $U$ är

  $ U^perp ={vv in V : scalar(vu, vv)=0 space forall space vu in U}. $

  #hr

  Om $U$ är ett underrum till $V$ och $dim U < infinity$, så kan varje $vv in V$ skrivas
  entydigt som $ vv=vv'+vv'' $ där $vv' in U$ och $vv'' in U^perp$.

  $ vv' quad v^(-1) $

  -- Kan man alltid använda samma siffror för att skapa fina ON-basvektorer?

  -- Nej. o.o

  = Rang

  / Radrang: $"radrang" A = dim V(A^t)$

  $ V(A)^perp=N(A^t) $

  $ A^perp ^perp=A $

  "Det är inget samband som man har någon praktisk nytta av."

  "Nästa gång ska vi göra något mycket konkret, nämligen minstakvadratmetoden."
]

#lecture(
  2024,
  9,
  26,
  [Minstakvadratmetoden],
)[
  Givet ett antal mätpunkter $(x_i, y_i)$ för $i=1,dots.c,n$ söker vi en linje $y=k x+m$ så
  att

  $ cases(k x_1+m&=y_1, k x_2+m&=y_2,   &#h(0.25em) dots.v, k x_n+m&=y_n) <=> underbrace(mat(x_1, 1;x_2, 1;dots.v, dots.v;x_n, 1), A) underbrace(mat(k;m), X)=underbrace(mat(y_1;y_2;dots.v;y_n), Y). $

  Vi har $A X=Y$ med fler ekvationer än obekanta, så vi söker en approximativ
  lösning.

  Projicera $Y$ på $V(A)$ (där $Y'$ är projektionen av $Y$ på $V(A)$) så att alla $Y$ för
  vilka $A X=Y$ saknar lösning plötsligt får en _approximativ_ lösning! #emoji.face.surprise

  Vi söker $X$ så att

  $ Y''=Y-Y'=Y- A X in V(A)^perp. $

  Vi har

  $      &Y-A X in V(A)^perp\
  <=>&Y-A X perp vu space forall space vu in V(A)\
  <=>&Y-A X perp A_1, A_2, dots.c, A_n\
  <=>&A_1^t (Y-A X)=0, A_2^t (Y-A X)=0, dots.c\
  <=>&A^t (Y-A X)=zv\
  <=>& A^t A X=A^t Y. $

  = Ett konkret räkneexempel med så att säga riktiga siffror

  // plot the points (0,0), (0,1), (1,1) and (2,1) with cetz
  // #figure(canvas({
  //   plot.plot(size: (10, 10), axis-style: "school-book", x-grid: true, y-grid: true, y-label: $y$, x-label: $x$, x-tick-step: 0.5 * calc.pi, y-min: -10, y-max: 10, y-tick-step: 5, {
  //     plot.add(((0,1)), style: (mark: (stroke: blue)))
  //   })
  // }), caption: [$y=tan x$.])

  Vi vill att $ mat(0, 1;0, 1;1, 1;2, 1)mat(k;m)=mat(0;1;1;1) $

  så vi löser $ mat(0, 0, 1, 2;1, 1, 1, 1)mat(0, 1;0, 1;1, 1;2, 1) mat(k;m)=mat(0, 0, 1, 2;1, 1, 1, 1) mat(0;1;1;1). $

  = LU-faktorisering

  #figure(image("lu.png", width: 20%), caption: [LU i LU-faktorisering.])

  "Jag har valt bokstäverna f och #sym.pi för att ni läser #sym.pi och f."

  Mer allmänt: $P L U$-faktorisering.

  Choleskyfaktorisering :o
]

#lecture(2024, 9, 30, [])[
  (Frånvarande)
]

#lecture(
  2024,
  10,
  1,
  [Mer om determinanter],
)[
Tomas shell: `tomasp@strauss`

EMACS.

= Cramers regel

Antag att $A$ är inverterbar. Då är lösningen till $ A X=Y$ där $Y=mat(y_1;dots.v;y_n)$ och $X=mat)x_1; dots.v; x_n$

$ x_i=(det mat(A_1, dots.c, underbrace(Y, i), dots.c, A_n)t)/(det A). $

Hotell Kramer finns faktiskt: #link(
  "https://web.archive.org/web/20240907053427/https://www.scandichotels.se/hotell/sverige/malmo/scandic-kramer",
)[Scandic Kramer].

"Det kanske inte är en beräkningsmässigt sund metod, men det är trevligt att ha
en formel i varje fall."

= Det

Om $A$ är en inverterbar $n times n$-matris så är

$ A^(-1)=1/(det A) mat(
  (-1)^(1+1) det A^((1,1)),
    (-1)^(1+2) det A^((1,2)),
    dots.c,
    (-1)^(1+n)det A^((1,n));(-1)^(2+1) det A^((2,1)),
    (-1)^(2+2) det A^((2,2)),
    dots.c,
    (-1)^(2+n)det A^((2,n));dots.v, dots.v, dots.down, dots.v;(-1)^(n+1) det A^((n,1)),
    (-1)^(n+2) det A^((n,2)),
    dots.c,
    (-1)^(n+n)det A^((n,n))
)^t $

där $A^((i,j))$ betecknar matrisen som erhålls genom att stryka rad $i$ och
kolonn $j$ från $A$.

Strukturen för $2 times 2$-matriser är att de är så jäkla små.
]

#lecture(
  2024,
  10,
  2,
  [Seminarium],
)[
  = En fullständig parentes (Riemann--Lebesgue)

  "Det här är enklare att göra om man räknar med komplexa tal."

  ${e^(i 2 pi k x)}_(k=-infinity)^(infinity)$ är en ON-mängd i $cal(L)^2([0,1])$.

  $scalar(f, e^(i 2pi k x))=integral_0^1 f(x) e^(-i 2pi k x) dd(x)$

  och $ sum_(k=-infinity)^infinity (integral_0^1 f(x) e^(-i 2 pi k x) dd(x)) <= integral_0^1 |f(x)|^2 dd(x) < infinity $

  så $ integral_0^1 f(x) e^(-i 2pi k x) dd(x)->0 "då" k -> infinity. $
]

#lecture(
  2024,
  10,
  7,
  [Allmänna projektioner, speglingar och isometrier],
)[
  "Där ligger någon som gömt en krita."

  Om $V=U_1+U_2$ och $U_1 sect U_2={zv}$ så skriver vi $ V=U_1 plus.circle U_2. $

  #hr

  $ P^2=P <=> P "är en projektion". $

  $P$ projicerar på $V(P)$ parallellt med $N(P)$.

  #hr

  En avbildning $F$ är en isometri om $|F(vv)|=|vv|$ för alla $vv$.

  #important[$ A A^t $]
]

#lecture(
  2024,
  10,
  8,
  [Egenvärden och egenvektorer],
)[
  = Ordinära differentialekvationer

  $ cases(x'(t)=x(t)+2y(t), y'(t)=2x(t)+y(t)) <=> mat(x'(t);y'(t))=mat(1, 2;2, 1)mat(x(t);y(t)) $

  $mat(1;1), mat(1, -1)$ är en bas och varje lösning kan skrivas $mat(x(t);y(t))=z_1(t)mat(1;1)+z_2(t)mat(1;-1)$.

  Derivera:

  $      & mat(x'(t);y'(t))=z_1'(t)mat(1;1)+z_2'(t)mat(1;-1)=mat(1, 2;2, 1)(z_1(t)mat(1;1)+z_2(t)mat(1;-1))\
  => & z_1'(t)mat(1;1)+z_2'(t)mat(1;-1)=3z_1(t)[1;1]+(-1)z_2(t)mat(1;-1)\
  <=>& cases(z_1'(t)=3z_1(t), z_2'(t)=(-1)z_2(t)) <=> cases(z_1(t)=z_1(0)e^(3t), z_2(t)=z_2(0)e^(-t)). $

  Vi får att

  $ cases(x(t)=z_1(0)e^(3t)+z_2(0)e^(-t), y(t)=z_1(0)e^(3t)-z_2(0)e^(-t)). $

  = Att finna egenvärden och -vektorer

  $ A X=lambda X <=> (A-lambda E)X=0. $

  Det finns en nollskild lösning till $(A-lambda E)X=0$ om $det(A - lambda E)=0$.
  Detta kallas för det karakteristiska polynomet.

  Efter att $lambda$ har hittats så löser vi $(A-lambda E)X=0$ för att hitta $X$.

  = Diagonalisering

  En avbildningsmatris $A$ för en linjär avbildning $F$ är diagonaliserbar om det
  finns en bas av egenvektorer $e1', e2', dots.c, en'$ med motsvarande egenvärden $lambda_1, lambda_2, dots.c, lambda_n$.
  Då är den diagonaliserade matrisen

  $ D=mat(
    lambda_1, 0, dots.c, 0;0, lambda_2, dots.c, 0;dots.v, dots.v, dots.down, dots.v;0, 0, dots.c, lambda_n
  ). $

  $A$ har diagonaliserats av $T$:

  $ A=T D T^t. $

  $ A^1000=(T D T^t)(T D T^t)dots.c(T D T^t)=T D E D E dots.c E T^t=T D^1000 T^t. $

  Tusen gånger! #emoji.face.surprise

  $A$ kallas för diagonaliserbar om det finns $T$ så att $A=T D T^-1$ och $D$ är
  diagonal.

  #important($ A T=T D $)
]

#lecture(2024, 10, 9, [Seminarium])[
  Välj en ON-bas.

  #hr

  #important[
    Visa att
    $ N(A)^perp = V(A^t). $
  ]
]

#lecture(
  2024,
  10,
  14,
  [Dagens höjdpunkt är spektralsatsen],
)[
  #smallcaps[Lederhosen]

  Den algebraiska multipliciteten av ett egenvärde $mu$ är antalet faktorer $(lambda - mu)$ i $det(A-lambda E)$.

  Den geometriska multipliciteten av ett egenvärde $mu$ är dimensionen av $N(A-mu E)$.

  #hr

  För varje egenvärde $mu$ är $ op("geometrisk multiplicitet")(mu)<=op("algebraisk multiplicitet")(mu). $

  "$1=1$ och $2=2$ men det behöver inte alltid vara så."

  #hr

  Om det finns ett egenvärde $lambda$ med $op("algebraisk multiplicitet")(lambda)>op("geometrisk multiplicitet")(lambda)$ så
  är matrisen ej diagonaliserbar.

  Bevis i boken #emoji.face.sad

  #hr

  = Låtsasvektorer

  Om $X=mat(x_1;dots.v;x_n) in CC^n$ så är

  $ |X|^2=|x_1|^2+|x_2|^2+dots.c+|x_n|^2=overline(x_1)x_1+overline(x_2)x_2+dots.c+overline(x_n)x_n=overline(X)^t X=X^H X. $

  #emoji.face.halo

  == Exempel

  Rotation i planet $A=mat(0, -1;1, 0).$ $ det(A- lambda E)=mat(delim: "|", -lambda, -1;1, -lambda)=lambda^2+1=(lambda-i)(lambda+i). $

  Egenvektorer till $i$:

  $ mat(-i, -1;1, -i)mat(x_1;x_2)=mat(0;0)<=>mat(-i, -1;0, 0)mat(x_1;x_2)=mat(0;0)<=>cases(i x_1=-t, x_2=t)<=>cases(x_1=underbrace(t i, "tihi --Albert"), x_2=t) $

  Icke-reella egenvärden har med rotationer att göra.

  $ R_theta&=mat(cos theta, -sin theta;sin theta, cos theta)\ det(R_theta-lambda E)&=mat(
    delim: "|",
    cos theta, lambda, -sin theta;sin theta, cos theta - lambda, , , , , , ,

  )\ &=(cos theta-lambda)^2+sin^2 theta\ &= (cos theta-lambda+i sin theta)(cos theta -lambda - i sin theta) $

  Egenvärden $cos theta plus.minus i sin theta=e^(plus.minus i sin theta)$.

  #hr

  $A$ är hermitesk#footnote[Uttalas herr-m#strong[i]tsk.] om $A^H=A$.

  Om $A$ är hermitesk så är alla egenvärden reella. Speciellt: En symmetrisk reell
  matris har endast reella egenvärden.

  = DAGENS HÖJDPUNKT (WAOW #emoji.face.woozy) -- SPEKTRALSATSEN

  Om $A$ är en reell symmetrisk matris så finns en ortonormerad bas av
  egenvektorer. Det finns alltså en ortogonal matris $T$ så att $ A=T D T^-1 $ där $D$ är
  diagonal.
]

#lecture(
  2024,
  10,
  15,
  [Rekursionsekvationer, numerisk beräkning av egenvärden och geometri],
)[
  = Rekursionsekvationer

  Den rekursiva formeln

  $ f_n=2f_(n-1)-3f_(n-2)+pi f_(n-3) $

  kan skrivas som

  $ mat(f_n;f_(n-1);f_(n-2))=mat(2, -3, pi;1, 0, 0;0, 1, 0) mat(f_(n-1);f_(n-2);f_(n-3)). $

  (Det är bara Markovprocesser.)

  Om $A$ är diagonaliserbar så går det fort att räkna ut $A^n$.

  == Fibbonacci

  Följden beskrivs av

  $ mat(f_n;f_(n-1))=mat(1, 1;1, 0)mat(f_(n-1);f_(n-2)). $

  $mat(1, 1;1, 0)$ har egenvärdena $(1 plus.minus sqrt(5))/2$. Låt

  $ T=mat(1, -(sqrt(5)-1)/2;(sqrt(5)-1)/2, 1) => A^n=T mat(((sqrt(5)+1)/2)^(n-1), 0;0, ((1-sqrt(5))/2)^(n-1)) T^(-1). $

  = Egenvärdesberäkningar

  $A$ är en $n times n$-matris. Antag att dess egenvärden är $lambda_1, dots.c, lambda_n$ så
  att $lambda_1 >= dots >= lambda_n$. Låt $e1, dots.c, en$ vara motsvarande
  egenvektorer.

  Tag $vu_0!=zv$. Låt $vu_1=A vu_0, vu_2=A vu_1, dots.c, vu_n=A vu_(n-1)$. Vi har
  att $vu_0=a_1 e1+dots.c+a_n en$. Om vi har otur är $a_1=0$, annars är $a_1!=0$.

  $ vu_0&=a_1 e1+dots.c+a_n en\
  vu_1&=lambda_1 a_1 e1+dots.c+lambda_n a_n en\
  vu_2&=lambda_1^2 a_1 e1+dots.c+lambda_n^2 a_n en\
      & #h(0.3em) dots.v\
  vu_n&=lambda_1^n a_1 e1+dots.c+lambda_n^n a_n en. $

  Om $k$ är stort och $a_1!=0$ så är $ vu_k approx a_1 lambda_1^k e1. $

  Resterande egenvärden kan hittas med "QR-faktorisering och annat jox".

  = Kägelsnitt

  $ q(x,y)=a x^2+b x y+c y^2 $ kan skrivas $ q(mat(x;y))=mat(x, y)mat(a, b/2;b/2, c)mat(x;y), $

  Nu ska vi diagonalisera $mat(a, b/2;b/2, c)$.

  Nu har vi gjort det.

  = Seminarieuppgift för att tiden inte tog slut i tid

  $A$ är en $n times n$-matris med kolonnsumman 1. Visa att $1$ är ett egenvärde.

  $ det(A^t-lambda E)=det((A-lambda E)^t)=det(A-lambda E) $

  $ A^t mat(1;dots.v;1)=mat(1;dots.v;1) quad qed $
]

#lecture(
  2024,
  10,
  16,
  [Tomas sista föreläsning för höstterminen],
)[
  = Uppgift 10.10

  $A$ är diagonaliserbar med ickenegativa egenvärden. Visa att det finns en matris $B$ så
  att $B^2=A$.

  Vi har att $ A=T mat(
    lambda_1, 0, dots.c, 0;0, lambda_2, dots.c, 0;dots.v, dots.v, dots.down, dots.v;0, 0, dots.c, lambda_n
  ) T^(-1) $.

  Sätt $ B=T mat(
    plus.minus sqrt(lambda_1), 0, dots.c, 0;0, plus.minus sqrt(lambda_2), dots.c, 0;dots.v, dots.v, dots.down, dots.v;0, 0, dots.c, plus.minus sqrt(lambda_n)
  ) T^(-1). $

  "Alla matriser är nästan diagonaliserbara."

  Se _Jordanfaktorisering_.

  = Uppgift 10.12

  #set enum(numbering: "a)")

  $A$ är inverterbar $n times n$-matris. Visa att
  + #[
      $A^t A$ har endast positiva egenvärden. Tips: $x^t A^t A x=|A x|^2$.

      Låt $lambda$ vara ett egenvärde till $A^t A$ med egenvektorn $x != zv$.

      $ 0 < |A x|^2=(A x)^t (A x)=x^t A^t A x=x^t lambda x=lambda x^t x=lambda|x|^2 $.
    ]
  + #[
      Det finns precis en symmetrisk matris $B$ med positiva egenvärden så att $B^2=A^t A$.

      $A^t A$ är symmetrisk så $ A^t A=T D T^t $ där $T$ är ortogonal och $D=mat(lambda_1, dots.c, 0;dots.v, dots.down, dots.v;0, dots.c, lambda_n)$.
      Sätt

      $ B=T mat(
        sqrt(lambda_1), dots.c, 0;dots.v, dots.down, dots.v;0, dots.c, sqrt(lambda_n)
      ) T^t. $

      $B$ är uppenbarligen symmetrisk.

      Om $C$ är symmetrisk med positiva egenvärden och $B^2=B^2=A^t A$ så är $ C^2=B^2=T D T^t => C^2 "har egenvärdena" lambda_1, dots.c, lambda_n. $

      $ C "symmetrisk" => C "kan diagonaliseras, har ON-bas av egenvektorer" $

      Om $C x=mu x$ så är $C^2x=mu^2x$. Ger att $C$ har egenvärden $sqrt(lambda_1),dots.c,sqrt(lambda_n)$ och
      egenvektorer ges av kolonnerna i $T$.

      Så $C=B$.
    ]
  + #[
      Visa att $A=Q B$ där $B$ enligt tidigare, $Q$ ortogonal. Kallas för polär
      dekompisition.

      Jämför med $ a+i b=r e^(i theta). $ $r$ är en symmetrisk $1 times 1$-matris och $e^(i theta)$ är
      en ortogonal $1 times 1$-matris (rotation).

      $ A=Q B <=> Q=A B^(-1). $

      $B^(-1)$ existerar ty dess egenvärden är positiva.

      Är $Q$ ortogonal?

      $ Q^t Q=(A B^-1)^t (A B^-1)=(B^t)^(-1) A^t A B^(-1)=B^(-1) B^2 B^(-1)=E $

      så ja.
    ]

  = 11.4

  Minsta värde av $ 2x_1 x_2-4x_1 x_3+4x_2 x_3-3x_3^2 $ när $x_1^2+x_2^2+x_3^2<=4 $?

  Skriv om den kvadratiska formen på den nya formen

  $ X^t underbrace(mat(0, 1, -2;1, 0, 2;-2, 2, -3), A) X, quad X=mat(x_1;x_2;x_3). $

  $ det(A-lambda E)&=mat(delim: "|", -lambda, 1, -2;1, -lambda, 2;-2, 2, -3-lambda)\
                 &=mat(delim: "|", -lambda, 1, -2;1-lambda, 1-lambda, 0;-2, 2, -lambda-3)\
                 &=(1-lambda) mat(delim: "|", -lambda, 1, -2;1, 1, 0;-2, 2, -lambda-3)\
                 &=(1-lambda)mat(delim: "|", -lambda, 1+lambda, -2;1, 0, 0;-2, 4, -lambda-3)\
                 &=-(1-lambda)mat(delim: "|", 1+lambda, -2;4, -lambda-3)\
                 &=(-1-lambda)mat(delim: "|", 1+lambda, lambda-1;4, -(lambda-1))\
                 &=-(1-lambda)^2 mat(delim: "|", 1+lambda, -1;4, 1)\
                 &=-(1-lambda)^2 mat(delim: "|", lambda+5, 0;4, 1)\
                 &=-(1-lambda)^2(lambda+5). $

  "Det är töntigt att börja multiplicera ihop saker."

  Då finns ett ortogonalt $T$ så att $ A=T mat(1, 0, 0;0, 1, 0;0, 0, -5)T^t. $

  Låt $hat(X)=T^t X$ så att

  $ q=X^t A X=X^t T D T^t X=hat(X)^t D hat(X)=1 hat(x)_1^2+1 hat(x)_2^2-5hat(x)_3^2. $

  Vi söker $min q$ då $hat(x)_1^2+hat(x)_2^2+hat(x)_3^2<=4$.

  Minsta värde fås då $hat(x)_2^2=4$. Så svaret är: $-20$.

  = 11.7

  + #[
      Bestäm hel- och halvaxeln för ellipsen som ges av ekvationen $ 17x^2-12 x y+8y^2=20. $

      $ q(x,y)=mat(x, y)underbrace(mat(17, -6;-6, 8), A)mat(x;y)\
      det(A-lambda E)=mat(delim: "|", 17-lambda, -6;-6, 8-lambda)=lambda^2-25 lambda+100=(lambda-5)(lambda-20). $

      "Vi har en multiplikationstabell på mitt kontor."

      #ellipse(
        width: 3cm,
        height: 6cm,
        align(center + horizon)[Ta-da #emoji.sparkles],
      )
    ]

  = 11.16

  $e1, dots.c, en$ är en bas i $V$. Visa att det finns en skalärprodukt så att $e1, dots.c, en$ är
  ortonormerad.

  Tag $vu=(x_1, dots.c, x_n)$ och $vv=(y_1,dots.c,y_n)$. Definiera $scalar(vu, vv)=x_1 y_1+dots+x_n y_n$.
]

#pagebreak(weak: true)

= Redovisningsuppgift

Låt $U$ vara det linjära rummet av $n times n$-matriser. Matrisen $A$ är en
okänd $n times n$-matris. Definiera den linjära avbildningen $F: U -> U$ genom $F(X)=A X A$.

Visa att följande påståenden är ekvivalenta!

1. $N(F)={zm}$.
2. $V(F)=U$.
3. Det finns en matris $X_0$ i $U$ sådan att $F(X_0)=E$.
4. Matrisen $A$ är inverterbar.

#hr

== Visa att $1 <=> 2$

$ N(F)={zm} <=> underbrace(dim N(F)=0 <=> dim V(F)=dim U, "Dimensionssatsen") <=> V(F)=U. $

== Visa att $2 => 3$

$ V(F)=U in.rev E => exists space X_0 in U : F(X_0)=E. $

== Visa att $3 => 4$

$
      &F(X_0)=A X_0 A=(A X_0)A=A(X_0 A)=E\
  =>& A^(-1)=A X_0=X_0 A
  //\ =>& X_0=A^(-1) A^(-1) "ty" F(A^(-1) A^(-1))=A(A^(-1) A^(-1))A=E
  .
$

== Visa att $4 => 2$

$
      &exists space A^(-1) in U : A^(-1)A=A A^(-1)=E\
  =>& A^(-1)F(X)A^(-1)=A^(-1)(A X A)A^(-1)=underbrace((A^(-1)A), E) X underbrace((A A^(-1)), "E") = X \
  =>& F^(-1)(Y)=A^(-1)Y A^(-1).
$

så det finns en lösning $X=F^(-1)(Y)$ till varje $Y in U$. Därmed är $ V(F)=U. $

// == Visa att $4 => 1$

// $
// &exists space A^(-1) in U : A^(-1)A=A A^(-1)=E\
// =>& A^(-1)F(X)A^(-1)=A^(-1)(A X A)A^(-1)=underbrace((A^(-1)A), E) X underbrace((A A^(-1)), "E") = X \
// =>& F^(-1)(Y)=A^(-1)Y A^(-1)
// $

// ty $F(X)$ är inverterbar och därmed bijektiv; det finns bara en matris $X$ som avbildas på $zm$. Den matrisen ges av

// $ F^(-1)(zm)=A^(-1) zm A^(-1)=zm $

// så

// $ N(F)={zm}. $

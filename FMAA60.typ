#import "template.typ": conf, lecture, hr
#import "@preview/physica:0.9.3": dd

#show: doc => conf("FMAB66", [Introduktion till reell analys], doc)

= Mängder

Notation: $A = B => A subset B <=> A subset.eq B$

= Funktioner

En funktion $f: X -> Y $ avbildar värden i definitionsmängden $X$ i målmängden $Y$.

Värdemängden $f(X)$ är inte nödvändigtvis hela målmängden, dvs. $f(X) subset Y$ (och
inte $f(X)=Y$).

Bilden av $A subset X$ under $f$: $f(A)={f(x); x in A}$.

Urbilden av $B subset Y$ under $f$: $f^(-1)(B)={x in X; f(x) in B}$.

== Injektiva, surjektiva och bijektiva funktioner

Givet $x_1, x_2 in X$: om $f(x_1)=f(x_2)=>x_1=x_2$ så är $f$ injektiv.

Om $f(X)=Y$ så är $f$ surjektiv.

Om $f$ är injektiv och surjektiv så är den bijektiv.

== Inverser

En bijektiv funktion $f: X->Y$ har en invers $f^(-1):Y->X$.

(En injektiv funktion $f: X->Y$ har en _lokal_ invers $f^(-1): f(X)->X$.)

= Reella tal

== Kroppsaxiomet -- att $RR$ utgör en kropp

För $a,b,c in RR$ gäller:
- kommutativitet: $a+b=b+a$, $a b=b a$
- associativitet: $(a+b)+c=a+(b+c)$, $(a b)c=a(b c)$
- distributivitet: $a(b+c)=a b+a c$
- identiteter/neutrala element: additiv identitet ($0$) och multiplikativ
  identitet ($1$). $0!=1$
- inversa element: för varje $forall a in RR exists (-a); a+(-a)=0$
- multiplikativ invers: $forall a in RR\\{0} exists a^-1 in RR; a a^-1=1$

== Ordningsaxiomet

$ exists space RR_+ subset RR; a,b in RR_+ => a+b,a b in RR_+ $

För varje $a in RR$ gäller exakt en av följande:
- $a in RR_+$ (då sägs $a$ vara positivt)
- $-a in RR_+$
- $a=0$

Ordning:

- $a<b <=>b-a in RR_+$
- $a=b <=>a-b=0$
- $a>b <=>a-b in RR_+$

== Supremum och infimum

Betecknas $sup A$ respektive $inf A$.

=== Supremumaxiomet

Varje icketom delmängd av $RR$ begränsad ovanifrån har ett supremum.

== Arkimediska egenskapen

$ forall a in RR quad exists space n in ZZ: n>a $

==

Givet $a in RR$ och $epsilon>0$ existerar (minst) ett $r in QQ; |a-r|<epsilon$.

== Triangelolikheten

För $a_1, a_2, dots.c, a_n in RR$ gäller att

$ |a_1+a_2+dots.c+a_n|<=|a_1|+|a_2|+dots.c+|a_n| $

= Talföljder

== Cauchyföljden

$(a_k)$ Cauchyföljd om $forall space epsilon > 0 space exists space N in NN; |a_k-a_l| < epsilon quad k, l > N$.

== Delföljd

Om $(a_k)$ talföljd och $(n_k)$ strängt växande följd av naturliga tal så är $(b_k)=(a_((n_k)))$ delföljd
av $(a_k)$.

== Bolzano-Weierstraß

Varje begränsad följd har en konvergent delföljd.

= Topologi _(platslära)_

- $epsilon > 0$, #sym.epsilon\-omgigning till punkt $a in RR$ är mängden $B(a, epsilon)=(a-epsilon, a+epsilon)$. #footnote[$B$ kommer från _boll_ eftersom det ser ut som en boll i högre dimensioner. $B(a, epsilon)$ uttalas "#sym.epsilon\-bollen
    kring $a$".]
- En omgivning av punkten $a in RR$ är en #sym.epsilon\-omgivning.
- En punkterad omgivning till punkten $a in RR$ är en omgivning till $a$ utan $a$. $(a-epsilon,a+epsilon)\\ {a}$.

Låt $E in RR$. Följande ekvivalenta:
1. $E$ är sluten och begränsad (sämsta definitionen för kompakthet)
2. $E$ är kompakt
3. $E$ är följdkompakt

"Det här är kul."

"Öppenhet är väldigt viktigt."

= Exponentialfunktionen

$ a>0, x>0 $

$ a ^b=e^(b ln a) $ men vad är $e^x$?

$ e^x:=&lim_(n->infinity) (1+1/n)^(n x) quad "låt" k=n x\ =&lim_(n->infinity) (1+x/k)^k $

= Kontinuerliga funktioner

$f:D_f->RR$ är kontinuerlig i punkten $a in D_f$ om $forall epsilon > 0, exists delta > 0$ så
att

$ x in D_f \& |x-a|<delta => |f(x|-f(a)|<epsilon $

En kontinuerlig funktion $f:D_f->RR$ är kontinuerlig om den är kontinuerlig i
alla punkter på $D_f$.

Det kontrapositiva påståendet till

$ forall epsilon >0(exists delta > 0 (x in D_f \& |x-a|<delta => |f(x)-f(a)<epsilon)) $

är $ exists epsilon > 0 (forall delta > 0 (x in D_f \& |x-a|<delta "men" |f(x)-f(a)|>=epsilon)). $

#hr

$f:D_f-> RR$ sägs vara följdkontinuerlig i punkten $a in D_f$ om för varje följd $(a_k)$ i $D_f$ så
att $a_k -> a$ gäller $f(a_k)->f(a)$.

$cal(C)([a,b])$ betecknar alla kontinuerliga funktioner på $[a,b]$.

En funktion $f in cal(C)([a,b])$ som uppfyller $f(a)<0<f(b)$ har minst ett
nollställe i $[a,b]$. Intervallinkapsling (i vårt fall binärsök efter $f(x)=0$)
ger

$ exists space xi in sect.big_(k=1)^infinity I_k $

$ a_k -> xi$ och $b_k -> xi$, men gäller $f(xi)=0$?

Ja.

#hr

#figure(image("antipod.jpeg", width: 100%), caption: [Apropå antipod.])

#hr

$ cal(U)={U_c:c in [a,b]} $

== Weierstraß extremvärdessats (extremväderssats?)

"Det mesta i den här kursen är väldigt självklart tills man ser beviset."

"Så fort du ruckar på kontinuiteten kan du få vad du vill, nästan."

== Heines sats

Om $f in cal(C)([a,b])$ så är $f$ likformigt kontinuerlig.

#figure(image("heine.jpeg", width: 40%), caption: [Tomas Persson?])

== Favoritvariabler

- $alpha$
- $x$
- $xi$

= Derivator

== Extrem värdesundersökning #emoji.fire

== Fermats princip

Antag att $f$ har ett lokalt maximum eller minimum i $c in D_f$. Om $f$ är
deriverbar i $c$ och $c$ är en hopningspunkt till både $(-infinity,c) sect D_f$ och $(c, infinity) sect D_f$ så
är $f'(c)=0$.

== Idealt#footnote[Anton läste fel.]/lokalt maximum

$ qed $

== Rolles sats

#figure(stack(
  spacing: 4pt,
  image("rulle.png", width: 20%),
  image("rolle.jpeg", width: 20%),
), caption: [Rulle/Rolle Yeah.])

#let derivcont(a: $a$, b: $b$) = $cal(C)([#a,#b]) sect cal(D)^1((#a,#b))$

Antag att $f in derivcont()$ och att $f(a)=f(b)$. Då finns ett $xi in (a,b)$ så
att $f'(xi)=0$.

== Lagranges medelvärdessats

Antag att $f in derivcont()$. Då finns ett $xi in (a,b)$ så att $ f'(xi)=(f(b)-f(a))/(b-a). $

== Cauchys medelvärdessats

Antag $f,g in derivcont()$. Då finns ett $xi in (a,b)$ så att $ f'(xi)(g(b)-g(a))=g'(xi)(f(b)-f(a)). $

== Monotonicitet

(För trist för att antecknas.)

Gött mos.

== $exp$

$exp(x)$ definieras enligt

1. $lim_(n->infinity)(1+x/n)^n$
2. $sum_(k=0)^infinity x^k/(k!)$
3. $f in cal(D)'(RR)$ så att $f(0)=1$ och $f'(x)=f(x)$
4. $f in cal(C)(RR)$ så att $f(1)=e$ och $f(x+y)=f(x)f(y)$

== L'Hôpitalsession

=== Lill-l'Hôpital

Om $f$ och $g$ är deriverbara i $a$ $f(a)=g(a)=0$ och $g'(a) != 0$ så gäller $ lim_(x->a) f(x)/g(x)=(f'(a))/(g'(a)). $

=== Stor-l'Hôpital

Låt $a in I$ vara en inre punkt till intervallet $I$. Låt $f,g in cal(D)^1(I)$ så
att
$ f(a)=g(a)=0 $
och $ g'(x) != 0 $
för alla $x$ i en punkterad omvigning av $a$.

Om gränsvärdet $lim_(x->a)(f'(x))/(g'(x))$ existerar så existerar även $lim_(x-a)(f(x))/(g(x))$ och

$ lim_(x->a) (f(x))/(g(x))=lim_(x->a) (f'(x))/(g'(x)). $

==== Bevis

Låt $eta$ vara.

= Integraler

== Variabelbyte

Antag att $g in cal(C)'([a,b])$. (Det vill säga $g' in cal(C)([a,b])$.)

Då gäller det att $ integral_g(a)^g(b)f(t) dd(t)=integral_a^b f(g(x))g'(x) dd(x). $

och $ integral_c^d f(t)dd(t)=integral_(g^(-1)(c))^(g^(-1)(d)) f(g(x))g'(x) dd(x) $

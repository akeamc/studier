#import "template.typ": conf, lecture, hr
#import "@preview/cetz:0.2.2": canvas, plot
#import "@preview/physica:0.9.3": dv

#show: doc => conf("FMAB66", [Endimensionell analys], doc)

= Föreläsningar

#lecture(2024, 9, 2, [Intro])[]

#lecture(2024, 9, 4, [])[
  = Analysens dödliga vapen

  1. 1
  2. Konjugat

  $ underbrace(3, "3 delar detta") $

  $ underbrace(0 in.not NN, "Varken Albert eller Åke håller med") $
]

#lecture(2024, 9, 6, [])[
  $ {x in RR; x = -4} $

  $ 2x+3=x-1 $
]

#lecture(2024, 9, 9, [Binomialkoefficienter])[
  $ (n(n-1)(n-2) dots.c (n-(k+1)))/k! $

  $ n in RR #emoji.face.surprise $

  $ underbrace(1 <= m <= n-1, "Ett rätt så godtyckligt" m) $
]

#lecture(
  2024,
  9,
  11,
  [Avstånd],
)[
  $ |f-g|=|f-h+h-g|underbrace(<, "Triangel-"\ "olikheten")|f-h|+|h-g| $

  $ "d"(overline(u), overline(v))=====|overline(u), overline(v)| $

  = Omvända triangelolikheten

  Om $a,b in RR$ så:

  $ |a-b|>=||a|-|b|| $

  = Vad händer (för stora $n$ med uttrycket $1000^(1slash n)$)?

  = $lim_(n->infinity)n^(1 slash n)$

  $ n^(1 slash n)&<1,001 \
  n            &< 1,001^n $

  $ 1,001^n&=(1+1,001)^n\
         &=mat(n;0)+mat(n;1)dot 0,001+mat(n;2)dot 0,001^2+dots.c+mat(n;n)dot 0,001^n\
         &> 1+n dot 0,001 + n(n-1)/2 dot 0,001^2 \
         &> n(n-1)/2 dot 0,001^2 $
]

#lecture(
  2024,
  9,
  18,
  [Funktioner],
)[
  För Euler (1748) var en funktion "en formel": $ y=cases(x"," x => 0, -x"," x < 0) $ tyckte
  han var två funktioner. Dummer.

  Fourier (1822) tyckte att $ sin x -1/2 sin 2x+1/3 sin 3x - dots.c=x/2. $

  #hr

  $ f:x |-> x^2 $

  "En konstant funktion är både växande och avtagande. Känns det jobbigt?"

  #figure(canvas({
    plot.plot(
      size: (5, 5),
      axis-style: "school-book",
      x-grid: true,
      y-grid: true,
      y-label: $x_2$,
      x-label: $x_1$,
      x-tick-step: 0.5,
      y-tick-step: 1,
      {
        plot.add(
          domain: (0, 2),
          x => x * x,
          samples: 100,
          style: (mark: (stroke: blue)),
        )
      },
    )
  }), caption: [$x_2=x_1^2$.])

  $   &y_1^2+y_1 y_2+y_2^2+1\ =&(y_1+1/2 y_2)^2-1/4y_2^2+y_2^2+1\ =&(y_1+1/2 y_2)^2+3/4 y_2^2+1\ >&0 $
]

#lecture(
  2024,
  9,
  20,
  [Polynom],
)[
  Antag att heltalspolynomet $ f(x)=f_0+f_1 x+dots.c+f_n x^n $ har ett rationellt
  nollställe $x=p/q$ (förkortat!). Då är $p$ en delare till $f_0$ och $q$ en
  delare till $f_n$.
]

#lecture(
  2024,
  9,
  25,
  [Trigonometriska funktioner],
)[
  $ cot alpha=1/(tan alpha) $

  #let formatter(v) = if v == calc.pi { $pi$ } else if v == -calc.pi { $-pi$ } else if v != 0 { $#{ v / calc.pi } pi$ } else { $0$ }

  #figure(canvas({
    plot.plot(
      size: (10, 5),
      axis-style: "school-book",
      x-grid: true,
      y-grid: true,
      y-label: $y$,
      x-label: $x$,
      x-tick-step: 0.5 * calc.pi,
      y-tick-step: 1,
      x-format: formatter,
      {
        plot.add(
          domain: (0, 2 * calc.pi),
          x => calc.cos(x),
          samples: 101,
          style: (mark: (stroke: blue)),
        )
      },
    )
  }), caption: [$y=cos x$.])

  #figure(canvas({
    plot.plot(
      size: (10, 10),
      axis-style: "school-book",
      x-grid: true,
      y-grid: true,
      y-label: $y$,
      x-label: $x$,
      x-tick-step: 0.5 * calc.pi,
      y-min: -10,
      y-max: 10,
      y-tick-step: 5,
      x-format: formatter,
      {
        plot.add(
          domain: (-calc.pi, calc.pi),
          x => calc.tan(x),
          samples: 101,
          style: (mark: (stroke: blue)),
        )
      },
    )
  }), caption: [$y=tan x$.])

  = Cyklometriska funktioner (arcusfunktioner)

  "Här är funktionen nere på sin botten" _(pekar på $sin(-pi/2)$)_ "den har en
  dålig dag."

  #let ticks = ((-calc.pi / 2, $-pi slash 2$), -1, 1, (calc.pi / 2, $pi slash 2$))

  #figure(canvas({
    plot.plot(
      size: (10, 10),
      axis-style: "school-book",
      x-grid: true,
      y-grid: true,
      y-label: $y$,
      x-label: $x$,
      x-tick-step: none,
      x-ticks: ticks,
      y-tick-step: none,
      y-ticks: ticks,
      {
        plot.add(
          domain: (-calc.pi / 2, calc.pi / 2),
          x => calc.sin(x),
          samples: 101,
          style: (mark: (stroke: blue)),
        )

        plot.add(
          domain: (-1, 1),
          x => calc.asin(x).rad(),
          samples: 101,
          style: (mark: (stroke: red)),
        )
      },
    )
  }), caption: [$y=sin x$ och $y=arcsin x$.])

  "Om vi ska införa $arctan$ måste vi ha grafen för $tan$. Den hade jag här. Det
  hade inte ni!"
]

#lecture(
  2024,
  10,
  2,
  [Kontinuitet],
)[
  $ 0 in NN ~> underbrace(0 in.not NN, "Låt stå") $

  Han är bra.

  #hr

  "Vi kommer inte att gå härifrån klanderfria. Vi kommer ha lite smutsiga händer
  och så."

  $ e^t = \& $

  Min favoritligatur $e^t$.

  $ "språng" ~~> --> "hål i def.-mängd" $

  Man $lim_(h->0)$-mar ihop funktionerna.

  #let tier(content) = table.cell(align(center, content))

  #figure(table(
    columns: (auto, 1fr),
    inset: (x: 6pt, y: 8pt),
    stroke: (x: none, y: 0.5pt),
    tier[S],
    [$NN$, $ZZ$],
    tier[A],
    [$xi$],
    tier[B],
    [$in.rev$, $Sigma$],
    tier[C],
    [$sect$],
    tier[D],
    [],
    tier[E],
    [$emptyset$],
    tier[F],
    [$exists$],
  ), caption: [Symboltierlist.])

  = Mikaels pannkaksproblem

  == Det första pannkaksproblemet

  Om man ska steka pannkakor, som man gör lite då och då, kanske med sin käresta,
  men bara har en pannkaka (för CSN har inte kommit än) och vill dela pannkakan så
  att båda får lika mycket kant och pannkaka -- hur gör man?

  == Det andra pannkaksproblemet

  Nu har CSN kommit. Går det att göra ett enda snitt genom två pannkakor så att
  båda får lika mycket pannkaka?

  == Det tredje pannkaksproblemet

  Du vill dela en pannkaka med tre kamrater (det är återigen slutet av månaden och
  bistra tider). Går det att göra två vinkelräta snitt så att alla får lika mycket
  pannkaka?
]

#lecture(
  2024,
  10,
  7,
  [Derivator],
)[
  Om det inte finns någon tangent att $lim$-ma på så är funktionen inte deriverbar
  i den punkten.

  $ "deriverbara funktioner" subset "kontinuerliga funktioner" subset "funktioner". $
]

#lecture(
  2024,
  10,
  9,
  [Derivatan av diverse elementära funktioner],
)[
  = $dv(, x)e^x=e^x$

  $ (e^(a+h)-e^a)/h=&(e^a e^h - e^a)/h = e^a underbracket((e^h - 1)/h, -> 1 "då" h -> 0) --> e^a "då" h --> 0. $

  = $dv(, x) ln x = 1/x$

  $ (ln(a+h)-ln a)/h=ln((a+h)/a)=underbracket(ln(1+h/a)/(h/a), -> 1) 1/a --> 1/a "då" h --> 0. $

  = $dv(, x) sin x = cos x$

  $    & (sin(a+h)-sin(a))/h=(sin a cos h + cos a sin h - sin a)/h\
  =& sin a underbracket((cos h - 1)/h, -> 0) + cos a underbracket((sin h) / h, -> 1) $

  $ (cos h - 1)/h=((cos h - 1)(cos h + 1))/(h(cos h + 1))=underbracket((sin h)/h, -> 1) 1/(cos h + 1) sin h --> 0 "då" h --> 0. $

  = $dv(, x) cos x = -sin x$

  $ dv(, x) cos x = dv(, x) sin(pi/2 - x)=underbracket(cos(pi/2-x), -sin x) dot underbracket(dv(, x)(pi/2-x), -1). $

  = $dv(, x) tan x = 1 + tan^2 x$

  $ qed $

  = $dv(, x) x^alpha=alpha x^(alpha - 1)$ om $alpha in RR$ och $x > 0$

  $ dv(, x) x^alpha = dv(, x) e^(alpha ln x)=dots.c=alpha x^(alpha - 1). $

  = $dv(, x) arcsin x = 1/(sqrt(1-x^2))$

  Vår första nya derivata #emoji.face.tear.withheld

  $ y(x)&=arcsin x\ sin(y(x)) &= x \ cos(y(x)) y'(x)&=1 \ y'(x)&=1/(cos(y(x))) $

  = Får vi derivera implicit?

  Antag att $f$ är definierad och strängt monoton på ett intervall $I$. Om $a$ är
  en inre punkt i $I$ och om $f'(a)!=0$ så är $f^(-1)$ deriverbar i punkten $b=f(a)$:

  $ (f^(-1))'(b)=1/(f'(a)) = dv(x,y)=1/dv(y,x). $

  "Mycket snack för en enkel formel kanske."

  = Om $y=arcsin x$ så är $dv(y,x)=1/sqrt(1-x^2)$

  Vi har
  $ x=underbrace(sin y, "Strängt växande") quad -1<x<1, space space -pi/2<y<pi/2. $

  Satsen ger
  $ dv(y,x)=1/1/dv(x,y)=1/(cos y) = 1/sqrt(1-sin^2 y)=1/sqrt(1-x^2). $
  Observera att $cos y>0$ på intervallet $-pi/2<y<pi/2$.

  = $dv(,x) arccos x=-1/sqrt(1-x^2)$

  $ dv(,x) arccos x = dv(,x)(pi/2 - arcsin x)=-1/sqrt(1-x^2). $

  = $dv(,x) arctan x=1/(1+x^2)$

  $ y&=arctan x \ x&=tan y quad -pi/2 < y < pi/2 \ dv(y,x)&=1/dv(x,y)=1/(1+tan^2 y)=1/(1+x^2). $

  "När det börjar brinna så går vi ut där." _Pekar mot nödutgången längst bak i salen._

  = $dv(,x) ln |x|$

  $ cases(
    x > 0: dv(,x) ln x = 1/x,
    x < 0: dv(,x) ln(-x) = 1/(-x) dv(,x) (-x) = 1/x
  ) $

  Derivatan av en jämn funktion är en udda funktion.

  #hr

  $ (1-x^2)dv(y,x,2)-x dv(y,x)+y=0 \
  "sätt" x=cos t, space space y(x)=v(t) \
  dots.v\ dv(v,t,2)+v=0 $
]

#lecture(2024, 10, 11, smallcaps[Den sista föreläsningen med ny teori])[
  $c$ är en stationär punkt för $f$ om $f'(c)=0$.

  $c$ är en kritisk punkt för $f$ om $f'(c)=0$ eller om $f$ inte är deriverbar i $c$.

  #hr

  $f(x)=|x|$, $x in [-1,1]$ antar sitt minsta värde i en kritisk punkt.

  _Kritiska punkter i det inre_ #emoji.hands

  #let pol = x => -(x + 1) * (x - 2)

  // draw a graph of f(x) = |x| and mark the minimum
  #figure(canvas({
    plot.plot(
      size: (5, 5),
      axis-style: "school-book",
      x-tick-step: none,
      y-tick-step: none,
      {
        plot.add(
          domain: (-1.5, 3),
          x => {
            if x < 2 {
              pol(x)
            } else {
              3 * (x - 2) + pol(2)
            }
          },
          samples: 100,
        )
      },
    )
  }), )

  = Skördetider

  Givet $f in cal(C)([x_1,x_2]) sect cal(D)((x_1,x_2))$ och ett $xi in (x_1,x_2)$ så är

  $ f(x_2)-f(x_1)=f'(xi)(x_2-x_1). $

  - Om $f'(x)=0$ för alla $x in [x_1,x_2]$ så är $f$ konstant på intervallet.
  - Om $f'(x)>0$ för alla $x in [x_1,x_2]$ så är $f$ strängt växande på intervallet.
  - Om $f'(x)<0$ för alla $x in [x_1,x_2]$ så är $f$ strängt avtagande på intervallet.

  #hr

  $f(x)=x-sin x$ är strängt växande på $[0,2pi]$ ty $f'(x)=1-cos x>0$ för alla $x in (0,2pi)$.

  #hr

  $ x/(1+x)<ln(1+x)<x, quad x > 0. $

  Låt

  $ f(x)=ln(1+x)-x/(1+x), quad x>=0. $

  Vi vill visa att $f(x)>0$ för alla $x>0$, det vill säga att $f(0)=0$ och att $f'(x)>0$ för alla $x>0$.

  $ f'(x)=1/(1+x)-1/(1+x)^2=x/(1+x)^2 > 0, quad x > 0. $

  #hr

  För alla $a,b in RR$ är $ |arctan a - arctan b| <= |a-b|. $

  $ f(x)=arctan x => f'(x)=1/(1+x^2). $

  Tag $a,b in RR$. Då finns ett $xi$ mellan $a$ och $b$ så att $f(b)-f(a)=f'(xi)(b-a)$ dvs.

  $ arctan b - arctan a &= 1/(1+xi^2)(b-a)\
  |arctan b-arctan a|&=underbracket(|1/(1+xi^2)|, <= 1)|b-a|<=|b-a| $

  #hr

  $ f(x)=cases(x^2+2x\, space &x<=1, 4x-1\, space &x>1) $

  Det gäller att

  - $f(x) -> 3$ då $x->1$ både från vänster och höger,
  - $f'(x) -> 4$ då $x->1$ från båda håll

  så $f$ är deriverbar i $x=1$.

  = L'Hôpitals regel
  
  == "Musse Pigg-varianten"

  Om $f$ och $g$ är deriverbara i $x=a$, $f(a)=g(a)=0$ men $g'(a)!=0$ så gäller

  $ f(x)/g(x)=(f(x)-f(a))/(g(x)-g(a))=(f(x)-f(a))/(x-a) slash.big (g(x)-g(a))/(x-a) --> (f'(a))/(g'(a)), x -> a quad #emoji.sparkles $

  == Elaka varianten

  Givet $f, g in cal(C([a,b])) sect cal(C)((a,b))$ där $f(a)=g(a)=0$ och $g'(x)!=0$ i någon punkterad omgivning av $a$. Om

  $ lim_(x->a^+) (f'(x))/(g'(x))=A "så" lim_(x->a^+)f(x)/g(x)=A. $

  Motsvarande gäller för $x->a^-$.

  #hr

  $ lim_(x->0) (sin x - x)/(x - tan x) $

  $ f(x)&=sin x - x\
  g(x)&=x-tan x\
  f'(x)&=cos x -1\
  g'(x)=1-(1+tan^2 x)&=-tan^2 x\
  f''(x)&=-sin x\
  g''(x)&=-2 tan x (1 + tan^2 x) $

  $ lim_(x->0)(f''(x))/(g''(x))=lim_(x->0)(sin x)/(-2 tan x (1+tan^2x))=lim_(x->0)1/(-2/(cos x)(1 + tan^2 x))=-1/2=lim_(x->0)f(x)/g(x). $
]

#lecture(2024, 10, 17, [Asymptotanalys])[
  $f$ har en sned asymptot $y=k x+m$ precis då dessa ändliga gränsvärden existerar:

  $ k=lim_(x->+infinity) f(x)/x, quad m=lim_(x->infinity)(f(x)-k x). $

  $x=a$ är en lodrät asymptot till $f$ om $f(x)->+infinity$ eller $f(f(x)->-infinity)$ då $x->a^+$ och/eller $x->a^-$.

  Alltså: $x=0$ är en lodrät asymptot till $f(x)=ln x$.

  = Exempel

  Hyperbelgrenen $ (x/2)^2-y^2=-1, quad y>=0 $ har asymptot $y=x/2$ när $x->+infinity$.

  "Tomas kom till mitt kontor och frågade: 'Kan du rita hyperbler?'"

  Vi har $ (x/2)^2-y^2=-1 <=> y=sqrt(1+(x/2)^2). $

  $ k=lim_(x->+infinity) sqrt(1+(x/2)^2)/x=lim_(x->+infinity)|x/2|/x underbracket(sqrt(1/(x/2)^2+1), --> 1)=1/2\
  m=lim_(x->+infinity)(sqrt(1+(x/2)^2)-x/2)=lim_(x->+infinity) 1/(sqrt(1+(x/2)^2)+x/2)=0\
  $
  
  så $y=x/2$ är en asymptot.

  = Grafritning

  *I någon mening är det kanske passé att rita grafer för hand.*

  - $D_f$? Är $f$ kontinuerlig? Är $f$ deriverbar?
  - Kritiska punkter?#footnote[$f'=0$ eller $f'$ ej definierad.]
  - Teckentabell för derivatan där lokala maximum-, minimum- och terrasspunkter
    kan finnas samt punkter där $f$ eller $f'$ inte är definierad.
  - Gränsvärden och asymptoter.
  - Fler punkter?
  - Konvexitet?#footnote[$f$ är konvex om $f''>=0$. Konkav och strängt konvex/konkav på motsvarande vis.] (Brukar i allmänhet ej krävas.)
  - Skissa grafen. Ha med de intressanta punkterna!
]

#pagebreak(weak: true)

= Övningar

#table(
  stroke: (x: none, y: 0.5pt),
  columns: (auto, auto, 1fr),
  table.cell(rowspan: 2)[LV1],
  [Ö1],
  [1.{2, 3, 4, 5, 11}, 2.{3, 8bc, 13, 14c, 22bdf, 23e, 24}],
  [Ö2],
  [
    4.{1cd, 2bc, 6d, 7bde, 8cd, 12, 24, 25, (26)}\
    3.{1bcf, 2a, 6, 7, 9, 10, 12, 17}, 16.{34, 39, 68}
  ],
  table.cell(rowspan: 2)[LV2],
  [Ö3],
  [4.{15, 17, 19, 21}],
  [Ö4],
  [
    5.{14, 16, 18, 19, 24, 25, 26}, F5.{1, 2, 3, 4, 5, 6, 7}\
    F6.{1, 2, 3, 4, 5, 6, 7}, 16.{50, (81), 84a(b)}
  ],
  table.cell(rowspan: 2)[LV3],
  [Ö5],
  [9.{31, 32, 44}],
  [Ö6],
  [
    7.{3, 4, 7, 9, 12, 15, 19, 20, 21, 26ab, 29}\
    2.{37, 38}, 3.{3ef, 4}, 8.1, 16.60
  ],
  table.cell(rowspan: 2)[LV4],
  [Ö7],
  [8.{2, 3, 7, 13, 17, 18, 19, 24, 25, 27, 29, 31}],
  [Ö8],
  [8.{37, 38, 40, 43, 46, 47, 51, 53, 61, 70, 71, 72, 77, 78}\ 9.{2, 4, 5, 6, 8,
    10}],
  table.cell(rowspan: 2)[LV5],
  [Ö9],
  [9.{14, 17, 20, 24}],
  [Ö10],
  [9.{25, 26, 27, 29}, 16.7],
  table.cell(rowspan: 2)[LV6],
  [Ö11],
  [10.{1, 2, 3, 4, 6, 7}],
  [Ö12],
  [10.{8, 9, 10, 11, 12, 15, 16, 18, 19, 23, 24, 25}, 16.13],
  table.cell(rowspan: 2)[LV7],
  [Ö13],
  [10.{26, 29, 31, 33, 53, 54, 61, 67, 68}, 16.{32, 66, 69}],
  [Ö14],
  [10.{34, 38, 40, 44, 45, 49, 60, 65}],
  [LV8],
  [Ö15],
  [Repetition],
)

$ log_b x = log_b a log_a x = log_b a^(log_a x) = log_b x $

#import "template.typ": conf, lecture, hr
#import "@preview/cetz:0.2.2": canvas, plot

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

#lecture(2024, 9, 11, [Avstånd])[
  $ |f-g|=|f-h+h-g|underbrace(<, "Triangel-"\ "olikheten")|f-h|+|h-g| $

  $ "d"(overline(u), overline(v))=====|overline(u), overline(v)| $

  = Omvända triangelolikheten

  Om $a,b in RR$ så:

  $ |a-b|>=||a|-|b|| $

  = Vad händer (för stora $n$ med uttrycket $1000^(1slash n)$)?

  = $lim_(n->infinity)n^(1 slash n)$

  $ n^(1 slash n)&<1,001 \
  n &< 1,001^n $

  $ 1,001^n&=(1+1,001)^n\
  &=mat(n;0)+mat(n;1)dot 0,001+mat(n;2)dot 0,001^2+dots.c+mat(n;n)dot 0,001^n\
  &> 1+n dot 0,001 + n(n-1)/2 dot 0,001^2 \
  &> n(n-1)/2 dot 0,001^2 $
]

#lecture(2024, 9, 18, [Funktioner])[
  För Euler (1748) var en funktion "en formel": $ y=cases(x"," x => 0, -x"," x < 0) $ tyckte han var två funktioner. Dummer.

  Fourier (1822) tyckte att $ sin x -1/2 sin 2x+1/3 sin 3x - dots.c=x/2. $

  #hr

  $ f:x |-> x^2 $

  "En konstant funktion är både växande och avtagande. Känns det jobbigt?"

  #figure(canvas({
    plot.plot(size: (5,5), axis-style: "school-book", x-grid: true, y-grid: true, y-label: $x_2$, x-label: $x_1$, x-tick-step: 0.5, y-tick-step: 1, {
      plot.add(domain: (0, 2), x => x * x,
      samples: 100, style: (mark: (stroke: blue)))
    })
  }), caption: [$x_2=x_1^2$.])

  $ &y_1^2+y_1 y_2+y_2^2+1\ =&(y_1+1/2 y_2)^2-1/4y_2^2+y_2^2+1\ =&(y_1+1/2 y_2)^2+3/4 y_2^2+1\ >&0 $
]

#lecture(2024, 9, 20, [Polynom])[
  Antag att heltalspolynomet $ f(x)=f_0+f_1 x+dots.c+f_n x^n $ har ett rationellt nollställe $x=p/q$ (förkortat!). Då är $p$ en delare till $f_0$ och $q$ en delare till $f_n$.
]

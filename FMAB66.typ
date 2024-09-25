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

#lecture(2024, 9, 25, [Trigonometriska funktioner])[
  $ cot alpha=1/(tan alpha) $

  #let formatter(v) = if v == calc.pi {$pi$} else if v == -calc.pi {$-pi$} else if v != 0 {$#{v/calc.pi} pi$} else {$0$}

  #figure(canvas({
    plot.plot(size: (10, 5), axis-style: "school-book", x-grid: true, y-grid: true, y-label: $y$, x-label: $x$, x-tick-step: 0.5 * calc.pi, y-tick-step: 1, x-format: formatter, {
      plot.add(domain: (0, 2 * calc.pi), x => calc.cos(x),
      samples: 101, style: (mark: (stroke: blue)))
    })
  }), caption: [$y=cos x$.])

  #figure(canvas({
    plot.plot(size: (10, 10), axis-style: "school-book", x-grid: true, y-grid: true, y-label: $y$, x-label: $x$, x-tick-step: 0.5 * calc.pi, y-min: -10, y-max: 10, y-tick-step: 5, x-format: formatter, {
      plot.add(domain: (-calc.pi, calc.pi), x => calc.tan(x),
      samples: 101, style: (mark: (stroke: blue)))
    })
  }), caption: [$y=tan x$.])

  = Cyklometriska funktioner (arcusfunktioner)

  "Här är funktionen nere på sin botten" _(pekar på $sin(-pi/2)$)_ "den har en dålig dag."

  #let ticks = ((-calc.pi/2,$-pi slash 2$),-1, 1, (calc.pi/2, $pi slash 2$))

  #figure(canvas({
    plot.plot(size: (10, 10), axis-style: "school-book", x-grid: true, y-grid: true, y-label: $y$, x-label: $x$, x-tick-step: none, x-ticks: ticks, y-tick-step: none, y-ticks: ticks, {
      plot.add(domain: (-calc.pi/2, calc.pi/2), x => calc.sin(x),
      samples: 101, style: (mark: (stroke: blue)))

      plot.add(domain: (-1, 1), x => calc.asin(x).rad(),
      samples: 101, style: (mark: (stroke: red)))
    })
  }), caption: [$y=sin x$ och $y=arcsin x$.])

  "Om vi ska införa $arctan$ måste vi ha grafen för $tan$. Den hade jag här. Det hade inte ni!"
]

#pagebreak(weak: true)

= Övningar

#table(
  stroke: (
    x: none,
    y: 0.5pt,
  ),
  columns: (auto, auto, 1fr),
  table.cell(rowspan: 2)[LV1],
  [Ö1], [1.{2, 3, 4, 5, 11}, 2.{3, 8bc, 13, 14c, 22bdf, 23e, 24}],
  [Ö2], [
    4.{1cd, 2bc, 6d, 7bde, 8cd, 12, 24, 25, (26)}\ 
    3.{1bcf, 2a, 6, 7, 9, 10, 12, 17}, 16.{34, 39, 68}
  ],
  table.cell(rowspan: 2)[LV2],
  [Ö3], [4.{15, 17, 19, 21}],
  [Ö4], [
    5.{14, 16, 18, 19, 24, 25, 26}, F5.{1, 2, 3, 4, 5, 6, 7}\ 
    F6.{1, 2, 3, 4, 5, 6, 7}, 16.{50, (81), 84a(b)}
  ],
  table.cell(rowspan: 2)[LV3],
  [Ö5], [9.{31, 32, 44}],
  [Ö6], [
    7.{3, 4, 7, 9, 12, 15, 19, 20, 21, 26ab, 29}\ 
    2.{37, 38}, 3.{3ef, 4}, 8.1, 16.60
  ],
  table.cell(rowspan: 2)[LV4],
  [Ö7], [8.{2, 3, 7, 13, 17, 18, 19, 24, 25, 27, 29, 31}],
  [Ö8], [8.{37, 38, 40, 43, 46, 47, 51, 53, 61, 70, 71, 72, 77, 78}\ 9.{2, 4, 5, 6, 8, 10}],
  table.cell(rowspan: 2)[LV5],
  [Ö9], [9.{14, 17, 20, 24}],
  [Ö10], [9.{25, 26, 27, 29}, 16.7],
  table.cell(rowspan: 2)[LV6],
  [Ö11], [10.{1, 2, 3, 4, 6, 7}],
  [Ö12], [10.{8, 9, 10, 11, 12, 15, 16, 18, 19, 23, 24, 25}, 16.13],
  table.cell(rowspan: 2)[LV7],
  [Ö13], [10.{26, 29, 31, 33, 53, 54, 61, 67, 68}, 16.{32, 66, 69}],
  [Ö14], [10.{34, 38, 40, 44, 45, 49, 60, 65}],
  [LV8], [Ö15], [Repetition]
)

$ log_b x = log_b a log_a x = log_b a^(log_a x) = log_b x $

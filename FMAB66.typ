#import "template.typ": conf, lecture

#show: doc => conf("FMAB66", [Endimensionell analys], doc)

= Föreläsningar

#lecture(2024, 9, 2, [Intro])[]

#lecture(2024, 9, 4, [])[
  === Analysens dödliga vapen

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

  === Omvända triangelolikheten

  Om $a,b in RR$ så:

  $ |a-b|>=||a|-|b|| $

  === Vad händer (för stora $n$ med uttrycket $1000^(1slash n)$)?

  === $lim_(n->infinity)n^(1 slash n)$

  $ n^(1 slash n)&<1,001 \
  n &< 1,001^n $

  $ 1,001^n&=(1+1,001)^n\
  &=mat(n;0)+mat(n;1)dot 0,001+mat(n;2)dot 0,001^2+dots.c+mat(n;n)dot 0,001^n\
  &> 1+n dot 0,001 + n(n-1)/2 dot 0,001^2 \
  &> n(n-1)/2 dot 0,001^2 $
]

#set text(lang: "sv")
#set page(header: align(center, smallcaps[FMAB66: Endimensionell analys]), numbering: "1")

#let lecture = (month, day, content) => [
  == #datetime(year: 2024, month: month, day: day).display()

  #content
]

= Föreläsningar

#lecture(9, 2)[]

#lecture(9, 4)[
  === Analysens dödliga vapen

  1. 1
  2. Konjugat

  $ underbrace(3, "3 delar detta") $

  $ underbrace(0 in.not NN, "Åke håller ej med") $
]

#lecture(9, 6)[
  $ {x in RR; x = -4} $

  $ 2x+3=x-1 $
]

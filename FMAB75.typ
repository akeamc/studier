#import "template.typ": conf, lecture, hr, ex
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty
#import "@preview/cetz:0.2.2": canvas, draw, plot

#show: doc => conf("FMAB75", [Diskret matematik], doc)

= Föreläsningar

#lecture(
  2024,
  11,
  4,
  [#emoji.face.disguise],
)[
  #figure(table(
    columns: 2,
    align: left,
    stroke: (x: none, y: 0.5pt),
    [Mån 13--14 (15)],
    [Introduktion till område $k$ och $k+1$.],
    [],
    [Arbeta med område $k$.],
    [Tis 15--17],
    [
      Seminarium om område $k$:

      Första timmen: arbeta i grupper om 3--4 personer.\
      Andra timmen: redovisning.
    ],
    [],
    [Arbeta med område $k + 1$],
    [Ons 15--17],
    [
      Seminarium om område $k+1$:

      Första timmen: arbeta i grupper om 3--4 personer.\
      Andra timmen: redovisning.
    ],
    [Tor 13--15],
    [Uppföljande föreläsning om område $k$ och $k+1$.],
  ), caption: [Schema. $k in NN$.])

  Krav för godkänt betyg:
  - Tenta den 13 januari
  - Muntligt prov (20--30 minuter) 16--23 januari

  *Discrete and Combinatorial Mathematics, Ralph P. Grimaldi, 5th edition.*

  #hr

  = Grundläggande kombinatorik

  På hur många sätt går det att välja $k$ element ur en mängd med $n$ distinkta
  element?

  #ex([7 biljardbollar.], table(
    columns: 3,
    stroke: 0.5pt,
    align: horizon,
    table.cell(stroke: none)[],
    [Ordning spelar roll],
    [Ordning spelar inte roll],
    [Utan återläggning],
    [$ 7 dot 6 $],
    [$ (7 dot 6)/2! $],
    [Med återläggning],
    [$ 7 dot 7 $],
    [
      $ 28 $

      Detsamma som antal sätt att placera 2 etiketter ($ballot$) på 7 biljardbollar:

      $ |ballot|space|space|space|space|ballot|\
      arrow.squiggly mat(7+1; 2) $
    ],
  ))
]

#import "@preview/unify:0.7.0": qty, num, unit
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#set text(lang: "sv")
#set heading(numbering: "1.1")

#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}

#outline(indent: 2em, fill: repeat[. #h(0.5em)])

#pagebreak(weak: true)

// glöm inte att multiplicera med 0,3 på något ställe

= Överblick

= Teori

#figure(
  canvas({
    let a = 1
    let V0 = 1

    plot.plot(
      size: (12, 8),
      axis-style: "school-book",
      x-tick-step: none,
      x-ticks: ((-a / 2, $-a slash 2$), (a / 2, $a slash 2$)),
      y-tick-step: none,
      y-ticks: ((V0, $V_0$),),
      {
        plot.add((
          (-a, 0),
          (-a / 2, 0),
          (-a / 2, V0),
          (a / 2, V0),
          (a / 2, 0),
          (a, 0),
        ))
      },
    )
  }),
)

#figure(
  canvas({
    import draw: *

    let a = 1
    let b = 1
    let V0 = 1

    plot.plot(
      size: (12, 8),
      axis-style: "school-book",
      x-tick-step: none,
      y-tick-step: none,
      y-ticks: ((V0, $V_0$),),
      {
        plot.add((
          (-a - b, 0),
          (-a - b / 2, 0),
          (-a - b / 2, V0),
          (-b / 2, V0),
          (-b / 2, 0),
          (b / 2, 0),
          (b / 2, V0),
          (a + b / 2, V0),
          (a + b / 2, 0),
          (a + b, 0),
        ))

        plot.annotate({
          set-style(mark: (symbol: ">"))

          line((-a - b / 2, V0 / 2), (-b / 2, V0 / 2), name: "l1")
          content("l1.mid", $ a $, anchor: "south", padding: -1.5pt)
          line((a + b / 2, V0 / 2), (b / 2, V0 / 2), name: "l2")
          content("l2.mid", $ a $, anchor: "south", padding: -1.5pt)
        })
      },
    )
  }),
)

#let stranger = [Я]

#figure(canvas({
  import draw: *

  line((-2, -1.9), (-2, 0), (4, 0), (4, -4), (-2, -4), (-2, -2.1))
  line((2, 0), (2, -4))

  line((-2.25, -1.9), (-1.75, -1.9), name: "l1")
  line((-2.5, -2.1), (-1.5, -2.1), name: "l1")

  circle((0, 0), radius: 0.5, fill: white, name: "A")
  content("A.center", [A])

  circle((4, -2), radius: 0.5, fill: white, name: "V")
  content("V.center", [V])

  rect((1.75, -1), (2.25, -3), fill: white, name: "R")
  content("R.center", stranger)
}), caption: [Kopplingsschema för experimentuppställningen. #stranger betecknar provet.])

= Resultat

#for sample in ("A", "B", "C", "D") {
  let results = csv(sample + ".tsv", delimiter: "\t")
  let points = results.slice(1).map(((U, I)) => (float(U), float(I))).sorted()

  let (_, max-current) = points.last()
  let thexponent = calc.ceil(calc.log(max-current, base: 1000) - 1) * -1

  let prefix = ("", "m", "u", "n").at(thexponent)
  let current-unit = prefix + "A"

  figure(
    canvas({
      plot.plot(
        size: (12, 8),
        axis-style: "scientific",
        x-label: [Spänning $U slash unit("V")$],
        y-label: [Ström $I slash unit(#current-unit)$],
        x-min: 0,
        x-grid: true,
        y-grid: true,
        x-format: U => num(str(calc.round(U * 10) / 10).replace(".", ",")),
        y-format: I => num(str(I).replace(".", ",")),
        y-min: 0,
        {
          plot.add(points.map(((U, I)) => (U, I * calc.pow(1000, thexponent))), mark: "x")
        },
      )
    }),
    caption: [Prov #sample.],
  )
}

= Analys

= Diskussion

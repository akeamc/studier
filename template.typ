#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#let conf(id, title, doc) = {
  set document(title: title)
  set text(lang: "sv")
  set page(header: align(center, smallcaps[#id: #title]), numbering: "1")
  set heading(numbering: "1.1")
  set math.equation(numbering: "(1)")
  set par(justify: true)
  set math.mat(delim: "[")

  outline(indent: 1em, depth: 3)
  pagebreak(weak: true)

  doc
}

#let lecture = (year, month, day, title, content) => [

  == #datetime(year: year, month: month, day: day).display() -- #title

  #set heading(offset: 2)

  #content
]

#let hr = line(length: 100%, stroke: 0.5pt)

#let ex = (title, content) => block(fill: white.darken(5%), width: 100%, inset: 8pt, radius: 4pt)[
  #set math.equation(numbering: none)
  #set enum(numbering: "a)")

  *Exempel:* #title

  #v(4pt)

  #content
]

#let obs = content => block(fill: white.darken(5%), width: 100%, inset: 8pt, radius: 4pt)[
  *Obs:* #content
]

#let sats = (name, content) => block(fill: white.darken(5%), width: 100%, inset: 8pt, radius: 4pt)[
  *Sats:* #name

  #v(4pt)

  #content
]

#let anm = content => block(fill: white.darken(5%), width: 100%, inset: 8pt, radius: 4pt)[
  *Anmärkning:* #content
]

#let fplot = (f, domain: (0, 1)) => canvas({
  plot.plot(
    size: (12, 8),
    {
      plot.add(f, domain: domain)
    },
  )
})

#let slopefield(
    df,
    x-min: 0,
    x-max: 10,
    y-min: 0,
    y-max: 10,
    x-step: 1,
    y-step: 1,
    x-lines: (),
    y-lines: (),
  ) = canvas({
    import draw: *

    set-style(
      axes: (stroke: .5pt, tick: (stroke: .5pt)),
      // legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%),
    )

    plot.plot(
      size: (10, 8),
      x-label: $t$,
      y-label: $x$,
      x-tick-step: none,
      y-tick-step: none,
      y-min: y-min,
      y-max: y-max,
      axis-style: "school-book",
      y-ticks: y-lines,
      y-grid: true,
      x-grid: true,
      {
        for x in range(x-min, x-max, step: x-step) {
          for y in range(y-min, y-max, step: y-step) {
            let x0 = x - 0.1 / x-step
            let x1 = x + 0.1 / x-step

            let y0 = y - df(y) * 0.03 / y-step
            let y1 = y + df(y) * 0.03 / y-step

            plot.add(((x0, y0), (x1, y1)), style: (stroke: blue))
          }
        }
      },
    )
  })
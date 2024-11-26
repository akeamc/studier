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

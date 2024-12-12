#import "@preview/unify:0.7.0": qty, num, unit
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#set text(lang: "en")
#set heading(numbering: "1.1")

#[
  #align(
    center + horizon,
    text(size: 48pt, font: "New Computer Modern")[
      Quantum Tunneling Lab
    ],
  )

  #align(end + bottom, text(size: 12pt)[Åke\ Amadeus])

  #pagebreak(weak: true)
]

// #show outline.entry.where(level: 1): it => {
//   v(12pt, weak: true)
//   strong(it)
// }

#outline(indent: 2em, fill: repeat[.])

#pagebreak(weak: true)

// glöm inte att multiplicera med 0,3 på något ställe

= Overview

= Background

#let default-plot-style = {
  draw.set-style(
    axes: (stroke: .5pt, tick: (stroke: .5pt)),
    legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%, fill: white),
  )
}

#let max-in-region(a: float, b: float, data) = {
  let region = data.filter(((U, I)) => a <= U and U <= b)
  let max-I = calc.max(..region.map(((U, I)) => I))
  region.find(((U, I)) => I == max-I)
}

#figure(
  canvas({
    let a = 1
    let V0 = 1

    default-plot-style

    plot.plot(
      size: (6, 4),
      axis-style: "left",
      x-tick-step: none,
      x-ticks: ((-a / 2, $-a slash 2$), (a / 2, $a slash 2$)),
      y-tick-step: none,
      y-ticks: ((V0, $V_0$),),
      y-grid: true,
      x-grid: true,
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

    default-plot-style

    plot.plot(
      size: (6, 4),
      axis-style: "left",
      x-tick-step: none,
      y-tick-step: none,
      y-ticks: ((V0, $V_0$),),
      y-grid: true,
      x-grid: true,
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
          // set-style(mark: (symbol: ">"))

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

#figure(
  canvas({

    import draw: *

    line((-2, -1.9), (-2, 0), (4, 0), (4, -4), (-2, -4), (-2, -2.1))
    line((2, 0), (2, -4))

    circle((0, 0), radius: 0.5, fill: white, name: "A")
    content("A.center", [A])

    circle((4, -2), radius: 0.5, fill: white, name: "V")
    content("V.center", [V])

    rect((1.75, -1), (2.25, -3), fill: white, name: "R")
    content("R.center", stranger)


    line((-2.25, -1.9), (-1.75, -1.9))
    line((-2.5, -2.1), (-1.5, -2.1))
set-style(mark: (end: "straight"))
    line((-2.5, -2.5), (-1.5, -1.5))
  }),
  caption: [Circuit diagram illustrating the setup. #stranger denotes some sample (A, B, C or D).],
)
  
= Results

#let read(sample: str) = csv(sample + ".tsv", delimiter: "\t").slice(1).map(((U, I)) => (float(U), float(I))).sorted()

#let interesting = (
  A: max-in-region(read(sample: "A"), a: 0.2, b: 0.4),
  B: max-in-region(read(sample: "B"), a: 0.4, b: 0.5),
)

#for sample in ("A", "B", "C", "D") {
  let points = read(sample: sample)

  let (_, max-current) = points.last()
  let thexponent = calc.ceil(calc.log(max-current, base: 1000) - 1) * -1

  let prefix = ("", "m", "u", "n").at(thexponent)
  let current-unit = prefix + "A"

  let (interesting-U, interesting-I) = interesting.at(sample, default: (none, none))

  figure(
    canvas({
      import draw: *

      default-plot-style

      plot.plot(
        size: (10, 6),
        axis-style: "scientific",
        x-label: [Voltage $U slash unit("mV")$],
        y-label: [Current $I slash unit(#current-unit)$],
        x-min: 0,
        x-grid: true,
        y-grid: true,
        x-format: U => num(str(calc.round(U * 1e4) / 1e4)),
        y-format: I => num(str(I)),
        // x-tick-step: 0.2,
        y-min: 0,
        // x-ticks: if interesting-U != none {
        //   ((interesting-U, $U_#sample$),)
        // } else {
        //   ()
        // },
        // y-ticks: if interesting-I != none {
        //   ((interesting-I * calc.pow(1e3, thexponent), $I_1$),)
        // } else {
        //   ()
        // },
        legend: "inner-north-west",
        {
          plot.add(points.map(((U, I)) => (U * 1e3, I * calc.pow(1e3, thexponent))), mark: "x", style: (stroke: none), label: [Sample #sample])

          if interesting-U != none {
            plot.add-vline(interesting-U * 1e3, style: (stroke: (dash: "dashed")), label: $U_#sample=qty(#str(interesting-U * 1e3), "mV")$)
          }
        },
      )
    }),
    caption: [Sample #sample.],
  )
}

Hej hej @ohlen

= Analysis

The energy levels of the electrons in the potential well are quantized and given by

$ E_n=(n^2 h^2) / (8 m^* L^2) $

where $n in ZZ^+$ is the quantum number, $h$ is Planck's constant, $m$ is the electron mass, and $L$ is the width of the well. 

och $ E=q U. $

At the first peak, the resonance inside the potential well gives rise to constructive interference, so $ L=h/sqrt(8 m_e q U) $

#let UA = interesting.at("A").at(0)
#let UB = interesting.at("B").at(0)
#let planck = 6.626e-34
#let me = 9.109e-31
#let meff = 0.067 * me
#let q = 1.602e-19

#let LA = planck / calc.sqrt(8 * meff * q * UA)
#let LB = planck / calc.sqrt(8 * meff * q * UB)

yielding

#cite(<ohlen>, form: "prose") anser

$
  L_A&=qty(#str(calc.round(LA * 1e12) / 1e3), "nm")\
  L_B&=qty(#str(calc.round(LB * 1e12) / 1e3), "nm").
$

= Discussion

#bibliography("bibliography.bib")

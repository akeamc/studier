#import "@preview/unify:0.7.0": qty, num, unit
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot
#import "@preview/physica:0.9.3": *

#set text(lang: "en")
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

#align(center)[
  #v(1fr)

  #text(size: 24pt, font: "New Computer Modern")[
      *Quantum Tunneling Lab Report*
      #v(2em)
      Concepts in Quantum Physics
    ],

  #v(.5fr)

  *F1.02 Åke Amcoff, (Amadeus Bernmark)*

  #v(.5fr)

  *Lab supervisor: unknown*\
  *Intro session teacher: Fernando Omlov*

  December 2024

  #pagebreak(weak: true)
]

// #show outline.entry.where(level: 1): it => {
//   v(12pt, weak: true)
//   strong(it)
// }

#outline(indent: 2em, fill: repeat[.])

#pagebreak(weak: true)

// glöm inte att multiplicera med 0,3 på något ställe


#set par(justify: true)
#set page(numbering: "1")
#counter(page).update(1)

= Overview

The purpose of this lab is to study heterostructures of gallium arsenide
(GaAs) and indium gallium arsenide (InGaAs), and deriving properties of
their potential landscapes from how they behave as conductors when a
voltage bias is applied.

= Background

A single potential barrier can be formed by sandwiching a material B between
to layers of material A. The potential landscape of such a strucutre is shown
in @single-barrier.

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
  caption: [The potential barrier formed by gallium arsenide (GaAs) and indium gallium arsenide (InGaAs) with and without a voltage bias $U$.],
  canvas({
    import draw: *

    let a = 1
    let V0 = 1

    default-plot-style

    set-style(legend: (orientation: ltr))

    plot.plot(
      size: (10, 4),
      axis-style: "left",
      x-tick-step: none,
      y-tick-step: none,
      y-grid: true,
      x-grid: true,
      y-label: $V$,
      y-min: 0,
      y-max: 2,
      x-min: -1.5,
      legend: "south",
      {
        plot.add(
          (
            (-a, 1),
            (-a / 2, 1),
            (-a / 2, V0 + 1),
            (a / 2, V0 + 1),
            (a / 2, 1),
            (a, 1),
          ),
          label: [Zero voltage],
        )
        plot.add(
          (
            (-a, 1),
            (-a / 2, 1),
            (-a / 2, V0 + 1),
            (a / 2, V0 + 0.5),
            (a / 2, 0 + 0.5),
            (a, 0 + 0.5),
          ),
          label: [With voltage bias $U$],
          style: (stroke: (paint: red, dash: "dashed")),
        )

        plot.annotate({
          set-style(mark: (start: "straight", end: "straight", scale: 0.25), stroke: .5pt)
          line((-1, 1), (-1, V0 + 1))
          content((-1.1, (1 + V0 + 1) / 2), anchor: "west", $V_0$)

          line((1, 1), (1, V0 + 1))
          content((0.9, (1 + V0 + 1) / 2), anchor: "west", $V_0$)

          line((0.4, 0.5), (0.4, V0 + 0.5))
          content((0.5, (1 + V0) / 2), anchor: "east", $V_0$)

          line((1, 1), (1, 0.5))
          content((0.87, 1.5 / 2), anchor: "west", $q U$)

          line((-0.5, 2.1), (0.5, 2.1))
          content((0, 2.1), anchor: "north", $a$)

          let y = 2.7
          let h = 0.4

          rect((-1, y), (-0.5, y + h), name: "I", fill: yellow.lighten(50%), stroke: none)
          content("I.center")[GaAs]
          rect((-0.5, y), (0.5, y + h), name: "II", fill: green.lighten(50%), stroke: none)
          content("II.center")[InGaAs]
          rect((0.5, y), (1, y + h), name: "III", fill: yellow.lighten(50%), stroke: none)
          content("III.center")[GaAs]
        })
      },
    )
  }),
) <single-barrier>

A double potential barrier can be constructed by alternating layers of two different semiconductor materials. Applying a voltage bias $U$ across the structure creates a potential difference $q U$ across the barriers, as shown in @double-barrier.

#figure(
  caption: [Potential landscape of a typical double barrier heterostructure with and without a voltage bias $U$.],
  canvas({
    import draw: *

    let a = 1
    let V0 = 1

    default-plot-style

    set-style(legend: (orientation: ltr))

    plot.plot(
      size: (15, 4),
      axis-style: "left",
      x-tick-step: none,
      y-tick-step: none,
      y-grid: true,
      x-grid: true,
      y-label: $V$,
      y-min: 0,
      y-max: 2,
      x-min: -1.5,
      legend: "south",
      {
        plot.add(
          (
            (-a, 1),
            (-a / 2, 1),
            (-a / 2, V0 + 1),
            (a / 2, V0 + 1),
            (a / 2, 1),
            (a, 1),
            (1, 1),
            (a, V0 + 1),
            (a + 1, V0 + 1),
            (a + 1, 1),
            (a + 1.5, 1),
          ),
          label: [Zero voltage],
        )
        plot.add(
          (
            (-a, 1),
            (-a / 2, 1),
            (-a / 2, V0 + 1),
            (a / 2, V0 + 0.75),
            (a / 2, 0 + 0.75),
            (a, 0 + 0.75),
            (1, 0 + 0.75),
            (a, V0 + 0.75),
            (a + 1, V0 + 0.5),
            (a + 1, 0 + 0.5),
            (a + 1.5, 0 + 0.5),
          ),
          label: [With voltage bias $U$],
          style: (stroke: (paint: red, dash: "dashed")),
        )

        plot.annotate({
          set-style(mark: (start: "straight", end: "straight", scale: 0.25), stroke: .5pt)
          line((-1, 1), (-1, V0 + 1))
          content((-1.1, (1 + V0 + 1) / 2), anchor: "west", $V_0$)

          line((2.5, 1), (2.5, 0.5))
          content((2.43, 1.5 / 2), anchor: "west", $q U$)

          line((-0.5, 2.1), (0.5, 2.1))
          content((0, 2.1), anchor: "north", $a$)
          line((0.5, 2.1), (1, 2.1))
          content((0.75, 2.1), anchor: "north", $L$)

          let y = 2.7
          let h = 0.4

          rect((-1, y), (-0.5, y + h), name: "I", fill: yellow.lighten(50%), stroke: none)
          content("I.center")[GaAs]
          rect((-0.5, y), (0.5, y + h), name: "II", fill: green.lighten(50%), stroke: none)
          content("II.center")[InGaAs]
          rect((0.5, y), (1, y + h), name: "III", fill: yellow.lighten(50%), stroke: none)
          content("III.center")[GaAs]
          rect((1, y), (2, y + h), name: "IV", fill: green.lighten(50%), stroke: none)
          content("IV.center")[InGaAs]
          rect((2, y), (2.5, y + h), name: "V", fill: yellow.lighten(50%), stroke: none)
          content("V.center")[GaAs]
        })
      },
    )
  }),
) <double-barrier>

Inside the potential well, the particles (in our case, electrons) are confined and
their energy levels are quantized. This causes particles whose energy does not match
some discrete energy level to have a higher chance of being reflected at the potential
step between the first potential barrier and the well. The energy levels of the even#footnote[In this lab, resonance at the ground frequency of the well is studied. The ground frequency has quantum number $1$ and is an even function.] wave
functions satisfy the relationship

$ tan(sqrt((m L^2E)/(2hbar^2)))=sqrt((V_0-E)/(E)), $ <even-vibes>

adapted from #cite(<ohlen>, form: "prose"), where $L$ is the width of the well, $m$ is the particle's mass, $E$ is its energy, $V_0$ is the depth of the well and $hbar$ is the reduced Planck constant. Since the voltage drop across one barrier is half the total voltage drop $U$, the electrons inside the well will have a kinetic energy $E=gamma q U slash 2$.

Rearranging @even-vibes and solving for $L$, we obtain

$ L=(sqrt(2 hbar^2) arctan(sqrt((V_0-E) slash E))) / (sqrt(m E)). $ <L-formula>

Electric current is the flow of electrons. In our samples, the current will be
proportional to the number of electrons that can tunnel through the potential
barrier and thus to the transmission probability. Therefore, we study the
current--voltage relationship of the samples.

= Method

In the experiment, the current--voltage relationship of four liquid nitrogen-cooled samples (A, B, C, D) of GaAs/InGaAs heterostructures#footnote[Two single-barrier structures (GaAs--InGaAs--GaAs) and two double-barrier structures (GaAs--InGaAs--GaAs--InGaAs--GaAs).] are measured using a computer-controlled variable voltage source, an ammeter and a voltmeter connected according to the circuit diagram in @circuit. The voltage is swept from 0 to $tilde qty("1", "V")$ (depending on the sample) in steps of around $qty("20", "mV")$ and the current is recorded.

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
) <circuit>

The constants listed in @constants, conveyed by an oracle#footnote[The lab instructor.], are used in the later analysis.

#figure(
  table(
    stroke: (
      x: none,
      y: .5pt,
    ),
    columns: 3,
    align: (
      left,
      right,
      left,
    ),
    [*Description*], [*Symbol*], [*Value*],
    [Electron mass], $m_e$, qty("9.109e-31", "kg"),
    [Effective electron mass in GaAs], $m^*$, $num("0.067") m_e$,
    [Barrier height], $V_0$, $qty("200", "meV")$,
    [Relative voltage drop in samples], $gamma$, $num("0.30")$,
  ),
  caption: [Lab-specific constants used in the calculations.],
) <constants>

= Results

The results obtained are plotted in the following figures.

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

= Analysis

The plots of samples A and B show a peak in the current at a certain voltage $U_A$ and $U_B$, respectively. This is characteristic of double barrier structures, where certain voltages correspond to resonances in the potential well formed by the barriers. Hence, we can use @L-formula derived earlier to calculate the width of the well for samples A and B. With $m=m^*$ and $E=gamma q U slash 2$ and the constants listed in @constants, we get

#let UA = interesting.at("A").at(0)
#let UB = interesting.at("B").at(0)
#let planck = 6.626e-34
#let pred = planck / (2 * calc.pi)
#let me = 9.109e-31
#let meff = 0.067 * me
#let q = 1.602e-19
#let V0 = 200e-3 * q
#let gamma = 0.3

#let E(U) = gamma * q * U / 2
#let L(U) = pred * calc.sqrt(2) * calc.atan(calc.sqrt((V0 - E(U)) / E(U))).rad() / calc.sqrt(meff * E(U))

#let LA = L(UA)
#let LB = L(UB)

$
  L_A&=qty(#str(calc.round(LA * 1e11) / 1e2), "nm")\
  L_B&=qty(#str(calc.round(LB * 1e11) / 1e2), "nm").
$

Samples C and D do not exhibit the same current peaks as A and B, which suggests that they are single barrier structures. Since the current for the same voltage is much lower in D than in C, we can conclude that the barrier in D is higher than in C.

= Discussion

(TODO)

The amperage of sample D is extremely low. Also, it is nonzero with a
voltage bias of 0 which suggests that there is a significant relative error
in the measurement.

#bibliography("bibliography.bib", style: "american-physics-society")

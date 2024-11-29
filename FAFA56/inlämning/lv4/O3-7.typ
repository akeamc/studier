#import "../template.typ": o
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => o(ch: 3, n: "7", doc)

#set enum(numbering: "1.")

#let sketch(data, V2: 1) = canvas({
  plot.plot(
    size: (12, 8),
    y-min: 0,
    y-max: 1,
    x-tick-step: none,
    x-label: $E$,
    y-label: $T$,
    y-tick-step: 0.1,
    x-ticks: if V2 == none {
      ()
    } else {
      ((V2, $V_2$),)
    },
    y-format: T => num(str(T).replace(".", ",")),
    axis-style: "school-book",
    {
      plot.add(data, domain: (0, 1.5), samples: 300)
      plot.add-hline(1, style: (stroke: (dash: "dashed", thickness: 0.5pt)))
    },
  )
})

2. #[
    Eftersom vågen reflekteras fram och tillbaka inuti brunnen förekommer resonanser, och eftersom brunnens högra kant är högre än den vänstra kommer inga vågor med lägre energi än $V_2$ att transmitteras.

    #let V2 = 0.5

    #sketch(
      V2: V2,
      E => if E < V2 {
        0
      } else {
        1 - calc.pow(calc.cos((E - V2) * 10), 2) * calc.exp(-3 * (E - V2))
      },
    )
  ]
+ #[
    Brunnens högra kant är lägre än dess vänstra, så alla $E$ kommer att ge ett $T>0$. Återigen förekommer resonanser, av samma anledning som ovan.

    #sketch(V2: none, E => 1 - calc.pow(calc.cos(E * 10), 2) * calc.exp(-3 * E))
  ]

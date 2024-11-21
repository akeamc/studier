#import "../template.typ": o
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => o(ch: 3, n: "2", doc)

+ $R+T=1$ eftersom reflektans och transmittans är varandras komplementhändelser.
+ #[
    När $E$ går mot oändligheten torde språnget bli försumbart litet i förhållande till $E$, dvs $T -> 1$.

    #rect(stroke: none, fill: gray.lighten(80%))[
      Vid ett negativt potentialsprång (med höjden $V_0$) är sannolikheten för reflektans $ R=((k-K)/(k+K))^2=((sqrt(E)-sqrt(E+V_0))/(sqrt(E)+sqrt(E+V_0)))^2 $

      för en partikel med vågtalen $k$ och $K$ innan respektive efter språnget, vilket kan skrivas om med den ursprungliga energin $E$ och potentialsprångets höjd $V_0$. Enligt (a) är $T=1-R$.
    ]

    Vi betraktar gränsvärdet $lim_(E->infinity)R$:

    $
      R=((cancel(sqrt(E))(1-sqrt(1-V_0/E))) / (cancel(sqrt(E))(1+sqrt(1+V_0/E))))^2 ->(
        (1-1) / (1+1)
      )^2=0 "då" E->infinity.
    $

    *Färdigbetraktat.* När $E$ går mot oändligheten går reflektansen mot 0 och transmittansen mot 1 (enligt villkoret i (a)).
  ]
+ #[
    Gränslöst stora $V_0$ borde rimligen få reflektansen att gå mot 1.

    Vi studerar $lim_(V_0->infinity) R$:

    $
      R=( (cancel(sqrt(V_0))(sqrt(E/V_0)-sqrt(E/V_0+1))) / (cancel(sqrt(V_0))(sqrt(E/V_0)+sqrt(E/V_0+1))) )^2 -> (
        (0-1) / (0+1)
      )^2=1 "då" V_0->infinity.
    $

    *Färdigstuderat.* När $V_0$ går mot oändligheten går reflektansen mot 1 (och transmittansen mot 0).
  ]
+ #[
    Nedan skissas $T$ som funktion av $E$.

    #let V_0 = 1
    #let k = (E, V) => calc.sqrt(E + V)
    #let f = E => 1 - calc.pow((k(E, 0) - k(E, V_0)) / (k(E, 0) + k(E, V_0)), 2)

    #canvas({
      import draw: *

      set-style(
        axes: (stroke: .5pt, tick: (stroke: .5pt)),
        grid: (stroke: 1pt),
        legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%),
      )

      plot.plot(
        size: (12, 8),
        x-tick-step: none,
        x-ticks: ((V_0, $ V_0 $),),
        y-min: 0,
        y-max: 1,
        x-label: $ E $,
        y-label: $ T $,
        y-format: v => num(str(v).replace(".", ",")),
        axis-style: "school-book",
        x-grid: "both",
        y-grid: "both",
        {
          plot.add(f, domain: (0, V_0 * 1.5), samples: 300)
        },
      )
    })
  ]
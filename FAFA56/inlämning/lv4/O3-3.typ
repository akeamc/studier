#import "../template.typ": o
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => o(ch: 3, n: "3", doc)


#figure(
  canvas({
    import draw: *

    let V0 = 1
    plot.plot(
      size: (12, 6),
      axis-style: "school-book",
      x-tick-step: none,
      y-tick-step: none,
      y-ticks: ((V0, $V_0$),),
      y-label: $V(x)$,
      y-max: V0 * 1.2,
      {
        plot.add(((-1, 0), (0, 0), (0, V0), (1, V0)), style: (stroke: red))
        plot.annotate({
          content((-V0 / 2, 0.5), [I])
          content((V0 / 2, 0.5), [II])
        })
      },
    )
  }),
)

$ V(x)=cases(0\, quad &x<0 quad "(I)", V_0\, quad &x>0 quad "(II)") $

#let I = $upright("I")$
#let II = $upright("II")$

+ #[
    $ -hbar^2 / (2m) psi_#I ''(x)+V(x) psi_#I (x)=E psi_#I (x) $

    I område I är $V(x)=0$ så, med det lokala $k_#I=sqrt(2 m E slash hbar^2)$, kan Schrödingerekvationen skrivas om enligt

    $
      &psi_#I ''+k_#I^2 psi_#I=0\
      <=>& psi_#I (x)=A exp(i k_#I x) + B exp(-i k_#I x).
    $

    I område II är $V(x)=V_0$. Den tidsoberoende Schrödingerekvationen blir alltså

    $ -hbar^2 / (2m)psi_#II ''(x)+V_0 psi_#II (x)=E psi_#II (x). $

    Vi inför det lokala vågtalet $k_#II=sqrt(2m(E-V_0) slash hbar^2)$ och skriver om ekvationen:

    $
      &psi_#II ''+k_#II^2 psi=0\
      <=>&psi_#II (x)=C exp(i k_#II x)+D exp(-i k_#II x).
    $

    Eftersom vågen antas komma från vänster måste $D=0$.

    Passningsvillkoren säger att $psi$ och $psi'$ måste vara kontinuerliga, dvs

    $ cases(psi_#I (0)&=psi_#II (0), psi_#I '(0)&=psi_#II '(0)). $
  ]
+ #[
    $
      T&=(4 k_#I k_#II) / (k_#I+k_#II)^2\
      R&=((k_#I - k_#II) / (k_#I + k_#II))^2
    $
  ]
+ #[


    Vi har

    $ T=k_#II / k_#I abs(C/A)^2. $

    För att hitta $C/A$ betraktar vi passningsvillkoren:

    $
      cases(
        psi_#I (0)&=psi_#II (0),
        psi_#I '(0)&=psi_#II '(0)
      )
      <=> cases(
        A+B&=C,
        i k_#I (A-B)&=i k_#II C
      )\
      => i k_I (A-cancel(B))+i k_I (A+cancel(B))=i k_II C+i k_I C\
      => 2 i k_I A=i C(k_II + k_I)\
      => (2 k_I A) / (k_II + k_I)=2 / (1+k_#II / k_#I)A=C.
    $

    Amplituden $C$ förhåller sig alltså till $A$ på samma sätt som för negativa potentialsteg, så transmittansen har samma uttryck, dvs.

    $
      T=(4k_#I k_#II) / (k_#I+k_#II)^2
      =(4sqrt((cancel(2m) E)/cancel(hbar^2))sqrt((cancel(2m)(E-V_0))/cancel(hbar^2))) / (
        sqrt((cancel(2m) E)/cancel(hbar^2))+sqrt((cancel(2m)(E-V_0))/cancel(hbar^2))
      )^2
      =(4 sqrt(E(E-V_0))) / (sqrt(E)+sqrt(E-V_0))^2
    $

    #let V0 = 1
    #let T3(E) = 4 * calc.sqrt(E) * calc.sqrt(E - V0) / calc.pow(calc.sqrt(E) + calc.sqrt(E - V0), 2)

    #let k = (E, V) => calc.sqrt(E + V)
    #let T2 = E => 1 - calc.pow((k(E, 0) - k(E, V0)) / (k(E, 0) + k(E, V0)), 2)

    #figure(
      canvas({
        import draw: *

        plot.plot(
          size: (12, 6),
          x-tick-step: none,
          x-ticks: ((V0, $ V_0 $),),
          y-min: 0,
          y-max: 1,
          x-label: $ E $,
          y-label: $ T $,
          y-format: v => num(str(v).replace(".", ",")),
          axis-style: "school-book",
          x-grid: "both",
          y-grid: "both",
          legend: "inner-east",
          legend-style: (stroke: none),
          {
            plot.add(
              T3,
              domain: (V0, V0 * 2),
              samples: 300,
              label: $T_"uppgift 3"$,
            )
            plot.add(
              T2,
              domain: (0, V0 * 2),
              samples: 300,
              label: $T_"uppgift 2"$,
            )
          },
        )
      }),
    )
  ]
+ #[
  $ R+T=1. $
]

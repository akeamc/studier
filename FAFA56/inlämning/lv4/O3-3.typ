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

+ #[
    #let I = $upright("I")$
    #let II = $upright("II")$
    #set math.equation(numbering: "(1)")

    $ psi(x,t)=exp(-i omega t) phi.alt(x) $

    $ -hbar^2 / (2m) phi.alt''(x)+V(x) phi.alt(x)=E phi.alt(x) $

    I område I är $V(x)=0$ så, med det lokala $k_#I=sqrt(2 m E slash hbar^2)$, kan Schrödingerekvationen skrivas om enligt

    $
      &phi.alt_#I ''+k_#I^2 phi.alt_#I=0\
      <=>& phi.alt_#I (x)=A exp(i k_#I x) + B exp(-i k_#I x).
    $

    I område II är $V(x)=V_0$. Den tidsoberoende Schrödingerekvationen blir alltså

    $ -hbar^2 / (2m)phi.alt''(x)+V_0 phi.alt(x)=E phi.alt(x). $ <SE-II>

    Vi inför det lokala vågtalet $k_#II=sqrt(2m(E-V_0) slash hbar^2)$ och skriver om @SE-II: 

    $ &phi.alt''+k_#II^2 phi.alt=0\
    <=>&phi.alt(x)=C exp(i k_#II x)+D exp(-i k_#II x). $

    Passningsvillkoren säger att $psi$ och $psi'$ måste vara kontinuerliga:
  ]

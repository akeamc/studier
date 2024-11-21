#import "../template.typ": assignment, planck, light, infint, conj
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => assignment(answer: doc, book: none, no: "1.2")

$ psi_1(x)=A e^(i(k+b)x), quad psi_2(x)=B e^(i(k x+alpha)), quad A, B, k, b, alpha in RR $

1. #[
  Den resulterande vågen $psi$ ges av
  
  $ psi(x)&=psi_1(x)+psi_2(x) $

  så sannolikhetstätheten $rho$ är

  $ rho(x)&=abs(psi(x))^2=(psi_1(x)+psi_2(x))(conj(psi_1(x))+conj(psi_2(x)))\
  &= A^2+B^2 + A B underbracket((e^(i(k+b)x) e^(-i(k x+alpha)) + e^i(k x+alpha) e^(-i(k+b)x)), e^i(beta-gamma)+e^i(gamma-beta)=2 cos (beta-gamma))\
  &= A^2+B^2+2 A B cos(b x - alpha). $
]
2. #[
  Om $b=0$ försvinner $x$-termen från $rho$, så funktionen blir konstant. Ingenting händer alltså när detektorn flyttas.
]
3. #[
  Med $b=qty("1000", "m^-1")$, $A=B=1$ och $alpha=0$ ser grafen för $rho(x)$ ut på följande vis:

  #let prob = x => {
    let A = 1
    let k = 0.001
    let b = 1000
    let B = 1
    let alpha = 0

    let real = A * calc.cos((k+b)*x) + B * calc.cos(k*x+alpha)
    let imag = A * calc.sin((k+b)*x) + B * calc.sin(k*x+alpha)

    real * real + imag * imag
  }

  #canvas({
      import draw: *

      // Set-up a thin axis style
      set-style(
        axes: (stroke: .5pt, tick: (stroke: .5pt)),
      )

      plot.plot(
        size: (12, 3),
        x-label: $ x /("mm") $,
        x-format: v => num(str(v * 1000)),
        x-tick-step: 1e-3,
        y-label: $ rho(x) $,
        y-tick-step: none,
        axis-style: "school-book",
        {
          plot.add(prob, domain: (0.005, 0.0155), samples: 300)
          plot.add-vline(0.01,)
        },
      )
    })

    Sannolikheten varierar alltså med positionen $x$.
]
+ #[
  Interferensmönstret visar $rho(x)=A^2+B^2+2 A B cos(b x-alpha)$, så det går att härleda $b$ från mönstrets utseende. Närmare bestämt gäller det att

  $ b=(2pi)/d $

  där $d$ är avståndet mellan två intilliggande maximum.

  #line(length: 100%, stroke: 0.5pt)

  Våglängd $lambda$ och vågtal $k$ hänger ihop enligt $lambda=2pi slash k$. Vågfunktionerna har varsin våglängd

  $ psi_1: quad  lambda_1&=(2pi)/(k+b) "och"\
  psi_2: quad lambda_2&=(2pi)/k. $

  Låt $lambda_2=qty("50,00", "nm")$ och $b=qty("1000", "m^-1")$. Vi har

  $ lambda_2=(2pi)/k <=> k=(2pi)/lambda_2 <=> lambda_1=(2pi)/(2pi slash lambda_2+b) $

  så våglängdsdifferensen är

  $ lambda_1-lambda_2=(2 pi)/((2pi)/qty("50,00e-9", "m") +qty("1000", "m^-1"))-qty("50,00e-9", "m")=qty("-0,4000", "pm"). $
]

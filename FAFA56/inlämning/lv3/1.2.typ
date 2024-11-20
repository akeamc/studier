#import "../template.typ": assignment, planck, light, infint
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => assignment(answer: doc, book: none, no: "1.2")

$ psi_1(x)=A exp(i(k+b)x), quad psi_2(x)=B exp(i(k x+alpha)), quad A, B, k, b, alpha in RR $

1. #[
  Den resulterande vågen $psi$ ges av
  
  $ psi(x)&=psi_1(x)+psi_2(x)=A exp(i k x) exp(i b x)+B exp(i k x)exp(i alpha)\
  &=A B exp(i k x)[exp(i b x)+exp(i alpha)]. $

  Sannolikhetstäten $rho$ ges i sin tur av

  $ rho(x)=abs(psi(x))^2=abs(A B exp(i k x)[exp(i b x)+exp(i alpha)])^2. $

  #text(size: 2em, fill: red)[Oklar (på mer än ett sätt)]

  // $ rho(x)&=abs(psi(x))^2=abs(psi_1(x)+psi_2(x))^2=abs(A exp(i(k+b)x)+B exp(i(k x+alpha)))^2\
  // &=abs(A cos((k+b)x)+A i sin((k+b)x)+B cos(k x+alpha)+B i sin(k x+alpha))^2\
  // &=underbracket((A cos((k+b)x)+B cos(k x+alpha)), Re psi(x))^2+underbracket((A sin((k+b)x)+B sin(k x+alpha)), Im psi(x))^2 $
]
2. #[
  Om $b=0$ kan vågfunktionen $psi$ förenklas till

  $ psi_1(x)+psi_2(x)=A exp(i k x)+B exp(i(k x+alpha))=exp(i k x)(A+B exp(alpha)), $

  alltså en stående våg. Sannolikhetstätheten $rho$ är densamma överallt, ty $rho(x)=abs(psi(x))^2=abs(A+B exp(alpha))$, så ingenting händer när detektorn flyttas.
]
3. #[
  Med $b=qty("1000", "m^-1")$, $A=B=1$ och $alpha=0$ ser grafen ut på följande vis:

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
        size: (12, 8),
        x-label: $ x space ("mm") $,
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

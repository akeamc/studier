#import "../template.typ": assignment, planck, light, I, II, III
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => assignment(answer: doc, book: none, no: "X")

#figure(
  canvas({
    import draw: *

    let V0 = 1
    let a = 0.5

    plot.plot(
      size: (12, 6),
      axis-style: "school-book",
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: ((a, $a$),),
      y-ticks: ((V0, $V_0$),),
      y-label: $V(x)$,
      y-max: V0 * 1.2,
      {
        plot.add(((-a / 2, 0), (0, 0), (0, V0), (a, V0), (a, 0), (a * 1.5, 0)), style: (stroke: red))
        plot.annotate({
          content((-a / 4, V0 / 2), [I])
          content((a / 2, V0 / 2), [II])
          content((a * 1.25, V0 / 2), [III])
        })
      },
    )
  }),
)

$psi$ har följande lösningar för respektive område:

$
  psi_#I (x)&=A e^(i k x)+B e^(-i k x)\
  psi_#II (x)&=C e^(i kappa x)+D e^(-i kappa x)\
  psi_#III (x)&=F^(i k x)
$

$A$, $C$ och $F$ är amplituder för högergående vågor; $B$ och $D$ för vänstergående. Vågtalet $k$ är detsamma i område I och III; $ k=sqrt(2m E)/hbar. $ Inuti brunnen, i område II, är vågtalet $ kappa=sqrt(2 m (E-V_0))/hbar. $ Eftersom ingen våg infaller från höger $(x>a)$ finns ingen $e^(-i k x)$-term i $psi_#III$. Passningsvillkoren lyder

$
  cases(
    A+B&=C+D,
    i k(A-B)&=i kappa(C-D),
    C e^(i kappa a)+D e^(-i kappa a)&=F e^(i k a),
    i kappa(C e^(i kappa a)-D e^(-i kappa a))&=i k F e^(i k a)
)
$

och vi söker $F/A="transmitterad sannolikhetsström"/"infallande sannolikhetsström"$.

Låt $alpha=i k$, $beta=i kappa$, $gamma=e^(i kappa a)$ och $delta=e^(i k a)$.

$ alpha(A+B+A-B)&=alpha(C+D)+beta(C-D)\
=> 2 alpha underbracket(A, = 1)&=C(alpha+beta)+D(alpha-beta)\
=> (2 alpha-C(alpha+beta))/(alpha-beta)&=D $

$ C gamma+(2 alpha -C(alpha+beta))/gamma(alpha-beta)=F delta\
=> (C gamma+(2 alpha - C(alpha+beta))/(gamma(alpha-beta)))/delta=F $

 Ekvationssystemet kan skrivas om som matrisekvationen

$
  mat(
    1,1,-1,-1, 0;
    i k, -i k, i kappa, -i kappa, 0;
    0, 0, e^(i kappa a), e^(-i kappa a), e^(i k a);
    0, 0, i kappa e^(i kappa a), -i kappa e^(-i kappa a), i k e^(i k a)
) mat(A;B;C;D;F)
=underbrace(mat(
    1,1,-1,-1,0;
    alpha,-alpha,beta,-beta,0;
    0,0,gamma,1 slash gamma, delta;
    0, 0, beta gamma, -beta slash gamma, alpha delta
), A) mat(A;B;C;D;F)=mat(0;0;0;0;0).
$

Gausseliminering av $A$ ger

$
  A ~ mat(
    1,1,-1,-1,0;
    0, -2alpha, alpha+beta, alpha-beta, 0;
    0, 0, gamma, 1 slash gamma, delta;
    0, 0, 0, -2beta slash gamma, alpha delta-beta delta
  )\
  => (-2 beta slash gamma) D+(alpha delta-beta delta)F=0
$

Transmittansen ges av .

#import "../template.typ": assignment, planck, light, infint, conj, me
#import "@preview/unify:0.6.0": qty, num
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => assignment(answer: doc, book: none, no: "1.4")

Man önskar att en elektron i en oändlig brunn ska sända ut en foton med energin #qty("3,2", "eV") när den övergår från det tredje exciterade tillståndet till grundtillståndet.

+ Vilken bredd ska brunnen ha?
+ Vilken färg har det utsända ljuset?

#line(length: 100%)

Vi vet att energinivåerna i en oändligt djup brunn ges av $E_n=(n^2 h^2)/(8 m L^2)$ där $n in ZZ^+$ är kvanttalet, $L$ är brunnens bredd och $m=#me$ är elektronens massa.

+ #[
  Vi vill att $ qty("3,2", "eV")=E_3-E_1=(3^2-1^2)(h^2/(8 m L^2))\
  <=> L=(h sqrt(3^2-1^2))/sqrt(8m dot qty("3,2", "eV"))=planck/sqrt(me dot qty("3,2", "eV") dot qty("1,602", "J/eV"))=qty("970", "pm"). $
]
+ #[
  Det gäller att $qty("1240", "eV nm")=lambda E$ för $lambda$ i nanometer och $E$ i elektronvolt. Därmed är $lambda=qty("1240", "eV nm")/qty("3,2", "eV")=qty("387,5", "nm")$; ultraviolett.
]

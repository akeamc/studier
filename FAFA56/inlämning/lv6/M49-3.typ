#import "../template.typ": m, e
#import "@preview/unify:0.6.0": qty, num

#show: doc => m(ch: 49, n: "3", doc)

Vi har $ p(E)=1/(e^((E-E_F) slash k T) + 1) $

och söker

$ p(E_F+qty("1", "eV"))=1/(exp(qty("1", "eV") slash (qty("1,38e-23", "J/K") dot qty("300", "K"))) + 1) approx 10^(-18) $

Svar: *(D)*.

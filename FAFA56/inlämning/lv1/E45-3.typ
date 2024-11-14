#import "../template.typ": e, nm_to_ev
#import "@preview/unify:0.6.0": qty

#show: doc => e(ch: 45, n: "3", doc)

Energin bevaras, så den absorberade energin ges av differensen mellan den ingående och utgående fotonens energi. Vi utnyttjar sambandet $E=#nm_to_ev/lambda$ och får den absorberade energin till

$ #nm_to_ev/qty("375", "nm")- #nm_to_ev/qty("580", "nm")=qty("1,17", "eV"). $

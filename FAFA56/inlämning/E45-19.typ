#import "./template.typ": e, nm_to_ev
#import "@preview/unify:0.6.0": qty

#show: doc => e(ch: 45, n: "19", doc)

Frågan är vilka $lambda$ som motsvarar en energi om minst $E_"min"$. Vi har

$ E_"min" &<= #nm_to_ev/lambda\
 <=> lambda&<=#nm_to_ev/E_"min"=#nm_to_ev/#qty("2,28", "eV")=#qty("544", "nm"). $

#set enum(numbering: "a)")

1. $qty("678", "nm")>qty("544", "nm")$ så nej -- det röda ljuset har för låg energi.
2. $qty("544", "nm")$; gröngult.

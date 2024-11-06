#import "./template.typ": e
#import "@preview/unify:0.6.0": qty, num

#show: doc => e(ch: 41, n: "39", doc)

Varje ring motsvarar en halv våglängds förflyttning av spegeln, så $n$ ringar torde motsvara $n$ halva våglängders förflyttning. Låt $lambda$ vara ljusets våglängd, $d$ spegelns förflyttning och $n$ antalet ringar. Då gäller att

$ n lambda/2=d <=> lambda = (2n)/d = (2 dot #qty("0,233e-3", "m"))/num("792")=qty("588", "nm"). $

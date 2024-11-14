#import "../template.typ": m, e
#import "@preview/unify:0.6.0": qty, num

#show: doc => m(ch: 46, n: "4", doc)

#set enum(numbering: "(a)")

+ #[
  Maximumen i interferensmönstret kommer att ligga på vinklar $theta$ från centralaxeln där $d sin theta=lambda n$, $n in ZZ$. För elektroner (och alla andra partiklar) gäller $lambda=h/(m v)$ (de Broglievåglängd), så

  $ d sin theta=(h n)/(m v). $

  Spaltbredden $d$, ordningstalet $n$, partikelmassan $m$ och Plancks konstant $h$ är konstanta, så om $v$ ökar kommer $sin theta$ (och därmed $theta$) att minska. Detta betyder att maximumen kommer att flyttas närmare centralaxeln. Svar: *(B)*.
]
+ #[
  Protonens massa är cirka #num("1000") gånger större än elektronens, så $theta$ kommer återigen att minska (nu är $v$ konstant istället för $m$). Svar: *(B)*.
]

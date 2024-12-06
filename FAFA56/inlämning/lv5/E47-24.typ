#import "../template.typ": m, e, planck, light, rinf, me
#import "@preview/unify:0.6.0": qty, num
#import "@preview/cetz:0.3.1": canvas, draw

#show: doc => e(ch: 47, n: "24", doc)

Rydbergs formel säger att den emitterade fotonens våglängd $lambda$ förhåller sig till den initiala energinivån $N$ och den slutliga $n$ enligt

$ 1/lambda = R_infinity (1/n - 1/N) $

där $R_infinity=rinf$ är Rydbergs konstant.

Vi vet även att fotonens rörelsemängd ges av $ p=h/lambda $

och tillsammans med Rydbergs formel får vi

$ p=R_infinity h (1/n-1/N). $

Eftersom rörelsemängden bevaras så måste väteatomens (med massan $m$) rörelsemängd $m v$ förändras med samma belopp, vilket ger oss en formel för hastighet(sändring)en $v$:

$ v = (R_infinity h)/m (1/N-1/n)=(rinf dot planck)/me (1-1/4)=qty("5984", "m/s"). $

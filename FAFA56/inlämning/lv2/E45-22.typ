#import "../template.typ": m, e, planck, light
#import "@preview/unify:0.6.0": qty

#show: doc => e(ch: 45, n: "22", doc)

#set enum(numbering: "(a)")

Stoppotentialen $U$, våglängden $lambda$ och utträdesarbetet $Phi$ hänger ihop enligt

$ e U=(h c)/lambda-Phi $

där $e$ är elementarladdningen.

1. #[
  Vi har en ursprunglig våglängd $lambda_1=qty("491", "nm")$, en ursprunglig stopponential $U_1=qty("710", "mV")$, en ny (okänd) våglängd $lambda_2$ och en ny stoppotential $U_2=qty("1,43", "V")$. Ovanstående ekvation låter oss ställa upp ekvationssystemet

  $ cases(
    e U_1=(h c)/lambda_1-Phi,
    e U_2=(h c)/lambda_2-Phi
  ) $

  och lösa ut $lambda_2$ genom att subtrahera den första ekvationen från den andra. Vi får
  
  $ e(U_2-U_1)=& h c(1/lambda_2-1/lambda_1)\
  <=> e(U_2-U_1)/(h c) + 1/lambda_1=& 1/lambda_2\
  <=> lambda_2=&(e(U_2-U_1)/(h c)+1/lambda_1)^(-1)\
  =& ((qty("1,602e-19", "C")(qty("1,43", "V")-qty("710e-3", "V")))/(planck dot light) + 1/qty("491e-9", "m"))^(-1)\
  =& qty("382", "nm"). $
]
2. #[
  Vi använder våra kända värden för $lambda_1$ och $U_1$ för att beräkna utträdesarbetet $Phi$:

  $ e U_1=(h c)/lambda_1-Phi\ <=> Phi=&(h c)/lambda - e U_1\
  =& (planck dot light)/qty("491e-9", "m")-qty("1,602e-19", "C") dot qty("710e-3", "V")\
  =& qty("2,91e-19", "J")=qty("1,82", "eV"). $
]

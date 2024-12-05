#import "@preview/unify:0.7.0": qty, unit, num

#set text(lang: "sv")
#set enum(numbering: "0a)")

+ #[
  Vi har
  
  $ lambda_"dB" slash unit("m")=a_1/sqrt(m E_k slash unit("kg J")). $
 
  de Broglie-våglängden $lambda_"dB"$ beräknas enligt $ lambda_"dB"=h/sqrt(2 m E_k). $

  Eftersom $unit("m")$, $unit("kg")$ och $unit("J")$ är SI-grundenheter så måste det gälla att $a_1=h/sqrt(2)$ med enhet $unit("J s")$.

  #line(length: 100%, stroke: 0.5pt)

  $ lambda_"dB" slash unit("nm")=a_1/sqrt(2 m E_k slash m_e unit("eV")) $

  Jämförelse med SI-formen för $lambda_"dB"$ ger

  $ a_2&=qty("1e9", "nm/m") qty("6.626e-34", "Js")/sqrt(2 dot qty("9,109e-31", "kg") dot qty("1,602e-19", "J/eV"))\
  &=qty("1,227", "nm eV^-0,5") space m_e^(-0,5) $
]
+ #[
  $ lambda_e=qty("1,227", "")/sqrt(num("1") dot m_e dot qty("10", "eV"))=qty("0,39", "nm"). $

  #line(length: 100%, stroke: 0.5pt)

  $ lambda_p=qty("1,227", "")/sqrt(num("1836") dot m_e dot qty("1", "keV"))=qty("0,91", "pm"). $
]
+ #[
  $ E=(h c)/lambda=b_1/lambda $ så $b_1=h c=qty("1,986e-25", "J m")$ och $b_2=qty("1240", "eV nm")$. 
]
+ #[
  - $qty("380", "nm")$ motsvarar $qty("3,263", "eV")$,
  - $qty("750", "nm")$ motsvarar $qty("1,653", "eV")$.
]
+ #[
  
]

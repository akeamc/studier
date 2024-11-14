#import "../template.typ": m, e, planck, light
#import "@preview/unify:0.6.0": qty

#show: doc => e(ch: 45, n: "20", doc)

Vi har våglängden $lambda=qty("200", "nm")$ och utträdesarbetet $Phi=qty("4,2", "eV")$.

#[

  #set math.equation(numbering: "(1)")

  Einsteins fotoelektriska ekvation lyder $ h f=Phi+K_"max" $ <einstein>
]

där $f=(h c)/lambda$ är fotonens frekvens och $K_"max"$ är den maximala kinetiska energi som den frigjorda foto-?elektronen kan ha.

#set enum(numbering: "(a)")

+ Vi löser ut $K_"max"$ ur @einstein: $ K_"max"=h f-Phi&=(h c)/lambda-Phi\
&=(planck dot light)/qty("200e-9", "m")-qty("4,2", "eV") dot qty("1,602e-19", "J/eV")\
&=qty("3,20e-19", "J")=qty("2,00", "eV") $
+ Utträdesarbetet är energin som krävs för att frigöra elektronerna med högst potentiell energi; kort sagt de som befinner sig längst från atomkärnan. De elektronerna kommer att få den högsta kinetiska energin, medan elektronerna längre in kommer att få mindre kinetisk energi. Hur mycket mindre energi de kommer få är svårt att säga endast utifrån uppgiftens information.
+ Stoppotentialen $U$ anger den elektriska potential som krävs för att till och med de mest energirika fotoelektronerna ska bli av med all sin rörelseenergi; vi vill omvandla all kinetisk energi till elektrisk potentialenergi $e U$ (där $e$ är elementarladdningen). Det ger $ e U=K_"max" <=> U=K_"max"/e=#qty("2,00", "eV")/(1 space upright("e"))=qty("2,00", "V"). $
+ Fotonens energi $(h c)/lambda$ är omvänt proportionell mot $lambda$, så vi söker ett $lambda_"max"$ sådant att fotonens energi är _precis_ tillräckligt stor för att frigöra en elektron. Detta sker då $(h c)/lambda=Phi$, dvs. då all energi går åt till utträdesarbetet och ingen blir över till kinetisk energi. Från @einstein får vi $ (h c)/lambda_"max"=Phi <=> lambda_max=(h c)/Phi=(planck dot light)/(qty("4,2", "eV") dot qty("1,602e-19", "J"))=qty("295", "nm"). $

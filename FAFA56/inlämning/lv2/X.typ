#import "../template.typ": assignment, planck, light
#import "@preview/unify:0.6.0": qty

#show: doc => assignment(answer: doc, book: none, no: "X")

1. #[
    Vi kallar laserstrålens "stationära" våglängd för $lambda_0=qty("588.9950", "nm")$, den skenbara våglängden (ur Na-atomernas perspektiv) för $lambda$ och Na-atomernas hastighet för $v=qty("500", "m/s")$. Eftersom $v<<c$ kan vi använda sambandet $ lambda=lambda_0(1-v/c)=qty("588,9950", "nm")(1-qty("500", "m/s")/light)=qty("588,9940", "m/s"). $
  ]
2. #[
    När en Na-atom (med massan $m=qty("23,000", "u")$) absorberar en foton med våglängden $lambda$ bevaras den sammanlagda rörelsemängden. Fotonen har rörelseenergin $-h/lambda$ (ty dess hastighet är motriktad atomen). Låt $tilde(v)$ vara atomens hastighet efter absorptionen. Vi har

    $
      m v-h / lambda&=m tilde(v)\
      <=> m tilde(v)-m v&=-h / lambda\
      <=> underbracket(tilde(v)-v, Delta v) &= -h / (lambda m)=-h / (lambda_0(1-v / c)m)\
      &=planck / (qty("588,9950e-9", "m") dot (
        1-qty("500", "m/s") / light
      ) dot qty("23,000", "u") dot qty("1,661e-27", "kg") )\
      &=qty("-2,95e-2", "m/s")=qty("-2,95", "cm/s").
    $

    När den exciterade elektronen återgår till sitt grundtillstånd emitterar den (minst) en foton och återigen bevaras rörelsemängden. Notera dock att den nya fotonen har en slumpmässig riktning, så i genomsnitt kommer rörelsemängdsändringen från alla emitterade fotoner att vara noll.
  ]
3. #[
  När atomen bromsas kommer den skenbara våglängden att gå från $lambda$ till $lambda_0$. Skillnaden mellan de två våglängderna är försumbar, och vi vet ändå inte vilka absorptionslinjer som Na har, så vi kan anta att varje absorberad foton ger upphov till en lika stor hastighetsändring.

  Vi kan använda hastighetsändringen $Delta v$ från föregående deluppgift för att uppskatta hur många absorptioner som behövs:

  $ v + n Delta v=0 <=> n=(-v)/(Delta v)=qty("-500", "m/s")/(qty("-2,95e-2", "m/s")) approx qty("16900", "") $
]

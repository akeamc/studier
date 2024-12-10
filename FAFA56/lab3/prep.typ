#import "@preview/unify:0.7.0": qty, unit, num

#set text(lang: "sv")
#set enum(numbering: "0a)")

#let a2 = $qty("1,227", "nm eV^-0,5") m_e^(-0,5)$

+ #[
    Vi har

    $ lambda_"dB" slash unit("m")=a_1 / sqrt(m E_k slash unit("kg J")). $

    de Broglie-våglängden $lambda_"dB"$ beräknas enligt $ lambda_"dB"=h/sqrt(2 m E_k). $

    Eftersom $unit("m")$, $unit("kg")$ och $unit("J")$ är SI-grundenheter så måste det gälla att $a_1=h/sqrt(2)$ med enhet $unit("J s")$.

    #line(length: 100%, stroke: 0.5pt)

    $ lambda_"dB" slash unit("nm")=a_1 / sqrt(2 m E_k slash m_e unit("eV")) $

    Jämförelse med SI-formen för $lambda_"dB"$ ger

    $
      a_2&=qty("1e9", "nm/m") qty("6.626e-34", "Js") / sqrt(2 dot qty("9,109e-31", "kg") dot qty("1,602e-19", "J/eV"))\
      &=a2 space m_e^(-0,5)
    $
  ]
+ #[
    $ lambda_e=a2 / sqrt(num("1") dot m_e dot qty("10", "eV"))=qty("0,39", "nm"). $

    #line(length: 100%, stroke: 0.5pt)

    $ lambda_p=a2 / sqrt(num("1836") dot m_e dot qty("1", "keV"))=qty("0,91", "pm"). $
  ]
+ #[
    $ E=(h c) / lambda=b_1 / lambda $ så $b_1=h c=qty("1,986e-25", "J m")$ och $b_2=qty("1240", "eV nm")$.
  ]
+ #[
    $qty("380", "nm")$ motsvarar $qty("3,263", "eV")$; $qty("750", "nm")$ motsvarar $qty("1,653", "eV")$ enligt formeln ovan ($E=qty("1240", "eV nm") slash lambda$).
  ]
+ #[
    Vi använder formeln framtagen i uppgift 0a:

    För en elektron: $a2 slash sqrt(1 m_e dot qty("3,263", "eV"))=qty("679", "nm")$ till $a2 slash sqrt(1 m_e dot qty("1,653", "eV"))=qty("954", "nm")$.

    För en proton: $a2 slash sqrt(num("1836") m_e dot qty("3,263", "eV"))=qty("15,6", "nm")$ till $a2 slash sqrt(num("1836") m_e dot qty("1,653", "eV"))=qty("22,3", "nm")$.
  ]
+ #[
    $ E_T=k T=#qty("1,380e-23", "J/K") dot qty("300", "K")=qty("4,14e-21", "J")=qty("25", "meV"). $
  ]
+ #[
    Vi har $E_T=k T$ och $lambda=h c slash E$ så $ lambda=(h c)/(k T). $

    #figure(
      table(
        columns: 3,
        stroke: (
          x: none,
          y: 0.5pt,
        ),
        align: (right, right, left),
        [*Temperatur*], [*Våglängd*], [*"Färg"*],
        ..(
          (300, "IR"),
          (4, "Mikrovågor"),
          (0.1, "Mikrovågor"),
          (5800, "IR"),
        ).map(((T, color)) => {
          let wavelength = 6.626e-34 * 3e8 / (1.38e-23 * T)

          (qty(str(T).replace(".", ","), "K"), qty(str(calc.round(wavelength * 1e6)), "um"), [#color])
        }).flatten()
      ),
    )
  ]
  + #[
      #set enum(numbering: "(a)")
      #let planck = qty("6,626e-34", "J s")

      + #[
          För en partikel i en oändlig potentialbrunn gäller det att

          $ E_n=(h^2 n^2) / (8 m a^2). $

          Vi vet att $n=1$ (grundtillståndet) och $m=#qty("9,109e-31", "kg")$, och söker $a$ så att $E_1=qty("0,1", "eV")$. Så

          $
            a=(h n) / sqrt(8 m E_n)=(planck) / (sqrt(8 dot qty("9,109e-31", "kg") dot qty("0,1", "eV") dot qty("1,602e-19", "J/eV")))=qty("1,939", "nm").
          $
        ]
      + #[
          Vi söker

          $ E_2-E_1=h^2 / (8 m a^2)(2^2-1^2)=(3 h^2) / (8 m a^2)=3E_1=qty("0,3", "eV"). $
        ]
    ]

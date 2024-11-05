#import "template.typ": conf, lecture, hr, ex, obs, sats, anm
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty
#import "@preview/cetz:0.2.2": canvas, draw, plot

#show: doc => conf("FMAB70", [Endimensionell analys], doc)

= Föreläsningar

#lecture(
  2024,
  11,
  4,
  [Komplexa tal],
)[
  #figure(
    canvas(
      {
        import draw: *

        let a = (0, 0)
        let b = (5, 0)
        let c = (2, 2)

        let d = (-0.5, 3.5)
        let e = (4.5, 4.5)

        let m = (2.5, 0)

        line(a, b, c, close: true)
        line(a, (-2.4, 1.5), d, c, close: true)
        line(b, (7.2, 2.5), e, c, close: true)

        line(c, m, stroke: orange, name: "l1")
        line(d, e, stroke: green, name: "l2")

        content(a, anchor: "north", padding: 5pt, $A$)
        content(b, anchor: "north", padding: 5pt, $B$)
        content(c, anchor: "west", padding: 8pt, $C$)
        content(d, anchor: "south", padding: 5pt, $D$)
        content(e, anchor: "south", padding: 5pt, $E$)

        content("l1.mid", anchor: "east", padding: 5pt, text(fill: orange, $l_1$))
        content("l2.mid", anchor: "south-east", padding: 5pt, text(fill: green, $l_2$))

        content("l1.end", anchor: "north", padding: 5pt, $M$)
      },
    ),
    caption: ["Som ett gammalt hus."],
  )

  $l_1$ är en median. Visa att $l_2=2 l_1$.

  Låt $z_1 = C A$ och $z_2=C B$. Då är $C D=-i z_1$ och $C E=i z_2$. Vi har att $D E=i(z_1+z_2)$ och $C M=1/2(z_1+z_2)$.

  #hr

  Komplexa tal har formen $a+b i$ där $a, b in RR$, $i^2=-1$.

  = Användning

  - $ integral cos^4 x dd(x) \ cos^4 x = ((e^(i x) + e^(-i x))/2)^4 $
  - $ y''+4y'+13y=0\ lambda^2+4lambda+13=0\ lambda=-2plus.minus 3 i \ y=e^(-2x)(A cos 3x+B sin 3x) $

  = Multiplikation

  Givet $z=(a+b i)$ -- vad händer med $(2+3 i)z$ i det komplexa talplanet?

  $ (2+3i)(a+b i)=(2a-3b)+i(2b+3a)\
  arrow.squiggly.long E=m c^2 + "AI" $

  Komplexa tal kan skrivas $ z=a+b i=r(cos theta + i sin theta) $
  där $r=abs(z)=sqrt(a^2+b^2)$ och $theta=arg(z)=arctan(b/a)$.

  Givet $w, z in CC$ kan $w z$ tolkas som en skalning av $z$ med $abs(w)$ följt av
  en rotation med $arg(w)$.

  = Argument för komplexa tal

  #emoji.face.surprise *Argumentet är ej entydigt!*

  $-pi < op("Arg") z <= pi$ kallas principalargumentet. Det gäller alltså att $arg z = op("Arg") + 2pi k$ där $k in ZZ.$

  = Argument mot komplexa tal

  = Konjugat

  $ abs(z)^2=z overline(z) $

  $ 1/z:=overline(z)/(abs(z)^2) $

  $ w/z:=w 1/z=(w overline(z))/(abs(z)^2)=(w overline(z))/(z overline(z)) $

  = Geometriska exempel

  #ex([
    Vad beskriver
    + ${z in CC | Re z + Im z = 1}$
    + ${z in CC | |z-1-i|=2}$
  ])[
    + En rät linje.
    + En cirkel med mittpunkt i $(1+i)$ och radie 2.
  ]

  Givet $z=x+i y$ och $w=xi+i eta$ är $abs(z-w)=sqrt((x-xi)^2+(y-eta)^2)$.

  #text(font: "Monsieur La Doulaise")[TP är en special treatment.]

  Triangelolikheten gäller även för komplexa tal:

  $ abs(z+w)^2&=(z+w)overline((z+w))\
            &=(z+w)(overline(z)+overline(w))\
            &=z overline(z)+z overline(w) + w overline(z) + w overline(w)+abs(w)^2 \
            &=abs(z)^2+z overline(w)+overline(overline(w+overline(z)))+abs(w)^2 \
            &=abs(z)^2+z overline(w)+overline(z overline(w))+abs(w)^2 \
            &=abs(z)^2+2 Re(z overline(w))+abs(w)^2\
            &<=abs(z)^2+2abs(z overline(w))+abs(w)^2\
            &=abs(z)^2+2abs(z)abs(overline(w))+abs(w)^2\
            &=abs(z)^2+2abs(z)abs(w)+abs(w)^2\
            &<=(abs(z)+abs(w))^2\
            &<=> abs(z+w)<=abs(z)+abs(w) $
]

#lecture(
  2024,
  11,
  5,
  [René Descartes],
)[
  = Komplex exponentialfunktion

  För $z=x+i y$, där $x, y in RR$, låter vi

  $ e^z=exp(z):=e^x (cos y+i sin y). $

  #obs(
    [
      - Om $z in RR$ får vi vår tidigare definition av exponentialfunktionen!
      - $exp$ blir periodisk med period $2 pi i$.
    ],
  )

  Uppfyller $ exp(z+w)=exp(z)exp(w) $ <expsum> och $ exp(0)=1. $

  Om man inte har något annat för sig ikväll kan man visa @expsum med
  additionsformler för trigonometriska funktioner.

  $exp(z)$ har en invers då $-pi < Im z <= pi$ och $z != 0$:

  $ log z=ln(abs(z))+i arg(z). $

  Lägg märke till att det finns flera $arg(z)$.

  #obs[
    Komplexa potensfunktioner $ z^w:=exp(w log z) $ kan anta flera värden eftersom $log z$ är
    flervärt.

    "Jag vill att ni ska akta er för att skriva komplexa tal upphöjt till andra
    komplexa tal."
  ]

  #hr

  $x+i y$ rektangulär form.

  $ z: abs(z)=2, space "ett" arg z=(5pi)/4\
  z=2underbrace((cos (5pi)/4+i sin (5pi)/4), exp(i (5pi)/4))=2e^(i (5pi)/4), quad e^(i theta)=cos theta+i sin theta\
  z=abs(z)e^(i arg z)=r e^(i theta) $

  #ex([Skriv $z=1+sqrt(3) i $ på polär form.])[
    $ r     &=abs(z)=sqrt(1^2+sqrt(3)^2)=2\
    arg z &= arctan(sqrt(3)/1)=pi/3\
    z     &=1+sqrt(3)i=2e^(i pi/3) $
  ]

  #ex([$theta in RR.$ Visa att $overline(e^(i theta))=e^(-i theta)$])[
    $ overline(e^(i theta))&=overline(cos theta+i sin theta)\
                         &=cos theta - i sin theta\
                         &=cos(-theta)+i sin(-theta)\
                         &=e^(-i theta) space qed $
  ]

  #ex([$abs(e^i theta)=1$])[
    $ abs(e^(i theta))^2&=e^(i theta)overline(e^(i theta))\
                      &=e^(i theta) e^(-i theta)\
                      &=e^(i theta - i theta)\
                      &=e^0=1\
    abs(e^(i theta))  &=1 space qed $
  ]

  = Multiplikation

  Med $z_1=r_1 e^(i theta_1)$ och $z_2=r_2 e^(i theta_2)$ är

  $ z_1 z_2=r_1 r_2 e^(i (theta_1+theta_2)) $

  så absolutbelopp multipliceras och argument adderas.

  #obs[
    $e^(i theta) z$ roterar $z$ med en vinkel $theta$.
  ]

  #ex(
    [En regelbunden 12-hörning med medelpunkt ($z=1 + i$) har ett hörn i $w=2$. Var
      finns grannhörnen?],
  )[
    #let W = text(size: 1.5em, $W$)

    Låt $ underbrace(#W, "stora" W)=w-z=1-i. $

    Grannhörnen finns i $ e^(i (2pi)/12) #W+z $ och $ e^(-i (2pi)/12) #W+z. $
  ]

  #sats(
    [De Moivres formel],
  )[
    För $n in ZZ$, $theta in RR$ gäller det att

    $ e^(i n theta)=(e^(i theta))^n. $

    Om man känner sig lite lurig kan man i stället skriva

    $ cos(n theta)+i sin(n theta)=(cos theta+i sin theta)^n. $

    Vi kan visa detta genom induktion.

    $n=2$: $ e^(i 2 theta)=e^(i theta+i theta)=e^(i theta) e^(i theta)=(e^i theta)^2 $

    $n<0$: $ e^(i n theta)=1/(e^(-i n theta))=1/((e^(i theta))^(-n))=(e^(i theta))^n $
  ]

  #ex(
    [Skriv $cos 4 theta$ som ett polynom i $cos theta$ (är det ens möjligt??)],
  )[
    $ cos 4 theta&=Re(cos 4theta + i sin 4theta)\
               &=Re((cos theta+i sin theta)^4)\
               &=Re[mat(4;0)cos^4 theta + underbracket(mat(4;1)cos^3 theta i sin theta, "försvinner") + mat(4;2)cos^2 theta (i sin theta)^2 +
    underbracket(mat(4;3) cos theta+(i sin theta)^3, "försvinner") + mat(4;4) (i sin theta)^4]\
               &=cos^4 theta-6cos^2 theta sin^2 theta+sin^4 theta\
               &=cos^4theta-6cos^2(1-cos^2theta)+(1-cos^2 theta)^2\
               &=dots.c=8cos^4theta-8cos^2theta+1. $

    Polynomet blev $T_4(x)=8x^4-8x^2+1$. Detta är det fjärde Tjebysjovpolynomet.
  ]

  #sats([Eulers formler])[
    $ theta in RR: quad cos theta&=(e^(i theta)+e^(-i theta))/2\
    sin theta                  &=(e^(i theta)-e^(-i theta))/(2i) $
  ]

  #anm[
    Vi kan nu definiera $cos$ och $sin$ på hela $CC$.
  ]

  #ex(
    [Skriv om $cos^4 theta$ som vi gjorde igår!],
  )[
    $ cos^4 theta
      &=((e^(i theta)+e^(-i theta))/2)^4
    =(
    overbracket(e^(i theta)^4, e^(4 i theta))
    +4overbracket((e^i theta)^3e^(-i theta), e^(2 i theta))
    +6overbracket((e^i theta)^2(e^(-i theta))^2, 1)
    +4overbracket(e^(i theta)(e^(-i theta))^3, e^(-2 i theta))
    +overbracket((e^(-i theta))^4, e^(-4 i theta))
    )/16\
      &=1/8 (e^(4 i theta)+e^(-4 i theta))/2+1/2 (e^(2 i theta)+e^(-2 i theta))/2+6/16\
      &=1/8 cos(4 theta)+1/2 cos(2 theta) + 3/8. $
  ]

  = Hur man kommer ihåg trigonometriska formler

  $ cos(theta+phi)+i sin(theta+phi)&=e^(i (theta+phi))=e^(i theta)e^(i phi) \
                                 &=(cos theta+ i sin theta)(cos phi+i sin phi)\
                                 &=(cos theta cos phi-sin theta sin phi)+i(cos theta sin phi+sin theta cos phi) $

  Jämför vi realdel och imaginärdel får vi de vanliga trigonometriska
  additionsformlerna.

  = Hjälpvinkelmetoden

  $ Im(a+ i b)(cos theta+i sin theta)&=a sin theta+b cos theta\
                                   &=Im(a+i b)e^(i theta)\
                                   &=Im sqrt(a^2+b^2)e^(i arg(a+i b)+theta)\
                                   &=sqrt(a^2+b^2)sin(arg(a+i b)+theta) $
]

#import "template.typ": conf, lecture, hr
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty
#import "@preview/cetz:0.2.2": canvas, draw, plot

#show: doc => conf("FMAB66", [Endimensionell analys], doc)

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

  - ${z in CC | Re z + Im z = 1}$ beskriver en rät linje i det komplexa talplanet.
  - ${z in CC | |z-1-i|=2}$ beskriver en cirkel med mittpunkt i $(1+i)$ och radie $2$.

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

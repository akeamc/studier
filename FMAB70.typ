#import "template.typ": conf, lecture, hr, ex, obs, sats, anm, fplot
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty, unit
#import "@preview/cetz:0.3.1": canvas, draw, angle
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => conf("FMAB70", [Endimensionell analys], doc)

= Föreläsningar

#lecture(
  2024,
  11,
  4,
  [Komplexa tal],
)[
  #figure(
    canvas({
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
    }),
    caption: ["Som ett gammalt hus."],
  )

  $l_1$ är en median. Visa att $l_2=2 l_1$.

  Låt $z_1 = C A$ och $z_2=C B$. Då är $C D=-i z_1$ och $C E=i z_2$. Vi har att $D E=i(z_1+z_2)$ och $C M=1/2(z_1+z_2)$.

  #hr

  Komplexa tal har formen $a+b i$ där $a, b in RR$, $i^2=-1$.

  = Användning

  - $ integral cos^4 x dd(x) \ cos^4 x = ((e^(i x) + e^(-i x)) / 2)^4 $
  - $ y''+4y'+13y=0\ lambda^2+4lambda+13=0\ lambda=-2plus.minus 3 i \ y=e^(-2x)(A cos 3x+B sin 3x) $

  = Multiplikation

  Givet $z=(a+b i)$ -- vad händer med $(2+3 i)z$ i det komplexa talplanet?

  $
    (2+3i)(a+b i)=(2a-3b)+i(2b+3a)\
    arrow.squiggly.long E=m c^2 + "AI"
  $

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

  $ 1 / z:=overline(z) / (abs(z)^2) $

  $ w / z:=w 1 / z=(w overline(z)) / (abs(z)^2)=(w overline(z)) / (z overline(z)) $

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

  $
    abs(z+w)^2&=(z+w)overline((z+w))\
    &=(z+w)(overline(z)+overline(w))\
    &=z overline(z)+z overline(w) + w overline(z) + w overline(w)+abs(w)^2 \
    &=abs(z)^2+z overline(w)+overline(overline(w+overline(z)))+abs(w)^2 \
    &=abs(z)^2+z overline(w)+overline(z overline(w))+abs(w)^2 \
    &=abs(z)^2+2 Re(z overline(w))+abs(w)^2\
    &<=abs(z)^2+2abs(z overline(w))+abs(w)^2\
    &=abs(z)^2+2abs(z)abs(overline(w))+abs(w)^2\
    &=abs(z)^2+2abs(z)abs(w)+abs(w)^2\
    &<=(abs(z)+abs(w))^2\
    &<=> abs(z+w)<=abs(z)+abs(w)
  $
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

  #obs([
    - Om $z in RR$ får vi vår tidigare definition av exponentialfunktionen!
    - $exp$ blir periodisk med period $2 pi i$.
  ])

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

  $
    z: abs(z)=2, space "ett" arg z=(5pi) / 4\
    z=2underbrace((cos (5pi)/4+i sin (5pi)/4), exp(i (5pi)/4))=2e^(i (5pi) / 4), quad e^(i theta)=cos theta+i sin theta\
    z=abs(z)e^(i arg z)=r e^(i theta)
  $

  #ex([Skriv $z=1+sqrt(3) i $ på polär form.])[
    $
      r &=abs(z)=sqrt(1^2+sqrt(3)^2)=2\
      arg z &= arctan(sqrt(3)/1)=pi / 3\
      z &=1+sqrt(3)i=2e^(i pi / 3)
    $
  ]

  #ex([$theta in RR.$ Visa att $overline(e^(i theta))=e^(-i theta)$])[
    $
      overline(e^(i theta))&=overline(cos theta+i sin theta)\
      &=cos theta - i sin theta\
      &=cos(-theta)+i sin(-theta)\
      &=e^(-i theta) space qed
    $
  ]

  #ex([$abs(e^i theta)=1$])[
    $
      abs(e^(i theta))^2&=e^(i theta)overline(e^(i theta))\
      &=e^(i theta) e^(-i theta)\
      &=e^(i theta - i theta)\
      &=e^0=1\
      abs(e^(i theta)) &=1 space qed
    $
  ]

  = Multiplikation

  Med $z_1=r_1 e^(i theta_1)$ och $z_2=r_2 e^(i theta_2)$ är

  $ z_1 z_2=r_1 r_2 e^(i (theta_1+theta_2)) $

  så absolutbelopp multipliceras och argument adderas.

  #obs[
    $e^(i theta) z$ roterar $z$ med en vinkel $theta$.
  ]

  #ex([En regelbunden 12-hörning med medelpunkt ($z=1 + i$) har ett hörn i $w=2$. Var
    finns grannhörnen?])[
    #let W = text(size: 1.5em, $W$)

    Låt $ underbrace(#W, "stora" W)=w-z=1-i. $

    Grannhörnen finns i $ e^(i (2pi)/12) #W+z $ och $ e^(-i (2pi)/12) #W+z. $
  ]

  #sats([De Moivres formel])[
    För $n in ZZ$, $theta in RR$ gäller det att

    $ e^(i n theta)=(e^(i theta))^n. $

    Om man känner sig lite lurig kan man i stället skriva

    $ cos(n theta)+i sin(n theta)=(cos theta+i sin theta)^n. $

    Vi kan visa detta genom induktion.

    $n=2$: $ e^(i 2 theta)=e^(i theta+i theta)=e^(i theta) e^(i theta)=(e^i theta)^2 $

    $n<0$: $ e^(i n theta)=1/(e^(-i n theta))=1/((e^(i theta))^(-n))=(e^(i theta))^n $
  ]

  #ex([Skriv $cos 4 theta$ som ett polynom i $cos theta$ (är det ens möjligt??)])[
    $
      cos 4 theta&=Re(cos 4theta + i sin 4theta)\
      &=Re((cos theta+i sin theta)^4)\
      &=Re[
        mat(4;0)cos^4 theta + underbracket(mat(4;1)cos^3 theta i sin theta, "försvinner") + mat(4;2)cos^2 theta (
          i sin theta
        )^2 +
        underbracket(mat(4;3) cos theta+(i sin theta)^3, "försvinner") + mat(4;4) (i sin theta)^4
      ]\
      &=cos^4 theta-6cos^2 theta sin^2 theta+sin^4 theta\
      &=cos^4theta-6cos^2(1-cos^2theta)+(1-cos^2 theta)^2\
      &=dots.c=8cos^4theta-8cos^2theta+1.
    $

    Polynomet blev $T_4(x)=8x^4-8x^2+1$. Detta är det fjärde Tjebysjovpolynomet.
  ]

  #sats([Eulers formler])[
    $
      theta in RR: quad cos theta&=(e^(i theta)+e^(-i theta)) / 2\
      sin theta &=(e^(i theta)-e^(-i theta)) / (2i)
    $
  ]

  #anm[
    Vi kan nu definiera $cos$ och $sin$ på hela $CC$.
  ]

  #ex([Skriv om $cos^4 theta$ som vi gjorde igår!])[
    $
      cos^4 theta
      &=((e^(i theta)+e^(-i theta)) / 2)^4
      =(
      overbracket(e^(i theta)^4, e^(4 i theta))
      +4overbracket((e^i theta)^3e^(-i theta), e^(2 i theta))
      +6overbracket((e^i theta)^2(e^(-i theta))^2, 1)
      +4overbracket(e^(i theta)(e^(-i theta))^3, e^(-2 i theta))
      +overbracket((e^(-i theta))^4, e^(-4 i theta))
      ) / 16\
      &=1 / 8 (e^(4 i theta)+e^(-4 i theta)) / 2+1 / 2 (e^(2 i theta)+e^(-2 i theta)) / 2+6 / 16\
      &=1 / 8 cos(4 theta)+1 / 2 cos(2 theta) + 3 / 8.
    $
  ]

  = Hur man kommer ihåg trigonometriska formler

  $
    cos(theta+phi)+i sin(theta+phi)&=e^(i (theta+phi))=e^(i theta)e^(i phi) \
    &=(cos theta+ i sin theta)(cos phi+i sin phi)\
    &=(cos theta cos phi-sin theta sin phi)+i(cos theta sin phi+sin theta cos phi)
  $

  Jämför vi realdel och imaginärdel får vi de vanliga trigonometriska
  additionsformlerna.

  = Hjälpvinkelmetoden

  $
    Im(a+ i b)(cos theta+i sin theta)&=a sin theta+b cos theta\
    &=Im(a+i b)e^(i theta)\
    &=Im sqrt(a^2+b^2)e^(i arg(a+i b)+theta)\
    &=sqrt(a^2+b^2)sin(arg(a+i b)+theta)
  $
]

#lecture(2024, 11, 8, [Komplexa polynomekvationer])[
  #ex([$p(x)=x^2+1$ saknar reella nollställen])[]

  #ex([$p(x)$ av udda grad med reella koefficienter har alltid ett reellt nollställe (satsen om mellanliggande värden).])[]

  #sats([Algebrans fundamentalsats])[
    Varje icke-konstant polynom har (minst) ett #underline[komplext] nollställe. Följd: ett polynom av grad $n$ har exakt $n$ nollställen. Kanske med multiplicitet.

    *Bevisskiss:*

    - Reducera till en disk, $abs(z)<R$: $abs(p(z))>=C abs(z)^n$ om $abs(z)>R$.
    - $z |-> p(z)$ är kontinuerlig.
    - $abs(p(z))$ kontinuerlig på ${z in CC; abs(z) <= R}$ så antar minsta värde där.
    - Om $abs(p(d))>0$ så finns $z$ nära $d$ så att $abs(p(z))<abs(p(d))$.

    *Bevisskiss 2:*

    Fixera $R$.

    $ R e^(i t), quad 0<=t<=2 pi $

    $ R e^(n i t), quad 0<=t<=2 pi $

    $ p(z)=a_n z^n+a_(n-1)z^(n-1)+dots.c+a_1 z+a_0 quad a_0 !=0 $

    $ p(R e^(i t)) approx a_1 R e^(i t)+a_0 $

    $R$ litet -- liten cirkel kring $a_0$

    $R$ stort -- stor cirkel kring origo

    $R$ någonstans mittemellan -- cirkel som skär $0$ (ty cirkeln går från liten till stor på ett kontinuerligt vis).
  ]

  #sats([])[
    Om $p$ har reella koefficienter så är $ p(z)=0 <=> p(overline(z))=0. $

    *Bevis*: $overline(p(z))=p(overline(z))$
  ]

  #sats([])[
    Om $p$ har reella koefficienter så kan vi faktorisera $p$ i reella faktorer, där varje faktor har grad högst 2.

    *Bevis:* Om $p(alpha)=0$ så är $p(overline(alpha))=0$ och därmed är $(z-alpha)$ och $(z-overline(alpha))$ faktorer i $p$.

    $
      (z-alpha)(z-overline(alpha))=z^2-(
        alpha+overline(alpha)
      )z+alpha overline(alpha)=z^2-2 Re(alpha) z+abs(alpha)^2 in RR
    $
  ]

  #ex([Faktorisera $p(z)=z^3-8z^2+22z-20$ dels över $CC$, dels över $RR$.])[
    Om $z=a/b$ så $a|20$ och $b|1$. Möjliga rationella nollställen är $plus.minus 1$, $plus.minus 2$, $plus.minus 4$, $plus.minus 5$, $plus.minus 10$, $plus.minus 20$.

    $z=2$ fungerar.

    Polynomdivision ger $p(z)=(z-2)(z^2-6z+10)=(z-2)(z-3-i)(z-3+i)$.

    Över $CC$: $p(z)=(z-2)(z-3-i)(z-3+i)$.

    Över $RR$: $p(z)=(z-2)(z^2-6z+10)$.
  ]

  $
    z+a=b quad &ZZ\
    a z=b quad &QQ\
    z^2=b, b>0 quad &RR\
    p(z)=0 quad &CC
  $

  $CC$ är algebraiskt slutet!

  #ex([Lös ekvationen $z^2=5+2i$.])[
    Ansätt $z=a+b i$.

    $
      (a+b i)^2=a^2-b^2+2a b i=5+12 i\
      cases(
      Re\: a^2-b^2&=5,
      Im\: 2a b&=12,
      "Abs"\: a^2+b^2&=sqrt(5^2+12^2)=13
    )
    $

    #underline[Re + Abs:] $2a^2=5+13=18$ så $a=plus.minus 3$.

    #underline[Im:] $a=3$ ger $b=2$; $a=-3$ ger $b=-2$.

    Så vi får lösningarna $ z_2&=3+2 i\ z_2&=-3-2i. $

    #canvas(
      length: 0.5cm,
      {
        import draw: *

        grid((-5, -4),(7, 14), stroke: gray + 0.5pt)

        let vec = (a, b) => {
          line((0, 0), (a, b))
          content(
            (a, b),
            anchor: if a > 0 {
              "south"
            } else {
              "north"
            },
            $#a+#b i$,
          )
        }

        vec(5, 12)
        vec(3, 2)
        vec(-3, -2)
      },
    )
  ]

  #ex([$p(z)=z^2-(2+4 i)z-8-8i=0$])[
    Reducera till föregående fall med kvadratkomplettering.

    $
      p(z)&=(z-(1+2i))^2-(1+2i)^2-8-8i\
      &=(underbracket(z-(1+2i), w))^2-5-12i=0\
      w&=z-(1+2i)\
      w^2&=5+12i
    $

    ger

    $
      w_1=3+2 quad w_2=-3-2i\
      z=w+(1+2i)\
      z_1=4+4i quad z_2=-2.
    $
  ]

  #ex([Binomisk ekvation $z^5=-1+i$])[
    Polär form! Ansätt $z=r e^(i theta)$.

    $
      z^5=-1+i <=> r^5 e^(i 5 theta)&=sqrt(2)e^(i (3pi) / 4)\
      cases(
      "abs:" r^5=sqrt(2),
      "arg:" 5theta=3pi/4+2pi k quad  k in ZZ sect [0, 4]
    )\
      r&=2^(1 slash 10)\
      theta_k&=(3pi) / 20+(2pi k) / 5 quad k in ZZ sect [0, 4]
    $
    #canvas(
      length: 2cm,
      {
        import draw: *

        grid((-1.5, -1.5),(1.5, 1.5), stroke: gray + 0.5pt, step: 0.25)

        let vec = (a, b) => {
          line((0, 0), (a, b))
        }

        let r = calc.pow(2, 0.1)
        for k in (0, 1, 2, 3, 4) {
          let theta = 3 * calc.pi / 20 + 2 * calc.pi * k / 5
          let a = r * calc.cos(theta)
          let b = r * calc.sin(theta)

          vec(a, b)
        }
      },
    )
  ]

  = Partialbråksuppdelning

  $
    &10 / (z-1)^2-6 / (z-1)+(3+i) / (z+1+i)+(3-i)(z+1-i)\
    =&10 / (z-1)^2-6 / (z-1)+(6z+8) / (z^2+2x+2)\
    =&(10z+40) / ((z-1)^2(z^2+2z+2))
  $

  Partialbråksuppdelning: att gå från botten till toppen.

  #sats([])[
    Antag $c in CC$, $n in NN$, $p, q$ polynom sådana att $p(c)!=0$, $q(c) != 0$. Då finns $A$ (=$p(c)/q(c)$) och polynom $s$ så att $ p(z)/((z-c)^n (q(z)))=A/((z-c)^n)+s(z)/((z-c)^(n-1)q(z)). $

    Vid räkningar: upprepa induktivt.
  ]

  #ex([])[
    $
      (10z+40) / ((z-1)^2 (z^2+2z+2))=&A / (z-1)^2+s(z) / ((z-1)(z^2+2z+2))\
      =&A / (z-1)^2+B / (z-1)+(tilde(s)(z)) / (z^2+2z+2)
    $
  ]
]

#lecture(2024, 11, 25, [Längd av funktionskurva])[
  #canvas({
    let a = 1
    let b = 5

    let parts = 5
    let px = k => a + k * (b - a) / parts

    plot.plot(
      size: (12, 8),
      x-tick-step: none,
      x-min: a - 1,
      x-max: b + 1,
      y-tick-step: none,
      axis-style: "school-book",
      x-grid: true,
      x-ticks: ((a, $a=x_0$), ..range(1, parts).map(k => (px(k), $x_#k$)), (b, $b=x_#parts$)),
      {
        plot.add(x => 0.1 * (x - 3) * (x - 5) * (x - 1) + 3, domain: (a - 1, b + 1))
        plot.add-vline(a, style: (stroke: (dash: "dashed")))
        plot.add-vline(b, style: (stroke: (dash: "dashed")))
      },
    )
  })

  $ y=f(x) $

  $ a=x_0<x_1<x_2<dots.c<x_n=b $

  Polygontåg som har längd $ sum_(k=1)^n sqrt((x_k-x_(k-1))^2+(f(x_k)-f(x_(k-1)))^2) $

  $y=f(x)$ är rektifierbar om

  $ sup sum_(k=1)^n sqrt((x_k-x_(k-1))^2+(f(x_k)-f(x_(k-1)))^2) $

  existerar. Kurvans längd är då supremumet.

  #sats([])[
    Om $f'$ är kontinuerlig på $[a,b]$ så har kurvan $y=f(x)$, $a<=x<=b$ längden $ integral_a^b sqrt(1+f'(x)^2) dd(x). $

    *Bevisskiss:*

    Vill skriva om längden av polygontåg som riemannsumma för den påstådda integralen.

    $
      S&=sum_(k=1)^n sqrt((x_k-x_(k-1))^2+(f(x_k)-f(x_(k-1)))^2)\
      &= sum_(k=1)^n sqrt(1+((f(x_k)-f(x_(k-1)))/(x_k-x_(k-1)))^2)(x_k-x_(k-1))
    $

    Medelvärdessatsen för derivator ger oss $xi_k$ i $(x_(k-1), x_k)$ så att $ (f(x_k)-f(x_(k-1)))/(x_k-x_(k-1)))=f'(xi_k) $

    så $ S_n=sum_(k=1)^n sqrt(1+f'(xi_k)^2)(x_k - x_(k-1)) --> integral_a^b sqrt(1+f'(x)^2) dd(x). $

    $S_n$ är strängt växande så $S=sup S_n$.
  ]

  #ex([Bestäm omkretsen av en cirkel med radie $R_0$.])[
    $ x^2+y^2=R_0^2 $

    #figure(
      canvas({
        import draw: *

        let R0 = 2

        grid((-2 * R0, 2 * R0), (-2 * R0, 2 * R0), step: 0.5, stroke: black)

        circle((0, 0), radius: R0)

        let R0s2 = R0 / calc.sqrt(2)
        arc-through((-R0s2, R0s2), (0, R0), (R0s2, R0s2), close: true, stroke: 2pt + red)
        angle.angle((0, 0), (-1, 1), (1, 1), label: $pi slash 2$, label-radius: 0.75)
        line((-R0s2, R0s2), (0, 0), (R0s2, R0s2))
      }),
    )

    $
      O&=4integral_(-R_0 slash sqrt(2))^(R_0 slash sqrt(2)) sqrt(1+[D sqrt(R_0^2-x^2)]^2) dd(x)\
      &=4 integral_(-R_0 slash sqrt(2))^(R_0 slash sqrt(2)) sqrt(1+(x/(sqrt(R_0^2-x^2)))^2) dd(x)\
      &=4 integral_(-R_0 slash sqrt(2))^(R_0 slash sqrt(2)) sqrt(R_0^2/(R_0^2-x^2)) dd(x)\
      &=4 integral_(-R_0 slash sqrt(2))^(R_0 slash sqrt(2)) R_0 / sqrt(R_0^2-x^2) dd(x)\
      &=[4 R_0 arcsin(x/R_0)]_(-R_0 slash sqrt(2))^(R_0 slash sqrt(q))\
      &=4 R_0 underbracket(arcsin 1/sqrt(2), =pi/4)-4 R_0 underbracket(arcsin(- 1/sqrt(2)), =-pi/4)=360 degree R_0
    $
  ]

  Nu gör vi samma sak igen fast vi är mindre rigorösa.

  $
    (Delta s)^2&=(Delta x)^2+(Delta y)^2\
    Delta s&=sqrt(1 + ((Delta y)/(Delta x))^2) Delta x.
  $

  Bågelement

  $ dd(s)=sqrt(1+(dd(y)/dd(x))^2) dd(x). $

  Längden $s$ blir:

  $ S=integral dd(s)=integral_a^b sqrt(1+f'(x)^2) dd(x). $

  = Längd av parametriserade kurvor

  $ S=integral_alpha^beta sqrt(X'(t)^2+Y'(t)^2) dd(t). $

  #ex([Omkrets av cirkel med radie $R_0$])[
    $
      cases(
      x=X(t)=R_0 cos t,
      y=Y(t)=R_0 sin t
    ) #h(4em) 0<=t<=2pi\
    X'(t)=-R_0 sin t quad Y'(t)=R_0 cos t\
    sqrt(X'(t)^2+Y'(t)^2)=R_0
    $

    Omkretsen

    $ O=integral_0^(2pi) R_0 dd(t)=2pi R_0. $
  ]

  #ex([Icke rektifierbar kurva])[
    $ cases(x=X(t)=t, y=Y(t)=t sin pi/t) $

    #canvas({
      let f = t => if t == 0 {
        0
      } else {
        t * calc.sin(calc.pi / t)
      }

      plot.plot(
        size: (6, 8),
        x-tick-step: none,
        y-tick-step: none,
        axis-style: "school-book",
        {
          plot.add(f, samples: 2000, domain: (0, 0.2))
        },
      )
    })
  ]

  = Längd av kurvor på polär form

  $ X'(theta)^2+Y'(theta)^2=dots.c=R(theta)^2+R'(theta)^2 $

  obs. $"abs"(e^(i theta))=1$

  #ex([Cirkel med radie $R_0$])[
    $
      R(theta)=R_0 quad R'(theta)=0\
      O=integral_0^(2pi)sqrt(R_0^2+0^2)dd(theta)=2pi R_0.
    $

    Nu har vi beräknat omkretsen av en cirkel på tre olika sätt och alltid fått samma svar och det ska vi vara tacksamma för.
  ]

  #ex([Pascals snäcka])[
    $
      R(theta)&=1+cos theta\
      R'(theta)&=-sin theta
    $

    $
      "Längden"&=integral_0^(2pi) sqrt((1+cos theta)^2+(-sin theta)^2) dd(theta)\
      &=integral_0^(2pi) sqrt(2+2cos theta) dd(theta)=integral_0^(2pi) sqrt(4 cos^2 theta/2) dd(theta)\
      &=integral_0^(2pi) 2 abs(cos theta/2) dd(theta)=4 integral_0^pi cos theta / 2 dd(theta)=underbracket(dots.c, \""Nu vill jag också ha lunch"\")=8
    $
  ]
]

#lecture(2024, 11, 26, [Rotationsareor och -volymer])[
  Då $y=f(x)$, $a<=x<=b$ ($f>0$) roterar 1 _varf_ [sic!] kring x-axeln uppstår en rotationsarea.

  $
    Delta A&=2pi f(x) Delta s\
    dd(A)&=2pi f(x) dd(s)=2pi f(x) sqrt(1+f'(x)^2) dd(x)\
    => A&= integral_a^b 2pi f(x) sqrt(1+f'(x)^2) dd(x)
  $

  #ex([Bestäm arean som uppstår då $f(x)=sqrt(x), 1<=x<=4$ roterar ett varv kring x-axeln.])[
    #fplot(x => calc.sqrt(x), domain: (1, 4))

    $ f'(x)&=1 / (2 sqrt(x)) $

    så

    $
      A&=integral_1^4 2pi sqrt(x) sqrt(1+1/(4 x)) dd(x)=integral_1^4 2pi sqrt(x + 1/4) dd(x)\
      &=[2pi 2 / 3 (x+1 / 4)^(3 slash 2)]_1^4= dots.c=pi / 6 (17sqrt(17)-5sqrt(5)).
    $
  ]

  = Rotation kring y-axeln?

  $ A=integral_a^b 2pi x sqrt(1+f'(x)^2) dd(x) $

  #ex([Låt $y=f(x)=x^2$, $1<=x<=2$ rotera kring y-axeln.])[
    $ A=integral_1^2 2pi x sqrt(1+(2x)^2) dd(x)=[(2pi) / 8 2 / 3 (1+4x^2)^(3 slash 2)]_1^2="samma som förut" $
  ]

  #ex([Bestäm arean av en sfär med radie $R_0$.])[
    Vi roterar $y=sqrt(R_0-x^2)$ kring x-axeln:

    $ y'=(-x) / sqrt(R_0-x^2) <=> 1+(y')^2=R_0^2 / (R_0^2-x^2) $

    $
      A&=integral_(-R_0)^R_0 2pi sqrt(R_0^2-x^2)sqrt(R_0^2/(R_0^2-x^2)) dd(x)\
      &= integral_(-R_0)^R_0 2pi R_0 dd(x)=4 pi R_0^2
    $

    ... och kring y-axeln:

    $
      A&=2 integral_0^R_0 2pi x sqrt(R_0^2/(R_0^2-x^2)) dd(x)\
      &=4pi R_0 integral_0^R_0 x / sqrt(R_0^2-x^2) dd(x)\
      &= 4pi R_0[-sqrt(R_0^2-x^2)]_0^R_0=4pi R_0^2.
    $
  ]

  = Volym

  Skivformeln: $ V=integral_a^b V(x) dd(x). $

  #ex([Bestäm volymen av en ellipsoid med halvaxlar $a$, $b$ och $c$.])[
    $ x^2 / a^2+y^2 / b^2+z^2 / c^2=1 $

    Fixera $x_0$. Vad blir arean då vi skär med planet $x=x_0$?

    $ y^2 / b^2+z^2 / c^2=1-x^2 / a^2 $ beskriver en ellips. Våra halvaxlar blir

    $
      &b sqrt(1-x_0^2/a^2) "och"\
      &c sqrt(1-x_0^2/a^2).
    $

    En ellips med halvaxlarna $alpha$ och $beta$ har arean $pi alpha beta$ så tvärsnittet får arean

    $ A(x)=pi b c (1-x^2 / a^2). $

    Totala volymen blir $ V=integral_(-a)^a A(x) dd(x)=integral_(-a)^a pi b c (1-x^2/a^2) dd(x)=[pi b c (x-x^3/(3 a^2))]_(-a)^a= 4/3 pi a b c. $

    Speciellt ger $a=b=c=R_0$ volymen av ett klot; $4/3 pi R_0^3$.
  ]

  = Alternativa ellipsoidvolymsberäkningar

  Skal: $ V=integral_0^(R_0) 4 pi r^2 dd(r)=4/3 pi R_0^3 $

  Skalning av klot:

  Vi vet att klotets volym är $4/3 pi R_0^2$. Om vi skalar klotet med $a$, $b$ och $c$ i x-, y- respektive z-led så skalas volymen med determinanten av skalningsmatrisen, dvs.

  $ det mat(a, 0, 0; 0, a, 0; 0, 0, c)=a b c. $

  = Rörmetoden

  #ex([$y=x^2$, $0<=x<=2$ roterar kring y-axeln. Det uppstår en skål#footnote[Egentligen _paraboloid._]. Bestäm volymen.])[
    $ V=integral_0^2 2pi x (2^2 - x^2) dd(x)=8 pi $

    Alternativt låter vi $y=sqrt(x)$, $0 <= x <= 4$ rotera kring x-axeln.
  ]

  #ex([Vi har en tre meter hög skulptur. Ett tvärsnitt på höjden $x$ bildar en rektangel med sidorna $(1+x) unit("m")$, $(4-x) unit("m")$.])[
    $ "Volymen"=integral_0^3 A(x) dd(x)=integral_0^3 (1+x)(4-x) dd(x)=dots.c=33 / 2 unit("m^3"). $
  ]
]

#import "template.typ": conf, lecture, hr, ex, obs, sats, anm, fplot, slopefield
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty, unit
#import "@preview/cetz:0.3.1": canvas, draw, angle
#import "@preview/cetz-plot:0.1.0": plot
#import "@preview/suiji:0.3.0": *

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
      &=Re[ mat(4;0)cos^4 theta + underbracket(mat(4;1)cos^3 theta i sin theta, "försvinner") + mat(4;2)cos^2 theta ( i sin theta )^2 +
        underbracket(mat(4;3) cos theta+(i sin theta)^3, "försvinner") + mat(4;4) (i sin theta)^4 ]\
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
      (z-alpha)(z-overline(alpha))=z^2-( alpha+overline(alpha) )z+alpha overline(alpha)=z^2-2 Re(alpha) z+abs(alpha)^2 in RR
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

  $ det dmat(a, b, c)=a b c. $

  = Rörmetoden

  #ex([$y=x^2$, $0<=x<=2$ roterar kring y-axeln. Det uppstår en skål#footnote[Egentligen _paraboloid._]. Bestäm volymen.])[
    $ V=integral_0^2 2pi x (2^2 - x^2) dd(x)=8 pi $

    Alternativt låter vi $y=sqrt(x)$, $0 <= x <= 4$ rotera kring x-axeln.
  ]

  #ex([Vi har en tre meter hög skulptur. Ett tvärsnitt på höjden $x$ bildar en rektangel med sidorna $(1+x) unit("m")$, $(4-x) unit("m")$.])[
    $ "Volymen"=integral_0^3 A(x) dd(x)=integral_0^3 (1+x)(4-x) dd(x)=dots.c=33 / 2 unit("m^3"). $
  ]
]

#lecture(2024, 11, 29, [Gammal tenta])[
  #figure(image("myrlejonslända.jpeg", width: 20%), caption: [Myrlejonsländans larv, _"doodlebug"_.])
]

#lecture(2024, 12, 2, [Differentialekvationer (jippi!)])[
  _Maya min Maya, min bitska lilla piraja_

  Tre frågor:
  - existens
  - entydighet
  - regularitet.

  (Skånetrafiken är inget av ovanstående.)

  = Populationsmodeller

  $x=x(t)$ antalet fiskar i en sjö.

  = Malthus (1798)

  $x'=k x$ där $k>0$ är differensen mellan födslar och dödslar. Lösning $ x=C e^(k t). $

  #figure(slopefield(y => y))

  = Verhulst (1845)

  Den logistiska modellen: $ x'=(a-b x) x $

  Funktionen har ett stabilt och ett instabilt jämviktsläge.

  #figure(slopefield(y => (6 - y) * y))

  = Logistiska modellen med fiske

  Verhults modell fungerar fint om fisken får vara i fred.

  $ x'=(1-x) x-c $

  #figure(slopefield(y => (6 - y) * y - 5, y-lines: ((1, "Instabilt jämviktsläge"),)), caption: [Hållbart fiske.])

  #figure(slopefield(y => (7 - y) * y - 15), caption: [Överfiske.])

  = Fiskekvoter

  $ x'=(1-x)x-p x=(1-p-x)x $

  #let p = 5 * 0.5

  #figure(slopefield(y => (5 - p - y) * y))

  = Lite om det existentiella

  #ex([Visa att $x'=k x$ endast har lösningar på formen $x=C e^(k t)$ där $C in RR$.])[
    Inför $u=u(t)$ genom $ x=u e^(k t). $

    Om $x'=k x$ så:

    $ (x'=u' e^(k t)+u k e^(k t)) $

    $ 0=x'-k x=u' e^(k t) + k u e^(k t)-k u e^(k t)=u' e^(k t) $

    så $ u' e^(k t)=0 <=> u'=0 $

    men då måste ju $u$ vara en konstant funktion; $ u=C. $
  ]

  #ex([Visa att om $k$, $t_0$, $x_0$ är konstanter och $ cases(x'&=k x, x(t_0)&=x_0) $ så måste det gälla att $ x=x_0 e^(k(t-t_0)). $])[
    Entydig!
  ]

  #let rng = gen-rng(42)

  // #slopefield(y => integers-f(rng, low: -1, high: 1))

  #ex([Visa att $x(t)=1/(1+C e^(-t))$ uppfyller $x'=(1-x)x.$])[
    $
      x'(t)&=-1/(1+C e^(-t))^2 (-C e^(-t))\
    &=1/(1+C e^(-t))((C e^(-t))/(1+C e^(-t)))\
    &=1/(1+C e^(-t))((1+C e^(-t)-1)/(1+C e^(-t)))=x(1-x). quad #emoji.sparkles
    $
  ]

  == Existens av lösning

  Vi har $x'=f(t,x)$

  Peano #emoji.piano sa att om $f$ är kontinuerlig så finns lösning, men den behöver inte vara entydig.

  Picard-Lindelöf sa att om $f$ uppfyller ett Lipschitzvillkor $ abs(f(t,x_1)-f(f,x_2))<= K abs(x_1-x_2) $ så är lösningen entydig.

  Ett tillräckligt villkor för detta är att $f$ är deriverbar med kontinuerliga derivator.

  #ex([Vid tömning av tank används Tornicellis lag, $ x'=-sqrt(abs(x)). $ Låt $x(0)=1.$ Mikael påstår att $ x(t)=cases((t-2)^2/4 quad &0<=t<=2, 0 quad &t>2) $ löser differentialekvationen.#footnote[När tanken väl är tömd så fortsätter den att vara tömd.]])[
    *$0<t<2$:*

    $
      x'(t)&=1 / 2 (t-2)\
      -sqrt(abs(x(t)))&=- abs(t-2) / 2=(t-2) / 2 quad "så ok."
    $

    *$t>2$:*

    $ x'=0, -sqrt(abs(x))=0 quad "så ok." $

    *$t=2$:* ok.

    Men det finns fler lösningar:

    Tänk tanken att tanken blir tömd till tommare än tömd.
  ]
]

#lecture(2024, 12, 3, [Linjära differentialekvationer av ordning 1])[
  Alltså ekvationer på formen $ y' + g y=h $ där $g$ och $h$ är givna.

  De kallas linjära för om man tar vänsterledet och inför $ cal(L)(y)=y'+g y $ så är $cal(L)$ en linjär operator#footnote[Det vill säga $cal(L)(alpha y_1+beta y_2)=alpha cal(L)(y_1)+beta cal(L)(y_2)$.].

  Vi vill multiplicera $y'+g y =h$ med någon funktion $a>0$ som gör att vänsterledet blir derivatan av en produkt:

  $ underbracket(a y' + a g y, (a y)') = a h $

  Vi behöver alltså att

  $
    a g&=a'\
    a' / a&=g\
    (ln a)'&=g\
    ln a &= G
  $

  så $ a=e^G. $

  Vi vill alltså multiplicera med den integrerande faktorn $ e^G=e^(integral g(x) dd(x)). $

  Vi får

  $
    (e^G y)'&=e^G h\
    e^G(x) y(x)&=integral e^G(x) h(x) dd(x)\
    y(x)&=e^(-G(x)) integral e^G(x) h(x) dd(x).
  $

  #ex([Lös $y'-x y=0$.])[
    $ y=C e^(x^2 slash 2) $
  ]

  #ex([Bestäm alla kurvor vars tangent i $(x,y)$ har riktningskoefficient $-1-y/x$ då $x>0$.])[
    Om vi ser $y$ som funktion av $x$ så är riktningskoefficienten $y'$. Vi vill ha

    $
      y'&=-1-y / x\
      y'+underbracket(1/x, g(x)) y&=underbracket(-1, h(x)).
    $

    $G(x)=ln x$ duger. Integrerande faktor: $e^G(x)=e^(ln x)=x$.

    $
      x y'+y&=-x\
      (x y)'&=-x\
      x y(x)&=integral -x dd(x)=-x^2 / 2+C\
      y(x)&=-x / 2+C / x.
    $
  ]

  #ex([
    #canvas({
      import draw: *

      let sun_center = (0.5, 0.3)

      line((0.3, -1), (1.3, -1), name: "mirror")
      line(sun_center, "mirror.mid", (1, 0.3), stroke: (dash: "dashed"))
      circle(sun_center, radius: 0.2, stroke: yellow, fill: yellow)
      line((0, 0), (2, 0), stroke: blue)
    })

    Ljusintensiteten $y$ uppfyller $y'=-k y$ och det visade sig att intensiteten halverades då ljuset kom till ytan igen. Bestäm $k$.])[
    $ y=C e^(k x). $

    Vi har villkoren

    $
      x=0 "ger" y=C\
      x=10 "ger" y=C e^(-k dot 10)
    $

    som ger $ C e^(-k dot 10)=1/2 C\
    e^(-10 k)=1/2\
    e^(10 k)=2\
    k=1/10 ln 2. $
  ]

  #ex([
    Betrakta partabelfamiljen $x+C=y^2 slash 2$. En kurva som skär alla parabler vinkelrätt kallas för ortogonal trajektorie. Vilka kurvor blir sådana?
  ])[
    Derivatan med avseende på $x$ är

    $ 1+0=y(x) y'(x) $

    och de ortogonala trajektorierna måste ha derivatan

    $
      1&=y_perp (-1 / (y'_perp))\
      y'_perp&=-y_perp
    $

    så $ y_perp (x)=C e^(-x). $
  ]

  = Integralekvationer

  En integralekvation kräver mindre regularitet. I allmänhet får man något som beter sig bättre än vad man började med.

  #ex([Bestäm samtliga kontinuerliga funktioner $f$ sådana att $ f(x)=3 ln abs(1+x)+integral_0^x f(t)/(1+t) dd(t) $ då $x>=0$.])[
    Om $f$ löser ekvationen och är kontinuerlig så kan ekvationen deriveras, varför $f in cal(D)$.

    Derivering ger $ f'(x)=3/(1+x)+f(x)/(1+x). $

    Integralekvationen ger dessutom att $ f(0)=3ln(1+0)+integral_0^0 dots.c space dd(x)=0. $

    Låt $y'=f(x)$. Vi har

    $ y'-1 / (1+x)y=3 / (1+x) $

    och vår integrerande faktor blir

    $
      g(x)&=-1 / (1+x)\
      G(x)&=-ln(1+x)\
      e^G(x)&=e^(-ln(1+x))=1 / (1+x).
    $

    Vi får $ 1/(1+x)y'-1/(1+x)^2 y&=3/(1+x)^2\
    (1/(1+x)y)'&=3/(1+x)^2. $

    Integrera: $ 1/(1+x)y&=integral 3/(1+x)^2 dd(x)=-3/(1+x)+C\
    y&=-3 + C(1+x). $

    Insättning av $x=y=0$ ger

    $ 0=-3+C(1+0) $ så $C=3$ och $ y=f(x)=3 x. $
  ]

  Vår reflex när vi får en integralekvation ska vara att derivera den för att istället få en differential-?ekvation.

  #ex([Ett fysikaliskt, kanske ganska läskigt exempel med rotationssymetriska stålstolpar.

    Vi har en julklapp ovanpå en stolpe.

    #table(
      stroke: (x: none, y: 0.5pt),
      columns: 2,
      [$rho$], unit("kg/m^3"),
      [Maximal last], qty("350", "MN/m^2"),
    )

    "Jag är inte fysiker, så det är förmodligen o-troligt."
  ])[
    Vid ett tvärsnitt på höjden $h$ är belastningen summan av paketets och stolpens tyngd från tvärsnittet och uppåt.

    Paketets tyngd: $350 pi f(0)^2$.

    Övre delens tyngd: $10^(-6) g rho integral_0^x pi f(t)^2 dd(t) $.

    För maximal last:

    $
      overbracket(350 pi f(0)^2+10^(-6) g rho integral_0^x pi f(t)^2 dd(t), "kraft") / underbracket(pi f(x)^2, "area")&=350\
      350 pi f(0)^2 + 10^(-6) g rho integral_0^x pi f(t)^2 dd(t)&=350 pi f(x)^2.
    $

    Derivering ger

    $
      10^(-6) g rho pi f(x)^2=2 dot 350 dot pi f(x)f'(x)\
      dots.v\
      f'(x)=k f(x) <=> f(x)=r_0 e^(k x).
    $
  ]
]

#lecture(2024, 12, 5, [Separabla differentialekvationer])[
  Givet $f(y) y'=h(x)$:

  Om $F$ är en primitiv till $f$ och $H$ en till $h$ så bestäms lösningarna av $ F(y)=H(x)+C. $

  Alternativt skrivsätt: $ f(y) derivative(y, x)&=h(x)\
    integral f(y) dd(y)/(cancel(dd(x))) cancel(dd(x))&=integral h(x) dd(x) $

  #ex([
    $ y'=(1-y)y $

    #set enum(numbering: "a)")

    + $y=1/2$, $x=0$
    + $y=1$, $x=0$
  ])[
    $
      derivative(y, x)&=(1-y)y\
      1 / ((1-y)y) derivative(y, x)&=1\
      integral 1 / ((1-y)y) dd(y)&=x+C\
      integral (1 / (1-y)+1 / y) dd(y)&=x+C\
      -ln abs(1-y)+ln abs(y)=ln abs(y/(1-y))&=x+C
    $

    #set enum(numbering: "a)")

    1. #[
        $y(0)=1/2$ så $ abs(y/(1-y))=y/(1-y). $

        $y(0)=1/2$ ger $ ln((1 slash 2)/(1-1 slash 2))=0+C $

        så $C=0$.

        Algebra ger $ y=e^x/(1+e^x)=1/(1+e^(-x)). $
      ]
    2. #[
        Vi startar i en jämviktspunkt så $y=1$ blir lösningen.
      ]
  ]

  = Dagens lilla trick

  $ integral 1 / ((1-y)y) dd(y)=integral 1 / ((1 / y-1)y^2) dd(y)=-ln(1/y-1)+C. $

  #ex([$y'=x(1+y^2)$])[
    $
      1 / (1+y^2)y'&=x\
      integral 1 / (1+y^2) dd(y) &= integral x dd(x)\
      arctan y&=x^2 / 2+C\
      y&=tan(x^2/2+C).
    $

    Lösningarna slutar att existera då $ x^2/2+C -> pi/2. $
  ]

  #ex([
    Toricellis lag ...

    $
      derivative(x, t)&=-sqrt(x) quad quad (x(0)=1)\
      integral 1 / sqrt(x) dd(x)&=integral -1 dd(t)\
      2 sqrt(x)&=-t+C
    $

    Begynnelsevillkoret ger $ 2sqrt(1)=-0+C <=> C=2 $

    så $ x=((2-t)/2)^2. $
  ])[]

  #ex([
    Bestäm de kurvor som är ortogonala överallt mot alla räta linjer genom origo.
  ])[
    Cirklar?

    Räta linjer: $y=k x <=> y/x=k$. Derivera:

    $ (y' x-y) / x^2=0 dots.c y'=y / x. $

    Ortogonala kurvor: Byt ut $y'$ mot $-1/y'$ så

    $
      -1 / y'&=y / x\
      y y'&=-x quad "Separabel!"\
      integral y dd(y)&=integral -x dd(x)\
      y^2 / 2&=-x^2 / 2+C\
      x^2+y^2&=tilde(C).
    $

    Cirklar!
  ]

  #ex([
    Ett exempel från fysik med någon slags härledning av kedjekurvan.
  ])[
    #let F = $overline(F)$
    #let H = $overline(H)$
    #let V = $overline(V)$
    #let g = $overline(g)$

    Densitet $rho$.

    Ett kedjesegment mellan $x$ och $x+Delta x$ påverkas av tyngdkraften $rho Delta s #g$ och två spännkrafter; $overline(F)(x)$ och $overline(F)(x+Delta x)$.

    Kraftjämvikt råder: $ #F (x)+#F (x+Delta x)+ rho Delta s #g=overline(0). $

    $#F$ delas upp i sin horisontella komposant $#H$ och sin vertikala $#V$. I horisontellt led gäller

    $ #H (x)+#H (x+Delta x)=overline(0) $

    och i vertikalt

    $ #V (x)+#V (x+Delta x)+rho Delta s #g = overline(0). $

    $
      f'(x)&=- V(x) / H\
      f'(x+Delta x)&=V(x+Delta x) / H\
      Delta s &= sqrt(1+f'(x)^2) Delta x
    $

    $
      V(x+Delta x)-V(x)&=rho g sqrt(1+f'(x)^2) Delta x\
      (V(x+Delta x)-V(x)) / (Delta x)&=rho g sqrt(1+f'(x)^2)\
      (f'(x+Delta x)-f'(x)) / Delta x&=(rho g) / H sqrt(1+f'(x)^2)\
      f''(x)&=(rho g) / H sqrt(1+f'(x)^2).
    $

    Sätt $u(x)=f'(x)$:

    $
      u'(x)&= C sqrt(1+u(x)^2), quad C=(rho g)/H\
      integral 1/sqrt(1+u^2) dd(u)&= integral C dd(x)\
      ln(u+sqrt(1+u^2))=op("arsinh")(h)&=C x+D\
      f'(x)=u&=sinh(C x+D)\
      f(x)&=1/C cosh(C x+D)+E quad #emoji.sparkles
    $

    $cosh$ kallas för kedjekurvan. Se S:t Paul i London och Gateway Arch i Saint Louis.
  ]

  #ex([
    *En makaber uppgift.* Vi har en hund i $(0, 1)$ och husse i $(0, 0)$. Hunden vill inte vara ute och gå men husse går längs x-axeln i positiv riktning och drar med sig hunden. Vilken kurva beskriver hunden?
  ])[
    Kopplet kommer att vara spänt längs tangenten av kurvan.

    Hunden befinner sig i $(a, f(a))$. Tangent $ y=f(a)+f'(a)(x-a)$.

    Skär x-axeln där $y=0$ -- ger

    $
      0&=f(a)+f'(a)(x-a)\
      x&=a-f(a) / f'(a)
    $
  ]

  #figure(
    canvas({
      import draw: *

      let arcosh(x) = calc.ln(1 + calc.sqrt(1 - x * x))
      let C = -0.9
      let D = 0
      let E = 1
      let A = 1
      // let catenary(x) = 1 / C * arcosh(C * x + D) + E
      let catenary(x) = A * calc.cosh(x / A)
      let catenary-inv(y) = A * arcosh(y * A)

      let artanh(x) = 0.5 * calc.ln((1 + x) / (1 - x))


      // let P = (d, catenary(d))

      let x(t) = t - calc.tanh(t)
      let y(t) = 1 / calc.cosh(t)

      let dydx(t) = {
        let d = 1e-3

        // derivative of parametric curve
        let dx = x(t + d) - x(t)
        let dy = y(t + d) - y(t)

        dy / dx
      }

      let W = 10
      let H = 19

      let d = 3
      let N = 100
      let n = 10
      let ts = range(-N * d, N * d + 1).map(i => i / N)
      let x-min = x(ts.first()) * 1.5
      let x-max = x(ts.last()) * 1.5

      let grad = gradient.linear(..color.map.rainbow)

      plot.plot(
        size: (W, H),
        axis-style: "school-book",
        x-tick-step: none,
        y-tick-step: none,
        y-min: 0,
        y-max: (x-max - x-min) * (H / W),
        {
          for i in range(-n * d, n * d + 1) {
            let t = i / n
            let dy = dydx(t)
            if dy == 0 {
              continue
            }
            let slope = -1 / dydx(t)
            let x0 = x(t)
            let y0 = y(t)

            if calc.abs(x0) < 0.001 {
              continue
            }

            let f(x) = slope * (x - x0) + y0

            let color = grad.sample((t - ts.first()) / (ts.last() - ts.first()) * 100%)
            let domain = if x0 < 0 {
              (x-min, x0)
            } else {
              (x0, x-max)
            }

            // let p = ts.map(x).map(x => (x, catenary(x))).find(((x, y)) => calc.abs(y - f(x)) < 10)

            // if p != none {
            //   plot.annotate({
            //     line((x0, y0), p, stroke: (color + 0.5pt))
            //   })
            // }

            plot.add(f, domain: domain, style: (stroke: 0.5pt + color))
          }

          plot.add(ts.map(t => (x(t), y(t))), style: (stroke: grad + 2pt))
          plot.add(catenary, domain: (x-min, x-max), style: (stroke: 2pt))
        },
      )
    }),
    caption: [Kedjekurvan.],
  )
]

#lecture(2024, 12, 6, [Linjära differentialekvationer])[
  $ y^((n))+a_(n-1)y^((n-1))+dots.c+a_1 y' + a_0 y=g $ <lindiff>

  #ex([Newton $m a=F$])[
    $x=x(t)$ position

    $m x''(t)=F$
  ]

  Även de allra enklaste funktionerna $a_(n-1), dots.c, a_0$ resulterar i ickeelementära funktioner i lösningen $y$.

  #sats([])[Antag att $y_p$ är en lösning till @lindiff. Då kommer $y$ att lösa @lindiff om och endast om $y-y_p$ löser motsvarande homogena ekvation.]

  Idag: homogena differentialekvationer av ordning 2.

  #rect(inset: 12pt, [$ y''+a y'+b y=0 $ <ode2>])

  Vi vet att $y=e^(lambda x)$ löser $y'-lambda y=0$. Kan det vara så att $y=e^(lambda x)$ löser @ode2?

  $ y''+a y'+b y=lambda^2 e^(lambda x)+a lambda e^(lambda x)+b e^(lambda x)=(lambda^2 + a lambda + b) e^(lambda x). $

  Om $lambda^2 + a lambda + b=0$ så har vi hittat en lösning!

  #hr

  Antag att $y$ löser $y''-6y'+5y=0$. Inför $u(x)$ via $y(x)=u(x) e^x$.

  $
    y'&=u'(x)e^x+u(x)e^x\
    y''&=u''(x)e^x+2u'(x)e^x+u(x)e^x.
  $

  $
    0=y''-6y'+5y&=e^x (u''+2u'+u-6u'-6u+5u)\
    &=e^x (u''-4u')
  $
  $
    =>u''-4u'&=0\
    v'-4v&=0 quad quad v=u'\
    => v(x)&=A e^(4x)\
    u'(x)&=A e^(4 x)\
    u(x)&=A / 4 e^(4x)+B\
    y&=u e^x\
    &=(A / 4 e^(4x)+B)e^x\
    &=tilde(A) e^(5x)+B e^x.
  $

  #sats([])[
    Antag att $lambda_1$ och $lambda_2$ är lösningarna till $lambda^2+a lambda+b=0$. Då har $y''+a y'+b y=0$ lösningar:

    #set enum(numbering: "a)")

    + #[
        $y_h=A e^(lambda_1 x)+B e^(lambda_2 x)$ om $lambda_1 != lambda_2$
      ]
    + #[
        $y_h=(A+B x)e^(lambda_1 x)$ om $lambda_1=lambda_2$
      ]
  ]

  #ex([Visa att lösningen till $ y''-6y'+9y=0 $ har formen $ y=(A+B x)e^(3x). $])[
    Inför $u$ via $y(x)=u(x) e^(3x)$.

    $
      y&=u e^(3x)\
      y'&=u' e^(3x)+3u e^(3x)\
      y''&=u'' e^(3x)+6u' e^(3x)+9u e^(3x)
    $

    $
      0=y''-6y'+9y=e^(3x) (u''+6u'+9u-6u'-18u+9u)=e^(3x) u''\
      => u''(x)=0 "och" u(x)=A + B x.
    $
  ]

  #ex([Omskrivning av $y=A e^((3-i)x) + B e^((3+i)x)$.])[
    $
      y&=A e^(3x)(cos x-i sin x)+B e^(3x)(cos x+i sin x)\
      &=e^(3x) (underbrace((A+B), C_1) cos x + underbrace((-i A + i B), C_2) sin x)\
      &=e^(3x) (C_1 cos x + C_2 sin x).
    $
  ]

  #sats([])[
    Om $ a, b in RR, quad lambda_1=alpha+i beta, quad lambda_2=alpha-i beta quad (beta != 0) $ löser $lambda^2+a lambda + b=0$ så kommer $y''+a y'+b y=0$ att ha lösningarna $ y=e^(alpha x) (A cos beta x + B sin beta x). $
  ]

  = Högre ordning?

  Vi har en karakteristisk ekvation $ 0=(lambda-3)^3 (lambda-1)=lambda^4-10lambda^3+36lambda^2-54lambda+27. $ <kekv1>

  #ex([Lös $ y''''-10y'''+36y''-54y'+27y=0. $])[
    Differentialekvationens karakteristiska ekvation finns att skåda i @kekv1. Dess lösningar är $ lambda_1=lambda_2=lambda_3=3, quad lambda_4=1. $

    Vi får $ y=(A_1+A_2 x+A_3 x^2)e^(3x)+B e^x. $
  ]

  #sats([])[
    Betrakta $y^((n))+a_(n-1) y^((n-1))+dots.c+a_1 y'+a_0 y=0$. Antag att karakteristiska ekvationen $lambda^n+a_(n-1) lambda^(n-1)+dots.c+a_1 n+a_0=0 $ har lösningar $lambda_1$ med multiplicitet $m_1$, $lambda_2$ med multiplicitet $m_2$, dots.c, $lambda_r$ med multiplicitet $m_r$. Då ges den allmänna lösningen till differentialekvationen av

    $
      y=p_1(x)e^(lambda_1 x)+p_2(x)e^(lambda_2 x)+dots.c+p_r (x)e^(lambda_r x)
    $ där graden av varje polynom $p_k$ är $m_k-1$.
  ]

  #let dop = $op(upright(D))$

  Man kan faktorisera operatorn #dop:

  $
    y''-6y'+5y&=0\
    (dop^2-6dop+5)y&=0\
    (dop-1)underbracket((dop-5)y, v)&=0\
    cases(
      (dop-1)v = 0,
      (dop-5)y = v
    )
  $
]

#lecture(2024, 12, 10, [Differentialekvationer, avslutning])[
  Man kan skala bort tråkiga konstanter:

  $ -hbar^2/(2m) derivative(,x,2) psi + 1/2 m omega^2 x^2 psi &= E omega\
  - derivative(,x,2) Psi+x^2 Psi&=lambda Psi. $

  #hr

  En fallskärmshoppare med massa $m$.

  $ m derivative(v,t)=m g - k v^2 $

  Inför $t^*=t slash T$ och $v^*=v slash V$.

  $ dots.v $
]

#lecture(2024, 12, 12, [Maclaurinutveckling])[
  #canvas({
    plot.plot(size: (12, 8), x-min: 0, x-max: 5, y-min: 0, y-max: 8, x-tick-step: none, y-tick-step: none, axis-style: "left", {
      let f(x) = 0.5 * x * x * x - 2 * x * x + 2 + 4

      plot.add(f, domain: (1, 4))
      plot.add(f, domain: (1, 4), samples: 6, style: (stroke: none), mark: "x")
    })
  })

  #let macterm(n) = {
    if type(n) == int {
      if n == 0 {
        return $f(0)$
      }

      if n == 1 {
        return $f'(0)x$
      }

      if n == 2 {
        return $(f''(0))/2! x^2$
      }

      if n == 3 {
        return $f('''(0))/3! x^3$
      }
    }

    $(f^((#n))(0))/(#n !) x^#n$
  }

  $ P_(f,n)=#range(3).map(macterm).join($+$)+dots.c+macterm(n) $

  = Feluppskattning

  Vill visa att $abs(f(x)-P_(f,n)(x))<=M abs(x)^(n+1)$ åtminstone på ett begränsat intervall.

  För $n=2$: Antag att $m<=f^((3))(0)<=M$ på något intervall som inehåller $0$.

  Integrera mellan $0$ och $x>0$:

  $ integral_0^x m dd(t) &<= integral_0^x f'''(t) dd(t) &<= integral_0^x M dd(t)\
  m x &<= f''(x) - f''(0) &<= M(x) $

  Integrera igen!

  $ integral_0^x m t dd(t) &<= integral_0^x (f''(t) - f''(0)) dd(t) &<= integral_0^x M t dd(t)\
  m x^2/2 &<= f'(x)-f'(0)-f''(0) x &<= M x^2/2 $

  Igen!

  $ integral_0^x m t^2/2 dd(t) &>= integral_0^x (f'(t)-f'(0)-f''(0)t) dd(t) &<= integral_0^x M t^2/2 dd(t)\
  m x^3/3! &<= underbrace(f(x)-f(0)-f'(0)x-(f''(0))/2! x^2, f(x)-P_(f,2)(x)) &<= M x^3/3! $

  #sats([])[
    Antag att $abs(f^((n+1)))<=M, quad M>0$ på ett intervall som innehåller $0$. Då gäller där att $ abs(f(x)-P_(f,n)(x))<=M/(n+1)! abs(x)^(n+1).. $
  ]

  #ex([Låt $f(x)=e^x$. På intervallet $[-1, 1]$ är $f^((5))(x)=e^x$ begränsad av $e$, dvs. $abs(f^((5))(x))=abs(e^x)<=e$. Satsen ovan ger därför att $ e^x-(1+x+x^2/2!+x^3/3!+x^4/4!)<=e/5! abs(x)^5. $])[]

  #obs[
    Approximationen är bäst nära $0$.x
  ]

  #obs[
    $ "Maclaurinutveckling" = "Maclaurinpolynom" + "Restterm" $
  ]

  = Lagranges form

  Fixera $x>0$.

  $ m&=min_(t in [0, x]) f^((n+1))(t)\
  M&=max_(t in [0, x]) f^((n+1))(t). $

  $ m <= (f(x)-P_(f,n)(x))/(x^(n+1) slash (n+1)!) <= M $

  Antag nu att $f^((n+1)) in cal(C)$. Satsen om mellanliggande värden ger $xi$ mellan $0$ och $x$ så att kvoten är lika med
  
  $ f^((n+1))(xi), $

  dvs. $ (f(x)-P_(f,n))/(x^(n+1) slash (n+1)!)=f^((n+1))(xi), $

  dvs. $ f(x)=P_(f,n)(x)+(f^((n+1))(xi))/(n+1)! x^(n+1). $

  = Svag form

  $ B(x) x^(n++1) $

  = Standardutvecklingar

  $ ln(1+x)&=x-x^2/2+x^3/3-x^4/4+dots.c+(-1)^(n+1) x^n/n +x^(n+1) B(x)\
  arctan(x)&=x-x^3/3+x^5/5-x^7/7+dots.c+(-1)^(n-1) (x^(2n-1))/(2n-1)+x^(2n+1)B(x) $
]

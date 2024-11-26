#import "template.typ": conf, lecture, hr, ex, obs, sats, anm
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty, unit
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/cetz-plot:0.1.0": plot

#show: doc => conf("FAFA56", [Kvantfysikaliska koncept], doc)

= Ordlista

/ Spänningskälla: Tomas Persson
/ Elektronbassäng: Bollhav
/ Påg: Något som har både partikel- och vågegenskaper #image("limpa.png", width: 30%)
/ Vårtikel: se _Påg_

= Föreläsningar

#lecture(2024, 11, 6, [Fotoelektriska effekten])[
  Två metallplattor med spänning $U$ kan användas för att bromsa elektroner som emitteras med hjälp av fotoelektriska effekten. Mät $I$ som funktion av $U$. #emoji.sparkles

  $ underbrace(unit("A V"), underbrace(unit("W"), unit("J s^-1"))) unit("s") $

  $Phi$: utträdesarbete för en elektron i en elektronbassäng.

  $ E_k=h f-Phi $

  $ E_"Röntgen" underbrace(approx^5, 5 "storleksordningar") E_"synligt" $

  = Comptoneffekten

  $ Delta lambda=lambda'-lambda=h / (m c)(1-cos theta) $
]

#lecture(2024, 11, 8, [])[
  $
    E=h f=(h c) / lambda=(qty("6e-34", "J s") dot qty("3e8", "m/s")) / qty("500e-9", "m") dot underbracket(qty("1", "eV")/qty("1,6e-19", "J"), =1)=(10 dot 10^(-34) dot 10^8 dot 1 "eV") / (1000 dot 10^(-9) dot 1 dot 10^(-19))=1 "eV"
  $

  - $3 dot 6 approx 10$
  - $500 approx 1000$

  *Fotonens rörelsemängd:* $ p=h/lambda $et

  = Laserkylning

  #canvas({
    import draw: *

    set-style(mark: (end: ">"))

    circle((0, 0), name: "atom", radius: 1pt, fill: black)
    line((0, 0), (1, 0), name: "atom_v")
    content("atom.north", anchor: "south", padding: 3pt, [Atom])
    content("atom_v.mid", anchor: "north", padding: 3pt, [$v_i$])

    circle((4, 0), name: "foton", radius: 1pt, fill: red, stroke: red)
    line((4, 0), (3, 0), name: "foton_v", stroke: red)
    content("foton_v.mid", anchor: "north", padding: 3pt, text(fill: red)[$-c$])

    content("atom.north", anchor: "south", padding: 3pt, [Atom])
  })

  $
    p_i+p_f&=p_e\
    m v_i-h / lambda&=m v_e \
    -h / lambda&=m(v_e-v_i) \
    Delta v=v_e-v_i&=(-h) / (m lambda)
  $

  *Uppskattning:*

  $
    lambda approx& qty("500", "nm")\
    "(Ar)" quad m=&40 u\
    => Delta v=&qty("6,6e-34", "J s") / (40 dot qty("1,6e-27", "kg") dot qty("500e-9", "m"))approx qty("-1e-2", "m/s")=qty("-1", "cm/s")
  $

  Vid $T=qty("1000", "K")$ är $v_i approx qty("1000", "m/s")$.

  I verkligheten har $v_i$ en slumpmässig riktning, så det fungerar inte att belysa atomen från bara ett håll.

  #figure(
    canvas({
      import draw: *

      set-style(mark: (end: ">"))

      circle((0, 0), name: "atom", radius: 1pt, fill: black)
      line((0, 0), (1, -0.5), name: "atom_v")
      content("atom.north", anchor: "south", padding: 3pt, [Atom])
      content("atom_v.mid", anchor: "north", padding: 3pt, [$v_i$])

      line((-3, 0), (-2, 0), stroke: red)
      line((0, 3), (0, 2), stroke: red)
      line((3, 0), (2, 0), stroke: red)
      line((0, -3), (0, -2), stroke: red)

      content("atom.north", anchor: "south", padding: 3pt, [Atom])
    }),
    caption: [Kan atomen belysas från alla håll samtidigt? #emoji.face.think],
  )

  Dopplereffekten räddar oss! $ f&=f_0 (v+c)/c\ lambda&=c/f=c/f_0 c/(v+c)=lambda_0 c/(v+c) $

  #canvas({
    plot.plot(
      size: (10, 4),
      y-label: "Absorption",
      x-tick-step: none,
      y-tick-step: none,
      x-label: $lambda$,
      axis-style: "school-book",
      {
        plot.add(
          domain: (400, 600),
          samples: 300,
          lambda => {
            let x = (lambda - 500) / 4

            calc.exp(-x * x)
          },
        )
      },
    )
  })

  #table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.5pt,
    table.cell(stroke: none)[], [*Partikel*], [*Våg*],
    [*Ljus*], [Fotoelektrisk effekt], [Youngs dubbelspaltexperiment],
    [*"Vanliga" partiklar*], [Viss massa $m$], [de Broglie-våglängd $ lambda=h/p $]
  )

  = de Broglie-våglängd

  == Dammpartikel

  $
    m&=qty("1", "ug")=qty("1e-9", "kg")\ v&=qty("1", "cm/s")=qty("1e-2", "m/s")\
    =>lambda&=h / (m v)=qty("7e-34", "J s") / (qty("1e-9", "kg") dot qty("1e-2", "m/s"))=qty("1e-23", "m").
  $

  Det går nog inte att göra interferens med dammpartiklar. #emoji.face.sad

  == Elektron

  $
    m&=qty("9,1e-31", "kg")\
    E_k&=qty("1", "eV")\
    v&=sqrt((2 E_k)/m)\
    =>lambda&= h / (m v)=h / (sqrt(2 m E_k))=qty("1", "nm")
  $

  #text(fill: green.darken(20%))[_Kan levande objekt interferera med sig själva?_]
]

#lecture(2024, 11, 25, [Bundna tillstånd])[
  $ K=1 / 2 m v^2=p^2 / (2 m)=h^2 / (2 m lambda^2)=(h^2 k^2) / ((2pi)^2 2 m)=(hbar^2 k^2) / (2 m) $

  Konstruktiv interferens i oändlig kvantbrunn? Ja, om $ 2 a = n lambda $ för ett kvanttal $n in NN$.

  Lös vågfunktionen!

  $
    V(x)=cases(infinity\, quad &x<0,
  0\, quad &0<x<a,
  infinity\, quad &x > a
  )
  $

  $
    &"I och III": quad &psi(x)&=0\
    &"II": &-hbar^2 / (2 m) psi''(x)&=E psi(x)
  $

  Passningsvillkoren $psi(0)=psi(a)=0 <=> A+B=0$ ger

  $
    A(e^(i k a)-e^(-i k a))=2 i sin (k a)=0\
    <=> k a=n pi quad quad n in ZZ^+\
    <=> k=k_n=(n pi) / a
  $

  så

  $
    E=E_n=(hbar^2 k_n^2) / (2 m)=(hbar^2 n^2 pi^2) / (2 m a^2)=(h^2 n^2 cancel(pi^2)) / ((
      2 cancel(pi)
    )^2 2 m a^2)=(h^2 n^2) / (8 m a^2).
  $

  #canvas({
    let a = 1
    let E = n => (n * n)
    let wave = (n, x) => calc.sin(n * calc.pi * x / a) + E(n)

    let ns = range(1, 4)

    plot.plot(
      size: (12, 8),
      y-min: 0,
      y-tick-step: none,
      x-tick-step: none,
      x-ticks: ((a, $a$),),
      y-label: none,
      axis-style: "school-book",
      y-ticks: ns.map(n => (E(n), text(fill: blue)[$E(#n)$])),
      {
        for n in ns {
          plot.add-hline(E(n), style: (stroke: (dash: "dashed", paint: blue)))
          plot.add(domain: (0, a), samples: 100, x => wave(n, x), style: (stroke: blue))
        }

        plot.add-vline(a, style: (stroke: 1pt))
      },
    )
  })

  I område II är $ psi_n(x)=A(e^(i k x)-e^(- i k x))=underbrace(2 i A, C) sin(k x) $

  och normering av $psi$ ger $ integral_0^a abs(psi(x)) dd(x)=1 <=> abs(C)=sqrt(2 / a). $
]

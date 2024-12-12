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
    E=E_n=(hbar^2 k_n^2) / (2 m)=(hbar^2 n^2 pi^2) / (2 m a^2)=(h^2 n^2 cancel(pi^2)) / (( 2 cancel(pi) )^2 2 m a^2)=(h^2 n^2) / (8 m a^2).
  $

  #figure(
    canvas({
      let a = 1
      let E = n => (n * n)
      let wave = (n, x) => calc.sin(n * calc.pi * x / a) + E(n)

      let ns = range(1, 5)

      plot.plot(
        size: (12, 8),
        y-min: 0,
        y-tick-step: none,
        x-tick-step: none,
        x-ticks: ((a, $a$),),
        y-label: none,
        axis-style: "school-book",
        y-ticks: ns.map(n => (E(n), text(fill: blue)[$E_#n$])),
        {
          for n in ns {
            plot.add-hline(E(n), style: (stroke: (dash: "dashed", paint: blue)))
            plot.add(domain: (0, a), samples: 100, x => wave(n, x), style: (stroke: blue))
          }

          plot.add-vline(a, style: (stroke: 1pt))
        },
      )
    }),
  )

  I område II är $ psi_n(x)=A(e^(i k x)-e^(- i k x))=underbrace(2 i A, C) sin(k x) $

  och normering av $psi$ ger $ integral_0^a abs(psi(x)) dd(x)=1 <=> abs(C)=sqrt(2 / a). $
]

#lecture(2024, 11, 27, [])[
  #figure(
    canvas({
      import draw: *

      let b = 1
      let V0 = 1

      plot.plot(
        size: (12, 6),
        axis-style: "school-book",
        x-tick-step: none,
        y-tick-step: none,
        x-ticks: ((-b, $-b$), (b, $b$)),
        y-ticks: ((-V0, $-V_0$),),
        y-min: -V0 * 1.5,
        y-label: $V(x)$,
        {
          plot.add-vline(-b, style: (stroke: (dash: "dashed")))
          plot.add-vline(b, style: (stroke: (dash: "dashed")))
          plot.annotate({
            content((-b * 1.2, -V0 * 1.4), [I])
            content((-b / 2, -V0 * 1.4), [II])
            content((b / 2, -V0 * 1.4), [II])
            content((b * 1.2, -V0 * 1.4), [III])
          })
          plot.add(((-b * 1.2, 0), (-b, 0), (-b, -V0), (b, -V0), (b, 0), (b * 1.2, 0)), style: (stroke: red))
        },
      )
    }),
  )

  $ V(x)=cases(-V_0\, quad x in (-b,b), 0 quad"annars") $

  = Utanför brunnen

  $ -hbar^2 / (2m) psi''(x)+underbracket(V(x), = space 0)psi(x)=underbracket(E, < space 0) psi(x) $

  Ansatsen $psi(x)=e^(kappa x)$ ger $ -hbar^2/(2 m) kappa^2 cancel(psi(x))=E cancel(psi(x))\
  => kappa^2=(2m (-E))/hbar^2>0\
  => kappa= plus.minus sqrt((2m(-E))/hbar^2) $

  #let I = $upright("I")$
  #let II = $upright("II")$
  #let III = $upright("III")$

  $ #I:& quad psi_#I (x)=A e^(kappa x)\
  #III:& quad psi_#III (x)=B e^(-kappa x) $

  = Inuti brunnen

  $
    -hbar^2 / (2m) psi''(x)=underbracket((E+V_0), > space 0) psi(x)\
    => psi(x)=C sin(k x)+D cos(k x), quad k=sqrt((2m(E+V_0))/hbar^2)
  $

  = Passning av $psi$

  $
    cases(psi_#I (-b)&=psi_#II (-b),
  psi_#I '(-b)&=psi_#II '(-b),
  psi_#II (b)&=psi_#III (b),
  psi_#II '(b)&=psi_#III '(b))\
    => A=B\
    => tan(k b)=kappa / k\
    => tan(sqrt(((2m)(E+V_0))/hbar^2) dot b)=sqrt(-E) / sqrt(E+V_0)
  $

  #figure(
    canvas({
      import draw: *

      let V0 = 1

      let f1(E) = calc.tan(calc.pi * V0 * 3 * E)
      let f2(E) = if E == -V0 {
        100000
      } else {
        calc.sqrt(-E) / calc.sqrt(E + V0)
      }
      let f3(E) = if E == 0 {
        -100000
      } else {
        -calc.sqrt(E + V0) / calc.sqrt(-E)
      }

      plot.plot(
        size: (12, 8),
        axis-style: "school-book",
        x-tick-step: none,
        y-tick-step: none,
        x-label: $E$,
        x-ticks: ((-V0, $-V_0$),),
        x-grid: true,
        y-grid: true,
        y-max: 4,
        y-min: -4,
        {
          let n = 6

          for i in range(0, n) {
            let len = V0 / n
            let domain = (-len * (i + 1), -len * i)
            plot.add(f1, domain: domain, samples: 200, style: (stroke: 0.5pt))
          }

          plot.add(f2, domain: (-V0, 0), samples: 200)
          plot.add(f3, domain: (-V0, 0), samples: 200)
        },
      )
    }),
  )

  Vi kan använda $ E_n=(h^2 n^2)/(8 m a^2) $ om $k<<kappa$.
]

#lecture(2024, 11, 29, [Diverse tillstånd])[
  #align(center)[
    #emoji.sparkles _Qdot#sym.trademark #sym.trademark.registered Nanocrystal_ #emoji.sparkles
  ]

  = Atomer som bundna tillstånd

  $ "kemi" subset "kvantfysik" subset "matematik". $

  #figure(
    canvas({
      import draw: *

      circle((-1, 1), radius: 1pt, fill: black)
      content((-1, 1), anchor: "south-east", padding: 5pt, [$q=e$])

      circle((0, 0), radius: 5pt, fill: black)
      content((0, 0), anchor: "north-west", padding: 7pt, [$Q=Z e$])
    }),
  )

  $ V(r)=-(q Q) / (4 pi epsilon_0) $

  #figure(
    canvas({
      let ns = range(1, 4)
      let E(n) = -10 / calc.pow(n, 2)
      let wave = (n, x) => calc.sin(n * calc.pi * x / 1) + E(n)

      plot.plot(
        size: (12, 6),
        y-max: 0,
        y-min: -15,
        y-tick-step: none,
        x-tick-step: none,
        axis-style: "school-book",
        x-label: $r$,
        y-label: $V(r)$,
        y-ticks: ns.map(n => (E(n), text(fill: blue)[$E_#n$])),
        {
          plot.add(
            domain: (-1, 1),
            samples: 100,
            r => if r == 0 {
              none
            } else {
              -1 / (calc.abs(r))
            },
          )

          // FIXME
          for n in range(1, 4) {
            plot.add-hline(E(n), style: (stroke: (dash: "dashed", paint: blue)))
            plot.add(domain: (-1, 1), samples: 100, x => wave(n, x), style: (stroke: blue))
          }
        },
      )
    }),
  )

  $ E_n=-(E_"Ry" Z^2) / n^2 $

  Spinn $sigma$: #sym.arrow.t eller #sym.arrow.b.

  Kemins natur beror på Systembolaget.

  $ "Fler tillstånd" => "fler mångfald". $

  Snurrigt.

  = Optiska övergångar

  #figure(
    canvas({
      import draw: *

      content((0, 0), anchor: "east", padding: 3pt, [$E_n$])
      line((0, 0), (2, 0))
      content((0, 2), anchor: "east", padding: 3pt, [$E_m$])
      line((0, 2), (2, 2))

      line((1, 0), (1, 2), stroke: blue)

      content((3, 1), anchor: "west", [_foton._])
    }),
  )

  Om en elektron går från $E_m$ till $E_n$ emitteras en foton. En elektron i $E_n$ som absorberar en foton kommer att exciteras och hoppa till $E_2$. En foton som stimulerar en elektron i $E_m$ gör att fotonen deexciteras samtidigt som samma foton emitteras.

  #text(size: 0.75em)[
    "Du lever i en stimulation," sa den ena lasern till den andra.
  ]

  $
    &U=complement nothing \
  &#rotate(-90deg, $in$)\
   &psi_m (x).
  $

  $
    #text[en massa _*ytterst triviala*_ räkningar]\
  => hbar (omega_m-omega_n) = E_m-E_n
  $

  == Urvalsregeln

  #figure(
    table(
      columns: 2,
      stroke: (
        x: none,
        y: 0.5pt,
      ),
      ..(
        ($n=2 -> n=1$, true),
        ($n=3 -> n=1$, false),
        (
          $Gamma_"opt">0$,
          true,
        ),
        (
          $Gamma_"opt"=0$,
          false,
        ),
      ).map(((event, allowed)) => (
        event,
        if allowed {
          emoji.face.happy
        } else {
          emoji.face.sad
        },
      )).flatten()
    ),
    caption: [
      Inte alla övergångar är tillåtna.
    ],
  )

  $ Gamma_"opt"=1 / tau_"opt" prop integral_(-infinity)^infinity psi_m(x) psi_n(x) x dd(x) $

  Integralen är nollskild om dess integrand är jämn, så #underline[$psi_m$ får inte ha samma paritet som $psi_n$].
]

#lecture(2024, 12, 4, [])[
  = Tillståndstäthet

  $ n(E)=1 / V derivative(N(E), E) $

  Metall.

  Fermienergin $E_F in [qty("1", "eV"), qty("10", "eV")]$ för metaller (oftast).

  $ n(E)=m / (pi^2 hbar^3) sqrt(2 m E) $

  Vid $T=0$ är alla tillstånd ovanför $E_F$ oockuperade.

  #let EF = 1

  #let F(E, T) = {
    1 / (1 + calc.exp((E - EF) / T))
  }

  #canvas({
    let n(E, T) = {
      if T == 0 {
        if E > EF {
          0
        } else {
          calc.sqrt(E)
        }
      } else {
        calc.sqrt(E) * F(E, T)
      }
    }

    plot.plot(
      size: (12, 8),
      x-label: $E$,
      y-label: $n(E)$,
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "school-book",
      x-ticks: ((1, $E_F$),),
      {
        plot.add(E => n(E, 0), domain: (0, 1.5), samples: 200, fill: true)
        plot.add(E => n(E, 0.05), domain: (0, 1.5), samples: 200, fill: true)
      },
    )
  })

  Rumstemperatur: $E_"T"approx k dot qty("300", "K")=qty("25", "meV")$.

  Sannolikhet att ockupera ett tillstånd med $E$ ges av Fermifunktionen

  $ f(E)=1 / (1 + exp((E-E_F) slash k T)). $

  (Använd bara en stegfunktion om $T=0$.)

  $
    N=cases(
    T=0: quad &V integral_0^E_F n(E) dd(E),
    T>0: quad &V integral_0^infinity n(E) f(E) dd(E)
  )
  $

  = Bandstruktur i kristaller

  // TODO: rita kvantbrunnar formade som tänder

  #figure(
    canvas({
      let wave(x, x0) = calc.exp(-10 * calc.pow(x - x0, 2)) / 2

      plot.plot(
        size: (12, 8),
        axis-style: none,
        x-tick-step: none,
        y-tick-step: none,
        x-label: $x$,
        y-label: $V(x)$,
        {
          plot.add(
            ((-1, 1), (-0.6, 1), (-0.6, 0), (-0.1, 0), (-0.1, 1), (0.1, 1), (0.1, 0), (0.6, 0), (0.6, 1), (1, 1)),
            style: (stroke: black),
          )
          for x0 in (-0.35, 0.35) {
            plot.add(x => wave(x, x0), domain: (-1, 1), style: (stroke: (dash: "dashed")), samples: 200)
          }

          plot.add(x => wave(x, -0.35) + wave(x, 0.35), domain: (-1, 1), style: (stroke: blue), samples: 200)
          plot.add(x => wave(x, -0.35) - wave(x, 0.35), domain: (-1, 1), style: (stroke: red), samples: 200)
        },
      )
    }),
  )

  $N$ brunnar (atomer) ger $N$ tillstånd per ursprungligt antal tillstånd i varje enskild atom, det vill säga väldigt många ty det finns väldigt många atomer. Mellan energibanden finns så kallade bandgap som saknar (serverings)tillstånd.

  \#atomer \#kvantfysik \#wow

  Hos metaller ligger $E_F$ typ i mitten av valensbandet, eller åtminstone så långt ner att det innehåller oockuperade tillstånd.

  Isolatorer har fulla valensband.

  Diamanter är snygga isolatorer.

  #canvas({
    import draw: *

    rect((0, 0), (5, -2), stroke: none, fill: blue.lighten(90%))
    line((0, 0), (5, 0), stroke: blue)
    line((0, 2), (5, 2), stroke: blue)
  })
]

#lecture(2024, 12, 11, [])[
  = Heterostrukturer

  #figure(
    canvas({
      import draw: *

      draw.set-style(
        axes: (stroke: .5pt, tick: (stroke: .5pt)),
        legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%, fill: white),
      )

      plot.plot(
        size: (12, 8),
        axis-style: "left",
        x-tick-step: none,
        y-tick-step: none,
        x-label: none,
        y-label: none,
        y-ticks: ((-2, $E_C$), (-3, $E_V$)),
        legend: "south",
        {
          plot.annotate({
            content((1, 6pt), [InAs])
            content((3, 6pt), [InP])
            content((5, 6pt), [InAs])
          })

          plot.add(((0, 0), (6, 0)), style: (stroke: (dash: "dashed")))
          plot.add(((0, -2), (2, -2), (2, -1), (4, -1), (4, -2), (6, -2)), style: (stroke: black))
          plot.add(((0, -3), (2, -3), (2, -4), (4, -4), (4, -3), (6, -3)), style: (stroke: black))

          plot.add-hline(-1.5, label: [Stark dopning ($1 slash 10^4$)], style: (stroke: red))
          plot.add-hline(-2.5, label: [Svag dopning ($1 slash 10^7$)], style: (stroke: blue))
        },
      )
    }),
  )
]

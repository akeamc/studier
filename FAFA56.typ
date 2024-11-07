#import "template.typ": conf, lecture, hr, ex, obs, sats, anm
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.6.0": qty, unit
#import "@preview/cetz:0.2.2": canvas, draw, plot

#show: doc => conf("FAFA56", [Kvantfysikaliska koncept], doc)

= Ordlista

/ Spänningskälla: Tomas Persson
/ Elektronbassäng: Bollhav
/ Påg: Något som har både partikel- och vågegenskaper
/ Vårtikel: se _Påg_

= Föreläsningar

#lecture(2024, 11, 6, [Fotoelektriska effekten])[
  Två metallplattor med spänning $U$ kan användas för att bromsa elektroner som emitteras med hjälp av fotoelektriska effekten. Mät $I$ som funktion av $U$. #emoji.sparkles

  $ underbrace(unit("A V"), underbrace(unit("W"), unit("J s^-1"))) unit("s") $

  $Phi$: utträdesarbete för en elektron i en elektronbassäng.

  $ E_k=h f-Phi $

  $ E_"Röntgen" underbrace(approx^5, 5 "storleksordningar") E_"synligt" $

  = Comptoneffekten

  $ Delta lambda=lambda'-lambda=h/(m c)(1-cos theta) $
]

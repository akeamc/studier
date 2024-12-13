#import "@preview/unify:0.6.0": qty
#import "@preview/physica:0.9.3": *

#let assignment(book: "Bok", no: "FXX", answer: []) = [
  #set text(lang: "sv")
  #set par(justify: true)
  #set page(header: text(size: 10pt)[*#book #no*])
  #set enum(numbering: "(a)")
  #set math.mat(delim: "[")

  #answer
]

#let m(ch: 0, n: "0", answer) = assignment(book: "Concepts", no: "M" + str(ch) + "-" + n, answer: answer)

#let e(ch: 0, n: "0", answer) = assignment(book: "Concepts", no: "E" + str(ch) + "-" + n, answer: answer)

#let p(ch: 0, n: "0", answer) = assignment(book: "Concepts", no: "P" + str(ch) + "-" + n, answer: answer)

#let o(ch: 0, n: "0", answer) = assignment(book: "Ohlén", no: str(ch) + "-" + n, answer: answer)

#let planck = qty("6,626e-34", "J s")
#let light = qty("3,00e8", "m/s")
#let nm_to_ev = qty("1240", "eV nm")
#let rinf = qty("1,097e7", "m^-1")
#let me = qty("9,109e-31", "kg")

#let infint(content) = $integral_(-infinity)^infinity #content dd(x)$

#let conj(z) = $ #z^* $

#let I = $upright("I")$
#let II = $upright("II")$
#let III = $upright("III")$

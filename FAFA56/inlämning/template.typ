#import "@preview/unify:0.6.0": qty

#let assignment(book: none, no: "FXX", answer: []) = [
  #set text(lang: "sv")
  #set par(justify: true)

  #let book = if book == none {
    "Concepts"
  } else {
    book
  }

  #set page(header: text(size: 10pt)[*#book #no*])

  #answer
]

#let m(book: none, ch: 0, n: "0", answer) = assignment(book: book, no: "M" + str(ch) + "-" + n, answer: answer)

#let e(book: none, ch: 0, n: "0", answer) = assignment(book: book, no: "E" + str(ch) + "-" + n, answer: answer)

#let planck = qty("6,626e-34", "J s")
#let light = qty("3,00e8", "m/s")
#let nm_to_ev = qty("1240", "eV nm")

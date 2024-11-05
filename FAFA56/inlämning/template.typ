#let conf(year, month, day, number, doc) = {
  
  doc
}

#let assignment(book: none, no: "FXX", answer: []) = [
  #set text(lang: "sv")
  #set par(justify: true)

  #let book = if book == none {
    "Concepts"
  } else {
    book
  }

  *#book #no*

  #answer
]

#let m(book: none, ch: 0, n: "0", answer) = assignment(book: book, no: "M" + str(ch) + "-" + n, answer: answer)

#let e(book: none, ch: 0, n: "0", answer) = assignment(book: book, no: "E" + str(ch) + "-" + n, answer: answer)

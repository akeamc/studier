#let conf(id, title, doc) = {
  set document(title: title)
  set text(lang: "sv")
  set page(header: align(center, smallcaps[#id: #title]), numbering: "1")
  set heading(numbering: "1.1")
  set math.equation(numbering: "(1)")

  outline(indent: 1em)
  pagebreak(weak: true)

  doc
}

#let lecture = (year, month, day, title, content) => [
  == #datetime(year: year, month: month, day: day).display() -- #title

  #content
]

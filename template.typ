#let conf(id, title, doc) = {
  set document(title: title)
  set text(lang: "sv")
  set page(header: align(center, smallcaps[#id: #title]), numbering: "1")
  set heading(numbering: "1.1")
  set math.equation(numbering: "(1)")
  set par(justify: true)

  outline(indent: 1em, depth: 3)
  pagebreak(weak: true)

  doc
}

#let lecture = (year, month, day, title, content) => [

  == #datetime(year: year, month: month, day: day).display() -- #title
  
  #set heading(offset: 2)

  #content
]

#let hr = line(length: 100%, stroke: 0.5pt)

#let ex = (title, content) => rect(fill: white.darken(5%))[
  #set math.equation(numbering: none)
  #set enum(numbering: "a)")

  *Exempel:* #title

  #content
]

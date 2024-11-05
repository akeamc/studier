#import "@preview/unify:0.6.0": qty, unit

#set text(lang: "sv")
#set enum(numbering: "a)")

= R1

$f approx qty("5e14", "Hz")$

+ $ lambda = c/f approx qty("600", "nm") $
+ $ qty("1e-2", "m")/qty("6e-7", "m")approx qty("1,67e4", "") $
+ $ E=h f = h dot qty("5e14", "s^-1")=qty("3e-19", "J") $
+ $ qty("3e-19", "J")/qty("1,602e-19", "J/eV")=qty("2", "eV") $
+ Orange (nästan rätt kulör). #figure(caption: [6~211 Å.], image("f.svg", width: 10%))

= R2

$ a=h c unit("eV")/unit("J") 1/(10^(-9))=qty("1239", "nm eV") $

= R3

$ [qty("380", "nm"), space qty("750", "nm")] arrow.squiggly [a/qty("380", "nm"), space a/qty("750", "nm")]=[qty("3,26", "eV"), space qty("1,652", "eV")] $

= R4

$ (r_1-r_2)=lambda (n + 1 slash 2), quad n in ZZ $

= R5

Koherens. Fas.

#import "./template.typ": e
#import "@preview/unify:0.6.0": qty

#show: doc => e(ch: 41, n: "9", doc)

Vid tillräckligt små vinklar är avståndsskillnaden mellan två intilliggande minima i interferensmönstret ungefär

$ Delta y=(lambda L)/d $

vilket ger

$ lambda = (d Delta y)/L. $

Avståndet mellan första och tionde minimumet är känt: $9 Delta y=qty("1,8e-2", "m")$.

Våglängden är då

$ lambda = (d Delta y)/L=(d (9 Delta y)/9)/L=(qty("1,5e-4", "m") dot qty("1,8e-2", "m")/9)/qty("50e-2", "m")=qty("6,0e-7", "m"). $

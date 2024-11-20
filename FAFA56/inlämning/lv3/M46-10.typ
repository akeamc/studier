#import "../template.typ": m, e
#import "@preview/unify:0.6.0": qty, num

#show: doc => m(ch: 46, n: "10", doc)

2. #[
  $ z = root(3, -1) <=> z^3=(r e^(i theta))^3&=-1=e^(pi i)\
    <=> r^3 e^(3 i theta)&=e^(pi i) quad quad &r=1\
    <=> 3 theta&=(1 + 2n)pi quad quad &n in ZZ\
    <=> theta&=((1+2n)pi)/3 quad quad &n=0
  $

  så rätt svar är *(B)*.
]

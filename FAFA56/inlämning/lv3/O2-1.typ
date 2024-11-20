#import "../template.typ": o
#import "@preview/unify:0.6.0": qty
#import "@preview/physica:0.9.3": *

#show: doc => o(ch: 2, n: "1", doc)

+ Att kraften är återställande -- ett positivt $x$ ger en kraft $F_x$ i negativ $x$-riktning och vice versa.
+ #[
  Potentialen ges av arbetet som utförs när fjädern sträcks ut en sträcka $x$, nämligen $ V(x)=-integral F_x dd(x)=c integral x^3 dd(x)=(c x^4)/4 + C. $

  Potentialen borde rimligtvis vara noll då $x=0$, så $C=0$.
]
+ #[
  I utgångsläget har kroppen den kinetiska energin $K=1/2 m v_0^2$. Utefter banan kommer den att bromsas snabbare och snabbare (decelerationen är proportionell mot förskjutningen $x$ i kubik; $x^3$), innan den vänder och passerar jämviktsläget $x=0$ med hastigheten $-v_0$. Symmetri säger oss att den kommer att bete sig på samma sätt på andra sidan jämviktsläget, och sedan återvända till utgångsläget med hastigheten $v_0$. Alltså kommer den att fortsätta svänga fram och tillbaka för evigt.

  Kroppen vänder i punkten $x_1$ där all kinetisk energi $K$ har omvandlats till potentiell fjäderenergi $V(x)$:
  
  $ K&=V(x_1)\
  <=> 1/2 m v_0^2&=(c x_1^4)/4\
  <=> ((2 m v_0^2)/c)^(1/4)&=x_1. $
]

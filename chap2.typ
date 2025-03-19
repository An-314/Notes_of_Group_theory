#import "@preview/scripst:1.1.1": *

= (有限)群的表示论

== 线性空间

#definition(subname: [线性空间])[
  对于非空集合$V={x,y,z,...}$和域$K={alpha,beta,gamma,...}$，定义两个运算：
  - 加法：$+:V times V -> V, x + y |-> z$
  - 数乘：$dot:K times V -> V, alpha dot x |-> y$
  满足以下条件：
  - 加法交换律：$x + y = y + x$
  - 加法结合律：$(x + y) + z = x + (y + z)$
  - 加法单位元：存在$0 in V$，使得$x + 0 = x$
  - 加法逆元：对于每个$x in V$，存在$y in V$，使得$x + y = 0$
  - 数乘结合律：$(alpha beta) dot x = alpha dot (beta dot x)$
  - 数乘单位元：存在$1 in K$，使得$1 dot x = x$
  - 数乘分配律：$alpha dot (x + y) = alpha dot x + alpha dot y$, $(alpha + beta) dot x = alpha dot x + beta dot x$
  则称$V$为$K$上的*线性空间*。
]

线性空间定义了数乘的加法群。所以在线性空间里就有
$
  vb(r) = sum_i x_i vu(e)_i
$
加法和数乘给出了线性空间的结构。

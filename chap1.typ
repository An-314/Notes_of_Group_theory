#import "@local/scripst:1.1.0": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

= 群

#definition(subname: [*群*])[

  对于*集合* ${...,f,g,h} = cal(G)$ 以及*二元运算*乘法 $dot:cal(G)times cal(G)->cal(G)$ 满足以下条件：

  - *封闭性：*$f dot g in cal(G)$
  - *结合律：*$(f dot g) dot h = f dot (g dot h)$
  - *单位元：*存在 $e in cal(G)$ 使得 $e dot f = f$
  - *逆元：*对于每个 $g in cal(G)$ 存在 $g^(-1) in cal(G)$ 使得 $g dot g^(-1)= e$

  称 $(cal(G), dot)$ 为一个*群*。
]

- 群无序、不重、不独立
- 二元运算并不一定有交换律，用乘法做二元运算的代表；运算是要定义在集合上的，这样封闭性是自然的、一体的
- 结合率是必要的，否则 $f dot g dot h$ 是模棱两可的，$QQ$中的减法就是一个例子，$QQ$ 上的减法和除法是不能构成群的
- 单位元的例子：$QQ$上的加法单位元是 $0$，$QQ$上的乘法单位元是 $1$




// 思考：有限群只需要第一个条件

#definition(subname: [*拟群*])[

  对于*集合* ${...,f,g,h} = cal(G)$ 以及*二元运算*乘法 $dot:cal(G)times cal(G)->cal(G)$ 满足以下条件：

  - *封闭性：*$f dot g in cal(G)$
  - *结合律：*$(f dot g) dot h = f dot (g dot h)$
  - *单位元：*存在 $e in cal(G)$ 使得 $e dot f = f$

    称 $(cal(G), dot)$ 为一个*拟群*。
]

#definition(subname: [*半群*])[

  对于*集合* ${...,f,g,h} = cal(G)$ 以及*二元运算*乘法 $dot:cal(G)times cal(G)->cal(G)$ 满足以下条件：

  - *封闭性：*$f dot g in cal(G)$
  - *结合律：*$(f dot g) dot h = f dot (g dot h)$

  称 $(cal(G), dot)$ 为一个*半群*。
]

#definition(subname: [*群胚*])[

  对于*集合* ${...,f,g,h} = cal(G)$ 以及*二元运算*乘法 $dot:cal(G)times cal(G)->cal(G)$ 满足以下条件：

  - *封闭性：*$f dot g in cal(G)$

  称 $(cal(G), dot)$ 为一个*群胚*。
]

本课程我们研究的重点对象是*群*。

#theorem(subname: [*重排定理*])[

  对群 $cal(G) = {...,g_1,g_2,...}$，对于固定的 $u in cal(G)$，$u dot cal(G) =  {u dot g_1, u dot g_2,...}$，则
  $
    u cal(G) = cal(G)
  $
]

#proof[
  用两步说明：
  1. $forall f in cal(G), f = u g$
  2. $f_1 = u g_1, f_2 = u g_2, g_1 != g_2$则$f_1 != f_2$
]

#definition(subname: [*Cayley 表*])[

  对于群 $cal(G)$，其*Cayley 表*是一个 $n times n$ 的矩阵，其中 $n = |cal(G)|$，第 $i$ 行第 $j$ 列的元素是 $g_i dot g_j$。


  #figure(
    tablex(
      columns: 5,
      align: center,
      auto-vlines: false,
      auto-hlines: false,
      (),
      vlinex(),
      (),
      (),
      (),
      (),
      [$dot$],
      [$e$],
      [$...$],
      [$g_i$],
      [$...$],
      hlinex(start: 0, end: 54),
      [$e$],
      [$e$],
      [ ],
      [ ],
      [ ],
      [$...$],
      [],
      [],
      [],
      [],
      [$g_j$],
      [],
      [],
      [$g_i dot g_j$],
      [],
      [$...$],
      [],
      [],
      [],
      [],
    ),
  )

  每个元素在乘法表中的每行每列都会出现一次。
]

#newpara()

一个有运算的重排表能对应一个群吗？

- 不一定满足结合率，所以不一定是一个群。


#example(subname: [加法群 $ZZ_n$])[

  加法群 $ZZ_n = {0,1,2,...,n-1}$，定义 $dot: ZZ_n times ZZ_n -> ZZ_n$ 为 $a dot b = (a+b) mod n$，这构成一个*加法群*。
]

#example(subname: [常见的数的集合])[
  - $NN$ 的加法不构成群、构成拟群，乘法不构成群
  - $ZZ$ 的加法构成群，乘法不构成群
  - $QQ$ 的加法构成群，乘法构成群
  - $RR$ 的加法构成群，乘法构成群
  - $CC$ 的加法构成群，乘法构成群

  这些都是Abel群。
]

#definition(subname: [*Abel群*])[
  如果群的二元运算满足交换律，则称该群为*Abel群*。
]

#example(subname: [矢量的集合])[

  $E^3 = {vb(r)}$ 加法构成群，点乘不构成群，叉乘不构成群
]

#example(subname: [矩阵群/一般线性变换群])[

  $n$维复空间上的非奇异矩阵构成*矩阵群*：
  $
    M(n, CC) = {m_(n times n) | m_(i,j) in CC, det(M) != 0}
  $
  加法构成群，乘法构成群。
]

一个变换（算符）在选定合适的基下可以用矩阵表示，变换和矩阵是一一对应的。
$
  "GL"(n, CC) = { A | A_(i j) in CC, det(A) != 0 }
$
*一般线性变换群*，变换相比矩阵是脱离空间的。

#example(subname: [循环群])[

  对于群 $cal(G)$，满足
  $
    C^n = {a, a^2, a^3, ..., a^n = e}
  $
  对运算
  $
    a^k dot a^l = a^(k+l mod n)
  $
  构成一个*循环群*。这个群是一个Abel群。
]

对于加法群：
$
  ZZ_n = C^n_1
$
#newpara()

所有Abel群都是循环群吗？

不一定，例如$ZZ_2 times ZZ_2$。

#example(subname: [置换群 $S_n$])[

  对于三个元素的置换构成一个*置换群*，$S_3 = {P_i}$，$abs(S_3) = 6$，其中
  $
    e = P_1 = mat(1,2,3;1,2,3), P_2 = mat(1,2,3;2,3,1), P_3 = mat(1,2,3;3,1,2)\
    P_4 = mat(1,2,3;2,1,3), P_5 = mat(1,2,3;3,2,1), P_6 = mat(1,2,3;1,3,2)
  $
  这是非Abel群。

  对于一般的置换群$S_n$，$abs(S_n) = n!$。
]

#example(subname: [正三角形的二面体群 $D_3$])[

  $D_3 = {e, f, g, a, b, c}$，其中操作为沿着三个轴的旋转和反射，$abs(D_3) = 6$，这是非Abel群。
]

$D_3$的坐标系是刚体坐标系，而非空间坐标系。它和$S_3$是同构的。


#example(subname: [Lie群 $"SO"(2)$])[

  二维空间上的旋转群
  $
    "SO"(2) = { R(theta) }
  $
  运算定义为
  $
    R(theta_2) dot R(theta_1) = R(theta_1 + theta_2 mod), theta in (-pi, pi]
  $
  这是一个无限Abel群。

]

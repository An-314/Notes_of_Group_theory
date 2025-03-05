#import "@preview/scripst:1.1.0": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge

= 群

== 群的定义

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
- 群定义中单位元和任意群元素的逆元都是唯一的

#note(count: false)[

  有限群只需要第一个条件。这是因为考虑$g,g^2,...,g^abs(cal(G)+1)$这几个元素，一定有两个是相同的，这意味着$forall g in cal(G), exists m, n, g^(m-n)=e$这就证明单位元一定存在。而$g^(-1) = g^(m-n-1)$。
] #label("1")

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

#newpara()

== 子群

#definition(subname: [*子群*])[

  对于群 $cal(G)$，如果 $cal(H) subset cal(G)$ 且 $cal(H)$ 也是一个群，则称 $cal(H)$ 是 $cal(G)$ 的*子群*。
]

下面给出$cal(G)$非空子集$cal(H)$是$cal(G)$的子群的充要条件：

#proposition(subname: [*子群的充要条件*])[

  对于群 $cal(G)$，$cal(H)$ 是 $cal(G)$ 的子群当且仅当：

  1. $forall f, g in cal(H), f dot g in cal(H)$
  2. $forall f in cal(H), f^(-1) in cal(H)$

  等价于 $forall f, g in cal(H), f dot g^(-1) in cal(H)$
]

#proof[
  给出的两条判定条件而言，结合率是显然的，而逆元的存在保证了单位元的存在。下面证明两种命题的等价性：

  1. 充分性：
    - 考虑$f = h_i, g = h_i$，单位元存在
    - 考虑$f = e, g = h_j$，逆元存在
    - 考虑$f = h_i, g = (h_j)^(-1)$，封闭性
    - 结合率是显然的
  2. 必要性：是显然的

]

需要注意验证逆元是因为群$cal(G)$已经定义了单位元和逆元，在群$cal(G)$的定义中，单位元的存在性是必要的。

#proposition[

  两个子群的交集还是一个子群，但两个子群的并集不一定是一个子群。
]

#proposition[

  $cal(G)$是群，则非空有限子集合$cal(H)$是$cal(G)$的子群当且仅当：$∀a,b∈cal(H)⇒a b∈cal(H)$
]

#proof[

  此证明和群的定义下面的探讨是类似的。
]

#problem[

  证明：$cal(H)$是群$cal(G)$的一个有限子群当且仅当$cal(H)^2=cal(H)$。
]

#proof[
  - 群$cal(G)$的非空子集$cal(H)$是子群当且仅当$cal(H)^2 = cal(H)$且$cal(H)^(-1) = cal(H)$
    - $cal(H)^2 = {a dot b | a, b in cal(H)}$
    - 由定义这是显然的：需要验证$cal(H)^2 subset cal(H) and cal(H)^2 supset cal(H)$（由$cal(H)^(-1) = cal(H)$可得）
  - 群$cal(G)$的非空子集$cal(H)$成为子群当且仅当$cal(H) cal(H)^(-1) = cal(H)$
  - $cal(H)$是群$cal(G)$的一个有限子群当且仅当$cal(H)^2=cal(H)$
]

#example(subname: [一些子群的简单例子])[

  - 任何群$cal(G)$都有两个平凡的子群：$cal(G)$和$\{e\}$。
  - 数集$(CC,+)$的一个子群是$(RR,+)$，$(RR,+)$的一个子群是$(ZZ,+)$，$(ZZ,+)$的一个子群是$(ZZ_e,+)$。
    - 这就构成一条*群链*：$(CC,+) supset (RR,+) supset (ZZ,+) supset (ZZ_e,+)$。
  - $"GL"(n, CC)$的一个子群是$"GL"(n, RR)$，$"GL"(n, CC) supset "GL"(n, RR)$。
    - 故此$"GL"(n, RR)$的定义除了$"GL"(n, RR) = { A | A_(i j) in RR, det(A) != 0 }$外还可以是$"GL"(n, RR) = { A in "GL"(n, CC) | A_(i j) in RR }$。
  - 定义*特殊线性群*为$"SL"(n, CC)$
  $
    "SL"(n, CC) = { A | A_(i j) in CC, det(A) = 1 }
  $
  则$"SL"(n, CC)$是$"GL"(n, CC)$的子群。$"SL"(n,CC)$是群是显然的。

]

#proposition(subname: [关于$"SL"$的一些性质])[

  #figure(
    diagram(
      spacing: 2em,
      $
        & "GL"(n,RR)edge("dr", supset, ->) & \
        "GL"(n,CC) edge("ur", supset, ->) edge("dr", supset, ->) && "SL"(n,RR) \
        & "SL"(n,CC) edge("ur", supset, ->) & \
      $,
    ),
  )

  $
    "SL"(n,RR) = "SL"(n,CC) and "GL"(n,RR)
  $

  $
    "GL"(n,CC) subset "GL"(n+1,CC)
  $
]

#example(subname: [二面体群$D_3$的子群])[

  $D_3$的子群有$\{e\}$、$\{e, a\}$、$\{e, b\}$、$\{e, c\}$、$\{e, d, f\}$、$D_3$。
]

#example(subname: [循环子群$C^n_a$])[

  对于$g in cal(G)$，如果$exists m in ZZ$使得$g^m = e$，则$C^m_a = {e, g, g^2, ..., g^(m-1)}$是$cal(G)$的一个子群。这些子群都是Abel群。
]

#definition(subname: [*阶*])[

  对于群$cal(G)$，$cal(G)$的元素个数称为$cal(G)$的*阶*，记作$abs(cal(G))$。

  群元素$g$的阶是使得$g^m = e$的最小正整数$m$，记作$abs(g)$。
]

#example(subname: [二面体群$D_3$的元素的阶])[

  对于旋转$abs(a) = abs(b) = abs(c) = 3$，对于反射$abs(d) = abs(f) = 2$，对于单位元$abs(e) = 1$。
]

#example(subname: [中心])[

  对于$cal(G)$的子集$C={x in cal(G) | x g = g x, forall g in cal(G)}$，$C$是$cal(G)$的一个子群，称为$cal(G)$的*中心*。
]

#proof[

  1. 逆元存在：$x^(-1) dot (x g) dot x^(-1) = x^(-1) dot (g x) dot x^(-1)$
  2. 封闭性：$(x g^(-1)) dot g = x g^(-1) g = x g g^(-1) = g x g^(-1)= g dot (x g^(-1))$
]

#example(subname: [$"SO"(2)$的子群])[

  $"SO"(2)$是最小的Lei群，但它有子群
  $
    {e, f, g} = {R(0), R(2 / 3pi), R(4 / 3pi)}
  $
  $
    "SO"(2) supset T, O, I
  $
  $T, O, I$：表示三维中的有限旋转对称群：
  - $T$(Tetrahedral group)四面体群,$A_4$交错群
  - $O$(Octahedral group)八面体群,$S_4$对称群
  - $I$(Icosahedral group)二十面体群,$A_5$交错群
]

#newpara()

对于无限群，我们希望能够找到有限的“元素”来刻画，这就引出了*生成元*的概念。

#definition(subname: [生成元])[

  对于群$cal(G)$，如果$cal(G)$的子集$S = {g_1, g_2, ... ,g_r}$，如果$cal(G)$中的每个元素都可以表示为$S$中元素的有限次运算，则称$S$是$cal(G)$的*生成元*。记作$expval(S)$或者$angle.l g_1, g_2, ... ,g_r angle.r$。
]

1. 生成元不是唯一的。对有限群，总是可以考虑一组数量最少的生成元。单位元一般不考虑它在生成元中。
2. 有限群的生成元一定是有限的。但有限的生成元生成的群不一定是有限群。

#example(subname: [只有一个生成元的群])[

  - 循环群$C^n$是由一个生成元$g$生成的，$C^n$：
    $
      {g} => {g^i | i in ZZ}
    $
    - 如果存在$m in ZZ$使得$g^m = e$，则$C^m = {e, g, g^2, ..., g^(m-1)}$是有限循环群
    - 如果不存在这样的$m$，则$C = expval(g)$是无限循环群
  // 问题，这样的定义对吗？
  - 整数群$(ZZ,+)$是由一个生成元$1 ("和"-1)$生成的，$ZZ = angle.l 1,(-1) angle.r$。
]

一个生成元无法生成非Abel群，两个就有可能。

#example(subname: [两个元素生成群])[

  考虑$D_3$和变换$a, d$，有：
  $
    e = d^2, d=d, f= d^2, a=a, b= a d, c= a d^2
  $
]

#newpara()

对于两个生成元$g_1,g_2$，可以生成的元素是
$
  g_1^(i_1) g_2^(i_2), g_2^(i_1) g_1^(i_1), g_1^(i_1) g_2^(i_2) g_1^(i_3), ...
$
可以写成
$
  {g_1,g_2} = { product_(k) g_1^(i_1_k) g_2^(i_2_k) | i_1_k, i_2_k in ZZ }
$
#newpara()

现在群元有了生成元的表示，在生成元的表示下，原来的乘法表可以复现。这就是*定义关系*。

#example(subname: [$D_3$的乘法表])[

  #let tab = (
    (),
    vlinex(),
    (),
    (),
    (),
    (),
    (),
    [$dot$],
    [$a^2$],
    [$d$],
    [$d^2$],
    [$a$],
    [$a d$],
    [$a d^2$],
    hlinex(),
    [$d$],
    [$d a^2$],
    [$d^2$],
    [$d^3$],
    [$d a$],
    [$d a d$],
    [$d a d^2$],
  )
  #figure(
    tablex(
      columns: 7,
      align: center,
      auto-vlines: false,
      auto-hlines: false,
      ..tab,
    ),
  )

  看起来第一行并不是$D_3$群元的置换，这意味着$a,d$有一定关系
  $
    a^2 = e, d^3 = e, a d = d^2 a
  $
  上述关系是$D_3$的*定义关系*。利用定义关系，可以将$D_3$的乘法表写成

  #let tab = (
    (),
    vlinex(),
    (),
    (),
    (),
    (),
    (),
    [$dot$],
    [$a^2$],
    [$d$],
    [$d^2$],
    [$a$],
    [$a d$],
    [$a d^2$],
    hlinex(),
    [$d$],
    [$d$],
    [$d^2$],
    [$a^2$],
    [$a d^2$],
    [$a$],
    [$a d$],
  )
  #figure(
    tablex(
      columns: 7,
      align: center,
      auto-vlines: false,
      auto-hlines: false,
      ..tab,
    ),
  )
]

生成元不唯一，定义关系就不唯一。

#definition(subname: [生成元的定义关系])[

  设生成元集合$S = {g_1, g_2, ... ,g_s}$，生成群$cal(G) = expval(S)$，生成元存在如下定*义关系集合*
  $
    W = {W_i(g_1, g_2, ... ,g_s) = e | i = 1, 2, ... ,m}
  $
  其中$W_i$是$g_1, g_2, ... ,g_s$的乘积形式，每一个形如$W(g_1, g_2, ... ,g_s) = e$的等式称为$cal(G)$的*定义关系*。
]

可以证明定义关系的存在性，因此我们说：*一个有限群群可以由其生成元集合和定义关系集合所完全刻画*。一般，我们并不强调定义关系是不多余的，因为在具体应用的大多数情况中，少数定义关系就可确定一个群。

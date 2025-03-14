#import "@preview/scripst:1.1.1": *
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

#note(count: false, lab: "有限群")[

  有限群只需要第一个条件。这是因为考虑$g,g^2,...,g^abs(cal(G)+1)$这几个元素，一定有两个是相同的，这意味着$forall g in cal(G), exists m, n, g^(m-n)=e$这就证明单位元一定存在。而$g^(-1) = g^(m-n-1)$。
]

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
    numbering: none,
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

#exercise[

  证明：$cal(H)$是群$cal(G)$的一个有限子群当且仅当$cal(H)^2=cal(H)$。
]

#proof[
  - 群$cal(G)$的非空子集$cal(H)$是子群当且仅当$cal(H)^2 = cal(H)$且$cal(H)^(-1) = cal(H)$
    - $cal(H)^2 = {a dot b | a, b in cal(H)}$
    - 由定义这是显然的：需要验证$cal(H)^2 subset cal(H) and cal(H)^2 supset cal(H)$（由$cal(H)^(-1) = cal(H)$可得）
  - 群$cal(G)$的非空子集$cal(H)$成为子群当且仅当$cal(H) cal(H)^(-1) = cal(H)$
  - $cal(H)$是群$cal(G)$的一个有限子群当且仅当$cal(H)^2=cal(H)$
]

#example(subname: [一些子群的简单例子], lab: "群链")[

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

#proposition(subname: [关于$"SL"$的一些性质], lab: "SL")[

  #figure(
    diagram(
      spacing: 2em,
      $
        & "GL"(n,RR)edge("dr", supset, ->) & \
        "GL"(n,CC) edge("ur", supset, ->) edge("dr", supset, ->) && "SL"(n,RR) \
        & "SL"(n,CC) edge("ur", supset, ->) & \
      $,
    ),
    caption: [关于$"SL"$的一些性质],
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

== 生成元

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

  设生成元集合$S = {g_1, g_2, ... ,g_s}$，生成群$cal(G) = expval(S)$，生成元存在如下*定义关系集合*
  $
    W = {W_i (g_1, g_2, ... ,g_s) = e | i = 1, 2, ... ,m}
  $
  其中$W_i$是$g_1, g_2, ... ,g_s$的乘积形式，每一个形如$W(g_1, g_2, ... ,g_s) = e$的等式称为$cal(G)$的*定义关系*。
]

可以证明定义关系的存在性，因此我们说：*一个有限群群可以由其生成元集合和定义关系集合所完全刻画*。一般，我们并不强调定义关系是不多余的，因为在具体应用的大多数情况中，少数定义关系就可确定一个群。

如上所示，$D_3 = {angle.l a,d angle.r | a^2=d^3=e, (d a)^2=e}$。

#example(subname: [点群$D_(2n)$])[

  $D_(2n)$是$n$维正多面体的对称群，$D_(2n) = {angle.l a,b angle.r | a^2 = b^n = e, (a b)^2 = e}$。
]

== 陪集

为了研究子群和母群之间的联系，引入陪集的概念。

#definition(subname: [*左陪集*])[

  对于群$cal(G)$和子群$cal(H)$，取$cal(G)$中不属于$cal(H)$的$u$，$cal(G)$的*左陪集*是$cal(G)$的子集$u cal(H) = {u h | h in cal(H)}$，记作$u cal(H)$。
]

#proposition(subname: [陪集的性质], lab: "陪集性质")[

  1. 陪集与子群的阶相同
  $
    abs(u cal(H)) = abs(cal(H))
  $
  2. 陪集之间没有交集
  $
    u cal(H) inter cal(H) = nothing
  $
  3. *陪集定理：*两陪集要么全同，要么完全不同。
  4. 陪集的代表元不唯一。
]

#proof[

  1. 考虑重排定理的证明方法。
  2. 考虑 $u h_alpha = h_beta$ ，就有 $u = h_beta h_alpha^(-1)$，这意味着 $u = e in cal(H)$，矛盾。
  3. 如果有共同元素，我们证明其是完全相同的。$u_1 h_alpha in u_1 cal(H), u_2 h_beta in u_2 cal(H)$，$u_1 h_alpha = u_2 h_beta$，有
    $
      u_2^(-1) u_1 cal(H) = h_beta h_alpha^(-1) cal(H) =^"重排定理" cal(H)
    $
    从而$u_1 cal(H) = u_2 cal(H)$。
  4. 对于$v in u cal(H), v in.not cal(H), v in cal(G)$有
    $
      v cal(H) = u cal(H)
    $
]

#proposition(subname: [陪集的性质])[

  陪集不是子群。
]

#proof[

  这是由 @陪集性质 的第二条性质得到的。因为$e in cal(H)$，所以$u in u cal(H)$，但$u cal(H)$不包含单位元。
]

#theorem(subname: [Lagrange定理])[

  有限群的子群的阶为该有限群阶的因子（factor）。设群 $cal(G)$ 的阶为 $n$，其子群 $cal(H)$ 的阶为 $m$，则 $m$ 是 $n$ 的因子。
]

#proof[

  对$G$进行划分：
  - $cal(H)$
  - $u_1 in.not cal(H)$, $u_1 cal(H)$
  - $u_2 in.not cal(H), in.not u_1 cal(H)$, $u_2 cal(H)$
  - ...
  - $u_(n-1) in.not cal(H), in.not u_1 cal(H), in.not u_2 cal(H), ..., in.not u_(n-2) cal(H)$, $u_(n-1) cal(H)$
  可以把$cal(G)$划分为$n/m$个陪集，每个陪集的阶都是$m$。

  我们说每个元素都一定在一个陪集里，$u$一定在一个陪集里，而陪集的阶一定是$u$，否则就在已经被划分好的陪集里了。
]

#note(count: false)[

  初等数论里的 *Fermat小定理*, *Euler定理* 是Lagrange定理的一个特例。
]

#remark(subname: [Lagrange逆定理成立吗])[

  12阶的 $T$ 没有6阶子群。
]

#corollary(subname: [Langrange定理的推论])[

  阶为素数的群一定是循环群。
]

#proof[

  在子群里任取一个非单位元$g$，$g$的阶是$m$，$m$是$cal(G)=p$的因子，$m=p$，所以$g$是生成元。
]
#corollary(subname: [Langrange定理的推论])[

  群元素的阶是群的阶的因子。
]

#proof[

  由Lagrange定理，$abs(g) = m$，$abs(cal(G)) = n$，$cal(H) = expval(g), abs(cal(H))=m$，$m$是$n$的因子。
]

#definition(subname: [双陪集])[

  对于群$cal(G)$和子群$cal(H), cal(K)$，$cal(G)$的*双陪集*是$cal(G)$的子集$cal(H) u cal(K) = {h u k | h in cal(H), k in cal(K)}$，记作$cal(H) u cal(K)$。
]

== 共轭元素

#definition(subname: [*共轭元素*])[

  对于群$cal(G)$，$cal(G)$的元素$g_1, g_2$，如果存在$u in cal(G)$使得$g_2 = u g_1 u^(-1)$，则称$g_1, g_2$是*共轭元素*。记作$g_1 ~ g_2$。
]

在线性空间中是*相似*的概念。

#proposition(subname: [共轭元素性质])[

  - 自反性：$g ~ g$
  - 对称性：$g_1 ~ g_2 => g_2 ~ g_1$
  - 传递性：$g_1 ~ g_2, g_2 ~ g_3 => g_1 ~ g_3$
]

#definition(subname: [等价关系])[

  如果一个关系满足自反性、对称性、传递性，则称这个关系是*等价关系*。
]
共轭是一个等价关系。

#note(count: false)[

  我门可以定义其他的等价关系，例如
  $
    K u H = {k u h | k in K, h in H}
  $
  若$v = k u h$，称$v tilde u$，这也是个*等价关系*。特别地，$H u H$就是共轭关系。
]


#definition(subname: [*类*])[

  所有相互共轭的元素构成一个类。包含群元素$g$的类记作$K_g$，其元素为
  $
    K_g = {u g u^(-1) | forall u in cal(G)}
  $
]

#example(subname: [$D_3$的类])[

  $D_3$的类有$K_e = {e}$, $K_a = {a, b, c}$, $K_d = {d, f}$。
  $
    d ->^(g d g^(-1)) cases(
    d "  " &e,
    d "  " &d\,f,
    f "  " &a\,b\,c
  )
  $
  可以看到$d$做共轭是$d$的是一个子群${e, d, f}$。
]

类也是对母群的*划分*。

#proposition(subname: [类的性质])[

  单位元 $e$ 自成一类。
]

#proposition(subname: [类的性质])[

  同类的元素的阶相同，即 $g_alpha tilde g_beta, exists x in cal(G), g_beta = x g_alpha x^(-1)$，则 $abs(g_alpha) = abs(g_beta)$。
]

#proof[

  令$abs(g_alpha)=n$
  $
    g_beta^n = (x g_alpha x^(-1))^n = x g_alpha^n x^(-1) = e
  $
  下面证明不会有更小的$m$使得$g_beta^m = e$。
  $
    &g_beta^m = (x g_alpha x^(-1))^m = x g_alpha^m x^(-1) = e\
    => & g_alpha^m = x^(-1) e x = e
  $
  由$abs(g_alpha)=n$知$m>=n$。
]

#proposition(subname: [类的性质])[

  不同的类没有共同的元素。
]

#proposition(subname: [类的性质])[

  一个类的逆也是一个类。
]

#proof[

  由$g_alpha tilde g_beta$，存在$x in cal(G)$使得$g_beta = x g_alpha x^(-1)$，则$g_beta^(-1) = (x g_alpha x^(-1))^(-1) = x g_alpha^(-1) x^(-1)$。
]

#theorem(subname: [类定理])[

  有限群的一个类所包含的元素个数为该群的阶的因子。
]

#proof[

  ```
  "子群" -> "陪集" -> "Lagrange" -> "因子"
  ```
  #newpara()
  对于$f in cal(G)$，取共轭到自己的元素$h$构成的集合
  $
    cal(H)_f = { h in cal(G) | h f h^(-1) = f }
  $
  下面证明他是一个*子群*：
  - $h_alpha , h_beta in cal(H)_f => h_alpha h_beta in cal(H)_f$
    $
      h_alpha f h_alpha^(-1) = f, h_beta f h_beta^(-1) = f => h_alpha h_beta f h_beta^(-1) h_alpha^(-1) = f
    $
  - $h in cal(H)_f => h^(-1) in cal(H)_f$
    $
      h f h^(-1) = f => h^(-1) f h = f
    $
  从而$cal(H)_f$是子群。现在由这个子群构造*陪集串*
  $
    cal(H)_f, g_alpha cal(H)_f, g_beta cal(H)_f, ...
  $
  #newpara()
  下面证明一个引理
  #lemma[

    任意两个元素作 $f$ 的共轭运算给出 $cal(K)_f$ 类中的同一个元素的*充要条件是*：这两个元素属于 $H_f$ 的同一个陪集。
  ]


  $forall g_alpha, g_beta in.not cal(H)_f$有
  $
    g_alpha f g_alpha^(-1) = g_beta f g_beta^(-1) <=> f = (g_alpha^(-1) g_beta) f (g_alpha^(-1) g_beta)^(-1)<=> g_alpha^(-1) g_beta in cal(H)_f <=> g_beta in g_alpha cal(H)_f
  $
  这就意味着，类中的每一个元素都对应着一个陪集，且这些陪集的元素个数相同，这些陪集的元素个数是$cal(G)/cal(H)_f$，也就是类的元素个数是$cal(G)/cal(H)_f$，是$cal(G)$的阶的因子。
]

== 不变子群

下面我们考虑对子群做共轭运算。

#definition(subname: [*共轭子群*])[

  对于群$cal(G)$和子群$cal(H)$，取一个群元素$x in cal(G), x in.not cal(H)$，可以证明$cal(H)$的共轭
  $
    cal(F) = cal(H)_x = {x h x^(-1) | h in cal(H)}
  $
  是$cal(G)$的一个子群，称为$cal(H)$的*共轭子群*，记作$cal(H) tilde cal(F)$。
]

#proof[

  - 封闭性：$x h_1 x^(-1) x h_2 x^(-1) = x h_1 h_2 x^(-1)$
  - 单位元：$x e x^(-1) = e$
  - 逆元：$x h x^(-1) x h^(-1) x^(-1) = e$
]

#proposition(subname: [共轭子群的性质])[

  若$cal(H) tilde cal(F)$，则
  - 子群 $cal(F)$ 的阶与 $cal(H)$ 的阶相等
  - $cal(F)$ 与 $cal(H)$ 是互为共轭子群
]

#definition(subname: [不变子群])[

  对于群$cal(G)$和子群$cal(H)$，若对任意群元素$g in cal(G)$，有
  $
    g cal(H) g^(-1) = cal(H)
  $
  则称$cal(H)$是$cal(G)$的*不变子群*。$cal(H) lt.tri cal(G)$
]

#proposition(subname: [不变子群的性质])[

  - 任意群元素$u in.not cal(H)$所生成的左右陪集相同$u cal(H) = cal(H) u$。
  - 如果$cal(H)$中包含了元素$h$，则一定包含了$h$的完整类$K_h$。
]

#remark[
  这两条性质和定义，任意一个都可以作为不变子群的定义。
]

#example(subname: [$D_3$的不变子群])[

  $D_3$的不变子群是
  $
    d_3 = {e, d, f}
  $
]

利用不变子群的概念，可以对群进行分类：

#definition(subname: [*单群与半单群*])[

  - 如果群$cal(G)$不含不变子群，则称$cal(G)$是*单群*。
  - 如果群$cal(G)$不含Abel不变子群，则称$cal(G)$是*半单群*。
]

== 商群

不变子群可以构造陪集串。设$cal(H)$是$cal(G)$的不变子群，$cal(H)$的陪集串
$
  cal(H), u_1 cal(H), u_2 cal(H), ..., u_(j-1) cal(H)
$
考虑两个陪集相乘
$
  u_i cal(H) dot u_j cal(H) = (u_i u_j) (u_j^(-1) cal(H) u_j) cal(H) = u_i u_j cal(H) = u_l cal(H)
$
还是一个陪集。这样就构成了一个群，称为*商群*。

#definition(subname: [*商群*])[

  如果把$cal(H)$的陪集串
  $
    cal(H), u_1 cal(H), u_2 cal(H), ..., u_(j-1) cal(H)
  $
  中的每个陪集看成一个元素，那么该陪集串在陪集乘法
  $
    u_i cal(H) dot u_j cal(H) = u_i u_j cal(H) = u_l cal(H)
  $
  下构成一个群，称为$cal(G)$关于$cal(H)$的*商群*，记作$cal(G)\/cal(H)$。
]

#proof[

  - 封闭性：$u_i u_j cal(H) = u_l cal(H)$
  - 结合率：$(u_i cal(H)) ((u_j cal(H)) (u_k cal(H))) = (u_i u_j u_k) cal(H) = (u_i (u_j u_k)) cal(H) = ((u_i u_j) u_k) cal(H) = ((u_i cal(H)) (u_j cal(H))) (u_k cal(H))$
    - 用到了群元素的结合率：$u_i (u_j u_k) = (u_i u_j) u_k$
    - 以及性质 $cal(H)^n = cal(H)$
  - 单位元：$cal(H)$
  - 逆元：$u_i cal(H) u_i^(-1) cal(H) = cal(H)$
]
#note(count: false)[

  其实，其乘法的封闭性并不显然，需要说明：
  - $u_i,u'_i in u_i cal(H), u_j,u'_j in u_j cal(H)$，
    $
      u_i u_j cal(H) = u'_i u'_j cal(H)
    $
    这个用不变性质说明
    $
      u_i u_j cal(H) = u_i (u_j cal(H)) = u_i (cal(H) u_j) = u_i (cal(H) u'_j)= (u_i cal(H)) u'_j = u'_i u'_j cal(H)
    $
  - $u_i u_j in.not cal(H), u_i u_j in.not u_i cal(H), u_i u_j in.not u_j cal(H)$
]
#proposition(subname: [商群的性质])[

  商群的阶是
  $
    abs(cal(G)\/cal(H)) = abs(cal(G)) / abs(cal(H))
  $
]

商群$cal(G)\/cal(H)$的元素是$cal(H)$的陪集，$cal(G)\/cal(H)$的阶是$abs(cal(G)) / abs(cal(H))$同时也是$abs(cal(G))$的因子。

#example(subname: [$D_3$的商群])[

  $D_3$的商群是
  $
    D_3\/d_3 = {d_3, a d_3}
  $
  阶为2。
]

#remark(lab: "商群例子")[

  1. 子群的阶为母群的阶的一半的群是不变的。
  2. 对于$cal(G)\/cal(H) = {cal(H), u_1 cal(H), u_2 cal(H), ..., u_(j-1) cal(H)}$，可否一定能诱导出一个群$cal(G)' = {e, u'_1, u'_2, ..., u'_(j-1)}$，$cal(G)'$是$cal(G)$的子群，其中$u'_i$是$u_i cal(H)$的代表元？
]

#proof[

  1. 可知$a cal(H) = cal(H) a$是唯一的非平凡陪集，从而是不变子群。
  2. 考虑$ZZ_4\/ZZ_2 = {{0,2}, {1,3}}$，是找不到这样的子群的。
]

#note[
  正是因为 @商群例子 ，才认为商群是一个新群。否则商群就是一个子群的同构。
]

== 群的同构

以上讨论的是一个群的内部性质，现讨论两个群之间的联系。

我们先回顾一下映射的一些基本概念。

#proposition(subname: [映射])[

  对于映射$f:A->B$意味着
  $
    forall a in A , exists "唯一" b in B, f(a) = b
  $
  对于群的映射，有
  $
    "Img"(f) = {b in B| exists a in A, f(a) = b}
  $
  - 满射（映上）：$"Img"(f) = B$，即$forall b in B, exists a in A, f(a) = b$
  - 单射（1-1映射）：$forall a_1, a_2 in A, f(a_1) = f(a_2) => a_1 = a_2$或者说$a_1 != a_2 => f(a_1) != f(a_2)$
  - 双射（一一映上）：这就意味着$f$是一个一一对应的映射
    $
      forall b in B, exists "唯一" a in A, f(a) = b
    $
    这就意味着存在逆映射$f^(-1):B->A$，使得$f^(-1) f = id_A, f f^(-1) = id_B$
]

#example(subname: [映射])[

  - $f:ZZ -> ZZ$，$f(x) = 2x$是一个单的，但不是满的
  - $f:ZZ -> ZZ_e$，$f(x) = 2x$是一个双射
]

#definition(subname: [*同构*])[

  如果在两个群$cal(G)$和$cal(F)$之间存在一个*双射*$phi: cal(G) -> cal(F), g |-> f$，使得
  $
    phi(g_1 g_2) = phi(g_1) phi(g_2)
  $
  则称$cal(G)$和$cal(F)$是*同构*的，记作$cal(G) tilde.equiv cal(F)$。
]

#note[
  更详细地，可以写成 $cal(G)(g_i, dot) tilde.equiv cal(F)(f_i, dot.circle)$。保乘关系可以写成
  $
    phi(g_i dot g_j) = phi(g_i) dot.circle phi(g_j)
  $
]

#note(count: false)[

  $phi(g_i g_j) = phi(g_i) phi(g_j)$意味着元素和乘法的对应关系是保持的。

  同构是一个等价关系。
]

#example(subname: [2阶群的同构])[

  反射群${e,I}$和mod2加法群${0,1}$是同构的。
]

#proposition(subname: [下表给出阶小于 16 的具有不同乘法的群的数目])[
  #three-line-table[
    | 阶 | 不同乘法的群的数目 | 阶 | 不同乘法的群的数目 |
    | --- | --- | --- | --- |
    | 1 | 1 | 9 | 2 |
    | 2 | 1 | 10 | 2 |
    | 3 | 1 | 11 | 1 |
    | 4 | 2 | 12 | 5 |
    | 5 | 1 | 13 | 1 |
    | 6 | 2 | 14 | 2 |
    | 7 | 1 | 15 | 1 |
    | 8 | 5 | 16 | 14 |
  ]
]

#remark(subname: [$D_3$的讨论])[
  对于$D_3$，对于反射采用的刚体系和空间系，二者是同构的。它们是一种乘法，参考系的选择不会影响。
]

#remark(subname: [关于前面群链的讨论])[
  @群链 有提到过
  $
    ZZ supset ZZ_e
  $
  更确切地，这是一个同构，$ZZ tilde.equiv ZZ_e$。

  @SL 也提到过
  $
    "GL"(4,CC) supset "GL"(3,CC)
  $
  这是因为
  $
    "GL"(4,CC) supset mat("GL"(3,CC),O;O,I) tilde.equiv "GL"(3,CC)
  $
  同理地
  $
    "SO"(3) supset "SO"(2)
  $
]

#example(subname: [$(RR_+,times)$与$(RR,+)$的同构])[
  定义映射
  $
    phi: RR_+ -> RR, x |-> ln(x)
  $
  这是一个*双射*，且
  $
    phi(x y) = ln(x y) = ln(x) + ln(y) = phi(x) + phi(y)
  $
  从而$(RR_+,times) tilde.equiv (RR,+)$。
]

#example(subname: [$C_g^n$与$ZZ_n^+$的同构])[
  $
    C_g^n tilde.equiv ZZ_n^+, C_g^oo tilde.equiv ZZ^+
  $
]

#example(subname: [$D_3$和$P_3$的同构])[
  二面体群$D_3$和置换群$P_3$是同构的。
]

更一般地，推广到任意阶的有限群和置换群的情形，这就是下面的 Cayley 定理。

#theorem(subname: [Cayley定理])[
  任何一个 $n$ 阶有限群都和置换群 $S_n$ 的某一个子群同构。
]

#proof[
  设$cal(G)= {g_1, g_2, ..., g_n}$，其一个排序
  $
    g_1, g_2, ..., g_n
  $
  如果$g_alpha$是$cal(G)$中的一个元素，按照重排定理有
  $
    g_alpha cal(G) = {g_1, g_2, ..., g_n}
  $
  即有如下对应关系
  $
    g_alpha <-> P(g_alpha) = mat(1,2,...,n;alpha_1,alpha_2,...,alpha_n)
  $
  同样的方法，可以使 $cal(G)$ 中的每一个元素与一个确定的 $n$ 次置换（ $S_n$ 的某一个元素）之间建立这种对应关系。下面证明这是一个同构。

  首先这是一体个双射，因为$cal(G)$中的每一个元素都对应着一个置换，而置换的元素也对应着$cal(G)$中的一个元素。其次，这是一个保乘法的映射，因为
  $
    P(g_alpha g_beta) = P(g_alpha) P(g_beta)
  $
  从而$cal(G)$和$S_n$是同构的。

  这$n$个不同的置换是$S_n$的某一个子集，由于它们在$S_n$的乘法关系下封闭（因为 $cal(G)$ 是封闭的），从而这是一个子群。
]

#definition(subname: [自同构])[群 $cal(G)$ 到自身的同构关系称为 $cal(G)$ 的自同构。]
显然，每个群 $cal(G) = { ... , g_i , ...}$都存在一个平庸的自同构，即 $phi_0: cal(G) -> cal(G), g_i |-> g_i$。以后只须考虑非平庸的自同构关系。

#example(subname: [三阶循环群$C^3$的非平凡自同构])[
  三阶循环群$C^3$的非平凡自同构是
  $
    phi: C^3 -> C^3, e |-> e, a |-> a^2, a^2 |-> a
  $
]

== 群的同态

#definition(subname: [*同态*])[

  对于两个群$cal(G)$和$cal(F)$，如果存在一个映射$phi: cal(G) -> cal(F)$，使得
  $
    phi(g_1 g_2) = phi(g_1) phi(g_2)
  $
  则称$phi$是一个*同态*。记作 $cal(G) approx cal(F)$。
]

同态是多一对应的映射，保乘关系。

#proposition(subname: [同态的简单性质])[
  - 群 $cal(G)$ 同态于群 $cal(F)$ 不意味着 $cal(F)$ 同态于 $cal(G)$。
  - 若群 $cal(G)$ 同态于群 $cal(F)$ ，那么 $cal(G)$ 中的互逆元素对应于 $cal(F)$ 中的互逆元素。
  - 若群 $cal(G)_1, cal(G)_2$ 同态于群 $cal(F)$ ，也不能说明 $cal(G)_1$ 和 $cal(G)_2$ 同态。
  - 任何一个群 $cal(G)$ 都有一个平庸的同态 $phi: cal(G) -> {e}$。
]

#example(subname: [$D_3$的同态])[
  商群$D_3\/d_3 = {d_3, a d_3}$和$K = {e,I}$同构。

  而其母群 $D_3$ 和 $K$ 是同态。
]

我们对其做推广。下面群找映射到单位元的集合，这就是核。

#definition(subname: [*同态核*])[

  对于一个同态$phi: cal(G) -> cal(F)$，定义
  $
    H = "Ker"(phi) = {g in cal(G) | phi(g) = e}
  $
  为$phi$的*核*。
]

#theorem(subname: [同态核定理/第一同态定理])[
  群$cal(G)$同态于群$cal(F)$，则
  1. $cal(G)$的同态核$H$是$cal(G)$的不变子群。
  2. 商群 $cal(G)\/H$ 与 $cal(F)$ 同构。
]

#proof[
  1. 先证明是子群：
    - 封闭性：$g_1, g_2 in H => phi(g_1 g_2) = phi(g_1) phi(g_2) = e e = e$
    - 单位元：$phi(e) = e$
    - 逆元：$phi(g) phi(g^(-1)) = phi(g g^(-1)) = phi(e) = e$
    再证明是不变子群：
    - $forall g in cal(G), h in H$
    $
      phi(g h g^(-1)) = phi(g) phi(h) phi(g^(-1)) = phi(g) phi(g^(-1)) = phi(g g^(-1)) = phi(e) = e
    $
  2. 构造商群
    $
      cal(G)\/H = {g H | g in cal(G)} = {H, g_1 H, ...}
    $
    现在证明$cal(G)\/H$和$cal(F)$同构，构造映射$psi$
    $
      psi: cal(G)\/H -> cal(F), g H |-> phi(g)
    $
    先说明这个映射的合理性，$psi(g h) = phi(g)$与代表元无关：
    $
      phi(g') = phi(g h) = phi(g) phi(h) = phi(g)
    $
    所以取其代表元即可。

    最后说明这是保乘法的
    $
      psi(g_1 H g_2 H) = psi(g_1 g_2 H) = phi(g_1 g_2) = phi(g_1) phi(g_2) = psi(g_1 H) psi(g_2 H)
    $
    再说明这个映射是一个双射
    - 满射，$forall f in cal(F), exists g in cal(G), phi(g) = f$。就有
      $
        phi(g) = psi(g H) = f
      $
      这也就是说$psi$是满射。
    - 单射，$psi(g_1 H) = psi(g_2 H) => phi(g_1) = phi(g_2) => phi(g_1 g_2^(-1)) = e => g_1 g_2^(-1) in H => g_1 H = g_2 H$。这也就是说$psi$是单射。

    从而$cal(G)\/H$和$cal(F)$同构。
]

下面研究 $cal(G)\/H$ 的子群和 $cal(G)$ 的子群之间的关系。

$cal(G)\/H$ 的子群 $cal(A)' = {H, a_1 H, a_2 H, ...}$，$cal(A)'$ 的原像 $cal(A) = {e, h_1, ..., a_1, a_1 h_1,..., a_2, a_2 h_2,...}$，$cal(A)$ 是 $cal(G)$ 的子群。

#theorem(subname: [第二同态定理])[
  群 $cal(G)$ 的子群 $cal(A)$ 含于 $cal(G)$ 的同态核 $H$，则 $cal(G)\/H$ 的子群 $cal(A)'$ 和 $cal(A)$ 同构。并且$H$是$cal(A)$的不变子群，商群$cal(A)\/H$和$cal(A)'$同构。

  对于不同的子群$cal(A)'$，一一对应到不一样的子群$cal(A)$。商群 $cal(G)\/H$ 的所有子群都是这种形式的。

  如果 $A\/H$ 是不变子群，则 $H lt.tri A lt.tri cal(G)$。进一步就有
  $
    (cal(G)\/ H) \/ (A\/H) tilde.equiv cal(G)\/A
  $
]

== 群的直积

前面讲到子群、陪集、类等概念，它们是将群元素分类，将群分割成一个较小的群或集
合。

$
  cal(G) = union.big_i u_i cal(H) = K cal(H), K = {u_1, u_2, ...}
$

现在讨论群扩大的一种常用方式——群的直积。

=== 子集的乘法

#definition(subname: [*子集的乘法*])[

  对于群$cal(G)$的子集$cal(H), cal(K)$，定义
  $
    cal(H) cal(K) = {h k | h in cal(H), k in cal(K)}
  $
  为$cal(H)$和$cal(K)$的*乘法*。
]

#remark(subname: [子集乘法的讨论])[

  - 这个乘法不一定唯一，可能 $h_1 k_1 = h_2 k_2$，但是 $h_1 != h_2, k_1 != k_2$。
  - 就有 $abs(A B) <= abs(A) abs(B)$。
  - 一般$A B != B A$
]

#example(subname: [$D_3$的类的乘法])[
  例如$D_3$的三个类是 ${e}, {a,b,c}, {d,f}$，则
  $
    {d,f} {a,b,c} = {c,a,b,b,c,a} = 2 {a,b,c} = 0 K_e union 0 K_a union 2 K_d
  $
]

#proposition(subname: [类的乘法])[

  两个类 $K_i, K_j$ 的乘法是 $K_i K_j = {k_i k_j | k_i in K_i, k_j in K_j}$。则有
  $
    K_i K_j = union.big_k c_(i,j,k) K_k
  $
  其中 $K_i K_j$ 是完整的类，且 $c_(i,j,k)$ 是次数。
]

#proof[
  对 $x f_i f_j x^(-1) , forall x in cal(G)$，有
  $
    x f_i f_j x^(-1) = x f_i x^(-1) x f_j x^(-1) = f_i f_j in K_i K_j
  $
  从而 $K_i K_j$ 是一个类。
]

// 类和子群相乘的性质

=== 子群的直积

首先，上面讨论的所有性质都显然满足。

我们希望子群的乘法也是一个群。

#proposition(subname: [子集的乘法])[
  $cal(H) cal(F)$ 是 $cal(G)$ 的子群，当且仅当 $cal(H) cal(F) = cal(F) cal(H)$。进一步有 $abs(H F) = (abs(H) abs(F))/abs(H inter F)$。
]

#proof[
  - 必要性：$cal(H) cal(F) = cal(F) cal(H) => cal(H) cal(F) subset cal(G)$
    - 封闭性
      $
        (cal(H) cal(F))^2 = cal(H) cal(F) cal(H) cal(F) = cal(H) cal(H) cal(F) cal(F) = cal(H) cal(F)
      $
    - 逆元
      $
        forall h,h^(-1) in cal(H), f,f^(-1) in cal(F), h f in cal(H) cal(F) \
        => (h f)^(-1) = f^(-1) h^(-1) in cal(F) cal(H) = cal(H) cal(F)
      $
  - 充分性：$cal(H) cal(F) subset cal(G) => cal(H) cal(F) = cal(F) cal(H)$
    $forall h in cal(H), f in cal(F)$
    $
      h f in cal(H) cal(F), h^(-1) f^(-1) in cal(H) cal(F) => (h^(-1) f^(-1))^(-1) in cal(H) cal(F) => f h in cal(H) cal(F)
    $
    从而
    $
      cal(F) cal(H) subset cal(H) cal(F)
    $
    再考虑到
    $
      f^(-1) h^(-1) = h' f'
      (f^(-1) h^(-1))^(-1) =f'^(-1) h'^(-1) in cal(F) cal(H)
    $
    从而
    $
      cal(H) cal(F) subset cal(F) cal(H)
    $
    从而
    $
      cal(H) cal(F) = cal(F) cal(H)
    $

  我们知道两个子群的交仍然是一个子群，从而
  $
    cal(H) inter cal(F) subset cal(H)
  $
  记
  $
    cal(A) = cal(H) inter cal(F)
  $
  构造陪集串
  $
    cal(H) = union.big_(i=1)^n u_i cal(A)
  $
  就有
  $
    n = abs(H) / abs(A) = abs(H) / abs(H inter F)
  $
  进一步
  $
    cal(H) cal(F) = union.big_(i=1)^n u_i cal(A) cal(F) = union.big_(i=1)^n u_i cal(F)
  $
  // 这里不够严谨
  从而
  $
    abs(H F) = n abs(cal(F))
  $
  即
  $
    abs(H F) = (abs(H) abs(F)) / abs(H inter F)
  $
]

进一步加紧要求，我们希望 $cal(H) inter cal(F) = {e}$，就有$abs(H F) = abs(H) abs(F)$。这就引出了直积的概念。

=== 群的直积

#definition(subname: [*直积*])[

  $cal(G)$的两个子群$cal(G_1), cal(G_2)$的直积是
  $
    cal(G_1) times.circle cal(G_2) = {g_1 g_2 | g_1 in cal(G_1), g_2 in cal(G_2)}
  $
  若
  - $forall g_(alpha beta) = g_(1 alpha) g_(2 beta)$都可以唯一地被表示
  - $g_(1 alpha) g_(2 beta) = g_(2 beta) g_(1 alpha)$
  则称$cal(G_1) times.circle cal(G_2)$是$cal(G)$的*直积*。
]

*群是其两个子群的直积*即两个子群撑满了整个群。

#proposition(subname: [直积的性质])[
  - $cal(G) = cal(G_1) times.circle cal(G_2) = cal(G_2) times.circle cal(G_1)$
  - $cal(G_1) inter cal(G_2) = {e}$
  - $cal(G)_1 lt.tri cal(G), cal(G)_2 lt.tri cal(G), cal(G)\/cal(G)_1 tilde.equiv cal(G)_2, cal(G)\/cal(G)_2 tilde.equiv cal(G)_1$
]

#example(subname: [$D_3$])[

  $D_3 = {e,a,b,c,d,f}$，$D_3 = K_e times.circle K_a$，其中
  $
    K_e = {e,d,f}, K_a = {e,a,b,c}
  $
]

#definition(subname: [半直积])[

]

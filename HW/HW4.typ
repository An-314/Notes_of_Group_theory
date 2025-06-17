#import "@preview/scripst:1.1.1": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

#show: scripst.with(
  template: "article",
  title: [群论],
  info: [第四次作业],
  author: "Anzreww",
  time: datetime.today().display("[year]/[month]/[day]"),
  /* preface parameter not available if template sets to 'article'*/
  matheq-depth: 2,
  lang: "zh",
)

#exercise[
  求 5 阶对称群$S_5$的类，并指出$S_5$的那些Young图是自共轭的，那些Young图是互为共轭的。
]

#solution[
  $S_5$的类如下：
  #grid(columns: (1fr,) * 2, row-gutter: 2em)[
    - $[1^5]$
      #let tab = (
        (vlinex(end: 5), vlinex(end: 5)),
        (hlinex()),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(end: 1),),
        ([],),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 1,
        rows: (2em,) * 5,
        ..tab.flatten(),
      )
  ][
    - $[2,1,1,1]$
      #let tab = (
        (vlinex(end: 4), vlinex(end: 4), vlinex(end: 1)),
        (hlinex()),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(end: 1),),
        ([], []),
        (hlinex(end: 1),),
        ([], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 4,
        ..tab.flatten(),
      )
  ][
    - $[2,2,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 2)),
        (hlinex()),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 3,
        ..tab.flatten(),
      )
  ][
    - $[3,1,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], []),
        (hlinex(),),
        ([], [], []),
        (hlinex(end: 1),),
        ([], [], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 3,
        ..tab.flatten(),
      )
  ][
    - $[3,2]$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([], [], []),
        (hlinex(),),
        ([], [], []),
        (hlinex(end: 2),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 2,
        ..tab.flatten(),
      )
  ][
    - $[4,1]$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], [], []),
        (hlinex(),),
        ([], [], [], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 2,
        ..tab.flatten(),
      )
  ][
    - $[5]$
      #let tab = (
        (vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], [], [], []),
        (hlinex(),),
      )
      #gridx(
        columns: (2em,) * 5,
        rows: (2em,) * 1,
        ..tab.flatten(),
      )
  ]
  如上所示：可以看出
  - 自共轭的Young图有：$[3,1,1]$
  - 互为共轭的Young图有：
    - $[1^5]$ 和 $[5]$
    - $[2,1,1,1]$ 和 $[4,1]$
    - $[2,2,1]$ 和 $[3,2]$
]

#exercise[
  求 4 阶对称群$S_4$的所有不变子群。指出哪个不变子群的商群和$S_3$同构。
]

#solution[
  先考虑$S_4$中的元素
  - 【6个】类$[1,1,1,1] = (4^1)$：$(1,2,3,4),(1,2,4,3),(1,3,2,4),(1,3,4,2),(1,4,2,3),(1,4,3,2)$
  - 【8个】类$[2,1,1] = (1^1, 3^1)$：$(1,2,3),(1,3,2),(1,2,4),(1,4,2),(1,3,4),(1,4,3),(2,3,4),(2,4,3)$
  - 【3个】类$[2,2] = (2^2)$：$(1,2)(3,4),(1,3)(2,4),(1,4)(2,3)$
  - 【6个】类$[3,1] = (1^2, 2^1)$：$(1,2),(1,3),(1,4),(2,3),(2,4),(3,4)$
  - 【1个】类$[4] = (1^4)$：$e$
  一共$6+8+3+6+1 = 4! = 24$个元素。

  由Lagrange定理，$S_4$的所有子群的阶数只能是$1, 2, 3, 4, 6, 8, 12, 24$。并且我们知道，如果一个元素在不变子群内，那么其所在类的所有元素也在；以及$e$一定在不变子群内。

  可能的子群有：
  - ${e}$
  - ${[4], [2,2]} = G$
  - ${[4], [2,2], [2,1,1]} = A_4$
  - ${[4], [2,2], [2,1,1], [3,1], [1,1,1,1]} = S_4$
  经验证，他们都是不变子群。

  $abs(G)=4$，从而$abs(S_4\/G) = 24 / 4=6=3!$，下面证明$G$和$S_3$同构。

  考虑
  $
    S_3 = {e, (1,2), (1,3), (2,3), (1,2,3), (1,3,2)}
  $
  群$G$的陪集为
  $
    (1,2)G &= {(1,2), (3,4), (1,4,3,2), (1,3,2,4)}\
    (1,3)G &= {(1,3), (1,4,3,2), (2,4), (1,2,3,4)}\
    (2,3)G &= {(2,3), (1,2,4,3), (1,3,4,2), (1,4)}\
    (1,2,3)G &= {(1,2,3), (2,3,4), (1,4,2), (1,3,4)}\
    (1,3,2)G &= {(1,3,2), (1,4,3), (2,3,4), (1,2,4)}
  $
  可以看出，$G$的陪集和$S_3$的元素一一对应，因此$S_4\/G$和$S_3$同构。
]

#exercise[
  设$A_n$是$n$阶对称群$S_n$的偶置换子群，证明：$A_n$是$S_n$的一个不变子群，并求出其商群$S_n\/A_n$.
]

#proof[
  首先证明$A_n$是子群。
  - $e in A_n$，因此$A_n$非空。
  - 设$g, h in A_n$，则$g$和$h$都是偶置换，因此它们的乘积$g h$也是偶置换，所以$g h in A_n$。
  - 设$g in A_n$，则$g^(-1)$也是偶置换，因此$g^(-1) in A_n$。
  因此$A_n$是$S_n$的子群。

  接下来证明$A_n$是$S_n$的一个不变子群。
  #lemma[
    子群的阶为母群的阶的一半的群是不变的。
  ]
  #proof[
    我们知道任意群元素$u in.not cal(H)$所生成的左右陪集相同$u cal(H) = cal(H) u$，则这样的群是不变的。

    而对于阶为母亲一半的群$H$，任意元素$g in.not cal(H)$，则$g cal(H) = cal(H) g$。因此$H$是一个不变子群。
  ]
  因为$A_n$的阶为$S_n$的阶的一半，所以$A_n$是一个不变子群。

  最后求出商群$S_n\/A_n$。

  由于$S_n$为所有$n$阶置换的群，而$A_n$为$n$阶偶置换的群。一个奇的置换都可以由一个偶置换置换再做置换$(12)$得到，反之也可以。从而
  $
    S_n = {A_n, (12) A_n}
  $
]

#exercise[
  5阶对称群$S_5$有多少个不等价不可约表示？每个维数是多少？
]

#solution[
  不可约表示和Young图一一对应。不可约表示的维度计算$S_5$的每个类的标准Young盘的个数。

  $S_5$的类如下：
  #grid(columns: (1fr,) * 2, row-gutter: 2em)[
    - $[1^5]$
      #let tab = (
        (vlinex(end: 5), vlinex(end: 5)),
        (hlinex()),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(end: 1),),
        ([],),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 1,
        rows: (2em,) * 5,
        ..tab.flatten(),
      )
      $
        f^[1^5] = 5! / (5 times 4 times 3 times 2 times 1) = 1
      $
  ][
    - $[2,1,1,1]$
      #let tab = (
        (vlinex(end: 4), vlinex(end: 4), vlinex(end: 1)),
        (hlinex()),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(end: 1),),
        ([], []),
        (hlinex(end: 1),),
        ([], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 4,
        ..tab.flatten(),
      )
      $
        f^[2,1,1,1] = 5! / (5 times 3 times 2 times 1 times 1) = 4
      $
  ][
    - $[2,2,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 2)),
        (hlinex()),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 3,
        ..tab.flatten(),
      )
      $
        f^[2,2,1] = 5! / (4 times 2 times 3 times 1 times 1) = 5
      $
  ][
    - $[3,1,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], []),
        (hlinex(),),
        ([], [], []),
        (hlinex(end: 1),),
        ([], [], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 3,
        ..tab.flatten(),
      )
      $
        f^[3,1,1] = 5! / (5 times 2 times 1 times 2 times 1) = 6
      $
  ][
    - $[3,2]$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([], [], []),
        (hlinex(),),
        ([], [], []),
        (hlinex(end: 2),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 2,
        ..tab.flatten(),
      )
      $
        f^[3,2] = 5! / (4 times 3 times 1 times 2 times 1) = 5
      $
  ][
    - $[4,1]$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], [], []),
        (hlinex(),),
        ([], [], [], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 2,
        ..tab.flatten(),
      )
      $
        f^[4,1] = 5! / (5 times 3 times 2 times 1 times 1) = 4
      $
  ][
    - $[5]$
      #let tab = (
        (vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], [], [], []),
        (hlinex(),),
      )
      #gridx(
        columns: (2em,) * 5,
        rows: (2em,) * 1,
        ..tab.flatten(),
      )
      $
        f^[5] = 5! / (5 times 4 times 3 times 2 times 1) = 1
      $
  ]
  综上所述，$S_5$有7个不等价不可约表示，对应的维度分别为：
  #three-line-table[
    | Young图 | $[1^5]$ | $[2,1,1,1]$ | $[2,2,1]$ | $[3,1,1]$ | $[3,2]$ | $[4,1]$ | $[5]$ |
    | --- | --- | --- | --- | --- | --- | --- | --- |
    | 维度 | 1 | 4 | 5 | 6 | 5 | 4 | 1 |
  ]
]

#exercise[
  求4阶对称群$S_4$的不可约表示$[Lambda] = [2,2]$。
]

#solution[

  考虑类$[2,2]$的元素
  #let tab1 = (
    (vlinex(end: 2), vlinex(end: 2), vlinex(end: 2)),
    (hlinex()),
    ([1], [2]),
    (hlinex(),),
    ([3], [4]),
    (hlinex(end: 2),),
  )
  #let tab2 = (
    (vlinex(end: 2), vlinex(end: 2), vlinex(end: 2)),
    (hlinex()),
    ([1], [3]),
    (hlinex(),),
    ([2], [4]),
    (hlinex(end: 2),),
  )
  #gridx(
    columns: (2em,) * 2,
    rows: (2em,) * 2,
    align: center,
    ..tab1.flatten(),
  )
  #gridx(
    columns: (2em,) * 2,
    rows: (2em,) * 2,
    align: center,
    ..tab2.flatten(),
  )


  考虑$[2,2]$，先构造其函数基，考虑函数$f(1,2,3,4)$：
  $
    psi^[2,2]_1 &= f(1,2,3,4)\
    psi^[2,2]_2 &= (23) psi^[2,2]_1 = f(1,3,2,4)\
  $
  再利用Young算符
  $
    E(T^[2,2]_1) =& (e + (12))(e + (34))(e-(13))(e - (24))\
    =& e - (13) - (24) + (13) (24) + (12) - (132) - (124) + (1324)\
    &+ (34) - (143) - (234) + (1423) + (12) (34) - (1432) - (1234) + (14) (23)\
    E(T^[2,2]_2) &= (e + (1,3))(e + (2,4))(e-(1,2))(e - (3,4))\
    &= = e + (13) + (24) + (13) (24) - (12) - (123) - (142) - (1423)\
    &- (34) - (134) - (243) - (1324) + (12) (34) + (1234) + (1432) + (14) (23)
  $
  就有
  $
    Psi^[2,2]_1 =& E(T^[2,2]_1) psi^[2,2]_1\
    = &psi(1234) + psi(1243) + psi(2134) + psi(2143) + psi(3412) + psi(3421) + psi(4312) + psi(4321)\
    &- psi(1342) - psi(1432) - psi(2341) - psi(2431) - psi(3214) - psi(3124) - psi(4213) - psi(4123)\
    Psi^[2,2]_2 =& E(T^[2,2]_2) psi^[2,2]_2\
    =& psi(1324) + psi(1342) + psi(2413) + psi(2431) + psi(3124) + psi(3142) + psi(4213) + psi(4231)\
    &psi(1243) - psi(1423) - psi(2134) - psi(2314) - psi(3241) - psi(3421) - psi(4132) - psi(4312)
  $
  由此可得$[2,2]$的不可约表示为
  $
    (12) mat(Psi^[2,2]_1; Psi^[2,2]_2) = mat(1, 0; -1, -1) mat(Psi^[2,2]_1; Psi^[2,2]_2)\
    (23) mat(Psi^[2,2]_1; Psi^[2,2]_2) = mat(0, 1; 1, 0) mat(Psi^[2,2]_1; Psi^[2,2]_2)\
    (34) mat(Psi^[2,2]_1; Psi^[2,2]_2) = mat(1, 0; -1, -1) mat(Psi^[2,2]_1; Psi^[2,2]_2)\
  $
  这是$S_4$生成元$(12),(23),(34)$的不可约表示。它们互相作用就能给出$S_4$的所有表示。
]

#exercise[
  利用$S_4$的特征标，计算$S_4$的以下两个不可约表示的直积分解：
  - $[4] times.circle [3,1]$
  - $[3,1] times.circle [3,1]$
  - $[2,2] times.circle [1^4]$
]

#solution[
  $S_4$的Young图如下

  #grid(columns: (1fr,) * 2)[
    - $[4]$
      #let tab = (
        (vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], []),
        (hlinex(),),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 1,
        ..tab.flatten(),
      )
    - $[3,1]$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], []),
        (hlinex(),),
        ([], [], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 2,
        ..tab.flatten(),
      )
    - $[2,2]$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 2)),
        (hlinex()),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        ..tab.flatten(),
      )
  ][
    - $[2,1,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 1)),
        (hlinex()),
        ([], []),
        (hlinex(),),
        ([], []),
        (hlinex(end: 1),),
        ([], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 3,
        ..tab.flatten(),
      )
    - $[1,1,1,1]$
      #let tab = (
        (vlinex(end: 4), vlinex(end: 4)),
        (hlinex()),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(),),
        ([],),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 1,
        rows: (2em,) * 4,
        ..tab.flatten(),
      )
  ]
  可以计算$[a]$对$[nu]$的特征标$Chi^[nu]_[a]$
  #three-line-table[
    | $[nu] \\ [a]^TT$ | $[1^4] = (4^1)$\ 【6个】 | $[2,1,1] = (1^1 3^1)$\ 【8个】 |$[2,2]=(2^2)$\ 【3个】 |$[3,1]=(1^2 2^1)$\ 【6个】 | $[4]=(1^4)$\ 【1个】 |
    | --- | --- | --- | --- | --- | --- |
    | $[4]$ | 1 | 1 | 1 | 1 | 1 |
    | $[3,1]$ | -1 | 0 | -1 | 1 | 3 |
    | $[2,2]$ | 0 | -1 | 2 | 0 | 2 |
    | $[2,1,1]$ | 1 | 0 | -1 | -1 | 3 |
    | $[1^4]$ | -1 | 1 | 1 | -1 | 1 |
  ]
  注意：其中$Chi^[2,2]_[4]$是无法按照规则填的，所以是0。 以及
  $
    Chi^([nu_1]times.circle [nu_2])_[a] = Chi^[nu_1]_[a] Chi^[nu_2]_[a]
  $
  就有
  #three-line-table[
    | $[nu] \\ [a]^TT$ | $[1^4] = (4^1)$\ 【6个】 | $[2,1,1] = (1^1 3^1)$\ 【8个】 |$[2,2]=(2^2)$\ 【3个】 |$[3,1]=(1^2 2^1)$\ 【6个】 |$[4]=(1^4)$\ 【1个】 |
    | --- | --- | --- | --- | --- | --- |
    | $[4] times.circle [3,1]$ | -1 | 0 | -1 | 1 | 3 |
    | $[3,1] times.circle [3,1]$ | 1 | 0 | 1 | 1 | 9 |
    | $[2,2] times.circle [1^4]$ | 0 | -1 | 2 | 0 | 2 |
  ]
  利用正交关系就有
  $
    Chi^([4] times.circle [3,1]) &= Chi^([3,1])\
    => [4] times.circle [3,1] &= [3,1]\
  $
  $
    Chi^([3,1] times.circle [3,1]) dot Chi^([4]) &= norm(Chi)^2\
    Chi^([3,1] times.circle [3,1]) dot Chi^([3,1]) &= norm(Chi)^2\
    Chi^([3,1] times.circle [3,1]) dot Chi^([2,2]) &= norm(Chi)^2\
    Chi^([3,1] times.circle [3,1]) dot Chi^([2,1,1]) &= norm(Chi)^2\
    Chi^([3,1] times.circle [3,1]) dot Chi^([1^4]) &= 0\
    => [3,1] times.circle [3,1] &= [4] plus.circle [3,1] plus.circle [2,2] plus.circle [2,1,1]
  $
  $
    Chi^([2,2] times.circle [1^4]) = Chi^[2,2]\
    => [2,2] times.circle [1^4] = [2,2]
  $
  综上有
  $
    [4] times.circle [3,1] &= [3,1]\
    [3,1] times.circle [3,1] &= [4] plus.circle [3,1] plus.circle [2,2] plus.circle [2,1,1]\
    [2,2] times.circle [1^4] &= [2,2]\
  $

]

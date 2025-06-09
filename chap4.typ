#import "@preview/scripst:1.1.1": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge

= 对称群

在物理中的全同粒子可以用对称群描述。

对称群（置换群）是由$n$个标号的所有置换的集合构成，它在量子全同多体系统的处理上有着重要应用。利用单粒子本征函数来构造全同多粒子波函数的工作将会随着粒子数的增加而变的冗长无味，但与之有密切联系的对称群已给我们提供了强有力的方法和简单明确的结果。

== 对称群的定义


#definition(subname: [对称群])[
  *对称群*$S_n$是由$n$个标号的所有*置换*的集合构成。它是一个有限群，阶为$n!$。

  从基本排列中把$1$变换成$m_1$，$2$变换成$m_2$，…，$n$变换成$m_n$得到一个置换
  $
    P = mat(1, 2, ..., n; m_1, m_2, ..., m_n)
  $
]
其中保持基本排列不变的置换称为恒等置换
$
  P_0 = mat(1, 2, ..., n; 1, 2, ..., n)
$
置换运算是$n$个元素的集合到自身的一个 1—1 映射。如果仅是$P$中各列的相对位置发生变化并不影响$P$的结果，还代表同一置换，例如
$
  mat(1, 2, ..., n; m_1, m_2, ..., m_n) = mat(2, 1, ..., n; m_2, m_1, ..., m_n)
$

== 轮换与对换

#definition(subname: [轮换])[
  对称群$S_n$中的一个置换$P$，如果它可以表示为
  $
    P = mat(a_1, a_2, ..., a_m; a_2, a_3, ..., a_1) equiv mat(a_1, a_2, ..., a_m)
  $
  则称之为轮换，其中$m$是正整数，且$a_i$是从$1$到$n$的整数。
]

称 $m$ 为轮换的长度。显然，
$
  mat(a_1, a_2, ..., a_m) = mat(a_2, a_3, ..., a_m, a_1) = mat(a_3, a_4, ..., a_m, a_1, a_2) = ... \
$
都是指同一个轮换。$mat(a_1, a_2, ..., a_m)$的逆轮换是
$
  mat(a_1, a_2, ..., a_m)^(-1) = mat(a_m, a_1, ..., a_(m-1))
$

#definition(subname: [对换])[
  两个数字的轮换称为*对换*。特别地，两个相邻数字的对换称为*邻换*。对换和邻换的长度都是2。
]

#proposition(subname: [置换与轮换])[
  任意置换可以*唯一地*写成没有公共元素的轮换乘积的形式。
]

#example(subname: [置换与轮换])[
  对于置换
  $
    P = mat(1, 2, 3, 4, 5, 6; 3, 6, 4, 1, 2, 5) = mat(1, 3, 4) mat(2, 6, 5)
  $
  称此形式为置换的*轮换结构*。它包括两个要素：轮换的长度、轮换的个数。
  #note[
    - 只有一个数字的轮换可以省略不写。
    - 轮换结构中轮换的次序是任意的。因为没有相同数字的两轮换之积是可对易的，如上例中的$(1 3 4)(2 6 5) = (2 6 5) (1 3 4)$
  ]
]

#proposition(subname: [轮换与置换])[
  长度为$m$的轮换可以写成$m-1$个对换乘积的形式。
  $
    (a_1 a_2 ... a_m) &= (a_1 a_m)(a_1 a_(m-1))...(a_1 a_3)(a_1 a_2) \
    &= (a_1 a_2)(a_2 a_3)...(a_(m-1) a_m)
  $
]

#example(subname: [轮换与对换])[
  $
    (a_1 a_3) (a_1 a_2) = mat(a_1, a_2, a_3; a_3, a_2, a_1) mat(a_1, a_2, a_3; a_2, a_1, a_3) = mat(a_1, a_2, a_3; a_2, a_3, a_1) = (a_1 a_2 a_3)
  $
  轮换的对换乘积的形式并不是唯一的，当一个数字同时出现在两个对换中时，这两个对换的乘积是不可对易的。例如
  $
    (a_1 a_3)(a_1 a_2) = (a_1 a_2 a_3) != (a_1 a_3 a_2) = (a_1 a_2)(a_1 a_3)
  $
  所以，需要注意分解方式中各对换的次序。
]

#proposition(subname: [对换与邻换])[
  任意对换可以写成邻换乘积的形式，只需要反复应用下述公式
  $
    (a a+k) = (a+1 a+k) (a a+1) (a+1 a+k)
  $
  轮换的邻换之积的形式也不是唯一的，而且分解中会出现多个相同的邻换。
]

#example(subname: [对换与邻换])[
  $
    (1 3) &= (2 3)(1 2)(2 3)\
    (2 4) &= (3 4)(2 3)(3 4)\
    (1 4) &= (2 4)(1 2)(2 4)\
    &= (3 4)(2 3)(3 4)(1 2)(3 4)(2 3)(3 4)\
  $
]

#example(subname: [$S_3$群])[
  $S_3$群有6个元素，分别是
  $
    e, (12), (23), (31), (123), (132)
  $
  它们都可以写成对换或邻换的形式。
  $
    (12), (23)\
    e = (12)(12)\
    (31) = (23)(12)(23)\
    (123) = (13)(12) = (23)(12)(23)(12)\
    (132) = (12)(13) = (12)(23)(12)(23)
  $
]
邻换是最简单的非平庸置换，所以可以选择如下$n-1$个邻换作为$S_n$的*生成元*
$
  (12), (23), (34), ..., (n-1 n)
$
这种选择能大大减少计算$S_n$的不可约表示的工作量。

#definition(subname: [置换的奇偶性])[
  把置换写成*对换乘积*的形式，若它所包含的对换的个数为奇数，则称之为*奇置换*；若它所包含的对换的个数为偶数，则称之为*偶置换*。
]


#proposition(subname: [置换的奇偶性])[
  - 虽然置换的对换之积的形式不是唯一的，但其奇偶性是唯一确定的。
  - 任意置换与其逆有相同的奇偶性。
]

== 对称群的类和不变子群

=== 类

设有两个置换
$
  P = mat(1, 2, ..., n; a_1, a_2, ..., a_n), Q = mat(1, 2, ..., n; b_1, b_2, ..., b_n) = mat(a_1, a_2, ..., a_n; c_1, c_2, ..., c_n)
$
用$Q$对$P$进行共轭运算，则有
$
  Q P Q^(-1) = mat(a_1, a_2, ..., a_n; c_1, c_2, ..., c_n) mat(1, 2, ..., n; a_1, a_2, ..., a_n) mat(b_1, b_2, ..., b_n; 1, 2, ..., n) = mat(b_1, b_2, ..., b_n; c_1, c_2, ..., c_n)
$
由此可见，共轭运算$Q P Q^(-1)$是对$P$的上、下两行同时施行$Q$所得到的置换。

若把$P$和$Q$都写成轮换的形式，那么$Q P Q^(-1)$的结果是对$P$的每个轮换因子中的数字分别施行$Q$。

#example(subname: [对称群的类])[
  $
    P = mat(1, 2, 3, 4, 5, 6; 2, 4, 6, 1, 5, 3) = (124)(36)(5), Q = mat(1, 2, 3, 4, 5, 6; 5, 6, 4, 1, 3, 2) = (3415)(26)
  $
  则有
  $
    Q P Q^(-1) = (561)(42)(3)
  $
  对比发现：$Q P Q^(-1)$ 与$P$的轮换结构是相同的，只是轮换中的数字发生了变化。
]

推广到$S_n$，有一般性结论：
#proposition(subname: [对称群的类])[
  共轭运算保持轮换结构不变，*具有相同轮换结构的置换属于同一个类*。
]

为$S_n$的类是由*轮换结构*决定的，所以可以用轮换结构的两个要素（长度和个数）来标记类，
$
  nu = (1^(nu_1), 2^(nu_2), 3^(nu_3), ..., k^(nu_k))
$
其中$nu_i$代表$i$阶轮换的个数。轮换的总长度等于
$
  n = sum_(i=1)^k i nu_i
$<对称群类>

#example(subname: [对称群的类与轮换结构])[
  $S_6$的元素
  $
    P = (124)(36)(5) in (1^1,2^1,3^1)
  $
]

注意到 @对称群类 可以写成
$
  n = nu_1 + nu_2 + ... + nu_k &\
  nu_2 + ... + nu_k &\
  dots.v&\
  nu_k&
$
以$S_n$的类也可以方便地用如下一组数
$
  [lambda] = [lambda_1, lambda_2, ..., lambda_k]
$
来标记，其中
$
  lambda_1& = nu_1 + nu_2 + ... + nu_k &\
  lambda_2& = nu_2 + ... + nu_k &\
  dots.v&\
  lambda_k& = nu_k&
$
它们满足如下两个限制条件
$
  lambda_1 >= lambda_2 >= ... >= lambda_k > 0\
  lambda_1 + lambda_2 + ... + lambda_k = n
$
上两式表明：自然数$n$被分割成一些不增的非负整数之和，$[lambda]$为$n$的*分割*。

#definition(subname: [分割])[
  自然数$n$的*分割*是指将$n$写成一些不增的非负整数之和的方式。
]

#newpara()

*在刻画$S_n$的类方面，轮换结构标记和分割标记是等同的。*

#proposition(subname: [对称群的类])[
  对于$S_n$的每个类$nu$，都有一个唯一的分割$[lambda]$，使得
  $
    nu = (1^(nu_1), 2^(nu_2), 3^(nu_3), ..., k^(nu_k)) <=> [lambda] = [lambda_1, lambda_2, ..., lambda_k]
  $
]
每一个类对应一个分割，类的数目等于$n$的分割的个数。

#figure(
  three-line-table[
    | $n$ | 分割$[lambda]$ | 类的数目 |
    | --- | --- | --- |
    | $1$ | $[1]$ | $1$ |
    | $2$ | $[2], [1,1]$ | $2$ |
    | $3$ | $[3], [2,1], [1,1,1]$ | $3$ |
    | $4$ | $[4], [3,1], [2,2], [2,1,1], [1,1,1,1]$ | $5$ |
  ],
  caption: [对称群$S_n$的类与分割的关系表],
  kind: table,
)

#example(subname: [对称群的类与分割])[
  $S_6$的元素
  $
    P = (124)(36)(5) in [3,2,1]
  $
]

#example(subname: [$S_n$的单位元])[
  $S_n$的单位元写成轮换乘积的形式为
  $
    e = (1)(2)(3)...(n)
  $
  有
  $
    nu_1 = n, n_j = 0 (j > 1) \
    [lambda] = [n]
  $
]

#example(subname: [$n$阶轮换])[
  $n$阶轮换的轮换结构为
  $
    nu = (1^0, 2^0, ..., n^1)
  $
  对应的分割为
  $
    [lambda] = [1, 1, ..., 1] = [1^n]
  $
]

#proposition(subname: [类的元素个数])[
  利用排列组合可以证明，$S_n$中每个类$(nu)$包含元素个数为
  $
    rho^((nu)) = n! / (1^(nu_1) 2^(nu_2) 3^(nu_3) ... m^(nu_m) nu_1 ! nu_2 ! nu_3 ! ... nu_m !) \
  $
]
// rho^([lambda])呢

#example(subname: [类的元素个数])[
  - $S_n$的类$[n]$的元素为$rho^[n] = 1$即单位元$e$
  - $S_n$的类$[1^n]$的元素个数为$rho^[1^n] = n! / n = (n-1)!$
]

#example(subname: [$S_3$的类])[
  #figure(
    three-line-table[
      | 轮换结构 | 分割 | 元素 |
      | --- | --- | --- |
      | $(1^3)$ | $[3]$ | $e$ |
      | $(1^1, 2^1)$ | $[2,1]$ | $(12), (13), (23)$ |
      | $(3^1)$ | $[1,1,1]$ | $(123), (132)$ |
    ],
    caption: [$S_3$的类与分割的关系表],
    kind: table,
  )
]


=== 不变子群

#proposition[
  对任意$n$，有群链结构
  $
    S_n supset S_(n-1) supset ... supset S_1
  $
]

轮换结构的奇偶性。

#proposition[
  $S_n$中的偶置换的集合构成$S_n$的不变子群。
]

== Young图、Young盘与Young算符

=== Young图

对自然数 $n$ 的每一个分割
$
  [lambda] = [lambda_1, lambda_2, ..., lambda_k]
$
还可以用形象的*Young图*来刻画。

#definition(subname: [Young图])[
  *Young图*$[lambda]$是一个由$n$个格子组成的图案，且其第一行有$lambda_1$个格子，第二行有$lambda_2$个格子，…，第$k$行有$lambda_k$个格子。
]

每个格子可以用一个坐标来表示，坐标为$(i, j)$，其中$i$为行号，$j$为列号。

#example(subname: [$S_4$的Young图])[
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
]

#definition(subname: [对偶Young图])[
  称两个Young图是对偶Young图，若其中一个Young图可以通过另一个Young图的行与列的互换得到。称某Young图是自对偶Young图，若它的行和列经过互换后仍保持原图形不变。
]

#example(subname: [$S_4$的Young图])[
  $S_4$有两组对偶Young图：$[4]$和$[1111]$，$[31]$和$[211]$，而$[22]$是一个自对偶Young图。
]

=== 标准Young盘

==== 定义

#definition(subname: [Young盘])[
  若在$S_n$的某Young图$[lambda]$的每个格子中不重复地填上数字$1, 2, .... n$，则称之为*Young盘*。
]

#definition(subname: [标准Young盘])[
  若Young盘中的数字填充满足以下两个条件，则称之为*标准Young盘*，记为$T_r^([lambda])$，其中下表$r$用于区分属于同一Young图的不同盘：
  + 填在同一行的数字，从左到右是增加的；
  + 填在同一列的数字，从上到下是增加的。
]

#example(subname: [$S_3$的标准Young盘])[
  $S_3$只有$4$个标准Young盘
  #grid(columns: (1fr,) * 2, row-gutter: 1em)[
    - $T^[3]$
      #let tab = (
        (vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([1], [2], [3]),
        (hlinex(),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 1,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[2,1]_1$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [2]),
        (hlinex(),),
        ([3], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[2,1]_2$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [3]),
        (hlinex(),),
        ([2], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[1,1,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3)),
        (hlinex()),
        ([1],),
        (hlinex(),),
        ([2],),
        (hlinex(),),
        ([3],),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 1,
        rows: (2em,) * 3,
        align: center,
        ..tab.flatten(),
      )
  ]
]

==== Yamanouchi符号

#definition(subname: [Yamanouchi符号])[
  *Yamanouchi符号*是如下一数组：
  $
    (R_1, R_2, ..., R_n)
  $
  其中$R_1$是数字$1$所在行数，$R_2$是数字$2$所在行数，……， $R_n$是数字$n$所在行数。
]

#example(subname: [$S_3$的Yamanouchi符号])[
  #grid(columns: (1fr,) * 2, row-gutter: 1em)[
    - $T^[3]$ : $(1,1,1)$
      #let tab = (
        (vlinex(end: 1), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([1], [2], [3]),
        (hlinex(),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 1,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[2,1]_1$ : $(1,1,2)$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [2]),
        (hlinex(),),
        ([3], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[2,1]_2$ : $(1,2,1)$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [3]),
        (hlinex(),),
        ([2], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[1,1,1]$ : $(1,2,3)$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3)),
        (hlinex()),
        ([1],),
        (hlinex(),),
        ([2],),
        (hlinex(),),
        ([3],),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 1,
        rows: (2em,) * 3,
        align: center,
        ..tab.flatten(),
      )
  ]
]


==== 标准Young盘的个数

#proposition(subname: [标准Young盘的个数])[
  对于$S_n$的给定Young图$[lambda]$，其标准Young盘的个数为
  $
    f^([lambda]) = (n!) / (product_(i j) g_(i j))
  $
  其中$g_(i j)$是$(i j)$格子的钩长，其值等于该格子的右面和下面格子数之和再加上1。
]

#figure(
  image("pic/2025-06-10-01-50-11.png", width: 80%),
  caption: [钩长的示例，$[6,4,3]$的钩长图],
)

#example(subname: [标准Young盘的个数])[
  $S_n$的两个Young图$[n]$和$[1^n]$的标准Young盘的个数相等
  $
    f^([n]) = f^([1^n]) = 1
  $
]

#proposition(subname: [对偶Young图的标准Young盘的个数])[
  对偶Young图的标准Young盘的个数相等。
]

==== 标准Young盘的排列顺序

设$S_n$的属于Young图$[lambda]$的标准Young盘为${T_r^([lambda]) | r = 1, 2, ..., f^([lambda])}$。

对比两个标准Young盘$T^[lambda]_r, T^[lambda]_s$在相同格子中的数字，设数字$a$出现在$T^[lambda]_r$某一格子中，数字$b$出现在$T^[lambda]_s$相同格子中。从第一行的第一个格子开始，由左向右依次对比每个格子，若第一个非零差$a-b$是负的，则把$T^[lambda]_r$排在$T^[lambda]_s$的前面。

照此方法对所有标准Young盘进行排序便得到所谓的*字典式顺序*。以后，若不加说明，均取标准Young盘的字典式顺序。

#example(subname: [标准Young盘的排列顺序])[
  对于$S_3$的Young图$[2,1]$，其标准Young盘的字典式顺序为
  #grid(columns: (1fr,) * 2, row-gutter: 1em)[
    - $T^[2,1]_1$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [2]),
        (hlinex(),),
        ([3], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[2,1]_2$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [3]),
        (hlinex(),),
        ([2], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ]
  因为两个标准Young盘的第$(1,1)$格子中的数字相同，第$(1,2)$格子中的数差为$2-3<0$，从而$T^[2,1]_1$排在$T^[2,1]_2$的前面。

]

==== 同一个Young图的不同（标准）Young盘间的联系

对$S_n$的属于同一个Young图$[lambda]$的不同（标准）Young盘$T^[lambda]_r, T^[lambda]_s$，总存在一个置换$sigma_(r s) in S_n$，使得
$
  sigma_(r s) T^[lambda]_r = T^[lambda]_s
$

#example(subname: [Young盘间的联系])[
  对于$S_3$的Young图$[2,1]$，有
  $
    T^[2,1]_1 = (23) T^[2,1]_2, sigma_21 = (23) in S_3
  $
]

=== Young算符

利用标准Young盘，可以构造一些非常有用的算符。

#definition(subname: [行置换])[
  Young盘$T^([lambda])$中同行数字的置换。
]

#definition(subname: [行置换集合])[
  *行置换集合$R(T^[lambda])$*其中元素不仅包括$T^[lambda]$中每一行中的全部行置换，而且包括不同行中的全部行置换的乘积。
]

#definition(subname: [列置换])[
  Young盘$T^([lambda])$中同列数字的置换。
]

#definition(subname: [列置换集合])[
  *列置换集合$C(T^[lambda])$*其中元素不仅包括$T^[lambda]$中每一列中的全部列置换，而且包括不同行中的全部列置换的乘积。
]

可以证明，$R(T^[lambda])$与$C(T^[lambda])$是对称群的子群。

#example(subname: [行列置换集合])[
  标准Young盘
  #let tab = (
    (vlinex(end: 2), vlinex(end: 2), vlinex(end: 2)),
    (hlinex()),
    ([1], [2]),
    (hlinex(),),
    ([3], [4]),
    (hlinex(),),
  )
  #figure(
    gridx(
      columns: (2em,) * 2,
      rows: (2em,) * 2,
      align: center,
      ..tab.flatten(),
    ),
    numbering: none,
  )
  有
  $
    R(T^[2,2]) = {e, (12), (34), (12) (34)}\
    C(T^[2,2]) = {e, (13), (24), (13) (24)}
  $
]

#definition(subname: [对称化算符(行对称)])[
  *对称化算符*是行置换集合$R(T^[lambda])$中所有元素之和，
  $
    P(T^[lambda]) = sum_(p in R(T^[lambda])) p
  $
  具体计算时，可方便地写为
  $
    P(T^[lambda]) = product_i P_i
  $
  其中$P_i$称为$T^[lambda]$的第$i$行的对称化算符
  $
    P_i = sum_alpha p_alpha^((i))
  $
  其中$p_alpha^((i))$是$T^[lambda]$的第$i$行的第$alpha$个置换。
]

#definition(subname: [反对称化算符(列反对称)])[
  *反对称化算符*是列置换集合$C(T^[lambda])$中所有元素加权之和，
  $
    Q(T^[lambda]) = sum_(q in C(T^[lambda])) delta_q q
  $
  当$q$为偶置换时，$delta_q = 1$；当$q$为奇置换时，$delta_q = -1$。 具体计算时，可方便地写为
  $
    Q(T^[lambda]) = product_j Q_j
  $
  其中$Q_j$称为$T^[lambda]$的第$j$列的反对称化算符
  $
    Q_j = sum_beta delta_q q_beta^((j))
  $
  其中$q_beta^((j))$是$T^[lambda]$的第$j$列的第$beta$个置换。
]

#definition(subname: [Young算符])[
  对于一给定的Young盘$T^[lambda]$，可利用其对称化算符和反对称化算符构造出如下算符
  $
    E(T^[lambda]) = P(T^([lambda])) Q(T^[lambda])
  $
  称之为*Young算符*。
]

对一个给定的Young图，对应于不同Young盘的Young算符是不独立的。如$S_n$的Young图$[n]$有$n!$个Young盘，相应地有$n!$个Young算符，但它们的表达式均相同，即实际上只有一个独立的Young算符，它对应于$[n]$的标准Young盘。

对应于标准Young盘的Young算符是独立的。独立Young算符的个数等于标准Young盘的个数。

#proposition(subname: [])[
  若有两个数字既在Young盘$T_a$的同一行，又在Young盘$T_b$的同一列，则有
  $
    E(T_a) E(T_b) = 0
  $
]

#example(subname: [Young算符])[
  Young盘$T^[3,2]$的Young算符
  $
    E(T^[32]) = P Q
  $
  $
    P &= P_1 P_2\
    &= [e + (12) + (13)+ (23) + (123) + (132)] [e + (45)]\
    Q &= Q_1 Q_2 Q_3\
    &= [e-(14)][e-(25)][e]\
  $
]

#example(subname: [$T^[2,1]$的两个Young盘])[
  对于$S_3$的Young图$[2,1]$，有两个标准Young盘
  #grid(columns: (1fr,) * 2, row-gutter: 1em)[
    - $T^[2,1]_1$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [2]),
        (hlinex(),),
        ([3], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $T^[2,1]_2$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 1)),
        (hlinex()),
        ([1], [3]),
        (hlinex(),),
        ([2], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ]
  则有
  $
    E(T_1) = (1 + (12))(1 - (13))\
    E(T_2) = (1 + (13))(1 - (12))
  $
  且有
  $
    E(T_1) E(T_2) = (1 + (12))(1 - (13))(1 + (13))(1 - (12)) = 0\
    E(T_2) E(T_1) = (1 + (13))(1 - (12))(1 + (12))(1 - (13)) = 0
  $
]

事实上
- Young算子 $->$ 幂等元/投影算符
- 每个 Young 图对应一个不可约表示
- 正则母单位（基）
- 分割$[lambda]$可以标记类，可以标记不可约表示，也可以标记Lie群的$"GL", "U"$群的不可约表示。

== Young定理与$S_n$的不可约表示

$S_n$有$q$个不可约表示，与$n$的分割（类）的个数相同。

主要目的是找其基和作用。

- 基
  $
    {psi^[lambda]_i | i = 1, 2, ..., f^([lambda])}
  $
- 标准Young盘
  $
    T^[lambda]_j = sigma_(j i) T^[lambda]_i
  $
#note[
  多粒子
  $
    psi_1 (1,2,...,n) <-> T_1^[lambda] \
    psi_2 (1,2,...,n) <-> T_2^[lambda] \
    ... \
    psi_q (1,2,...,n) <-> T_q^[lambda]
  $
]
这样可以得到与所有标准Young盘$T_i^[lambda], i=1,2,...,n_lambda$对应的一组函数
$
  {psi_i (1,2,...,n) | i = 1, 2, ..., n_lambda}
$
但它们并不是荷载不可约表示$[lambda]$的基。

利用与标准Young盘 $T_j^[lambda]$ 对应的标准Young算符 $E(T_i^[lambda])$ 可以构造出一组具有确定置换对称性的函数
$
  Psi_i (1,2,...,n) = E(T_i^[lambda]) psi_i (1,2,...,n)
$

#example()[
  $
    D_3 tilde.equiv S_3
  $
  对于$n=3$有分割
  $
    [lambda] = [3], [2,1], [1,1,1]
  $
  - 3个类
  - 3个不可约表示

  其中
  $
    dim[3] = 1, dim[2,1] = 2, dim[1,1,1] = 1
  $
  #newpara()
  对于基$[3]$，令$Psi(1, 2, ..., n) <-> T^[3]$，有
  $
    Psi^[3] &= E(T^3) psi(1, 2, ..., n)\
    &= (e + (12) + (13) + (23) + (123) + (132)) [e + (45)] psi(1, 2, ..., n)\
  $
  对于基$[1,1,1]$，令$Psi(1, 2, ..., n) <-> T^[1,1,1]$，有
  $
    Psi^[1,1,1] &= E(T^[1,1,1]) psi(1, 2, ..., n)\
    &= (e - (14)) (e - (25)) [e] psi(1, 2, ..., n)\
  $
  对于基$[2,1]$，令$Psi_i (1, 2, ..., n) <-> T_i^[2,1]$，有
  $
    sigma_(21) = (23)
  $
  从而
  $
    Psi_1^[2,1] &= E(T_1^[2,1]) psi(1, 2, 3)\
    &= (e + (12))(e - (13)) psi(1, 2, 3) = psi(1, 2, 3) + psi(2, 1, 3)-psi(3, 2, 1)-psi(3, 1, 2)
  $
  $
    Psi_1^[2,1] &= E(T_2^[2,1])(23) psi(1, 2, 3)\
  $
  #newpara()
  可以选择$(12),(13)$作为生成元。

  作用$[3]$恒等表示
  $
    (12) Psi^[3] = Psi^[3]\
    (13) Psi^[3] = Psi^[3]\
  $
  作用$[1,1,1]$是表示$A$
  $
    (12) Psi^[1,1,1] = -Psi^[1,1,1]\
    (13) Psi^[1,1,1] = -Psi^[1,1,1]\
  $
  作用$[2,1]$是表示
  $
    (12) Psi_1^[2,1] = Psi_1^[2,1]\
    (13) Psi_1^[2,1] = -Psi_1^[2,1] - Psi_2^[2,1]
  $
  就有
  $
    (12) = mat(1, -1; 0, -1) \
    (13) = mat(-1, 0; -1, 1)
  $
  这是非幺正的，即基是非归一化的。

  后面会给出酉的不可与表示的规则。
]

#note[
  前面也多次提到，事实上对称性就与确定变化下的对称性对应。

  全对称波函数是$Psi^[n]$，全反对称波函数是$Psi^[1,1,...,1]$。
]

== 得到 $S_n$ 的不可约酉表示的规则

== $S_n$ 到 $S_(n-1)$ 的分支律

$
  [lambda]_n -> sum_(lambda') plus.circle [lambda']_(n-1)
$
称为$S_n$到$S_(n-1)$的分支律，记为$S_n arrow.b S_(n-1)$

事实上分支律是直和分解。

#note[
  角动量有
  $
    "SO"(3) supset "SO"(2) \
    m = 0, plus.minus 1, plus.minus 2, ...\
    j = 0, 1, 2, ...\
  $
  角量子数取值约束。
]

#note[
  从群链中的不可约表示的标记可以构造出量子数的系统。
]

== $S_n$ 的单纯特征标

按轮换长度

== $S_n$ 的两个不可约表示的直积分解

没有一般性的结果


对于两个表示$[lambda], [mu]$，若在它们的直积分解中包含一次且只有一次的不可约的全反表示$[1^n]$
$
  C_[1^n] = 1
$
则有
$
  [lambda] = [mu]^TT
$

#example()[
  三个Fermi子
  $
    phi_i^[21] (i=1,2)\
    Theta_i^[21]^TT (i=1,2)\
  $
  有波函数
  $
    psi^[1^3] = sum_(i,j) N_(i j) phi_i^[21] Theta_j^[21]^TT\
  $
  就有
  $
    (12) psi^[1^3] = -psi^[1^3]\
  $
  其中，表示为
  $
    (12) = mat(-1, 0; -1, 1), (13) = mat(1, -1; 0, -1)
  $
  其中
  $
    N_11 = -N_22 = 1, N_12 = N_21 = 0
  $
]

对于
$
  S_n_1, [lambda]_n_1; S_n_2, [lambda]_n_2
$
其直积
$
  S_n_1 times.circle S_n_2, [lambda]_n_1 times.circle [lambda]_n_2
$
如果直积群中的因子群的表示都是不可约的，那么该直积群的表示也是不可约的。

如果我们继续考虑耦合
$
  S_n times.circle S_m subset S_(n+m)
$
就有
$
  [lambda]_n_1 times.circle [mu]_n_2 = sum plus.circle c_nu [nu]_(n+m)
$
波函数
$
  psi_i^[lambda] (underbrace(..., n_1)) psi_j^[mu] (underbrace(..., n_2))
$
一共
$
  (n_1 + n_2)! / (n_1! n_2!) f^[lambda] f^[mu]
$

#example[
  对于$S_1 times.circle S_1$，有
  $
    Psi^[2] = psi^[1](1) psi^[1](2) + psi^[1](2) psi^[1](1)\
    Psi^[1,1] = psi^[1](1) psi^[1](2) - psi^[1](2) psi^[1](1)
  $
  就有分解
  $
    [1] times.circle [1] = [2] plus.circle [1,1]
  $
  用Young图来说就是
  $
    [] times.circle [alpha] = [,alpha] plus.circle [, alpha]^TT
  $
]

#example()[
  考虑$S_2 times.circle S_1$，有
  $
    psi^[2] (1,2) psi^[1] (3)\
    psi^[2] (1,3) psi^[1] (2)\
    psi^[2] (2,3) psi^[1] (1)\
  $
  就有
  $
    Psi^[3] = psi^[2] (1,2) psi^[1] (3) + psi^[2] (1,3) psi^[1] (2) + psi^[2] (2,3) psi^[1] (1)
  $
  对应表示
  $
    [2] times.circle [1] = [3] plus.circle [2,1]
  $
  用Young图来说就是
  $
    [1] times.circle [alpha] = [,,alpha] plus.circle [1,alpha][alpha]
  $
]

一般来讲有
$
  S_n times.circle S_1\
  [lambda]_n times.circle [1]_1 = sum plus.circle c_lambda' [lambda']_(n+1)
$

这就给出了 Littlewood 规则

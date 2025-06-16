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

$S_n$有$q$个不可约表示，与$n$的分割（类）的个数相同。$n$的分割不仅可以用来标志$S_n$的类，也可以用于标记$S_n$的不可约表示。

#theorem(subname: [Young定理])[
  $S_n$的对应于Young图$[lambda]$的不可约表示的维数$d^[lambda]$等于Young图$[lambda]$所拥有的标准Young盘的个数，即
  $
    d^[lambda] = f^([lambda]) = (n!) / (product_(i j) g_(i j))
  $
]

#example(subname: [$S_n$的两个不可约表示])[
  $S_n$的两个不可约表示$[n]$及其对偶$[1^n]$都是一维的。
]

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
  多粒子波函数与标准Young盘的关系
  #figure(
    diagram(
      spacing: 2em,
      node((0, 0), [$psi_1 (1,2,...,n)$]),
      node((0, 1), [$psi_2 (1,2,...,n)$]),
      node((0, 1.5), [$...$]),
      node((0, 2), [$psi_q (1,2,...,n)$]),
      node((1, 0), [$T_1^[lambda]$]),
      node((1, 1), [$T_2^[lambda]$]),
      node((1, 1.5), [$...$]),
      node((1, 2), [$T_q^[lambda]$]),

      edge((0, 0), (1, 0), "<->"),
      edge((0, 1), (1, 1), "<->"),
      edge((0, 2), (1, 2), "<->"),

      edge((0, 0), (0, 1), "->", [$sigma_12$]),
      edge((1, 0), (1, 1), "->", [$sigma_12$]),

      edge((0, 0), (0, 2), "->", [$sigma_(1q)$], bend: -60deg),
      edge((1, 0), (1, 2), "->", [$sigma_(1q)$], bend: 60deg),
    ),
    caption: [多粒子波函数与标准Young盘的关系图],
  )
]
这样可以得到与所有标准Young盘$T_i^[lambda], i=1,2,...,n_lambda$对应的一组函数
$
  {psi_i (1,2,...,n) | i = 1, 2, ..., n_lambda}
$
但它们并不是荷载不可约表示$[lambda]$的基。

利用与标准Young盘 $T_j^[lambda]$ 对应的标准Young算符 $E(T_i^[lambda])$ 可以构造出一组具有*确定置换对称性*的函数
$
  Psi_i (1,2,...,n) = E(T_i^[lambda]) psi_i (1,2,...,n)
$

#theorem(subname: [不可约表示$[lambda]$的基])[
  $Psi_i (1,2,...,n)$ 是荷载不可约表示$[lambda]$的基。
]

把$S_n$的$n-1$个生成元$(k k -1)$（$k = 2,...,n$）作用到基${Psi_i (1,2,...,n) | i = 1, 2, ..., n_lambda}$上即可得到不可约表示。

#example(subname: [$S_3$的全部不等价不可约表示])[
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
  - 对于基$[3]$，令$Psi(1, 2, ..., n) <-> T^[3]$，有
    $
      Psi^[3] &= E(T^3) psi(1, 2, ..., n)\
      &= (e + (12) + (13) + (23) + (123) + (132)) e psi(1, 2, 3)\
      &= psi(1, 2, 3) + psi(2, 1, 3) + psi(3, 2, 1)+ psi(1, 3, 2) + psi(2, 3, 1) + psi(3, 1, 2)\
    $
    是全对称函数。
  - 对于基$[1,1,1]$，令$Psi(1, 2, ..., n) <-> T^[1,1,1]$，有
    $
      Psi^[1,1,1] &= E(T^[1,1,1]) psi(1, 2, 3)\
      &= e (e - (12) - (13) - (23) + (123) + (132)) psi(1, 2, 3)\
      &= psi(1, 2, 3) - psi(2, 1, 3) - psi(3, 2, 1) - psi(1, 3, 2) + psi(2, 3, 1) + psi(3, 1, 2)\
    $
    是全反对称函数。
  - 对于基$[2,1]$，令$Psi_i (1, 2, ..., n) <-> T_i^[2,1]$，有
    不妨设$T^[2,1]_1$对应的是$psi(1, 2, 3)$那么由于
    $
      sigma_(21) = (23)
    $
    从而$T^[2,1]_2$对应的是$psi(1, 3, 2)$，则有
    $
      Psi_1^[2,1] &= E(T_1^[2,1]) psi(1, 2, 3)\
      &= (e + (12))(e - (13)) psi(1, 2, 3) \
      &= psi(1, 2, 3) + psi(2, 1, 3)-psi(3, 2, 1)-psi(3, 1, 2)\
      Psi_2^[2,1] &= E(T_2^[2,1]) psi(1, 3, 2)\
      &= (e + (13))(e - (12)) psi(1, 3, 2) \
      &= psi(1, 3, 2) + psi(3, 1, 2)-psi(2, 1, 3)-psi(2, 3, 1)
    $
  #newpara()
  可以选择$(12),(13)$作为生成元。把群元素作用到基函数上，再用这组基展开，即可得到相应的不可约表示。

  - 作用$[3]$是恒等表示
    $
      (12) Psi^[3] = Psi^[3]\
      (13) Psi^[3] = Psi^[3]\
    $
  - 作用$[1,1,1]$是表示$A$
    $
      (12) Psi^[1,1,1] = -Psi^[1,1,1]\
      (13) Psi^[1,1,1] = -Psi^[1,1,1]\
    $
  - 作用$[2,1]$是表示
    $
      (12) Psi_1^[2,1] = Psi_1^[2,1], (12) Psi_2^[2,1] = - Psi_1^[2,1] - Psi_2^[2,1]\
      (13) Psi_1^[2,1] = -Psi_1^[2,1] - Psi_2^[2,1], (13) Psi_2^[2,1] =Psi_2^[2,1]
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

  量子多体系统的全对称波函数和全反对称波函数分别是按$S_n$的不可约表示$[n]$和$[1^n]$来变换的。同理，多行多列的不可约表示$[lambda]$则用于描述混合对称波函数。换句话，量子多 Boson 某量子多体系统的波函数具有混合对称性$[lambda]$。
]

注意到上述求表示的方法虽然简单直接，但随着$n$的增大，计算就显得复杂了。对称群有群链
$
  S_n subset S_(n-1) subset ... subset S_2 subset S_1
$
我们可以从一个容易计算（或已知）的子群$S_q$的不可约表示出发，通过递推的方式得到较大群 $S_(q+1)$的不可约表示。

== $S_n$ 的不可约酉表示的规则

对称群理论已经得到$S_n$的所有*不可约酉表示*（也称标准表示），并总结出简单的规律。

对于给定的Young图$[lambda]$，所有生成元$(k k-1)(k = 2,3,...,n)$的不可约酉表示的矩阵$U^[lambda](k-1,k)$可以利用如下规律构造出来：
- 若数字$k - 1$和$k$出现在标准Young盘$T^[lambda]$的同一行时，则有
  $
    U^[lambda]_(r r) (k-1, k) = 1
  $
- 若数字$k - 1$和$k$出现在标准Young盘$T^[lambda]$的同一列时，则有
  $
    U^[lambda]_(r r) (k-1, k) = -1
  $
- 若数字$k - 1$和$k$不在标准Young盘$T^[lambda]$的同一行或同一列时，且有
  $
    (k-1 k) T^[lambda]_r = T^[lambda]_(s)
  $
  则有
  $
    U^[lambda]_(r r) (k-1, k) &= - rho\
    U^[lambda]_(r s) (k-1, k) &= sqrt(1 - rho^2)\
    U^[lambda]_(s r) (k-1, k) &= sqrt(1 - rho^2)\
    U^[lambda]_(s s) (k-1, k) &= rho
  $
  其中$rho^(-1)$是Young盘中数 $k - 1$到$k$的*轴距离*。在Young盘中，数字$a$到$b$的轴距离定义为：从$a$开始数格子一直到$b$，向左或向下数一个格子为1，向右或向上数一个格子为$-1$，这样数出的代数和称为$a$到$b$的轴距离。
  #figure(
    image("pic/2025-06-10-13-22-59.png", width: 30%),
    caption: [Young盘中数字的轴距离, 图中$a$到$b$的轴距离为4],
  )
- 其他情况
  $
    U^[lambda]_(r s) (k-1, k) = 0
  $

== $S_n$ 的单纯特征标

$S_n$ 的不可约表示的特征标称为*单纯特征标*，记为$Chi^[nu]_[a]$，其中$[nu]=[nu_1,nu_2,...,nu_m]$是$S_n$的不可约表示$[nu]$的标记，$[a]=[a_1,a_2,...,a_m]$是$S_n$的类。此处的类是按长度排的，它与之前常用的分割$[lambda]$是互为转置关系，即$[a]=[lambda]^TT$

$S_n$的单纯特征标可用如下规则方便地求出。

先在Young图$[a]$的格子里填入数字：第$i$行$a_i$个格子都填上$i$。

$Chi^[nu]_[a]$的计算方法为：
$
  Chi^[nu]_[a] = sum_i (-1)^t_i
$
式中的求和是指把$a_1,a_2,...,a_m$个格子中的数字依次填入$[nu]$格子的所有可能途径；$t_i$为在第$i$个已填入数字的$[nu]$中标号为$1，2，...，m$的格子的“距”之和，各标号的“距”为该标号格子中最长一列的格子数减 1。

把$[a]$格子中的数字填入$[nu]$格子的规则为：
- 每组相同数字填完后，所填格子不能间断，即数字相同的格子在Young图$[nu]$上是一个连续段；
- 每一步填入都要使所得到的方格图为一Young图，且从上向下或从左向右看，数字是不减的；
- 每一步填入相同数字的格子都须形成该步的Young图的一个阶梯连续段。阶梯连续段是指由该填数的最左下方格子出发，仅沿向右或向上两个方向（即阶梯方向），便可走完该填数的全部格子。

当不能按上述规则来填加时，
$
  Chi^[nu]_[a] = 0
$

#example(subname: [])[
  求$S_8$的属于类$[4,2,2]$的元素在不可约表示$[4,2,2]$中的特征标$Chi^[4,2,2]_[4,2,2]$。

  先把类$[422]$中的格子做上标记：四个格子标记为1，两个格子标记为2，两个格子标记为 3。然后把这些数字连续地填加（即先添四个1，再添两个2，...）到不可约表示$[422]$的格子里，共有四种方法构成不可约表示$[422]$的图，它们是
  #grid(columns: (1fr,) * 2, row-gutter: 1em)[
    - $(-1)^(0+0+0) = 1$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 3), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([1], [1], [1], [1]),
        (hlinex(),),
        ([2], [2], [], []),
        (hlinex(end: 2),),
        ([3], [3], [], []),
        (hlinex(end: 2),),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 3,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $(-1)^(0+1+1) = 1$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 3), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([1], [1], [1], [1]),
        (hlinex(),),
        ([2], [3], [], []),
        (hlinex(end: 2),),
        ([2], [3], [], []),
        (hlinex(end: 2),),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 3,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $(-1)^(2+1+0) = -1$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 3), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([1], [1], [3], [3]),
        (hlinex(),),
        ([1], [2], [], []),
        (hlinex(end: 2),),
        ([1], [2], [], []),
        (hlinex(end: 2),),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 3,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $(-1)^(2+0+1) = -1$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 3), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([1], [1], [2], [2]),
        (hlinex(),),
        ([1], [3], [], []),
        (hlinex(end: 2),),
        ([1], [3], [], []),
        (hlinex(end: 2),),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 3,
        align: center,
        ..tab.flatten(),
      )
  ]
  其中幂次上的第一、二、三个数分别是标号 1、2、3 的距。于是有
  $
    Chi^[4,2,2]_[4,2,2] = 1 + 1 - 1 - 1 = 0
  $
]

#example()[
  求$S_n$的类$[n]$在不可约表示$[p,1^q]$（其中 $p+q=n$）中的特征标$Chi^[p, 1^q]_[n]$
]

== $S_n$ 到 $S_(n-1)$ 的分支律

#definition(subname: [分支律])[
  *分支律*是指从一个群到其子群的不可约表示的直和分解。
]

$S_(n-1)$是$S_n$的子群，所以$S_n$的不可约表示$[lambda]_n$作为$S_(n-1)$的表示一般是可约的。利用特征标方法可以确定$S_{n-1}$的哪些不可约表示$[lambda']_(n-1)$包含在$S_n$的$[lambda]_n$中，即
$
  [lambda]_n -> sum_(lambda') plus.circle [lambda']_(n-1)
$
称为$S_n$到$S_(n-1)$的*分支律*，记为$S_n arrow.b S_(n-1)$。

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

#proposition(subname: [分支律])[
  若将$S_n$的Young图$[lambda]_n$的某一个方格去掉后仍然是一个允许的Young图$[lambda']_(n-1)$，那么$[lambda']_(n-1)$必包含在$S_n$到$S_(n-1)$的约化中。
]

#example(subname: [$S_4 arrow.b S_3$])[
  已知$S_4$有如下 5 个Young图，在每一个Young图中标记有“\*”号的方格可以被分别去掉
  #grid(columns: (1fr,) * 2, row-gutter: 1em)[
    - $[4]$
      #let tab = (
        (vlinex(), vlinex(), vlinex(), vlinex(), vlinex()),
        (hlinex()),
        ([], [], [], [\*]),
        (hlinex()),
      )
      #gridx(
        columns: (2em,) * 4,
        rows: (2em,) * 1,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $[3,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 1), vlinex(end: 1)),
        (hlinex()),
        ([], [], [\*]),
        (hlinex()),
        ([\*], [], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 3,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $[2,2]$
      #let tab = (
        (vlinex(end: 2), vlinex(end: 2), vlinex(end: 2)),
        (hlinex()),
        ([], []),
        (hlinex()),
        ([], [\*]),
        (hlinex()),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 2,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $[2,1,1]$
      #let tab = (
        (vlinex(end: 3), vlinex(end: 3), vlinex(end: 1)),
        (hlinex()),
        ([], [\*]),
        (hlinex()),
        ([], []),
        (hlinex(end: 1),),
        ([\*], []),
        (hlinex(end: 1),),
      )
      #gridx(
        columns: (2em,) * 2,
        rows: (2em,) * 3,
        align: center,
        ..tab.flatten(),
      )
  ][
    - $[1,1,1,1]$
      #let tab = (
        (vlinex(end: 4), vlinex(end: 4)),
        (hlinex()),
        [],
        (hlinex()),
        [],
        (hlinex()),
        [],
        (hlinex()),
        [\*],
        (hlinex()),
      )
      #gridx(
        columns: (2em,) * 1,
        rows: (2em,) * 4,
        align: center,
        ..tab.flatten(),
      )
  ]
  于是，$S_4 arrow.b S_3$的分支律为
  $
    [4] &-> [3]\
    [3,1] &-> [2,1] plus.circle [3]\
    [2,2] &-> [2,1]\
    [2,1,1] &-> [2,1] plus.circle [1,1,1]\
    [1,1,1,1] &-> [1,1,1]
  $
]

#proposition(subname: [分支律])[
  $S_(n-1)$ 的不可约表示$[lambda']_[n-1]$在$S_n$到$S_(n-1)$的约化中只出现一次。
]

== $S_n$ 的两个不可约表示的直积分解

$S_n$的两个不可约表示$[lambda_1]$和$[lambda_2]$的直积$[lambda_1] times.circle [lambda_2]$一般是可约的，它可以约化为$S_n$的不可约表示的直和，即
$
  [lambda_1] times.circle [lambda_2] = sum_lambda plus.circle a_lambda [lambda]
$
其中$a_lambda$为$[lambda]$出现的次数。没有一般性的结果。

#proposition(subname: [对偶])[
  对于两个表示$[lambda], [mu]$，若在它们的直积分解中包含一次且只有一次的不可约的全反表示$[1^n]$
  $
    a_[1^n] = 1
  $
  则有
  $
    [lambda] = [mu]^TT
  $
  即$[lambda]$是$[mu]$的对偶表示。
]

== 两个对称群的不可约表示的外积分解

考虑两个量子多体系统，其中系统 1 有$n_1$个粒子，系统 2 有$n_2$ 个粒子，并设描述它们的置换对称性的群分别是$S_(n_1)$和$S_(n_2)$。现在的问题是：若系统 1 在$S_(n_1)$变换下具有置换对称性$[lambda]$，而系统 2 在$S_(n_2)$变换下具有置换对称性$[mu]$，那么将这两个系统合二为一（共有$n_1 + n_2$个粒子）后，该系统在$S_(n_1 + n_2)$变换下会有哪些置换对称性？

设${psi_i^[lambda] | i = 1,2,...,n_lambda}$是荷载$S_n_1$的不可约表示$[lambda]$的一组基，${psi_j^[mu] | j = 1,2,...,n_mu}$是荷载$S_n_2$的不可约表示$[mu]$的一组基。则合并后的系统的波函数可以写成
$
  {psi_i^[lambda] (underbrace(..., n_1)) psi_j^[mu] (underbrace(..., n_2)) | i = 1, 2, ..., n_lambda; j = 1, 2, ..., n_mu }
$

#example()[
  三个Fermi子
  $
    phi_i^[2,1] (i=1,2)\
    Theta_i^[2,1]^TT (i=1,2)\
  $
  有波函数
  $
    psi^[1^3] = sum_(i,j) N_(i j) phi_i^[2,1] Theta_j^[2,1]^TT\
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

如果我们继续考虑*耦合*
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
考虑所有$n_1 + n_2$个粒子的置换，就可以形成荷载$S_(n_1 + n_2)$的表示的一组基其分量的数目为
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
  #let tab1 = (
    (vlinex(), vlinex()),
    (hlinex()),
    ([],),
    (hlinex()),
  )
  #let tab2 = (
    (vlinex(), vlinex()),
    (hlinex()),
    ([$alpha$],),
    (hlinex()),
  )
  #let tab3 = (
    (vlinex(), vlinex(), vlinex()),
    (hlinex()),
    ([], [$alpha$]),
    (hlinex()),
  )
  #let tab4 = (
    (vlinex(), vlinex()),
    (hlinex()),
    ([],),
    (hlinex()),
    ([$alpha$],),
    (hlinex()),
  )
  $
    gridx(
      columns: #((2em,) * 1),
      rows: #((2em,) * 1),
      align: #center,
      ..tab1.flatten(),
    )
    times.circle
    gridx(
      columns: #((2em,) * 1),
      rows: #((2em,) * 1),
      align: #center,
      ..tab2.flatten(),
    ) =
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 1),
      align: #center,
      ..tab3.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 1),
      rows: #((2em,) * 2),
      align: #center,
      ..tab4.flatten(),
    )
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
    Psi^[3] = psi^[2] (1,2) psi^[1] (3) + psi^[2] (1,3) psi^[1] (2) + psi^[2] (2,3) psi^[1] (1)\
    Psi^[2,1]_1 = psi^[2] (1,2) psi^[1] (3) - psi^[2] (1,3) psi^[1] (2) + psi^[2] (2,3) psi^[1] (1)\
    Psi^[2,1]_2 = psi^[2] (1,3) psi^[1] (2) - psi^[2] (1,2) psi^[1] (3) + psi^[2] (2,3) psi^[1] (1)\
  $
  对应表示
  $
    [2] times.circle [1] = [3] plus.circle [2,1]
  $
  用Young图来说就是

  #let tab1 = (
    (vlinex(), vlinex(), vlinex()),
    (hlinex()),
    ([], []),
    (hlinex()),
  )
  #let tab2 = (
    (vlinex(), vlinex()),
    (hlinex()),
    ([$alpha$],),
    (hlinex()),
  )
  #let tab3 = (
    (vlinex(), vlinex(), vlinex(), vlinex()),
    (hlinex()),
    ([], [], [$alpha$]),
    (hlinex()),
  )
  #let tab4 = (
    (vlinex(), vlinex(), vlinex(end: 1)),
    (hlinex()),
    ([], []),
    (hlinex()),
    ([$alpha$], []),
    (hlinex(end: 1)),
  )

  $
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 1),
      align: #center,
      ..tab1.flatten(),
    )
    times.circle
    gridx(
      columns: #((2em,) * 1),
      rows: #((2em,) * 1),
      align: #center,
      ..tab2.flatten(),
    ) =
    gridx(
      columns: #((2em,) * 3),
      rows: #((2em,) * 1),
      align: #center,
      ..tab3.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 2),
      align: #center,
      ..tab4.flatten(),
    )
  $
]

一般来讲有
$
  S_n times.circle S_1\
  [lambda]_n times.circle [1]_1 = sum plus.circle c_lambda' [lambda']_(n+1)
$

这就给出了*Littlewood 规则*。

Young图$[nu]$是在Young图$[lambda]$上先添加$mu_1$个标有$alpha$的方格，再添加$mu_2$个标有 $beta$ 的方格，再添加$mu_3$ 个标有$gamma$的方格，……构成的。添加过程要受到下面两个条件的限制：
- 在添加过程中每一步都要构成一个Young图，并且由相同标号的方格不能排在同一列。
- 从第一行开始从右往左数，会得到$alpha, beta, gamma$的一个序列，要求在任意前$i$个序列段中$alpha$出现的次数$>= beta$出现的次数$>=gamma$出现的次数……。
原则上，Young图$[lambda]$和$[mu]$中的任意一个都可以作为基图，而另一个作为添加图。一般选择较大的Young图作为基图会简单些。当两个Young图比较复杂时，利用 Littlewood 规则就显得笨拙。

#example(subname: [$[2,1] times.circle [2,1]$的分解])[
  - 先在第二个Young图$[2,1]$的第一行的方格中填上$alpha$，第二行的方格中填上$beta$。
  - 第二步：先以各种可能的方式在基图上添加两个$alpha$方格（除了它们不能排在同一列），使它们成为允许的Young图。见下图中等号右边第一列（忽略$beta$方格）
  - 再在第二步中的每一个Young图上添加$beta$方格

  #let tab1 = (
    (vlinex(), vlinex(), vlinex(end: 1)),
    (hlinex()),
    ([], []),
    (hlinex()),
    ([], []),
    (hlinex(end: 1)),
  )
  #let tab2 = (
    (vlinex(), vlinex(), vlinex(end: 1)),
    (hlinex()),
    ([$alpha$], [$alpha$]),
    (hlinex()),
    ([$beta$], []),
    (hlinex(end: 1)),
  )
  #let tab3 = (
    (vlinex(), vlinex(), vlinex(), vlinex(end: 1), vlinex(end: 1)),
    (hlinex()),
    ([], [], [$alpha$], [$alpha$]),
    (hlinex()),
    ([], [$beta$], [], []),
    (hlinex(end: 2)),
  )
  #let tab4 = (
    (vlinex(), vlinex(), vlinex(end: 1), vlinex(end: 1), vlinex(end: 1)),
    (hlinex()),
    ([], [], [$alpha$], [$alpha$]),
    (hlinex()),
    ([], [], [], []),
    (hlinex(end: 1)),
    ([$beta$], [], [], []),
    (hlinex(end: 1)),
  )
  #let tab5 = (
    (vlinex(), vlinex(), vlinex(end: 2), vlinex(end: 2)),
    (hlinex()),
    ([], [], [$alpha$]),
    (hlinex()),
    ([], [$alpha$], [$beta$]),
    (hlinex(end: 3)),
  )
  #let tab6 = (
    (vlinex(), vlinex(), vlinex(end: 2), vlinex(end: 1)),
    (hlinex()),
    ([], [], [$alpha$]),
    (hlinex(end: 3)),
    ([], [$alpha$], []),
    (hlinex(end: 2)),
    ([$beta$], [], []),
    (hlinex(end: 1)),
  )
  #let tab7 = (
    (vlinex(), vlinex(), vlinex(end: 2), vlinex(end: 1)),
    (hlinex()),
    ([], [], [$alpha$]),
    (hlinex(end: 3)),
    ([], [$beta$], []),
    (hlinex(end: 2)),
    ([$alpha$], [], []),
    (hlinex(end: 1)),
  )
  #let tab8 = (
    (vlinex(), vlinex(), vlinex(end: 1), vlinex(end: 1)),
    (hlinex()),
    ([], [], [$alpha$]),
    (hlinex(end: 3)),
    ([], [], []),
    (hlinex(end: 1)),
    ([$alpha$], [], []),
    (hlinex(end: 1)),
    ([$beta$], [], []),
    (hlinex(end: 1)),
  )
  #let tab9 = (
    (vlinex(), vlinex(), vlinex()),
    (hlinex()),
    ([], []),
    (hlinex(end: 2)),
    ([], [$alpha$]),
    (hlinex(end: 2)),
    ([$alpha$], [$beta$]),
    (hlinex(end: 2)),
  )
  #let tab10 = (
    (vlinex(), vlinex(), vlinex(end: 2)),
    (hlinex()),
    ([], []),
    (hlinex(end: 2)),
    ([], [$alpha$]),
    (hlinex(end: 2)),
    ([$alpha$], []),
    (hlinex(end: 1)),
    ([$beta$], []),
    (hlinex(end: 1)),
  )


  $
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 2),
      align: #center,
      ..tab1.flatten(),
    ) times.circle
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 2),
      align: #center,
      ..tab2.flatten(),
    ) &= gridx(
      columns: #((2em,) * 4),
      rows: #((2em,) * 2),
      align: #center,
      ..tab3.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 4),
      rows: #((2em,) * 3),
      align: #center,
      ..tab4.flatten(),
    )\
    & plus.circle
    gridx(
      columns: #((2em,) * 3),
      rows: #((2em,) * 2),
      align: #center,
      ..tab5.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 3),
      rows: #((2em,) * 3),
      align: #center,
      ..tab6.flatten(),
    )\
    & plus.circle
    gridx(
      columns: #((2em,) * 3),
      rows: #((2em,) * 3),
      align: #center,
      ..tab7.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 3),
      rows: #((2em,) * 4),
      align: #center,
      ..tab8.flatten(),
    )\
    & plus.circle
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 3),
      align: #center,
      ..tab9.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 4),
      align: #center,
      ..tab10.flatten(),
    )
  $
]

还有一种常用的Young图添加方法，它适用于添加图比较简单的情况，即该添加图可以由特殊的单行或单列Young图通过简单的组合（直积、加、减运算）得到。

规则分两种情形：
- 若$[lambda] times.circle [mu]$中的$[lambda]$是一般Young图，而$[mu]$是特殊的单行或单列Young图，那么这个外积分解的方法：首先画出Young图$[lambda]$，再把$[mu]$的所有方格以所有允许的方式加到$[lambda]$ 上。此处“允许”的含义是指：
  - 得到的图形还是一个Young图$[nu]$，即满足分割条件。
  - 如果$[mu]$由单行（列）方格组成，那么$[nu]$图形中的任意一列（行）不能有$[mu]$的两个方格。
- 若$[lambda]$和$[mu]$都不是单行或单列Young图，那么先把其中较简单的一个Young图用单行或单列的Young图表示出来，再应用第一种情形的方法。这实际上是一种递推方法。

#example(subname: [$[2,1] times.circle [1^3]$的分解])[
  #let tab1 = (
    (vlinex(), vlinex(), vlinex(end: 1)),
    (hlinex()),
    ([], []),
    (hlinex()),
    ([], []),
    (hlinex(end: 1)),
  )
  #let tab2 = (
    (vlinex(), vlinex()),
    (hlinex()),
    ([$alpha$],),
    (hlinex()),
    ([$beta$],),
    (hlinex(end: 1)),
    ([$gamma$],),
    (hlinex(end: 1)),
  )
  #let tab3 = (
    (vlinex(), vlinex(), vlinex(end: 1)),
    (hlinex()),
    ([], []),
    (hlinex()),
    ([], []),
    (hlinex(end: 1)),
    ([$alpha$], []),
    (hlinex(end: 1)),
    ([$beta$], []),
    (hlinex(end: 1)),
    ([$gamma$], []),
    (hlinex(end: 1)),
  )
  #let tab4 = (
    (vlinex(), vlinex(), vlinex(end: 2)),
    (hlinex()),
    ([], []),
    (hlinex()),
    ([], [$alpha$]),
    (hlinex(end: 2)),
    ([$beta$], []),
    (hlinex(end: 1)),
    ([$gamma$], []),
    (hlinex(end: 1)),
  )
  #let tab5 = (
    (vlinex(), vlinex(), vlinex(end: 1), vlinex(end: 1)),
    (hlinex()),
    ([], [], [$alpha$]),
    (hlinex()),
    ([], [], []),
    (hlinex(end: 1)),
    ([$beta$], [], []),
    (hlinex(end: 1)),
    ([$gamma$], [], []),
    (hlinex(end: 1)),
  )
  #let tab6 = (
    (vlinex(), vlinex(), vlinex(end: 2), vlinex(end: 1)),
    (hlinex()),
    ([], [], [$alpha$]),
    (hlinex()),
    ([], [$beta$], []),
    (hlinex(end: 2)),
    ([$gamma$], [], []),
    (hlinex(end: 1)),
  )

  $
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 2),
      align: #center,
      ..tab1.flatten(),
    ) times.circle
    gridx(
      columns: #((2em,) * 1),
      rows: #((2em,) * 3),
      align: #center,
      ..tab2.flatten(),
    ) =
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 5),
      align: #center,
      ..tab3.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 2),
      rows: #((2em,) * 4),
      align: #center,
      ..tab4.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 3),
      rows: #((2em,) * 4),
      align: #center,
      ..tab5.flatten(),
    ) plus.circle
    gridx(
      columns: #((2em,) * 3),
      rows: #((2em,) * 3),
      align: #center,
      ..tab6.flatten(),
    )
  $
  从而有
  $
    [2,1] times.circle [1^3] = [2,1,1,1,1] plus.circle [2,2,1,1] plus.circle [3,1,1,1] plus.circle [3,2,1]
  $
]

#example(subname: [$[2,1] times.circle [2,1]$的分解])[
  分两步计算：先把$[2,1]$用单行或单列的Young图表示出来。由于
  $
    [2] times.circle [1] = [3] plus.circle [2,1]
  $
  或写成
  $
    [2,1] = [2] times.circle [1] minus.circle [3]
  $
  这样，$[2,1] times.circle [2,1]$就转化为
  $
    [2,1] times.circle [2,1] &= [2,1] times.circle ([2] times.circle [1] minus.circle [3])\
    &= [2,1] times.circle [2] times.circle [1] -plus.circle [2,1] times.circle [3]\
    &= [4,2] plus.circle [4,1,1] plus.circle [3,3] plus.circle 2 [2,3,1] plus.circle [3,1,1,1] plus.circle [2,2,2] plus.circle [2,2,1,1]
  $

]

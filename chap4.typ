#import "@preview/scripst:1.1.1": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge

= 对称群

在物理中的全同粒子

== 轮换与对换

=== 轮换

把 $m$ 个数 $a_1 a_2 ... a_m$的如下置换称为一个轮换。

$
  mat(a_1, a_2, ..., a_m; a_2, a_3, ..., a_m, a_1) equiv mat(a_1, a_2, ..., a_m)
$
称 $m$ 为轮换的长度。显然，
$$

=== 对换

两个数字的轮换称为对换（Transposition）。特别地，两个相邻数字的对换称为邻换。对换和邻换的长度都是 2。

== 对称群的类和不变子群

=== 类

$S_n$中每个类$(nu)$包含元素个数为
$
  rho^((nu)) = n! / (1^(nu_1) 2^(nu_2) 3^(nu_3) ... m^(nu_m) nu_1 ! nu_2 ! nu_3 ! ... nu_m !) \
$
// rho^([lambda])呢

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
还可以用形象的Young图来刻画。所谓杨图是由$n$个格子组成的一个图案，且其第一行有$lambda_1$个格子，第二行有$lambda_2$个格子，…，第$k$行有$lambda_k$个格子。

每个格子可以用一个坐标来表示，坐标为$(i, j)$，其中$i$为行号，$j$为列号。

=== 标准Young盘

==== 定义

若杨盘中的数字填充满足以下两个条件，则称之为标准Young盘，记为$T_r^([lambda])$，其中下表$r$用于区分属于同一Young图的不同盘：
+ 填在同一行的数字，从左到右是增加的；
+ 填在同一列的数字，从上到下是增加的。

#let tab = (
  (hlinex()),
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

==== Yamanouchi符号

Yamanouchi符号是如下一数组：
$
  (R_1, R_2, ..., R_n)
$
其中$R_1$是数字$1$所在行数，$R_2$是数字$2$所在行数，……， $R_n$是数字$n$所在行数。

==== 标准Young盘的个数

利用排列组合及数学归纳法可以证明，对$S_n$的给定杨图$[lambda]$，其标准杨盘的个数为
$
  f^([lambda]) = (n!) / (product_(i j) g_(i j))
$
其中$g_(i j)$是$(i j)$格子的勾长，其值等于该格子的右面和下面格子数之和再加上1。

==== 标准Young盘的排列顺序

设$S_n$的属于Young图$[lambda]$的标准Young盘为${T_r^([lambda]) | r = 1, 2, ..., f^([lambda])}$。

==== 同一个Young图的不同（标准）Young盘间的联系

=== Young算符

利用标准杨盘，可以构造一些非常有用的算符。

==== 行置换

Young盘$T^([lambda])$中同行数字的置换。

=== 对称化算符：行对称

=== 反对称化算符：列反对称

=== Young算符

对于一给定的杨盘$T^[lambda]$ ，可利用其对称化算符和反对称化算符构造出如下算符
$
  E(T^[lambda]) = P(T^([lambda])) Q(T^[lambda])
$
称之为Young算符。

$
  E(T^[32]) = P Q
$
$
  P &= P_1 P_2\
  &= [e + (12) + (13)+ (23) + (123) + (132)] [e + (45)]
$
$
  Q &= Q_1 Q_2 Q_3\
  &= [e-(14)][e-(25)][e]\
$

- Young算子 $->$ 幂等元/投影算符
- 每个 Young 图对应一个不可约表示
- 正则母单位（基）

分割$[lambda]$可以标记类，可以标记不可约表示，也可以标记Lie群的$"GL", "U"$群的不可约表示。

== Young定理与$S_n$的不可约表示

$S_n$有$q$个不可约表示，与$n$的分割（类）的个数相同。

主要目的是找其基和作用。

- 基
  $
    {psi^[lambda]_i | i = 1, 2, ..., f^([lambda])}
  $
- 标准杨盘
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
这样可以得到与所有标准杨盘$T_i^[lambda], i=1,2,...,n_lambda$对应的一组函数
$
  {psi_i (1,2,...,n) | i = 1, 2, ..., n_lambda}
$
但它们并不是荷载不可约表示$[lambda]$的基。

利用与标准杨盘 $T_j^[lambda]$ 对应的标准杨算符 $E(T_i^[lambda])$ 可以构造出一组具有确定置换对称性的函数
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

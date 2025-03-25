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

#note[

  这里的加法和数乘是抽象的，可以定义
  $
    x + y := x dot y , alpha dot x := x^alpha
  $
]

#definition(subname: [线性空间的同构])[
  设$V_1$和$W_2$是两个线性空间，如果存在一个双射$Phi:V_1 -> V_2$，使得
  - $Phi(x + y) = Phi(x) + Phi(y)$
  - $Phi(alpha dot x) = alpha dot Phi(x)$
  则称$V_1$和$V_2$是*同构*的。
]

保加法和保数乘的双射称为线性空间的同构。同理可以定义同态

#definition(subname: [线性空间的同态])[
  设$V_1$和$W_2$是两个线性空间，如果存在一个映射$Phi:V_1 -> V_2$，使得
  - $Phi(x + y) = Phi(x) + Phi(y)$
  - $Phi(alpha dot x) = alpha dot Phi(x)$
  则称$V_1$和$V_2$是*同态*的。
]

#newpara()

线性空间有内积的概念，从而会引出长度与正交的概念。

线性空间有基，其为独立和完备的；从而会有正交归一基的概念。

线性空间存在子空间：

#definition(subname: [子空间])[
  设$V$是线性空间，$W$是$V$的子集，如果$W$对于$V$的加法和数乘封闭，则称$W$是$V$的*子空间*。
  $
    forall x,y in W, alpha in K, x + y in W, alpha dot x in W
  $
]
加法和数乘的封闭性就可以推出$W$是一个线性空间。逆元的存在都由封闭性以及$0 in W$推出。

#definition(subname: [子空间的和])[
  设$V$是线性空间，$W_1$和$W_2$是$V$的子空间，定义$W_1$和$W_2$的和为
  $
    W_1 + W_2 = {x + y | x in W_1, y in W_2}
  $
]

#proposition(subname: [子空间的和])[
  $
    dim W_1 + dim W_2 = dim (W_1 + W_2) + dim (W_1 inter W_2)
  $
]

类似直积的概念，可以定义直和

#definition(subname: [子空间的直和])[
  $W$与$macron(W)$的直和定义为
  $
    W + macron(W) = {x + macron(x) | x in W}
  $
  满足
  - $r=x+macron(x)$ 可以被唯一分解
  - $W perp macron(W)$
]


#proposition(subname: [子空间的直和])[
  - $dim W + dim macron(W) = dim (W + macron(W))$
  - $W inter macron(W) = {0}$
]

线性变换是线性空间之间的映射

#definition(subname: [线性变换])[
  设$V$和$W$是线性空间，$hat(T):V -> W, vb(r) |-> vb(r)' = T vb(r)$是一个映射，如果
  - $T(x + y) = T(x) + T(y)$
  - $T(alpha dot x) = alpha dot T(x)$
  则称$T$是一个*线性变换*。
]
考虑选取基，线性变换可以用矩阵表示
$
  V = {e_i}, forall r = sum_i x_i e_i
$
$
  e'_i = hat(T) e_i = sum_j T_(j i) e_j \
  x'_i = sum_j T_(j i) x_j
$
对于基变换
$
  mat(e'_1, e'_2, ..., e'_n) = mat(e_1, e_2, ..., e_n) T
$
坐标变换
$
  mat(x'_1; x'_2; ...; x'_n) = T mat(x_1; x_2; ...; x_n)
$
作用可以作用在基上，也可以作用到坐标上
$
  r' &= T r = T sum_i x_i e_i\
  &= sum_i (T x_i) e_i\
  &= sum_i x_i (T e_i)
$
- 主动变换$T_a$：坐标变换，基不变
- 被动变换$T_p$：基变换，坐标不变

有
$
  T_a T_p = I
$

#newpara()

线性变换和矩阵是一一对应的。
$
  hat(T) cases(
  ->^{e_i}
  ->_{e'_i}
  )
$
// S, S^(-1) T S
#definition(subname: [共轭变换])[
  设$T$是线性变换，$T^*$是$T$的共轭变换，如果
  $
    (T x, y) = (x, T^dagger y)
  $
  则称$T^dagger$是$T$的*共轭变换*。
]

#definition(subname: [幺正变换])[
  如果$T^dagger T = I$，则称$T$是*幺正变换*。
]

子空间的直和可以推广到两个线性空间的直和

#definition(subname: [线性空间的直和])[
  设$V_1$和$V_2$是线性空间，找其中的基V_1 = {e_i}, V_2 = {f_i}，定义$V_1$和$V_2$的*直和*为
  $
    V_1 plus.circle V_2 = {e_i, f_i}_(n_1+n_2)
  $
]

#definition(subname: [线性空间的直积])[
  设$V_1$和$V_2$是线性空间，找其中的基V_1 = {e_i}, V_2 = {f_i}，定义$V_1$和$V_2$的*直积*为
  $
    V_1 times.circle V_2 = {e_i dot f_j}_(n_1 n_2)
  $
]

我们知道$hat(T)$在直和下可以写成
$
  mat(T_1,O;O,T_2) = T_1 plus.circle T_2
$
在直积下可以写成
$
  T_1 times.circle T_2
$

#newpara()

对于一个空间，可以分解成一个子空间和其正交补的直和
$
  V = W + macron(W) \
  W = {e_1, e_2, ..., e_n}, macron(W) = {e_(n+1), e_(n+2), ..., e_(n+m)}, V = {e_i}
$
其中对于$x in W$,
$
  x = mat(x_1; x_2; ...; x_n; O) = sum_i^n x_i e_i
$
对于$x in macron(W)$,
$
  x = mat(O; x_(n+1); x_(n+2); ...; x_(n+m)) = sum_(n+1)^(n+m) x_i e_i
$
这两个子空间是正交的。

我们看到对于$x in W$，有变换
$
  T x = mat(T_1, O; O, T_2) mat(x; O) = mat(T_1 x; O) in W
$
这是不变子空间。

#definition(subname: [不变子空间])[
  设$V$是线性空间，$W$是$V$的子空间，如果对于$T$，$forall x in W$, $hat(T) x in W$，则称$W$是*$T$的不变子空间*。
]

#newpara()

$
  G("抽象群") approx A("矩阵群")
$

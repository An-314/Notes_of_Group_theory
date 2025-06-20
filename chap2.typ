#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

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
- 主动变换$T_a$：坐标（物体）变换，基不变
- 被动变换$T_p$：基变换，坐标（物体）不变

有
$
  T_a T_p = I
$

#newpara()

线性变换和矩阵是一一对应的。

#figure(
  diagram(
    node((0, 0), $hat(T)$),
    node((1, -1), $mat(T)$),
    node((1, 1), $mat(T')$),

    edge((0, 0), (1, -1), "-|>", ${e_i}$),
    edge((0, 0), (1, 1), "-|>", ${e'_i}$, label-pos: 50%, label-side: right),
    edge((0.5, 0.5), (0.5, -0.5), "<|-|>", $e' = S e$, label-pos: 30%, label-side: right),
    edge((1, 1), (1, -1), "<|-|>", $T' = S^dagger T S$, label-pos: 60%, label-side: right),
  ),
  caption: [线性变换和矩阵的关系],
)<基选择>

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
  设$V_1$和$V_2$是线性空间，找其中的基$V_1 = {e_i}, V_2 = {f_i}$，定义$V_1$和$V_2$的*直和*为
  $
    V_1 plus.circle V_2 = {e_i, f_i}_(n_1+n_2)
  $
]

#definition(subname: [线性空间的直积])[
  设$V_1$和$V_2$是线性空间，找其中的基$V_1 = {e_i}, V_2 = {f_i}$，定义$V_1$和$V_2$的*直积*为
  $
    V_1 times.circle V_2 = {e_i dot f_j}_(n_1 n_2)
  $
]

我们知道$hat(T)$在直和下可以写成
$
  mat(T_1, O; O, T_2) = T_1 plus.circle T_2
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

== 群的表示

=== 群表示的基本概念

$
  G("抽象群") approx A("矩阵群")
$

这就是表示论的基本思想。

- 抽象：同态
- 具体：计算出矩阵

#definition(subname: [表示])[

  设 $cal(G)={...,g,...}$ 是一个抽象群，$A(cal(G))={...,A(g),...}$ 是线性空间 $R_n$ 上的一个矩阵群。若 $cal(G)$ 同态于 $A(cal(G))$，即 $cal(G) approx A(cal(G))$，则称 $A(cal(G))$ 是群 $cal(G)$ 的一个*矩阵表示*或*线性表示*，简称*表示*。

  同态映射要求保持乘法关系不变，即若 $g_1, g_2 in cal(G)$，则必有
  $
    A(g_1) A(g_2) = A(g_1 g_2)
  $
  #newpara()

  $A(cal(G))$ 的作用空间 $R_n$ 称为群 $cal(G)$ 的*表示空间*，$R_n$ 的矢量基称为*荷载群* $cal(G)$ 的*表示的基*， $R_n$ 的维数称为*表示的维数*。
]

- 若抽象群 $cal(G)$ 与矩阵群 $A(cal(G))$ 同构，则称 $A(cal(G))$ 是群 $cal(G)$ 个*忠实表示*。此表示能够“精确”地反映群 $cal(G)$ 的结构。
- 若抽象群 $cal(G)$ 同态于矩阵群 $A(cal(G))$ ，则称 $A(cal(G))$ 是群 $cal(G)$ 个*非忠实表示*。此表示只能够部分地反映群 $cal(G)$ 的结构，或“精确”地反映由群 $cal(G)$ 的同态核 $cal(H)$ 生成的商群 $cal(G)\/cal(H)$ 的结构。

#proposition(subname: [群表示的性质])[
  - 所有的表示矩阵都是方阵
  - 群 $cal(G)$ 的单位元 $e$ 对应的表示矩阵 $A(e)$ 一定是个单位矩阵 $I$ ，其阶为表示空间的维数。因为对任意元素 $g in G$ ，均有 $g e = e g = g$ ，与此对应的表示矩阵应满足
    $
      A(g) A(e) = A(e) A(g) = A(g)
    $
  - 互逆群元素对应的表示矩阵一定是互逆矩阵。设有互逆元素 $g,g^(-1) in cal(G)$，满足$g g^(-1) = g^(-1) g = e$，与此对应的表示矩阵应满足
    $
      A(g) A(g^(-1)) = A(g^(-1)) A(g) = A(e) = I
    $
    这表明
    $
      A(g^(-1)) = [A(g)]^(-1)
    $
]

#newpara()

下面我们考虑如何求表示
$
  hat(T) ->^{e_i} mat(T)
$
1. 选定群 $cal(G)$ 作用的一个表示空间 $V$ ， $V$ 中的一组基。
  $
    V = {phi_i}
  $
2. 把作用(群元素)作用在基上，得到矩阵
  $
    g_alpha phi_i = sum_j A(g_alpha)_(j i) phi_j
  $

可以验证保乘性质
$
  g_alpha g_beta phi_i = g_alpha sum_j A(g_beta)_(j i) phi_j = sum_(k,j) A(g_beta)_(j i) A(g_alpha)_(k j) phi_k = sum_k A(g_alpha g_beta)_(k i) phi_k
$

#newpara()

按群表示的定义，表示空间及其基的选择都是任意的。在物理应用上，常采用的基有：

#example(subname: [欧式空间])[
  $
    E^3 = {e_1, e_2, e_3}, braket(e_i, e_j) = delta_(i j)
  $
  作用$g$的*自然表示*
  $
    g e_i = e'_i = sum_j A(g)_(j i) e_j\
    g ->^"表示" A(g)
  $
  对于
  $
    g: vb(r) |-> vb(r)' = g vb(r)
  $
  有
  $
    g vu(e)_i = sum_j A(g)_(j i) vu(e)_j
  $
]
#example(subname: [函数基])[
  $
    V = {phi_i (r)| i = 1, 2, ...}
  $
  其中$phi_i$是标量且正交归一
  $
    braket(phi_i, phi_j) = integral phi_i^* phi_j dd(tau) = delta_(i j)
  $
  其表示
  $
    g: r |-> r' = g r\
    g: phi_i (r) |-> phi'_i (r') =g circle.tiny phi_i (r)
  $
  其中变量不同，在物理中我们认为 *$phi' tilde phi: phi'_i (r') = phi_i (r)$* ，即这个$g$是一个变量代换
  $
    phi'_i (r) = phi_i (g^(-1) r) = sum_j B(g)_(j i) phi_j (r)
  $
  表示$B$是满足保乘关系的。
]

从主动和被动变换的观点来看得到的
$
  phi'_i (r') = phi_i (r)\
  phi'_i (r) = phi_i (g^(-1) r)\
$<text.blue>
是一致的。可以理解成算符/变换本身不分主动和被动，只有选择了基才能加以区分。

例如$phi(r) = x^2 - y^2$，$A = 1 / 2 mat(-1, -sqrt(3); sqrt(3), -1)$，$A mat(x; y)=mat(x'; y')$，变量代换就是
$
  phi(r) &= phi(A^(-1) r') = (-1 / 2 x' + sqrt(3) / 2 y')^2 - (-sqrt(3) / 2 x' - 1 / 2 y')^2 \
  &= -1 / 2 (x'^2 - y'^2) - sqrt(3) x' y' eq.def phi'(r')
$

#figure(
  image("pic/2025-04-13-17-31-12.png", width: 20%),
  numbering: none,
)

为了看清楚 $phi_i$ 与群元素 g 的依赖关系，引入新的记号$T_g$，*定义在以$r$为变量的函数空间内*的*函数（形式）变换*：

#definition(subname: [函数（形式）变换])[
  设$phi(r)$是一个函数，$T_g$是一个算符，$T_g$的作用是把函数$phi(r)$变换成在以$r$为变量的函数空间内的另一个函数$phi'(r)$，即
  $
    T_g: phi |-> phi' = T_g phi
  $
  是*函数（形式）变换*的算符，其中$g$是一个变换
  $
    g: vb(r) |-> vb(r)' = g vb(r)
  $
  $T_g$是由$g$诱导出来的。
]

有
$
  T_g phi_i (r) = phi_i (g^(-1) r) = sum_j B(T_g)_(j i) phi_j (r) = sum_j B(g)_(j i) phi_j (r)
$

#remark[
  $T_g$的表示就是$g$的表示。
]

#proof[

  我们知道
  $
    cal(G):{g} tilde.equiv cal(G)_P:{T_g}
  $
  这是因为：
  - 双射是显然的
  - 保乘性质即
    $
      P_(g_alpha) P_(g_beta) = P_(g_alpha g_beta)
    $
    这是因为
    $
      P_(g_alpha) P_(g_beta) phi(r) &= P_(g_alpha) phi(g_beta^(-1)r) \
      &= P_(g_alpha) psi(r) = psi(g_alpha^(-1) r) \
      &= phi(g_beta^(-1) g_alpha^(-1) r) \
      &= phi((g_alpha g_beta)^(-1) r) = P_(g_alpha g_beta) phi(r)
    $
  有了同构关系之后，表示就是一致的。
]


#example(subname: [平移群$T$])[
  $
    T: x |-> x' = x + a
  $
  对于函数变换有
  $
    P_T phi(x) = phi(T^(-1) x) = phi(x - a) \
    P_T phi(x) = e^(-i a P_x) phi(x)
  $
  函数变换$P_T$就是$T$诱导出来的：$e^(-i a dv(, x)) = e^(-i a P_x)$
]

#example(subname: [Wigner定理])[
  一个量子系统有本征态集合${ket(kai)}$，在群$cal(G)$的元素$g$的作用下
  $
    g: ket(kai) |-> ket(kai)'
  $
  则存在一个幺正算符$U(g)$，使得
  $
    U(g) ket(kai) = ket(kai)'
  $
]
按照上面的分析，这几乎是显然的。

#exercise(subname: [$"SO"(2)$的表示])[

  $
    "SO"(2) = {C_vu(k) (theta)}, C_vu(k)(theta) ->^"表示" A(C_vu(k) (theta))
  $

]

#solution[

  对于空间$E^3={vu(i),vu(j),vu(k)}$，作用是
  $
    C(theta) vu(i) &= vu(i)' = vu(i) cos theta + vu(j) sin theta + vu(k) 0\
    C(theta) vu(j) &= vu(j)' = vu(i) (-sin theta) + vu(j) cos theta + vu(k) 0\
    C(theta) vu(k) &= vu(k)' = vu(i) 0 + vu(j) 0 + vu(k) 1
  $
  对应的矩阵是
  $
    C_k (theta) = mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1)
  $
  或者考虑坐标变换
  $
    mat(x; y; z) = mat(r cos theta; r sin theta; z)
  $
  则
  $
    C(theta) mat(x; y; z) = mat(x'; y'; z') = mat(r cos (theta + phi); r sin (theta + phi); z) = mat(cos phi, -sin phi, 0; sin phi, cos phi, 0; 0, 0, 1) mat(x; y; z)
  $
  上面两个（看原来的基如何变换，看原来的坐标如何变换）都是主动观点。

  现在考虑被动观点，考虑坐标系旋转 $phi$，有
  $
    mat(x; y; z) = mat(r cos theta; r sin theta; z), mat(x'; y'; z') = mat(r cos (theta - phi); r sin (theta - phi); z)
  $
  得到的变换矩阵是
  $
    mat(cos phi, sin phi, 0; -sin phi, cos phi, 0; 0, 0, 1) = mat(cos phi, -sin phi, 0; sin phi, cos phi, 0; 0, 0, 1)^(-1)
  $
  这就是$C_k (phi)$的逆矩阵。
]

#exercise(subname: [$D_3$的表示])[
  $
    D_3 = {e,d,f,a,b,c}
  $
]

#solution[

  表示空间是$E^3={vu(i),vu(j),vu(k)}$，考虑$D_3$的生成元$a,b$。

  对于$b$，是把正三角形绕轴II转动$180^degree$：
  $
    b vu(i) &= vu(i)' = vu(i) 1 / 2 + vu(j) sqrt(3) / 2 + vu(k) 0\
    b vu(j) &= vu(j)' = vu(i) sqrt(3) / 2 + vu(j)(- 1 / 2) + vu(k) 0\
    b vu(k) &= vu(k)' = vu(i) 0 + vu(j) 0 + vu(k) (- 1)
  $
  对应的矩阵是
  $
    A(b) = mat(1 / 2, sqrt(3) / 2, 0; sqrt(3) / 2, - 1 / 2, 0; 0, 0, - 1)
  $
  #figure(
    image("pic/2025-04-13-19-44-58.png", width: 80%),
    numbering: none,
  )
  而对于 $a$，是把正三角形绕轴I转动$180^degree$：
  $
    a vu(i) &= vu(i)' = vu(i) (- 1) + vu(j) 0 + vu(k) 0\
    a vu(j) &= vu(j)' = vu(i) 0 + vu(j) 1 + vu(k) 0\
    a vu(k) &= vu(k)' = vu(i) 0 + vu(j) 0 + vu(k) (- 1)
  $
  对应的矩阵是
  $
    A(a) = mat(- 1, 0, 0; 0, 1, 0; 0, 0, - 1)
  $
  #figure(
    image("pic/2025-04-13-19-48-26.png", width: 80%),
    numbering: none,
  )
  由群元素的定义关系知，其他群元素的表示矩阵可以由 $A(a)$和$A(b)$的乘积得到
  $
    A(e) &= A^2(a) = A^2(b) = I\
    A(c) &= A(b) A(a) A(b)\
    A(d) &= A(a) A(b)\
    A(f) &= A(b) A(a)\
  $
  这些矩阵的集合
  $
    A(D_3) = { A(e), A(a), A(b), A(c), A(d), A(f) }
  $
  就是$D_3$在Ecuclidean空间$E^3$上的表示。

  选取 6 维函数空间为表示空间表示空间是$V={phi_i}$，基为
  $
    { phi_1(vb(r)) = x^2,
      phi_2(vb(r)) = y^2,
      phi_3(vb(r)) = z^2,
      phi_4(vb(r)) = x y,
      phi_5(vb(r)) = x z,
      phi_6(vb(r)) = y z }
  $
  对于$g in cal(G)$：
  $
    P_g phi_i (r) = phi_i (g^(-1) r) = phi_i (A(g)^(-1) mat(x; y; z)) = sum_j B(g)_(j i) phi_j (r)
  $
  #newpara()
  对于$a$，变换为
  $
    mat(x'; y'; z') = mat(-1, 0, 0; 0, 1, 0; 0, 0, -1) mat(x; y; z)
  $
  可以得到 $a$ 在函数基${phi_i}$的表示
  $
    P_a phi_1(vb(r)) &= phi_1(a^(-1)vb(r)) = 1 phi_1 (vb(r))\
    P_a phi_2(vb(r)) &= phi_2(a^(-1)vb(r)) = 1 phi_2 (vb(r))\
    P_a phi_3(vb(r)) &= phi_3(a^(-1)vb(r)) = 1 phi_3 (vb(r))\
    P_a phi_4(vb(r)) &= phi_4(a^(-1)vb(r)) = -1 phi_4 (vb(r))\
    P_a phi_5(vb(r)) &= phi_5(a^(-1)vb(r)) = -1 phi_5 (vb(r))\
    P_a phi_6(vb(r)) &= phi_6(a^(-1)vb(r)) = 1 phi_6 (vb(r))
  $
  写成矩阵形式
  $
    mat(phi') = mat(phi) B(a)\
    mat(phi'_1, phi'_2, phi'_3, phi'_4, phi'_5, phi'_6) = mat(phi_1, phi_2, phi_3, phi_4, phi_5, phi_6) mat(1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, -1, 0, 0; 0, 0, 0, 0, -1, 0; 0, 0, 0, 0, 0, 1)\
  $
  再来计算操作 $b$。考虑到 $b^(-1) = b$ ，利用 $vb(r) |-> vb(r)' = b vb(r)$ 的变换结果
  $
    mat(x'; y'; z') = mat(1 / 2, sqrt(3) / 2, 0; sqrt(3) / 2, - 1 / 2, 0; 0, 0, -1) mat(x; y; z)
  $
  可以得到 $b$ 在函数基${phi_i}$的表示
  $
    B(b)=mat(
      1 / 4, 3 / 4, 0, sqrt(3) / 4, 0, 0;
      3 / 4, 1 / 4, 0, -sqrt(3) / 4, 0, 0;
      0, 0, 1, 0, 0, 0;
      sqrt(3) / 2, -sqrt(3) / 2, 0, 1 / 2, 0, 0;
      0, 0, 0, 0, 1 / 2, -sqrt(3) / 2;
      0, 0, 0, 0, -sqrt(3) / 2, -1 / 2
    )
  $
  利用群元素的定义关系，其他群元素的 6 维表示矩阵都可以由 $A(a)$和$A(b)$的乘积得到。
]

#note[
  引入$T_g$只是为了方便讨论，其定义是
  $
    T_g phi(r) = phi(g^(-1) r)
  $
  可以和$g$的表示联系起来，且
  $
    {T_g} tilde.equiv cal(G)
  $
  并且这是依赖
  $
    phi'(r') = phi(r)
  $
  的，其中$r' = g r$，这是一个假设，我们认为在物理中有该式成立。并且
  $
    phi(g^(-1) r) in V
  $
  也不是一定的，这依赖于
  - $T_g$是线性的
  - $phi_i$是完备的
]

#newpara()

对于一个群，最基本的两个性质是其*结构和表示*。同一个作用，对于不同的空间、基，有不同的表示。

#example(subname: [原子$d$轨道的函数])[
  $V_5$的函数基是：
  $
    d_1(vb(r)) = 1 / 2 (x^2-y^2), d_2(vb(r))=x y, \
    d_3(vb(r)) = x z, d_4(vb(r)) = y z, d_5(vb(r)) = sqrt(3) / 2 (3z^2 - r^2)
  $
]

#note[$V_5$为什么会少一个组合？$V_5$也是完备的
  $
    d_i (g^(-1) vb(r)) in V_5
  $
]
#note[
  $V_6 ->^"线性组合" V_4$是否能够构造？

  对$V_m->V_n$线性变换$T$：
  $
    phi = mat(phi_1; phi_2; ...; phi_m), phi' = mat(phi'_1; phi'_2; ...; phi'_n)\
    T phi = phi'\
  $
  完备性要求
  $
    phi'(g^(-1) r) in V_n\
    phi'(g^(-1) r) = T phi(g^(-1) r) = T B(g) phi = C(g) T phi
  $
  也就是说，对于有表示的$V_m$，其表示为$B(g)$，如果对于任意表示$B(g)$都有
  $
    C(g) T = T B(g)
  $
  成立，其中$T$是线性变换，那么$C(g)$是$V_n$的表示。

]
#note[$V_i (i>=7)$如何构造？]


#newpara()

=== 表示的等价性

按定义，一个群的表示就是它的所有群元素在某组基上的矩阵集合。因为基的选择是任意的，所以一个群可以有无穷多个的表示。实际上，有些表示之间是有关联的，或本质上是相同的。群表示论的主要任务就是要弄清楚需要多少个“独立”的表示才能把一个群的本质特征完全反映出来。

我们用共轭运算$g f g^(-1) = h$给群进行了分类，并给出了共轭子群$g F g^(-1) = H$的概念，共轭是一个等价关系，群就被分成了若干个等价类。我们也可以类似定义等价表示$X A(G)X^(-1) = B(G)$

我们要证明的是这样的$B(G)$也是一个表示，验证其保乘性质即可。（显然）

#definition(subname: [等价表示])[
  对群表示$A(G)$，若存在一个非奇异矩阵$X$，使得
  $
    X A(G) X^(-1) = B(G)
  $
  则称$A(G)$和$B(G)$是*等价表示*，记作 $A(G) tilde B(G)$

]
在同一个空间里，在不同的基下的表示是等价的，如 @基选择 所示。

等价表示实质上是同一个群在不同基上的表示。考虑表示空间 $V$ 中两组不同的基 $phi, phi'$，并设它们之间有如下关系
$
  phi'_i = sum_j S_(j i) phi_j
$
其中 $S$ 为过渡矩阵。设群元素$g$在$phi$上的表示矩阵为$A(g)$，即
$
  g phi_i = sum_j A(g)_(j i) phi_j
$
把$g$作用在$phi'$上，得到
$
  g phi'_i &= g sum_j S_(j i) phi_j = sum_(j k) S_(j i) A(g)_(k j) phi_k\
  &= sum_(j k l) S_(j i) A(g)_(k j) S^(-1)_(l k) phi'_l\
  &= sum_l (S^(-1) A S)_(l i) phi'_l
$
所以，群$cal(G)$在$phi'$上的表示矩阵为
$
  A'(cal(G)) = S^(-1) A(cal(G)) S
$
即二者由一个相似变换联系起来。

所有等价于某一个表示的所有表示相互等价。所有等价表示尽管在形式上不同，但本质上是相同的。所以，寻求给定群 $G$ 的所有表示的问题就归结为找出 $G$ 的一切不等价表示。

=== 表示的可约性

线性变换的矩阵形式与基的选择有直接的关系。表示的可约性与表示空间的基的性质有关。

在表示空间 $V$ 中选择适当的基，使相应的表示矩阵有简单的块结构，其中的对角块方阵可以对应一较小的表示空间 $W subset V$ 。这种小块方阵当然要比表示空间 $V$ 上的表示矩阵更容易得到。

我们下面考虑*表示的可约性*
$
  A = mat(C, N; O, B)
$
其中$A$是保乘的
$
  A(g_alpha) A(g_beta) = A(g_alpha g_beta)
$
且$B,C: g->B(g), g->C(g)$都是保乘的
$
  B(g_alpha) B(g_beta) = B(g_alpha g_beta)\
  C(g_alpha) C(g_beta) = C(g_alpha g_beta)
$
*就有$C(G) times.circle B(G)$是$G$的一个表示*。

#definition(subname: [不可分表示，可约但不完全可约表示])[
  设$A(G)$是群$cal(G)$的一个表示，如果$V$存在一个$cal(G)$的不变真子空间$W$，即
  - $W subset V$
  - $A(g) W subset.eq W$
  则称$A(G)$是*可约的*。

  用矩阵表示就是
  $
    A(G) tilde A'(G) = mat(C, N; O, B)
  $
]
事实上，$O$块矩阵和线性代数中的不变子空间是对应的。

其中$C$的表示空间是$W$，$B$的表示空间是$V\/W$；意味着$C$在$W$上是封闭的，$B$在$V\/W$上是封闭的，有$dim V\/W = dim macron(W)$。

$
  mat(C, N; O, B) mat(x; O) = mat(C x; O) in W
$

$
  mat(C, N; O, B) mat(O; x) = mat(C x; B x) in.not macron(W)
$

#note[
  可约表示具有三角块结构是由于选择了一组适当的基。若某个表示不具有三角块 结构，不见得不是可约的。
]

由于 $W$ 是 $G$ 不变子空间，因此我们称表示 $C(G)$ 是可约表示 $A'(G)$ 到 $W$ 上的*缩小*\/限制，记为
$
  C(G) = eval(A'(G))_W
$
此时 $C(G)$ 在 $W$ 上的变换行为等同于 $A'(G)$ 在 $W$ 上的变换行为。具体地
$
  C(g) (x) = A'(g) mat(x; O) in W
$
但是，$macron(W)$不是 $G$ 不变子空间，所以 $B(G)$ 就不是 $A'(G)$ 到 $macron(W)$ 上的缩小。

#note[
  $V\/W$ 是*商空间*，是$v+W={v+w|w in W}$的陪集构成的线性空间。$B$在$V\/W$上是封闭的
  $
    mat(C, N; O, B) mat(x; y) = mat(C x + N y; B y) in mat(O; B y) + W
  $
  由于
  $
    V\/W tilde.equiv macron(W)
  $
  有
  $
    dim V\/W = dim macron(W)
  $
]

#definition(subname: [完全可约])[
  设$A(G)$是群$cal(G)$的一个表示，如果存在两个子空间$W$和$macron(W)$，使得
  - $V = W plus.circle macron(W)$
    - $W + macron(W) = V$
    - $W inter macron(W) = {0}$
  - $A(g) W subset.eq W$
  - $A(g) macron(W) subset.eq macron(W)$
  则称$A(G)$是*完全可约的*。

  用矩阵表示就是
  $
    A(G) tilde A'(G) = mat(C, O; O, B)
  $
]
有$W$和$macron(W)$都是$cal(G)$不变子空间。

#definition(subname: [不可约表示])[
  设$A(G)$是群$cal(G)$的一个表示，$A$的表示空间$V$没有$cal(G)$不变的子空间，则称$A(G)$是*不可约的*。

  用矩阵表示就是没有$O$块结构。
]
群表示的可约性与表示空间是否存在群不变的真子空间紧密相联。*不可约的表示是最本质、最小维数的表示。*

以上内容很容易推广到包含多个群不变真子空间的情形。我们将一个表示分解为若干不可约表示的直和的过程称为*表示的约化*。显然，表示 $A (G)$ 是完全可约的意味着其表示空间至少有两个互补的不变子空间。

把上述*约化*过程反过来：若已知群的若干个不可约表示，那么可以通过矩阵直和的办法构造该群的一系列表示，但它们都是完全可约的，并没有给出实质上的新内容。所以，寻求群表示的主要目标又进一步缩小，只需要找出群的*全部不等价的不可约的表示*。后面我们将证明，*对于有限群，其不等价不可约表示的个数和相应的维数是由群结构唯一确定的*。

下面给出表示的幺正性质（酉性），后面再做更深入的研究：

#definition(subname: [酉表示，幺正表示])[
  设$A(G)$是群$cal(G)$的一个表示，如果
  $
    A^dagger (g) = A^(-1) (g) = A(g^(-1))
  $
  对任意$g in cal(G)$成立，则称$A(G)$是*酉表示*，或称*幺正表示*。
]

后面将给出*酉定理*及其证明：*酉表示可约则完全可约*。

#note[

  意味着表示$A(G)$若左下角为$O$块矩阵，则右上角一定是$O$块矩阵；或者$V = W plus.circle macron(W)$，如果$W$是$cal(G)$不变子空间，则$macron(W)$也是$cal(G)$不变子空间；即*酉表示一定不是不可分表示*。
]


对于一有限群，求其表示的任务可总结为：*全部的、不等价的、不可约的、幺正表示*。


#example(subname: [一维表示])[
  任何群的一维表示都是不可约的。
]

#example(subname: [二阶循环群$G_2^c$])[
  二阶循环群
  $
    G_2^c = {a, a^2=e}
  $
  有两个一维表示
  $
    A^1(e) = 1, A^1(a) = 1\
    A^2(e) = 1, A^2(a) = -1
  $
  由这两个一维表示可以构造一个二维表示，$A(G_2^c) = A^1(G_2^c) plus.circle A^2(G_2^c)$，即
  $
    A(e) = mat(1, 0; 0, 1), A(a) = mat(1, 0; 0, -1)
  $
  这个二维表示没有本质上的新内容。
]

#example(subname: [$RR_+$的表示])[
  - 1-dim 不可约表示
  $
    x |-> e^(k x), k in K
  $
  有
  $
    e^(k(x_1+x_2)) = e^(k x_1) e^(k x_2)
  $
  而且不同 $k$ 给出不同的不等价不可约表示（$k != 0$ 为一维恒等表示）
  $
    e^y e^(k x) e^(-y) = e^(k x)
  $
  $RR_+$有无穷多个不等价不可约表示。
  - 2-dim 不可分表示
  $
    x |-> mat(1, x; 0, 1) = A(x)
  $
  有
  $
    A(x_1 + x_2) = A(x_1) A(x_2)
  $
  该表示是可约的，因为$RR_+$的不变子空间$W$，基为
  $
    vu(e)_1 = mat(1; 0), vb(r) = mat(r; 0), A(x) vb(r) = mat(1, x; 0, 1) mat(r_1; 0) in W
  $
  但它的互补子空间$macron(W)$不是$RR_+$不变的
  $
    macron(vb(r)) = mat(0; r), A(x) macron(vb(r)) = mat(1, x; 0, 1) mat(0; r) = mat(x; r) in.not macron(W)
  $
  因此无限群$RR_+$的表示$A(x)$是一个不可分表示（可约但不完全可约表示）。
]


#example(subname: [$"SO"(2)$的表示])[
  前面提到过，在表示空间$V={vu(i),vu(j),vu(k)}$时，其一个表示为
  $
    A(theta) = mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1)
  $
  取
  $
    X = mat(1, i, 0; i, 1, 0; 0, 0, 1)
  $
  则
  $
    X^(-1) A(theta) X = mat(e^(i theta), 0, 0; 0, e^(-i theta), 0; 0, 0, 1)
  $
  是一个完全可约表示。表示空间 $V$ 可以分解为三个互补的 $"SO"(2)$ 不变子空间的直和。其空间的基由$mat(vu(i), vu(j), vu(k)) X$给出。
]

事实上所有 Able 群的不可约表示都是一维的，后面将给出证明。

#example(subname: [$D_3$的表示])[
  $D_3$的自然表示为
  $
    A(g) = mat(Gamma(g), O; O, A'(g)) = Gamma(g) plus.circle A'(g)
  $
  其中$A'(g)$是一维的不可约表示，$Gamma(g)$是一个二维的不可约表示。

  $Gamma$是保距变换，所以它是幺正的。事实上，@同时对角化 可知 $Gamma$ 不对易，所以不能同时对角化，它不是一个完全可约表示；另外，它是幺正的，所以他不可能是不可分表示；从而它是一个不可约的表示。

  从表示空间的角度看：荷载表示 $Gamma$ 的基 ${vu(i),vu(j)}$ 张成了一个 $D_3$ 不变子空间 $W$，荷载表示 $A^*(g)$ 的基 ${vu(k)}$ 张成了一个 $D_3$ 不变子空间 $macron(W)$，它们的直和就是表示空间 $V$。

  $D_3$的六维表示为
  $
    mat(A^*(g), O; O, Gamma(g))
  $
  其中$Gamma$是二阶不可分表示；$A^*$是一个四阶表示。
]

#remark(lab: "同时对角化")[
  两个矩阵可以同时对角化当且仅当它们对易。
]

=== 表示的幺正性

幺正的定义已经在前面给出
$
  A^dagger (g) = A^(-1) (g) = A(g^(-1))
$
荷载幺正表示的表示空间应是复内积空间。

#theorem(subname: [酉定理], lab: "酉定理")[
  酉表示可约则完全可约。
]

#proof[
  设 $A(G)$是群 $G$ 的一个可约的幺正表示，其表示空间 $V$ 是酉空间。可约性要求 $V$ 存在一个 $G$ 不变的真子空间 $W$，即对任意的 $y in W, g in G$，有 $A(g) y in W$。从而 $V$ 可以分解成 $W$ 何其互补子空间 $macron(W)$ 的直和，即 $V = W plus.circle macron(W)$。
  $
    macron(W) = {z in V| braket(z, y)=0, y in W}
  $
  我们下面证明 $macron(W)$ 也是 $G$ 不变的。
  $
    braket(A(g) z, y) &= braket(z, A^dagger (g) y) = braket(z, A^(-1) (g) y) = braket(z, y') = 0\
  $
  这说明 $macron(W)$ 也是 $G$ 不变的。所以按完全可约的定义，可约的幺正表示一定是完全可约的。换句话，幺正表示要么是完全可约的，要么是不可约的，决不可能是不可分表示。
]

#corollary[
  有限维幺正表示可以分解为有限个不可约幺正表示的直和。
]

如果群 $cal(G)$ 的表示空间（酉空间）$V$ 可分解，那么它一定可以分解为有限个不可再分的 $G$ 不变子空间 $W_i$ 的直和。
$
  V = sum_(i=1)^q plus.circle W_i
$
相应地，$G$ 在每个 $W_i$ 上的（缩小）表示$A^((i)) (G)$ 都是不可约的幺正表示。如果在 $V$ 中选择如下排序的基
$
  V = { underbrace(e_1\,...\,e_(m_1), W_1), underbrace(e_(m_1+1)\,...\,e_(m_2), W_2), ... , underbrace(e_(m_(q-1)+1)\,...\,e_m, W_q) }
$
那么所有群元素的表示矩阵 $A(g)$ 都可以写成如下的块对角矩阵形式
$
  A(g) &= mat(A^((1)) (g), ; , A^((2)) (g); , , dots.down; , , , A^((q)) (g))\
  &= sum_(i=1)^q plus.circle A^((i)) (g)\
  &= sum_(i=1) plus.circle c_i A^((i)) (g)\
$
这表明 $G$ 在 $V$ 上的幺正表示 $A(G)$ 已约化为有限个不等价不可约幺正表示 $A^((i)) (G)$ 的直和。另外约定：若两个不可约表示是等价的，那么视它们相同，并记它们的上标相等 $i = i'$；若两个不可约表示是不等价的，那么它们的上标不相等 $i != i'$。所以，在第三个等式中的系数 $c_i$ 代表相应的 $A^((i)) (G)$ 出现的次数。不难发现，表示 $A(G)$ 的维数 $dim A(G)$ 等于所有不可约表示的维数之和，即
$
  n = sum_i c_i dim A^((i)) (G)
$


== 有限群表示

前面所讲内容具有普适性，从本节开始的内容只适用于有限群，但其中有些性质和结论可以有条件地推广到其他群。

=== Maschke 定理

#theorem(subname: [Maschke 定理])[
  有限群在内积空间上的任意一个表示都等价于一个幺正表示。
]

#proof[

  $cal(G)$在内积空间$V$上有一个表示$A(G)$，$V$是有限维的，即给定的$g in cal(G), forall x,y in V$有
  $
    (A(g) x|A(g) y) != (x|y)
  $
  现在证明： $V$ 上存在一非奇异线性方阵 $X$ ，使得 $A$ 的等价表示 $X^(-1) A X$ 是幺正的。

  定义新内积
  $
    braket(x, y) = 1 / n sum_i^n ( A(g_i) x|A(g_i) y )
  $
  于是，利用重排定理得
  $
    braket(A(g_i) x, A(g_i) y) &= 1 / n sum_j^n ( A(g_j) A(g_i) x|A(g_j) A(g_i) y ) \
    &= 1 / n sum_k^n ( A(g_k) x|A(g_k) y ) = braket(x, y)
  $
  即在新定义的内积下， $A$ 是幺正表示。

  我们找基变换，使得原来的内积成为新定义的内积。设$e = {e_1,...,e_n}$是 V 中在内积 $(dot|dot)$ 下的一组基，*$f = {f_1,...,f_n}$是 V 中在内积 $braket(dot)$的一组基*。它们都是正交归一的，
  $
    (e_i|e_j) = braket(f_i, f_j) = delta_(i j)
  $
  设这两组基由一个非奇异线性变换 $X$ 联系起来，
  $
    f_i = X e_i
  $
  就有
  $
    braket(X x, X y) = sum_(i,j) braket(x_i f_i, y_j f_j) = sum_(i,j) x_i^* y_j braket(f_i, f_j) = sum_i x_i^* y_i = (x|y)
  $
  从而有
  $
    (X^(-1) A(g) X x|X^(-1) A(g) X y) = braket(A(g) X x, A(g) X y) = braket(X x, X y) = (x|y)
  $
  故 $A$ 有等价的幺正表示 $X^(-1) A X$。
]

#note[

  几何意义：在给定的内积空间，如果选择*一组正交归一基*，那么幺正变换 $hat(U)$ 相应的矩阵就是*幺正矩阵*；如果选择一组非正交基，那么幺正变换相应的矩阵就是非幺正的。

  在有限维复内积空间中，由非幺正表示到其幺正表示的变换实际上反映了从一组斜坐标基到正交基的变换。
]

#remark[
  上述证明中的基变换矩阵
  $
    X = sqrt(sum_i A^*(g_i) A(g_i))
  $
]

#corollary(subname: [有限群的表示])[
  结合 @酉定理：
  - 有限群在内积空间的表示可约则完全可约
  - 有限群在内积空间的表示，或不可约，或等价于有限个不可约表示的直和
]

对有限群求表示的中心任务：*寻求全部的不等价的不可约的幺正表示。*

=== Schur 引理

Schur引理的目的是给出正交性和完备性的证明。

#lemma(subname: [Schur 引理1], lab: "schur-lem-1")[
  若一个矩阵 $M$ 与群 $cal(G)$ 的一个不可约表示 $A$ 中的所有表示矩阵对易，
  $
    [ M, A(g)] = 0, forall g in cal(G)
  $<schur1>
  则 $M$ 是单位矩阵的倍数
  $
    M = lambda I
  $
  其中 $lambda$ 是一个常数。
]

#proof[
  复空间线性变换一定有本征向量，设 $M$ 的本征值为 $lambda$，本征向量为 $y$，即
  $
    M y = lambda y
  $
  考虑 $V$ 的子空间
  $
    V_lambda = {y in V| M y = lambda y}
  $
  是 $cal(G)$ 不变的，因为
  $
    M(A(g_alpha)y) = A(g_alpha) M y = lambda(A(g_alpha)y), A(g_alpha) y in V_lambda\
  $
  而表示 $A(g)$ 是不可约的，所以 $V_lambda = V$。这就意味着 $forall x in V$
  $
    M x = lambda x
  $
  从而
  $
    M = lambda I
  $
]

#caution[
  @schur-lem-1 只适用于复表示。
]

#proposition(subname: [不可约表示的判据])[
  先找到一个满足 @schur1 的矩阵 $M$ ，若 $M$ 恒为一个常数矩阵，那么该表示就是不可约的；若 $M$ 不是一个常数矩阵，那么该表示就是可约的。
]

#example(subname: [$"SO"(2)$的表示])[
  利用 @schur-lem-1 ，我们判断
  $
    A(theta) = mat(cos theta, -sin theta; sin theta, cos theta)
  $
  是可约的。考虑
  $
    mat(a, b; c, d) mat(cos theta, -sin theta; sin theta, cos theta) = mat(cos theta, -sin theta; sin theta, cos theta) mat(a, b; c, d)
  $
  就有
  $
    a=d,b=-c
  $
  这说明 $A(theta)$ 是可约的。

  事实上该表示和
  $
    mat(e^(i theta), 0; 0, e^(-i theta))
  $
  是等价的，后者是完全可约的。
]

#lemma(subname: [Schur 引理2], lab: "schur-lem-2")[
  设 $A$ 和 $B$ 是群 $cal(G)$ 的两个不等价的不可约表示，它们的维数分别为 $S_A,S_B$，若一个 $S_B times S_A$ 维的矩阵 $M$ 满足：
  $
    M A(g) = B(g) M, forall g in cal(G)
  $
  那么一定有 $M=0$。
]

#proof[
  取 $M$ 在 $V_A$ 上的零空间
  $
    N = {x in V_A| M x = 0}
  $
  $N$ 是 $cal(G)$ 不变的，因为
  $
    M A(g) x = B(g) M x = 0, A(g) x in N
  $
  从而 $A(g) x in N$。而 $A$ 是不可约的，其不变子空间 $N$ 只能有 $N = V_A$，或者 $N = {0}$。

  - $N = V_A$ ，只能是 $M=0$，是一个零变换。
  - $M equiv.not 0$时，$N = {0}$，即不变子空间只有零向量；此时$M:V_A->V_B$是一个一一映射。这是因为 $M$ 不能同时把 $V_A$ 中的 $x_1, x_2$ 映到 $V_B$ 中的同一个向量 $y$，否则就有 $M (x_1 - x_2) = y$，这就意味着 $x_1 = x_2$。所以 $M$ 是一个单射。

    设 $R$ 为 $M$ 作用于 $V_A$ 得到的空间
    $
      R = {y in V_B| y = M x, x in V_A}
    $
    $R$是$V_B$的子空间，且也是$cal(G)$不变的，因为
    $
      B(g) y = B(g) M x = M A(g) x = M x' in R, A(g) x in V_A, B(g) y in R
    $
    由于表示 $B$ 是不可约的，所以 $R$ 只能是 $V_B$，或者 $R = {0}$。但 $M equiv.not 0$ ， 从而 $R=V_B$。从而 $M : V_A -> V_B$ 是一个满射。这就意味着 $M$ 是一个双射。存在 $M^{-1}$，即 $M$ 是一个可逆的线性变换。

    $
      B(g) = M A(g) M^(-1)
    $
    即不可约表示 $A$ 和 $B$ 是等价的，这与假设矛盾。
]

#proposition(subname: [等价表示的判据])[
  在有限维线性空间$V_A, V_B$上的不可约表示$A(g), B(g)$是等价的当且仅当存在一个不恒为0的$M$，使得
  $
    M A(g) = B(g) M
  $
]

#newpara()

前面说过下面的命题，现在给出证明：

#proposition(lab: "able-ir")[
  Able 群的所有不可约表示都是一维的。
]

#proof[

  设 $A(cal(G))$ 是 Abel 群 $cal(G)$的一个不可约表示，那么乘法关系保持不变要求对所有 $a, a' in cal(G)$
  $
    A(a) A(a') = A(a') A(a)
  $
  利用 #ref(<schur-lem-1>) ，我们可以得到对于每一个 $a' in cal(G)$，都有
  $
    A(a') = M(a') I
  $
  其中 $M(a')$ 是依赖于 $a'$ 的常复数。因此，若 $A(a)$ 是一个不可约表示，那么 $A(a)$ 只能是一个一维的表示。
]

#example(subname: [二维旋转群$"SO"(2)$的不可约表示])[

  $"SO"(2)$的乘法关系为
  $
    C_k (theta_1) C_k (theta_2) = C_k (theta_1 + theta_2)
  $
  因为 $"SO"(2)$ 是一个 Abel 群，所以利用 @able-ir 的结论知， $"SO"(2)$ 的所有不可约表示都是一维的。

  设 $"SO"(2)$ 的一个不可约表示为 $A={a(theta)}$ ，并设 $a(theta)$ 是一个复的连续数。若有对应 $C_k (theta) |-> a(theta)$ 乘法关系保持不变要求
  $
    a(theta_1) a(theta_2) = a(theta_1 + theta_2)
  $
  把上式两边对 $theta_1$ 求导数
  $
    a'(theta_1) a(theta_2) + a(theta_1) a'(theta_2) = a'(theta_1 + theta_2)
  $
  令 $theta_1=0$，$theta_2=theta$，就有
  $
    a'(0) a(theta) = a'(theta)
  $
  解为
  $
    a(theta) = e^(i m theta)
  $
  其中，保证酉性
  $
    a'(0) = i m
  $
  若考虑周期性边界条件
  $
    a(theta + 2 pi) = a(theta)
  $
  就有
  $
    m in ZZ
  $
  最终得到 $"SO"(2)$ 的不可约表示为
  $
    A_m = {e^(i m theta)}, m in ZZ
  $
  有无穷多不等价不可约酉表示。
  #note[
    这是所有的不可约酉表示，目前不给出证明。
  ]
]

#note[
  - 在量子力学中，这是$hat(L)_z$的本征方程，事实上$hat(L)_z$就是$C_k (theta)$。
  - 如果周期性变成$theta = theta + 4pi$，$m$就是半整数，这是自旋的内禀对称性：
  $
    "空间角动量：" &phi ->^(2pi) phi\
    "自旋角动量：" &phi ->^(2pi) - phi ->^(2pi) phi\
  $
  周期性事实上是单值性的要求。
  - 利用了分析的手段，没有显用“基”；这是因为$"SO"(2)$群的特殊性。
  - 群平均$1 / n sum$事实上就是$dv(, t)integral dd(theta)$。
]

== 群代数

#definition(subname: [线性代数])[

  数域$KK={alpha,beta,gamma,...}$上的线性空间$R={x,y,z,...}$定义了加法和数乘，在线性空间的定义下，再引入乘法
  $
    dot : R times R -> R
  $
  满足
  - 封闭性 ：$forall x,y in R, x dot y in R$
  - 加法分配律：$forall x,y,z in R, (x+y) dot z = x dot z + y dot z$，$x dot (y+z) = x dot y + x dot z$
  - 数乘结合律：$forall alpha in KK, x,y in R, alpha (x dot y) = (alpha x) dot y = x dot (alpha y)$
  就称$R$是*线性代数*或*代数*。
]

所有$n times n$的复矩阵在代数乘法为矩阵乘法的顶定义下，就是$CC$上的线性代数。

当 $(x y)z=z(y z)$时，称为可结合代数或结合代数。

为了更简洁地表述和理解正交性定理和完备性定理，先引入群函数的概念。*群代数*给出了*群函数*，由此给出*群函数空间*（线性空间）的概念，其有正交归一基。由群表示诱导出的群函数就给出了一个*群表示函数空间*的概念。

以群元为基，定义加法和数乘，给出*群空间*的概念：
#definition(subname: [群空间])[
  设 $CC$ 为复数域，$cal(G) = {g}$ 是群。群$cal(G)$原来只有乘法运算，若进一步定义加法和数乘，即对任意
  $
    x = sum_alpha x_alpha g_alpha, y = sum_alpha y_alpha g_alpha, x_alpha,y_alpha in CC, g_alpha in cal(G)
  $
  满足
  $
    x + y = sum_alpha (x_alpha + y_alpha) g_alpha\
    a x = sum_alpha (a x_alpha) g_alpha\
  $
  则
  $
    x = sum_alpha x_alpha g_alpha
  $
  的全体构成一个线性空间 $V_cal(G)$ 称为*群空间*，群元素 $g_alpha$ 称为$V_cal(G)$的*自然基底*。
]

之后按照与$cal(G)$规则乘法规则一致的原则定义乘法，而给出*群代数*：
#definition(subname: [群代数])[
  设 $g_alpha, g_beta, g_gamma in cal(G), g_alpha g_beta = g_gamma$，$x,y in V_cal(G)$，则定义乘法为
  $
    x = sum_alpha x_alpha g_alpha, y = sum_beta y_beta g_beta\
    x y = (sum_alpha x_alpha g_alpha)(sum_beta y_beta g_beta) = sum_(alpha beta) x_alpha y_beta(g_alpha g_beta)= sum_(gamma)(x y)_gamma g_gamma
  $
  其中
  $
    (x y)_gamma = x_alpha y_(alpha^(-1) gamma)
  $
  $y_(alpha^(-1) gamma)$是$y$在$g_alpha^(-1) g_gamma$上的投影。这样定义的乘法，显然满足条件
  $
    (a x + y)z = a(x z) + y z\
    (x y)z = x(y z)\
  $
  在以上乘法的定义下，群空间$V_cal(G)$构成一个结合代数，称为群$cal(G)$的*群代*数，记为$R_cal(G)$。
  $
    dim R_cal(G) = abs(cal(G))
  $
]

由此可以定义*正则表示*：

#definition(subname: [正则表示])[
  若取群代数$R_cal(G)$为群$cal(G)$的表示空间，任意$g_i in cal(G)$可以映为$R_cal(G)$上的线性变换$L(g_i)$，定义为
  $
    L(g_i) g_j = g_i g_j = g_k
  $
  则
  $
    L(g_i) L(g_j) g_k = L(g_i) g_j g_k = g_i g_j g_k = L(g_i g_j) g_k\
  $
  保乘法，则称$L(g_i)$为群$cal(G)$的*正则表示*。维数为$|cal(G)|$。
]

*正则表示事实上是重排定理的体现。*

#example(subname: [二阶循环群$Z_2$])[
  $
    Z_2 = {a, a^2=e}
  $
  取群代数$R_Z_2$中的自然基
  $
    e = mat(1; 0), a = mat(0; 1)
  $
  则$Z_2$的左正则表示是
  $
    L(e) = mat(1, 0; 0, 1), L(a) = mat(0, 1; 1, 0)
  $
  取非奇异矩阵
  $
    X = 1 / sqrt(2) mat(1, 1; 1, -1) , X^(-1) = X
  $
  从而$e,a$等价于
  $
    X e X^(-1) = mat(1, 0; 0, 1), X a X^(-1) = mat(1, 0; 0, -1)
  $
  是可约变换。
]

#example(subname: [$D_3$的正则表示])[
  $R_D_3$的自然基为
  $
    e = mat(1; 0; 0; 0; 0; 0), d = mat(0; 1; 0; 0; 0; 0), f = mat(0; 0; 1; 0; 0; 0), a = mat(0; 0; 0; 1; 0; 0), b = mat(0; 0; 0; 0; 1; 0), c = mat(0; 0; 0; 0; 0; 1)
  $
  则正则表示
  $
    L(e) = mat(
      1, 0, 0, 0, 0, 0;
      0, 1, 0, 0, 0, 0;
      0, 0, 1, 0, 0, 0;
      0, 0, 0, 1, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 1
    ),
    L(d) = mat(
      0, 0, 1, 0, 0, 0;
      1, 0, 0, 0, 0, 0;
      0, 1, 0, 0, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 1;
      0, 0, 0, 1, 0, 0
    ),
    L(f) = mat(
      0, 1, 0, 0, 0, 0;
      0, 0, 1, 0, 0, 0;
      1, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 1;
      0, 0, 0, 1, 0, 0;
      0, 0, 0, 0, 1, 0
    )\
    L(a) = mat(
      0, 0, 0, 1, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 1;
      1, 0, 0, 0, 0, 0;
      0, 1, 0, 0, 0, 0;
      0, 0, 1, 0, 0, 0
    ),
    L(b) = mat(
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 1;
      0, 0, 0, 1, 0, 0;
      0, 0, 1, 0, 0, 0;
      1, 0, 0, 0, 0, 0;
      0, 1, 0, 0, 0, 0
    ),
    L(c) = mat(
      0, 0, 0, 0, 0, 1;
      0, 0, 0, 1, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 1, 0, 0, 0, 0;
      0, 0, 1, 0, 0, 0;
      1, 0, 0, 0, 0, 0
    )
  $
  后面将给出这个正则表示也是可约的。
]

== 群函数

=== 群函数空间

为了更简洁地表述和理解正交性定理和完备性定理，引入*群函数*：

#definition(subname: [群函数])[
  若存在一个从群 $cal(G)$ 到复数域 $CC$ 的映射 $phi$
  $
    phi : G -> CC , g |-> phi(g)
  $
  称 $phi(g)$ 为群 $cal(G)$ 上的函数，或*群函数*。
]
$R_cal(G)$是群代数，则$R_cal(G)$中的任意向量$x$都可以看成群元$g$的函数$x(g)$，即
$
  x = sum_(i=1)^n x_i g_i = sum_(i=1)^n x(g_i) g_i
$
$R_cal(G)$中的向量与复函数$x(g)$建有一一对应关系。*所有复函数全体构成一个和$R_cal(G)$同构的代数。*对$a in CC$，群函数$x(g),y(g)$有加法、数乘和乘法运算
$
  (a x)(g_i) = a x(g_i)\
  (x + y)(g_i) = x(g_i) + y(g_i)\
  (x y)(g_i) = sum_j x(g_i) y(g_j^(-1) g_i)
$

#theorem(subname: [群函数定理], lab: "群函数定理")[
  $n$ 阶有限群只有 $n$ 个线性独立的群函数。
]
#proof[

  如上所述，*所有复函数全体构成一个和$R_cal(G)$同构的代数*。空间中的一个元素$x$和一个群函数$x(g_alpha)$是一一对应的
  $
    V_G = {x} = {x(g_alpha)}
  $
  在线性空间中，就是线性空间可以用向量表示，也可以在基选择好的情况下，用所有的坐标表示。

  $n$个独立的基给出$n$个独立的群函数，这些基张成一个*群函数空间*$V_cal(G)$。
]
考虑$cal(G)$*的复函数空间*的$n$个基
$
  g_j (g_i) = delta_(j i)
$
可以写成一个矩阵，其中列是群函数，行是群元素
$
  mat(g_1 (g_1), g_1 (g_2), ..., g_1 (g_n); g_2 (g_1), g_2 (g_2), ..., g_2 (g_n); ...; g_n (g_1), g_n (g_2), ..., g_n (g_n))
$
这是有限域的基本性质。

在$V_G$中也可以引入内积，即对任意的群函数$g_i,g_j$，有
$
  braket(g_i, g_j) = 1 / n sum_(k=1)^n g_i^* (g_k) g_j (g_k) = 1 / n sum delta_(i j)
$
有*正交归一的完备基*
$
  V_G = {sqrt(n) g_i (g_t) | i=1,2,...,n}
$

#newpara()

=== 群表示函数

我们知道一个群表示可以诱导出一组群函数：若表示 $A(G)$ 的维数为 $S$，那么该表示总共可以产生 $S^2$ 个群函数 $A_(i j) (g_k)$
$
  A(g_k) = mat(
    A_(1 1) (g_k), dots, A_(1 S) (g_k);
    dots.v, dots.down, dots.v;
    A_(S 1) (g_k), dots, A_(S S) (g_k)
  )
$

#definition(subname: [群表示函数])[

  表示矩阵$A(g_k)$的矩阵元$A_(i j) (g_k)$是$cal(G)$上的函数，以$g_k$为自变量。由于这里的群函数是由表示产生的，所以称它们为*群表示函数*。
]
若表示$A(g)$的维数为$S$，那么该表示总共可以产生$S^2$个群函数$A_(i j) (g_k)$。

前面已经证明：*群函数集合是群函数空间的一组基*。所以，独立的群表示函数也可以张成一个线性空间，称为群表示函数空间。后面的讨论将给出该空间的基。

== 正交性定理和完备性定理

正交性定理在群表示理论中居于中心地位，它给出了不等价不可约么正表示的矩阵元所满足的关系。

$n$阶群$cal(G)$有$q$个不可约表示$A^((P))$，维度为$S_P$，那么就有 $S_P^2$ 个群函数 $A^((P))_(i j) (g_k)$。这就给出了正交性定理。

#theorem(subname: [(巨)正交性定理], lab: "正交性定理")[
  设 $n$ 阶有限群 $cal(G) = { ..., g_k , ... }$ 有不等价不可约的幺正表示 $A^((p)) (cal(G)), A^((r)) (cal(G))$，它们的维数分别为 $S_p,S_r$。那么由 $A^((p)) (cal(G))$ 产生的群函数 $A^((p))_(mu nu) (g_k)$ 和 $A^((r)) (cal(G))$ 产生的群函数 $A^((r))_(mu' nu;) (g_k)$ 满足
  $
    braket(A^((p))_(mu nu) (g_k), A^((r))_(mu' nu') (g_k)) = 1 / n sum_(k=1)^n A^((p)*)_(mu nu) (g_k) A^((r))_(mu' nu') (g_k) = 1 / S_p delta_(p r) delta_(mu mu') delta_(nu nu')
  $
]

#proof[
  作$S_p$维矩阵$C$，其中$D$为任意的$S_p$维矩阵
  $
    C = 1 / n sum_(i=1)^n A^p (g_i) D A^p (g_i^(-1))\
  $
  由 @重排定理 重排定理 可知
  $
    A^p (g_j) C &= 1 / n sum_(i=1)^n A^p (g_j) A^p (g_i) D A^p (g_i^(-1)) A^p (g_j^(-1)) A^p (g_j)\
    &= 1 / n sum_k A^p (g_k) D A^p (g_k^(-1)) A^p (g_j)\
    &= C A^p (g_j)\
  $
  由 @schur-lem-2 Schur 引理2 可知 $C$ 是一个常数矩阵
  $
    C = lambda(D) I_(S_p times S_p)
  $
  取$D$的矩阵元除$D_(nu' nu)=1$外，其余都为0，则有
  $
    lambda delta_(mu mu') = C_(mu' mu) = 1 / n sum_(i=1)^n A^p_(mu' nu') (g_i) A^p_(nu mu) (g_i^(-1))\
  $
  取$mu'=mu$，并对上式求和
  $
    sum_mu 1 / n sum_(i=1)^n A^p_(mu nu') (g_i) A^p_(nu mu) (g_i^(-1)) &= 1 / n sum_(i=1)^n A^p_(nu nu') (g_i^(-1) g_i) = 1 / n sum_(i=1)^n delta_(nu nu') = delta_(nu nu')\
    &= lambda S_p\
  $
  从而
  $
    lambda = delta_(nu nu') / S_p
  $
  从而
  $
    1 / n sum_i A^(p)_(mu' nu') (g_i) A^p_(nu mu) (g_i^(-1)) = 1 / S_p delta_(mu mu') delta_(nu nu')\
  $
  这是对一个表示而言的正交性。

  取$S_r times S_p$的$D'$，作$C'$
  $
    C' = 1 / n sum_(i=1)^n A^r (g_i) D' A^p (g_i^(-1))\
  $
  有
  $
    C' A^p (g_j) &= 1 / n sum_(i=1)^n A^r (g_j) A^r (g_i) D' A^p (g_i^(-1)) A^p (g_j^(-1)) A^p (g_j)\
    &= A^r (g_j) 1 / n sum_(i=1)^n A^r (g_j^(-1) g_i) D' A^p (g_i^(-1) g_j)\
    &= A^r (g_j) 1 / n sum_(k=1)^n A^r (g_k) D' A^p (g_k^(-1))\
    &= A^r (g_j) C' \
  $
  由 @schur-lem-1 Schur引理1 可知
  $
    C' equiv 0
  $
  取$D'_{nu' nu}=1$，其余都为0，则有
  $
    0 = C'_(mu' mu) &= 1 / n sum_(i=1)^n A^r_(mu' nu') (g_i) A^p_(nu mu) (g_i^(-1))\
    &=^"酉" 1 / n sum_(i=1)^n A^(p *)_(nu mu) (g_i) A^r_(mu' nu') (g_i)\
  $
  从而不是一个表示的群表示函数正交。

  综上有
  $
    braket(A^((p))_(mu nu) (g_k), A^((r))_(mu' nu') (g_k)) = 1 / n sum_(k=1)^n A^((p)*)_(mu nu) (g_k) A^((r))_(mu' nu') (g_k) = 1 / S_p delta_(p r) delta_(mu mu') delta_(nu nu')
  $
]

#theorem(subname: [完备性定理], lab: "完备性定理")[
  有限群 $cal(G)$ 的全部不等价不可约么正表示 $A^((i)), i=1,2,...,q$ 其中$q$是不等价不可约的酉表示个数；其产生的群表示函数集合
  $
    {A^(i)_(mu nu) (g_k) | i=1,2,...,q; mu,nu=1,2,...,S_i}
  $
  构成了群表示函数空间上的一个完备集。任何群函数$psi(g_k)$可以展开为${A^(i)_(mu nu) (g_k)}$的线性组合，即
  $
    psi(g_k) = sum_(i,mu,nu) C_(mu nu)^((i)) A^((i))_(mu nu) (g_k)
  $
  其中$C_(mu nu)^((i))$是复展开系数，由正交性定理给出
  $
    C_(mu nu)^((i)) = S_p braket(A^((i))_(mu nu) (g_k), psi(g_k))
  $
]

#proof[
  @正交性定理 说明了 $A^((p))$ 和 $A^((r))$ 之间的正交关系。
  $
    braket(A^((p))_(mu nu) (g_k), A^((r))_(mu' nu') (g_k)) = 1 / S_p delta_(p r) delta_(mu mu') delta_(nu nu')
  $
  我们知道 $A^((p))_(mu nu)$为正交基可以构成群函数空间 $R_cal(G)$ 的子空间 $V$。下面证明$V=R_cal(G)$。

  首先说明$V$是$R_cal(G)$的不变子空间，因为
  $
    L(g_j) A^((p))_(mu nu) (g_k) = A^((p))_(mu nu) (g_j^(-1) g_k) = sum_lambda A^((p))_(mu lambda) (g_j^(-1)) A^((p))_(lambda nu) (g_k) in V
  $
  所以$L(g_j)$可约，其中正则表示$L(g_i)$是酉表示，从而是完全可约的。设$macron(V)$是$V$的正交补空间，从而$macron(V)$是$R_cal(G)$的$cal(G)$不变子空间，有直和
  $
    R_cal(G) = V plus.circle macron(V)
  $
  下面再说明$macron(V) = {0}$。否则$macron(V)$有不变子空间$W$，$W$按$cal(G)$的不可约表示$A^((r))$变换，设$W$的基为$x_i,i=1,...s_r$
  $
    L(g_j) x_alpha (g_i) = x_alpha (g_j^(-1) g_i) = sum_beta A^((r))_(alpha beta) (g_j^(-1)) x_beta (g_i)
  $
  取$g_i=e$
  $
    x_a (g_j^(-1)) = sum_beta A^((r))_(alpha beta) (g_j^(-1)) x_beta (e) in V
  $
  (这里$g_i^(-1)$为变元) 从而$W subset V inter macron(V)$，矛盾！从而$macron(V) = {0}$。所以$V=R_cal(G)$，即群表示函数空间是完备的。
]

由上述讨论可知函数集${A^(i)_(mu nu) (g_k)}$是$R_cal(G)$完备基。
$
  sqrt(1 / S_p) A^((p))_(mu nu) (g_k)
$
是$R_cal(G)$的*函数群空间的正交归一基*。

#theorem(subname: [Burnside 定理], lab: "burnside")[
  有限群的所有不等价不可约表示的维数平方和等于该群的阶，即
  $
    sum_i^q S_i^2 = n
  $
]

#proof[
  这是 @完备性定理 的直接结果。
]

式中且至少有一项取值为1，因为每个群都有一个一维恒等表示。该定理大大地限制了有限群的不等价不可约表示的数目和维数。如，阶小于 5 的群的不等价不可约表示的数目就是该群的阶，且它们的所有不可约表示都是一维的。

但是 @burnside 并没有给出 $q$ 的具体值。
#corollary()[
  正则表示$L(g_i)$按不等价的不可约酉表示$A^((p))(g_i)$可约化为
  $
    L(g_i) = sum_(p=1)^q plus.circle S_p A^((p))(g_i)
  $
]

#proof[
  这是因为
  $
    L(g_j) A^((p))_(mu nu) (g_i)= sum_lambda A^((p) *)_(mu lambda) (g_j) A^((p))_(lambda nu) (g_i)
  $
  对于每一个固定的$nu$，基$A^((p))_(mu nu) (g_i)$给出一次$A^((p))$的表示空间，总共给出$S_p$次$A^((p))$的表示空间。*正则表示含不等价不可约酉表示的次数等于该表示的维度。*
]


#example(subname: [$D_3$群])[
  群 $D_3$ 的三维表示，通过表示约化技术知，它是由一个一维不可约表示 $A_1$ 和一个二维不可约表示 $Gamma$ 直和而成。由 @burnside
  $
    6 = 2^2 + 1^2 + x
  $
  可解出 $x = 1$ 。表明还剩下一个一维表示，即恒等表示。所以 $D_3$ 只有三个不等价不可约的表示。

  这样，$D_3$的全部不等价的不可约的表示的矩阵元共有 6 个，它们是群 $D_3$ 上的函数，其函数值可以从不可约表示直接读出，如下表
  #three-line-table[
    | 函数 | $e$ | $d$ | $f$ | $a$ | $b$ | $c$ |
    | --- | --- | --- | --- | --- | --- | --- |
    | $S$ | $1$ | $1$ | $1$ | $1$ | $1$ | $1$ |
    | $A_1$ | $1$ | $1$ | $1$ | $-1$ | $-1$ | $-1$ |
    | $Gamma_11$ | $1$ | $-1 / 2$ | $-1 / 2$ | $1$ | $-1 / 2$ | $-1 / 2$ |
    | $Gamma_12$ | $0$ | $sqrt(3) / 2$ | $-sqrt(3) / 2$ | $0$ | $sqrt(3) / 2$ | $-sqrt(3) / 2$ |
    | $Gamma_21$ | $0$ | $-sqrt(3) / 2$ | $sqrt(3) / 2$ | $0$ | $sqrt(3) / 2$ | $-sqrt(3) / 2$ |
    | $Gamma_22$ | $1$ | $-1 / 2$ | $-1 / 2$ | $-1$ | $1 / 2$ | $1 / 2$ |
  ]
  按矢量的观点，这里的每一个群表示函数都可以视为一个六维矢量空间中的一个矢量。因此，表中每一行给出矢量的分量，记为
  $
    vb(S) = mat(1; 1; 1; 1; 1; 1), vb(A)_1 = mat(1; 1; 1; -1; -1; -1), vb(Gamma)_11 = mat(1; -1 / 2; -1 / 2; 1; -1 / 2; -1 / 2), vb(Gamma)_12 = mat(0; sqrt(3) / 2; -sqrt(3) / 2; 0; sqrt(3) / 2; -sqrt(3) / 2) vb(Gamma)_21 = mat(0; -sqrt(3) / 2; sqrt(3) / 2; 0; sqrt(3) / 2; -sqrt(3) / 2), vb(Gamma)_22 = mat(1; -1 / 2; -1 / 2; -1; 1 / 2; 1 / 2)
  $
  这些矢量的长度为表示维数倒数的平方根$1 / sqrt(S_p)$，且不同行矢量之间都是相互正交的。

  #note[
    虽然函数值表是个方阵，但表中的列没有上述性质，因为每一列不是一个矢量。
  ]
]

约化是把一个可约表示分解为不可约表示的直和。我们可以把 $D_3$ 的表示 $A(g)$ 写成
$
  mat(A) = mat(square, , ; , square, ; , , square)
$

我们知道一个不可约表示的群表示函间$V_i$是可约表示的群表示函数空间$V_cal(G)$的不变子空间。从而$V_i$的基可以由$V_cal(G)$的基线性组合得到，这就是后面将要讨论的*投影算符*。

== 特征标理论

在给定的表示空间，群的表示也不是唯一的。选取不同的基，可以得到不同的表示。当然这些表示是等价的，它们可以通过相似变换联系起来。我们希望找出表示中不依赖基的某些固有性质。我们想找到一个标度：
- 与基无关
- 一一对应
- 映射到数集

矩阵理论告述我们，矩阵的迹在相似变换下不变。因此迹可以刻画群表示的与基无关的固有特点。利用特征标，可以得到关于群表示更多和更简洁的结论。

=== 特征标及其性质

#definition(subname: [特征标])[
  设 $A={A(g)}$是群$cal(G)$的一个表示，表示$A$的*特征标*为
  $
    chi^A = {Tr A(g) in CC}
  $
  其中$$（即表示矩阵的迹$Tr A(g)$）称为群元素 $g$ 的特征标。
]
其中$chi^A (g)$是群函数，但无法张成一个空间$V_chi$，因为其不满足完备性。

#example(subname: [$D_3$的特征标])[
  $D_3$的特征标是
  #three-line-table[
    | 特征标 | $e$ | $d$ | $f$ | $a$ | $b$ | $c$ |
    | --- | --- | --- | --- | --- | --- | --- |
    | $chi^S$ | $1$ | $1$ | $1$ | $1$ | $1$ | $1$ |
    | $chi^A_1$ | $1$ | $1$ | $1$ | $-1$ | $-1$ | $-1$ |
    | $chi^Gamma_1$ | $2$ | $-1$ | $-1$ | $0$ | $0$ | $0$ |
  ]
  写成向量的形式为
  $
    vb(chi)^S = mat(1; 1; 1; 1; 1; 1), vb(chi)^A = mat(1; 1; 1; -1; -1; -1), vb(chi)^Gamma = mat(2; -1; -1; 0; 0; 0)
  $
]

#proposition(subname: [特征标的性质])[
  对群的某一表示来说，其单位元的特征标就等于该表示的维数。
  $
    chi^A (e)=S_A
  $
]

#proposition(subname: [])[
  等价表示的特征标相等。
  $
    A tilde A' => chi^A = chi^A'
  $
]

#proposition(subname: [特征标的性质])[
  不可约幺正表示的特征标的模等于 1。
]

#proof[
  利用幺正表示的正交性定理，且只需考虑其中的对角元素
  $
    1 / n sum_(k=1)^n A_(i i)^((p)*) (g_k) A_(i' i')^((p)) (g_k) = 1 / S_p delta_(i i')\
  $
  对指标$i$求和有
  $
    braket(chi^((p))) = 1 / n sum_(k=1)^n chi^((p)*) (g_k) chi^((p)) (g_k) = 1 / S_p sum_(i=1)^S_p delta_(i i') = 1 / S_p S_p = 1\
  $
]
这个性质可以作为*判断表示是否可约的判据*。显然，一维表示满足上式。

#proposition(subname: [特征标的性质])[
  不等价的不可约幺正表示的特征标正交，即第 $p$ 个和第 $r$ （$r != p$）不可约表示的特征标满足
  $
    braket(chi^((p)), chi^((r))) = 1 / n sum_(k=1)^n chi^((p)*) (g_k) chi^((r)) (g_k) = 0
  $
]

#proof[
  利用幺正表示的正交性定理可直接得到。
]


#proposition(subname: [特征标的性质])[
  可约表示的特征标等于它所包含的不可约表示的特征标之和。
  $
    A(g_k) = sum_(i=1)^q plus.circle C_p A^((p))\
    chi^A = sum_p C_p chi^((p))\
  $
  其中
  $
    C_p = braket(chi^((p)), chi^A)
  $
]
这给出了约化技术$A = sum_p plus.circle C_p A^((p))$的$C_p$的计算。

由此也可以给出
#theorem(subname: [特征标的第一正交关系])[
  $
    braket(chi^((p)), chi^((r))) = delta_(p r) \
  $
]

#proposition(subname: [特征标的性质])[
  可约表示的特征标等于它所包含的不可约表示的特征标之和。
]

#proof[
  设 $A$ 是群 $cal(G)$ 的一个可约表示，那么它一定可以约化为 $cal(G)$ 的有限个不等价不可约表示（设为 $q$ 个）的直和，即
  $
    A(g) = sum_(i=1)^q plus.circle m_i A^((i)) (g), g in cal(G)
  $<特征标约化>
  其中 $m_i$ 是 $A^((i))$ 在 $A$ 中的重数。对上式两边的对角元求和，有
  $
    chi^A (g) = sum_(i=1)^q m_i chi^((i)) (g)
  $
  其中 $chi^((i)) (g)$ 是 $A^((i))$ 的特征标。由正交关系有
  $
    m_i = braket(chi^((i)), chi^A) = 1 / n sum_(k=1)^n chi^((i)*) (g_k) chi^A (g_k)
  $<特征标约化1>
]
注意到 @特征标约化 中的 $m_i$ 可以由 @特征标约化1 给出，这样就知道一个可约表示是由哪些不可约表示直和而成的，随即就完成了表示的约化任务。对于给定的一个表示 $A$ ， $chi^A$ 是确定的，又因为有限群的不可约表示的特征标 $chi^((p))$ 是确定的，所以$m_i$也是唯一确定的。由此说明了*有限群可约表示的约化的唯一性*。

当然，与 $m_i$ 相应的不可约表示 $A^((i))$ 在表示 $A$ 的对角线上的排序是任意的，所以只能确定到等价的块结构。

#corollary(subname: [特征标的性质])[
  $
    A tilde A' <=> chi^A = chi^A'
  $
]

#proposition(subname: [特征标的性质])[
  可约表示的特征标的模大于 1。
]

#proposition(subname: [特征标的性质])[
  同类元素的特征标相等。
]

#newpara()
$chi^A (g)$难以张成一个空间，现在我们可以引入*类函数*，使之可以张成一个空间。类函数
$
  phi: k -> phi(k) in CC
$
#definition(subname: [类函数])[
  是群$cal(G)$的一个函数，如果它满足
  $
    phi(K_i) = phi(g_i))
  $
  其中$g_i$是$K_i$类中的任意元素，$K_i$是群$cal(G)$的一个类。$phi$称为*类函数*。
]
同 @群函数定理 有，$q$个类上只有$q$的独立的类函数。对这个方阵，就可以构造出$chi^A (k)$可以张成一个空间$V_chi$，并且$V_chi$是一个正交归一且完备的空间。其中
$
  chi(k_g) = chi(g)
$

#example(subname: [$D_3$的类函数])[
  $D_3$的类函数是
  #three-line-table[
    | 类函数 | $K_1 = {e}$ | $K_2={d,f}$ | $K_3={a,b,c}$ |
    | --- | --- | --- | --- |
    | $chi^S$ | $1$ | $1$ | $1$ |
    | $chi^A_1$ | $1$ | $1$ | $-1$ |
    | $chi^Gamma$ | $2$ | $-1$ | $0$ |
  ]
  写成向量的形式为
  $
    vb(chi)^S = mat(1; 1; 1), vb(chi)^A = mat(1; 1; -1), vb(chi)^Gamma = mat(2; -1; 0)
  $
]

事实上类函数和群函数本质上没有区别，只是群函数是群元素的函数，而类函数是群类的函数。

利用类函数的性质，特征标的第一正交关系还可以写为

#theorem(subname: [特征标的第一正交关系])[
  $
    1 / n sum_(i=1)^q n_i chi^((p)*) (K_i) chi^((r)) (K_i) = delta_(p r)\
  $<特征标的第一正交关系>
  其中 $q$ 是 $cal(G)$ 中的类的个数，$n_i$ 是第 $i$ 个类 $K_i$ 中元素的个数，$chi^((p)) (K_i)$ 是第 $p$ 个不可约表示的特征标。
]
该正交性是特征标表行的正交关系，是不同类对应的特征标的正交性。

#theorem(subname: [完备性定理])[
  全部不等价不可约么正表示的特征标集合${chi^A (K_i)}$构成了*类函数空间*$R_cal(G)$的完备基。该集合可以作为类函数空间的一组基，空间中的任意类函数$f(K_i)$都可以用该集合的线性组合表示，即
  $
    f(K_i) = sum_(p=1)^q C_p chi^((p)) (K_i)\
  $
]

#proof[
  设这些不可约酉表示为$A^p$， @完备性定理 说明了 $f(g_i)$ 可以用 $A^p$ 的群表示函数 $A_(mu nu)^p (g_i)$ 展开
  $
    f(g_i) = sum_(p,mu,nu) a_(mu nu)^p A^p_(mu nu) (g_i)\
  $
  当$f(g_i)$是类函数的时候
  $
    f(g_i) &= f(g_j^(-1) g_i g_j) = 1 / n sum_(j=1)^n f(g_j^(-1) g_i g_j)\
    &= 1 / n sum_(p,mu,nu) sum_(j=1)^n a_(mu nu)^p A^p_(mu nu) (g_j^(-1) g_i g_j)\
    &= 1 / n sum_(j=1)^n sum_(p,mu,nu) sum_(lambda sigma) a_(mu nu)^p A^p_(mu lambda) (g_j^(-1)) A^p_(lambda sigma) (g_i) A^p_(sigma nu) (g_j)\
    &= 1 / n sum_(p,mu,nu) sum_(lambda sigma) a_(mu nu)^p A^p_(lambda sigma) (g_i) sum_(j=1)^n A^(p*)_(mu lambda) (g_j) A^p_(sigma nu) (g_j)\
    &= sum_(p,mu,nu) sum_(lambda sigma) a_(mu nu)^p A^p_(lambda sigma) (g_i) delta_(lambda sigma) delta_(mu nu)\
    &= sum_(p,mu,lambda) a_(mu mu)^p A^p_(lambda lambda) (g_i) = sum_(p,mu) a_(mu mu)^p chi^p (g_i)\
    &= sum_p a^p chi^p (g_i)\
  $
  其中 $a^p = sum_(mu) a_(mu mu)^p$ 是一个常数。从而任意类函数$f(K_i)$都可以用不可约酉表示的特征标$chi^p (K_i)$展开。这就意味着 $chi^p (K_i)$ 是类函数空间的完备基。
]

因为一个不可约表示给出一个类函数，所以*全部不等价不可约表示的数目等于类函数的数目*。又知完备的类函数的数目等于类的数目，于是对有限群，有如下重要结论：
$
  "不等价不可约表示的数目" = "类的数目"
$
这样就解决了 Burnside 定理中求和的个数问题。

#theorem(subname: [特征标的第二正交关系])[
  $
    n_i / n sum_(p=1)^q chi^((p)*) (K_i) chi^((p)) (K_i') = delta_(i i')\
  $
  其中 $q$ 是 $cal(G)$ 中的类的个数，$n_i$ 是第 $i$ 个类 $K_i$ 中元素的个数，$chi^((p)) (K_i)$ 是第 $p$ 个不可约表示的特征标。
]
该正交性是特征标表列的正交关系，是同类对应的不同特征标的正交性。

#proof[
  考虑矩阵$F$，其中矩阵元$F_(r i)$
  $
    F_(r i) = sqrt(n_i / n) chi^((r)) (K_i)\
  $
  则有
  $
    F_(p i)^* = sqrt(n_i / n) chi^((p)*) (K_i) = (F^dagger)_(i p)\
  $
  @特征标的第一正交关系 可写为
  $
    sum_(i=1)^q F_(r i) F^dagger_(i p) = (F F^dagger)_(r p) = delta_(r p)\
  $
  从而幺正矩阵$F$
  $
    F F^dagger = I
  $
  从而
  $
    F^dagger F = I
  $
  也就是
  $
    sum_(i=1)^q sqrt((n_i n_j) / n^2) chi^((p)*) (K_i) chi^((p)) (K_j) = delta_(i j)\
  $
]

#example(subname: [CG系数])[
  $
    sum_(m_1,m_2) braket(j_1 m_1 j_2 m_2, j m) braket(j_1 m_1 j_2 m_2, j' m') = delta_(j j') delta_(m m')\
    sum_(j,m) braket(j_1 m_1 j_2 m_2, j m) braket(j_1' m_1 j_2 m_2, j' m') = delta_(j_1 j_2) delta_(m_1 m_2)\
  $
  事实上对于$chi->F$，$F^dagger F = I$，行列的正交性就是这两个式子。
]

#newpara()

矢量空间的观点，设群 $cal(G)$ 有 $q$ 个类 $K_j$， $q'$ 个不等价不可约么正表示 $A^((i))$ 。那么由特征标的第一和第二正交关系可以“产生”两个矢量空间：
- $K$ 空间：

  该空间中的矢量为 $chi^((i))$ 其中不可约表示的指标 $i$ 用于区分不同的矢量，这样有 $q'$ 个独立的矢量。矢量 $chi^((i))$ 的分量为 $chi^((i)) (K_j)$，即类函数的自变量 $K_j$ 是该矢量的分量指标，它的取值范围是 $cal(G)$ 的全部类，所以“$K$空间”的维数为 $q>=q'$

- $p$ 空间：

  该空间中的矢量为 $chi(K_j)$，其中类的指标 $K_j$ 用于区分不同的矢量，这样有 $q$ 个独立的矢量。矢量 $chi (K_j)$ 的分量为 $chi^((i)) (K_j)$，即不可约表示的自变量 $i$ 是该矢量的分量指标，它的取值范围是 $cal(G)$ 的全部类，所以“$p$空间”的维数为 $q'>=q$

虽然是从不同的空间看，但总的矢量分量${chi^((i)) (K_j)}$是相同的，有$q=q'$。


#note[
  *特征标的用途：*
  - 判断两个表示是否等价 $chi^A = chi^A' <=> S tilde S'$
  - 利判断一个表示是否可约 $braket(chi^A, chi^A) = 1$
  - 计算出某一表示中包含哪些不可约表示，以及它们出现的次数 $C_p$，$chi^A (g) = sum_p plus.circle C_p chi^((p)) (g)$
]

=== 特征标表

为了把特征标的正交归一性表达更清楚和便于应用，常常将计算出的特征标排成一个表，称为特征标表。

#let tab = (
  ([$$], vlinex(), [$K_1={e}$], [$K_2$], [$...$], [$K_q$]),
  hlinex(),
  ([$Gamma^((1))=S$], [$1$], [$1$], [$...$], [$1$]),
  ([$Gamma^((2))$], [$S_2$], [$chi^((2)) (K_2)$], [$...$], [$chi^((2)) (K_q)$]),
  ([$dots.v$], [$...$], [$...$], [$...$], [$...$]),
  ([$Gamma^((q))$], [$S_q$], [$chi^((2)) (K_2)$], [$...$], [$chi^((q)) (K_q)$]),
)
#figure(
  tablex(columns: 5, align: center, auto-vlines: false, auto-hlines: false, ..tab.flatten()),
  caption: [特征标表],
  kind: table,
)
表中的第一列 $Gamma^((1)), Gamma^((2)), ... , Gamma^((q))$ 是不可约表示的名称，第二列是它们的维数 $S_1, S_2, ... , S_q$，后面的列是各个类 $K_i$ 的特征标 $chi^((p)) (K_i)$。特征标表的第一行是类的名称，单位元 $e$ 自成一类，排在第一行。
- 特征标表是一个 $q times q$ 的方阵，因为群的所有不等价不可约表示的个数等于群类的个数。
- 表的每一行写出的是群的所有类在同一不可约表示中的特征标，而每一列则写出群的某一个类在所有不等价不可约表示中的特征标。
- 通常，表的第一行写出群在恒等表示$Gamma^((1)) = 1$中的特征标，第一列写出群的单位元在所有不等价不可约表示（如 $Gamma^((p))$ ）中的特征标，数值上就等于相应表示的维数（$S_p$）。所以表的第一行和第一列都是不用计算的。
- 由特征标第一和第二正交关系分别知，表中每一行或每一列都可以看成一个矢量的分量，这些矢量的长度均为 1，而且行矢量与行矢量之间或列矢量与列矢量之间都是相互正交的。简而言之，这张表横竖都满足正交归一性。

$
  sum_(i=1)^q n_i chi^(p *)(K_i) chi^r (K_i) = n delta_(p r)\
  sum_(r=1)^q n_i chi^(r *)(K_i) chi^r (K_j) = n delta_(i j)\
$

#example(subname: [循环群$G^n$的特征标表])[
  $G^n$是 Abel 群，每个元素组成一类，共$n$类，所以有$n$个不等价的不可约表示。由 Burnside 可知，这些不可约表示的维数都是 1。
  $
    A(e) = 1 = A(a^n) = (A(a))^n\
    A(a) = e^((2 pi l) / n), l=0,1,...,n-1\
  $
  共有$n$个取值，对应$n$个不可约的不等价的表示。它们的特征标表为
  #three-line-table[
    | 函数 | $K_1$ | $K_2$ | $K_3$ | $...$ | $K_n$ |
    | --- | --- | --- | --- | --- | --- |
    | $chi^1$ | $1$ | $1$ | $1$ | $...$ | $1$ |
    | $chi^2$ | $1$ | $omega^2$ | $omega^4$ | $...$ | $omega^(2(n-1))$ |
    | $chi^3$ | $1$ | $omega^3$ | $omega^6$ | $...$ | $omega^(3(n-1))$ |
    | ...| ...| ...| ...| ...| ...|
    | $chi^(n-1)$| $1$| $omega^(n-1)$| $omega^(2(n-1))$| $...$| $omega^((n-1)(n-1))$ |
  ]
  其中$omega = e^((2 pi i) / n)$。
]

#example(subname: [约化$cal(G)$的正则表示])[
  - 基：自身${g_i|i=1,...,n}$
  - 作用：$L(g_i) g_j = g_i g_j = g_k = mat(0; dots.v; 0; 1; 0; dots.v; 0)mat(g_1, ..., g_k, ..., g_n)$

  我们知道
  $
    chi^L (g) = cases(
      n ", " g=e,
      0 ", " g!=e
    )
  $
  从而
  $
    braket(chi^L (g), chi^L (g)) = 1 / n sum_(i=1)^n chi^L (g_i) chi^L (g_i) = n
  $
  从而对于$n>1$，该表示是可约的。再利用特征标求约化
  $
    L(g) = sum_p plus.circle C_p A^((p)) (g) = sum_p plus.circle braket(chi^((i)), chi^L (g)) A^((i)) (g)
  $
  其中
  $
    C_p = braket(chi^((p)), chi^L (g)) = 1 / n sum_(i=1)^n chi^((p)*) (g_i) chi^L (g_i) = 1 / n chi^((p)*) (e) chi^L (e) =chi^((p)*) (e) = S_p
  $
  *有限群的全部的不等价的不可约的酉表示，它完全由其群结构决定！*
  $
    L(g) = sum_p plus.circle S_p A^((p)) (g)
  $
  而
  $
    sum_p S_p^2 = n
  $
  这正是 @burnside Burnside定理。

  *正则表示给出了所有的全部的不等价的不可约的表示。*
]

#example(subname: [$D_3$的正则表示])[
  特别地，有$D_3$的正则表示
  $
    L = S plus.circle A_1 plus.circle 2 Gamma
  $
  这就是完整的三个不等价的不可约表示。
]

#example(subname: [$D_3$的全部的不等价的不可约的酉表示])[
  1. 乘法表
  2. 生成元 ${a,b}$ 和定义关系 $a^2=b^2=(a b)^3=e$
  3. 类 $q=3, {e}, {d,f}, {a,b,c}$，则有三个不可约表示
  4. Burnside 定理
    $
      S_1^2 + S_2^2 + S_3^2 = 6\
    $
    解只能是$(1,1,2)$
  5. 求三个不可约表示
    - 1-dim
      $
        a -> a, b -> b\
        a^2 = b^2 = (a b)^3 = 1\
      $
      解为
      $
        (a,b) = (1,1), (-1,-1)
      $
      分别为恒等表示$S$，和一维表示$A_1$
    - 2-dim
      $
        e -> mat(1, 0; 0, 1) , a->(a_11,0;0,a_22), b->(b_11,b_12,b_21,b_22)\
      $
      $a$是酉矩阵，不妨是对角的，但是其与$b$不对易，则$b$不设为对角阵。解得二维表示$Gamma$。
]

总结求表示的三种方法：
- 对“有具体操作意义”的群：选择群元素的作用空间，并选择一组基。把群元素作用到基上，得到一组新基，它们可以用原基线性展开。展开系数构成的矩阵即为该群的表示。
- 对“抽象”群（只知道乘法表）：从群的乘法表出发，利用“5 步法”求得全部不等价不可约表示。
- 正则表示

== 群表示的直积

这里我们要给出矩阵直积的定义。设 $A$ 是 $n$ 阶矩阵，$B$ 是 $m$ 阶矩阵，那么它们的直积 $A times.circle B$ 是一个 $n m$ 阶矩阵，其元素为
$
  A times.circle B = C = c_(i j k l) = a_(i k) b_(j l)\
$
$
  A times.circle B = mat(a_(1 1)B, a_(1 2)B, ..., a_(1 n)B; a_(2 1)B, a_(2 2)B, ..., a_(2 n)B; dots.v, dots.v, dots.down, dots.v; a_(n 1)B, a_(n 2)B, ..., a_(n n)B)\
$

#definition(subname: [群表示的直积])[
  设 $A={A(g)}$ 和 $B={B(g)}$ 是群 $cal(G)$ 的两个表示，$A$ 和 $B$ 的*直积*表示为
  $
    A times.circle B = {A(g) times.circle B(g)}\
  $
  也是群 $cal(G)$ 的一个表示。它的维数为 $S_A times S_B$，其中 $S_A$ 和 $S_B$ 分别是 $A$ 和 $B$ 的维数。
]

#proof[
  我们需要证明这还是个表示
  $
    A(g_i g_j) times.circle B(g_i g_j) &= (A(g_i) A(g_j)) times.circle (B(g_i) B(g_j))\
    &= (A(g_i) times.circle B(g_i)) (A(g_j) times.circle B(g_j))\
  $
  即保持乘法关系不变。其中第二个等号是线性代数里的结论。
]



#proposition(subname: [特征标与直积])[
  两个表示的直积的特征标等于这两个表示的特征标的乘积，即
  $
    chi^(A times.circle B) (g) = chi^A (g) chi^B (g)\
  $
]

#proof[
  利用
  $
    tr(A times.circle B) = tr(A) tr(B)\
  $
]

群的两个不可约表示的直积表示一般是可约的。对有限群来说，其两个不可约表示的直积如果可约则必完全可约，即分解为该群的不可约表示的直和。

对于
$
  braket(chi^A) = 1 / n sum_(i=1)^n chi^A (g_i) chi^A (g_i) = 1\
  braket(chi^B) = 1 / n sum_(i=1)^n chi^B (g_i) chi^B (g_i) = 1\
$
而
$
  braket(chi^(A times.circle B)) = 1 / n sum_(i=1)^n chi^(A times.circle B) (g_i) chi^(A times.circle B) (g_i) = 1 / n sum_(i=1)^n chi^(A*) (g_i) chi^(B*) (g_i) chi^(A) (g_i) chi^(B) (g_i)\
$
一般不等于1。

#definition(subname: [Clebsch-Gordan 展开])[
  设 $A^((i))$ 和 $A^((j))$ 是 $n$ 阶有限群 $cal(G)$ 的两个不可约表示，那么它们的直积表示 $A^((i)) times.circle A^((j))$ 可以*Clebsch-Gordan 展开*为
  $
    A^((i)) times.circle A^((j)) = sum_(k=1)^q plus.circle a_(i j k) A^((k))
  $
  其中 $a_(i j k)$ 是非负整数，为*约化系数*，代表 $A^((k))$ 在直积表示中出现的次数。
]

$
  a_(i j k) = braket(chi^((k)), chi^((i) times.circle (j))) = 1 / n sum_(i=1)^n chi^((k)*) (g_i) chi^((i)) (g_i) chi^((j)) (g_i)
$
其中$chi^((k))$和$chi^((i)times.circle(j))$ 分别是 $A^((k))$和$A^((i)times.circle(j))$的特征标。上式也可以写成
$
  a_(i j k) = 1 / n sum_(l=1)^q n_l chi^((k)*) (K_l) chi^((i)) (K_l) chi^((j)) (K_l)
$
其中 $n_l$ 是类 $K_l$ 中的元素的数目。

表示空间的角度来看，设荷载群 $cal(G)$ 的两个不可约表示 $A^((i))$ 和 $A^((j))$ 的基分别为 ${psi_i|i=1,...,S_p}$ 和 ${phi_alpha|alpha=1,...,S_r}$，那么它们的直积表示 $A^((i)) times.circle A^((j))$ 的基为
$
  {Phi_(i alpha) = psi_i phi_alpha | i=1,...,S_p; alpha=1,...,S_r}
$
其维数是 $S_p times S_r$。这是因为
$
  g mat(..., Phi_(i alpha), ...) = mat(..., Phi_(i alpha), ...) mat(A^((p)) (g) times.circle A^((r)) (g))
$
$
  g(Phi_(i alpha)) &= g(psi_i phi_alpha)\
  &= sum_(j=1)^S_p sum_(beta=1)^S_r (A^((p)) (g) times.circle A^((r)) (g) psi_i)_(j beta, i alpha) Phi_(j beta)\
  &= (sum_(j=1)^S_p A^((p))_(j i) (g) psi_j) (sum_(beta=1)^S_r A^((r))_(beta alpha) (g) phi_beta)\
  &= (g psi_i) (g phi_alpha)
$
此式表明，群元素同时作用到两个表示空间的基分量上。

#definition(subname: [Clebsch—Gordan 系数])[
  对于约化，荷载不可约表示 $A^((k))$ 可以由 ${Phi_(i alpha)}$ 线性组合给出
  $
    phi.alt_m^((k),t) = sum_(i alpha) C_(m, i alpha)^((k),t) Phi_(i alpha) = sum_(i alpha) C_(m, i alpha)^((k),t) psi_i phi_alpha
  $
  其中展开系数 $C_(m, i alpha)^((k),t)$ 称为群 $cal(G)$ 的 *Clebsch—Gordan 系数*。
]
其中
- $m$ 是基分量的标记，$m=1,...,S_k$
- 如果在约化中出现了$t_k$个与$A^((k)) (g)$的等价的不可约表示，但但荷载它们的基却是不同的，所以这里用上角标 $t_k$ 来区分它们
所有约化系数均不超过 1 的约化称为*简单可约*。

#example(subname: [角动量的CG系数])[
  $
    vb(L)_1 times vb(L)_2 = vb(L)
  $
  两个 $"SO(3)"$ 的不可约表示 $L_1$ 和 $L_2$ 的直积表示 $L$ 希望展现其对称性（约化为不可约表示的分块对角矩阵）
  $
    braket(j_1 m_1 j_2 m_2, j m)
  $
]

#example(subname: [$D_3$群的三个不可约表示的直积])[
  $
    Gamma times.circle Gamma
  $
  考虑到
  $
    a_(Gamma times.circle Gamma, S) &= braket(chi^S, chi^(Gamma times.circle Gamma)) = 1 / 6 sum_(i=1)^3 n_l chi^S (K_l) chi^Gamma (K_l) chi^Gamma (K_l)\
    &= 1 / 6 (1 times 1 times 2 times 2 + 2 times 1 times (-1) times (-1) + 3 times 1 times 0 times 0)\
    & = 1
  $
  $
    a_(Gamma times.circle Gamma, A_1) &= braket(chi^A_1, chi^(Gamma times.circle Gamma)) = 1 / 6 sum_(i=1)^3 n_l chi^A_1 (K_l) chi^Gamma (K_l) chi^Gamma (K_l)\
    & = 1
  $
  $
    a_(Gamma times.circle Gamma, Gamma) &= braket(chi^Gamma, chi^(Gamma times.circle Gamma)) = 1 / 6 sum_(i=1)^3 n_l chi^Gamma (K_l) chi^Gamma (K_l) chi^Gamma (K_l)\
    & = 1
  $
  从而有
  $
    Gamma times.circle Gamma = S plus.circle A_1 plus.circle Gamma\
  $
]
不难证明一般性结论：
+ 任何表示与恒等表示的直积等于该表示。
+ 不可约表示与一维表示的直积仍然是不可约表示。

#proposition(subname: [恒等表示与直积])[
  当且仅当两个互为共轭表示的直积表示中才会出现且只出现一次恒等表示。
]

#proof[
  对于有限群的不可约表示$A^((p))$与不可约表示$A^((r))$，计算直和分解中出现恒等表示的次数；考虑特征标即可
  $
    a_(p r, S) &= braket(chi^S, chi^((p) times.circle (r)*)) = 1 / n sum_(i=1)^n chi^S (K_i) chi^((p)) (K_i) chi^((r)*) (K_i)\
    &= 1 / n sum_(i=1)^n chi^((p)) (K_i) chi^((r)) (K_i)\
    &= braket(chi^((p)), chi^((r))) = delta_(p r)\
  $
]

#note[
  在物理中，两个角动量的耦合$j_1 times.circle j_2 = abs(j_1 - j_2), abs(j_1 - j_2) + 1, ... , j_1 + j_2$，其中$j_1$和$j_2$是角动量的量子数。事实上这是对称性（量子数）所对应的不可约表示（标记）。
  $
    ket(j_1 m_1) ket(j_2 m_2) = sum_(j m) C(j_1 m_1 j_2 m_2, j m) ket(j m)\
  $
]

== 直积群的表示

对于两个群直积得到的群
$
  cal(G) = cal(G_1) times.circle cal(G_2) = {g_(alpha beta) = g_(1 alpha) g_(2 beta)}\
$
其中$cal(G)_1$和$cal(G)_2$是$cal(G)$的不变子群。

下面讨论直积群$cal(G)$的表示与其两个因子群$cal(G)_1$和$cal(G)_2$的表示之间的关系。

#proposition(subname: [直积群的表示])[
  $A(cal(G)_1) = {A(g_(1 alpha))}$ 和 $B(cal(G)_2) = {B(g_(2 beta))}$分别是$cal(G)_1$和$cal(G)_2$的表示
  $
    C(cal(G)) = A(cal(G)_1) times.circle B(cal(G)_2) = {A(g_(1 alpha)) times.circle B(g_(2 beta))} = {C(g_(alpha beta))}\
  $
  是直积群$cal(G) = cal(G_1) times.circle cal(G_2)$的表示。它的维数为$S_1 times S_2$，其中$S_1$和$S_2$分别是$A(cal(G)_1)$和$B(cal(G)_2)$的维数。
]

#proof[

  只需要验证保持乘法关系不变即可。

  $
    C(g_(alpha beta)) &= A(g_(1 alpha)) times.circle B(g_(2 beta))\
    C(g_(alpha' beta')) &= A(g_(1 alpha')) times.circle B(g_(2 beta'))\
  $
  则有
  $
    C(g_(alpha beta) g_(alpha' beta')) &= A(g_(1 alpha) g_(1 alpha')) times.circle B(g_(2 beta) g_(2 beta'))\
    &= (A(g_(1 alpha)) A(g_(1 alpha'))) times.circle (B(g_(2 beta)) B(g_(2 beta')))\
    &= (A(g_(1 alpha) times.circle B(g_(2 beta))) (A(g_(1 alpha')) times.circle B(g_(2 beta')))\
    &= C(g_(alpha' beta')) C(g_(alpha beta))\
  $

]

同时有特征标的关系
#proposition(subname: [群直积的特征标])[
  $
    chi^(A times.circle B) (cal(G)) = chi^A (cal(G_1)) chi^B (cal(G_2))\
  $
]

#proposition(subname: [群直积的可约性])[
  如果直积群中的因子群的表示都是不可约的，那么该直积群的表示也是不可约的。如果其中一个因子群的表示是可约的，那么该直积群的表示就是可约的。
]
#proof[

  利用
  $
    braket(chi^((p))) = 1 / n sum_(i=1)^n chi^((p)*) (g_i) chi^((p)) (g_i) = 1\
    braket(chi^((r))) = 1 / m sum_(i=1)^m chi^((r)*) (g_i) chi^((r)) (g_i) = 1\
  $
  以及群直积的分解唯一性；我们不难证明
  $
    braket(chi^((p) times.circle (r)), chi^((p) times.circle (r))) = 1 / (m n) sum_(i=1)^n sum_(j=1)^m chi^((p)*) (g_i) chi^((p)) (g_i) chi^((r)*) (g_j) chi^((r)) (g_j) = 1\
  $
  这就意味着直积群的两个不可约表示的直积表示是不可约的。
]

#proposition(subname: [直积群的不可约表示])[
  - *直积群的类的个数等于其因子群的类的个数之积*，所以，它的不可约表示的个数等于其因子群的不可约表示的个数之积。
  - 直积群的任意不可约表示都可以由它的两个因子群的不可约表示的直积构成。
]
这个结论使得寻求直积群的不可约表示的工作量大为减少，只需要求得每个因子群的不可约表示即可。

直积群的任意表示都可以约化这样一些不可约表示的直和，其中每个表示都是两个因子群的不可约表示的直积。总之，*直积群的（不可约）表示完全由其直积因子群的不可约表示决定*。

表示空间的角度来看，设荷载（不可约）表示$A(cal(G)_1), B(cal(G)_2)$的基分别为${phi_i|i=1,...,S_p}$和${psi_j|j=1,...,S_r}$，那么它们的直积表示$C(cal(G))=A(cal(G)_1) times.circle B(cal(G)_2)$的基为
$
  {Theta_(i j) = phi_i psi_j | i=1,...,S_1; j=1,...,S_2}
$
其中$S_1$和$S_2$分别是$A(cal(G)_1)$和$B(cal(G)_2)$的维数，$C(cal(G))$的表示是$S_1 times S_2$维的。

把$g_(alpha beta)$作用在基${Theta_(i j)}$上，有
$
  g_(alpha beta) Theta_(i j) &= sum_(k=1)^S_1 sum_(l=1)^S_2 C_(k l, i j) (g_(alpha beta)) Theta_(k l)\
  &= (g_alpha phi_k) (g_beta psi_l)\
$
此式表明两个因子群的元素只作用到它们各自表示空间的基分量上。

#example(subname: [直积群])[
  考虑两个二阶群$cal(G)_1 = {a, a^2=e}$和$cal(G)_2 = {b, b^2=e}$，它们都有一维不可约表示$S_i$和一维表示$A_i$，见下表
  #grid(columns: (1fr,) * 2, align: center)[
    #three-line-table[
      | $cal(G)_1$ | $e$ | $a$ |
      | --- | --- | --- |
      | $S_1$ | $1$ | $1$ |
      | $A_1$ | $1$ | $-1$ |
    ]
  ][
    #three-line-table[
      | $cal(G)_2$ | $e'$ | $b$ |
      | --- | --- | --- |
      | $S_2$ | $1$ | $1$ |
      | $A_2$ | $1$ | $-1$ |
    ]
  ]
  构造直积群
  $
    cal(G) = cal(G)_1 times.circle cal(G)_2 = {e e', e b, a e', a b}
  $
  它是一个四阶群。只需要将$cal(G)_1$和$cal(G)_2$的不可约表示按所有可能的直积就可以得到$cal(G)$的不可约表示，见下表
  #three-line-table[
    | $cal(G)$ | $e e'$ | $e b$ | $a e'$ | $a b$ |
    | --- | --- | --- | --- | --- |
    | $S$ | $1$ | $1$ | $1$ | $1$ |
    | $A$ | $1$ | $-1$ | $1$ | $-1$ |
    | $A'$ | $1$ | $1$ | $-1$ | $-1$ |
    | $A''$ | $1$ | $-1$ | $-1$ | $1$ |
  ]
]

== 诱导表示

诱导表示是从一个子群的表示出发，构造出整个群的表示。

$cal(G)$有子群$cal(H)$，如果$A$是$cal(G)$的表示，则也是$cal(H)$的缩小表示。

$A^((p))$是$cal(G)$的不可约表示，则$A^((p))$不是$cal(H)$的不可约表示。考虑$Gamma$对$D_3$的$d_3$。

对于母群$cal(G)$的子群$cal(H)$，其荷载$W$上的表示$B$，我们希望用$B$的表示得到母群$cal(G)$的表示$A$。

- 基：$V={f_i|f_i (g_j) in W}$ 选择自身为基的空间
  $
    f(h g) = B(h) f(g)
  $

== 广义投影算符

考虑$D_3$的6维表示
$
  mat(A_1, O; O, Gamma)
$
6维矩阵不能由$S,A_1,Gamma$直接直积得到，这就引入投影算符的概念。

$
  A = sum plus.circle C_m A^((m))\
  V = sum plus.circle C_m V^((m))\
$
希望由$V$的基的线性组合得到$V^((m))$的基
$
  phi_alpha^((p)t_p) = sum C_(alpha i)^((p)t_p) phi.alt_i
$
#newpara()

有限群的可约表示一定可以约化为其不可约表示的直和。从表示空间来看，这个约化过程实际上就是将可约表示空间“分成”不可约表示空间之和，那么如何从荷载可约表示的基中把荷载不可约表示的基挑选出来？广义投影算符是处理此类问题的一个常用方法。

#example(subname: [量子力学中的投影算符])[
  $
    P_m = ketbra(m, m)\
    psi = sum_k C_k ket(k)\
    P_m psi = sum_k C_k ket(m) braket(m, k) = C_m ket(m)\
  $
  且有
  $
    P_m^2= P_m
  $
]

#example(subname: [双电子的自旋态])[
  双电子
  $
    cases(
      reverse: #true,
      alpha(1) alpha(2),
      beta(1) beta(2),
      alpha(1) beta(2) + beta(1) alpha(2)
    ) -> chi_(1 m)\
    alpha(1) beta(2) - beta(1) alpha(2) -> chi_(0 0)
  $
  对称化就得到了不可约表示。定义$P_1,P_3$算子
  $
    P_1 &= 1 - vb(sigma)_1 dot vb(sigma)_2\
    P_3 &= 1 / 4 (1+vb(sigma)_1 dot vb(sigma)_2)
  $
  有
  $
    P_1 chi_(0 0) = chi_(0 0), P_1 chi_(1 m) = 0\
    P_3 chi_(0 0) = 0, P_3 chi_(1 m) = chi_(1 m)\
  $
  这就说明$P_1$和$P_3$是投影算符。它们的本征值为0和1。
]

现在我们构造一般的投影算符。

=== 广义投影算符

对于群$cal(G)$和不可约表示$A^((p))$及其荷载${psi_i^((p))|i=1,...,S_p}$有
$
  T_g psi_i^((p)) (vb(r)) = phi_i^((p)) (g^(-1) vb(r)) = sum_j A_(j i)^((p)) psi_j^((p)) (vb(r))\
$
用$A_(k l)^((r)*) (g)$左乘，对$g$求和
$
  sum_g A_(k l)^((r)*) (g) T_g psi_i^((p)) &= sum_g sum_j A_(k l)^((r)*) A_(j i)^((p)) psi_j^((p))\
  &= sum_j n / S_p delta_(r p) delta_(k j) delta_(l i) psi_j^((p))\
  &= n / S_p delta_(r p) delta_(l i) psi_k^((p))\
$

$
  S_r / n sum_g A_(k l)^((r)*) (g) T_g psi_i^((p))= delta_(r p) delta_(l i) psi_k^((p))\
$
#definition(subname: [*广义投影算符*, *转移算符*])[
  令
  $
    P_(k l)^((r)) = S_r / n sum_g A_(k l)^((r)*) (g) T_g\
  $
  则可以写为
  $
    P_(k l)^((r)) psi_i^((p)) = delta_(r p) delta_(l i) phi_k^((p))\
  $
  就把第$i$个基分量$psi_i^((p))$变成荷载同一个不可约表示$A^((p))$的第$k$个基分量$psi_k^((p))$。我们称$P_(k l)^((p))$为与$A^((p))$相联系的*广义投影算符*或*转移算符*。
]

一个$S_p$维的不可约表示可以构造出$S_p^2$个广义投影算符，所以$n$阶有限群$cal(G)$一共有$n$个广义投影算符：
$
  { P_(m n)^((i)) | i = 1,2,...,q; m,n = 1,2,...,S_i}\
$
其中$q$为$cal(G)$的类的个数。

特别地，对$P_(k k)^((p))$是
$
  P_(k k)^((p)) psi_k^((p)) = psi_k^((p))\
  P_(k k)^((p)) psi_i^((p)) = 0, i!=k\
$
是*投影算符*。

#proposition(subname: [投影算符的性质])[
  广义投影算符$P_(k l)^((r))$的并不是Hermitian的
  $
    braket(P_(k l)^((p)) Phi, Psi) = braket(Phi, P_(l k)^((p)) Psi)\
  $
  但投影算符是Hermitian的
  $
    braket(P_(k k)^((p)) Phi, Psi) = braket(Phi, P_(k k)^((p)) Psi)
  $
]

#proposition[
  两个广义投影算符满足乘法关系
  $
    P_(k l)^((p)) P_(s t)^((r)) = delta_(p r) delta_(l s) P_(k t)^((p))\
  $
  特别地，投影算符满足
  $
    P_(k)^((p)) P_(s)^((r)) = delta_(p r) delta_(k s) P_(k)^((p))\
  $
  进一步有
  $
    (P_(k)^((p)))^2 = P_(k)^((p))\
  $
  此式正是量子力学中投影算符的定义。具有上述性质的算符也称为*幂等算符*。
]

#proposition[
  进一步，$P_(k l)^((p))$作用于载荷$A^((r))$的基分量$psi_i^((p)) (r!=p)$上有
  $
    P_(k l)^((p)) psi_i^((r)) = 0
  $
  $P_(k l)^((p))$作用于载荷$A^((p))$的基分量$psi_l^((p))$上有
  $
    P_(k l)^((p)) psi_l^((p)) = psi_k^((p))\
  $
  而作用到其它的基分量$psi_l'^((p))$上有
  $
    P_(k l)^((p)) psi_l'^((p)) = 0\
  $
  特别地，$P_(k)^((p))$作用于载荷$A^((p))$的基分量$psi_k^((p))$上有
  $
    P_(k)^((p)) psi_k^((p)) = psi_k^((p))\
    P_(k)^((p)) psi_l^((p)) = 0, l!=k\
  $
]
因此，如果已经知道荷载$S_p$维不可约表示$A^((p))$的某基分量，那么可以利用投影算符$P_(k l)^((p))$来得到其它的基分量。

#proposition[
  表示空间$V$中的任一函数$Psi$可以由荷载所有不可约表示的函数基线性展开，即
  $
    Psi = sum_(i=1)^q sum_(j=1)^(S_i) c_(i j) psi_j^((i))\
  $
  那么将$P_(k l)^((p))$作用于$Psi$上，可把荷载$A^((p))$的第$k$个基分量$psi_k^((p))$提取出来（只要$Psi$中含有$psi_l^((p))$这个成分），同时将$Psi$的其他成分$psi_l'^((p))$全部消除，即
  $
    P_(k l)^((p)) Psi = c_(p l) psi_k^((p))\
  $
  此作用如同在 Euclidean 空间中用投影算符把一个向量投影到一个子空间上。

  特别地，将$P_k^((p))$作用于$Psi$上，可把荷载$A^((p))$的第$k$个基分量$psi_k^((p))$提取出来，同时将$Psi$的其他成分$psi_k'^((p)) (k'!=k)$全部消除，即
  $
    P_(k)^((p)) Psi = c_(p k) psi_k^((p))\
  $
]

#figure(
  image("pic/2025-05-09-17-29-41.png", width: 20%),
  numbering: none,
)

上面的性质表明${P_(m n)^((p))}$的作用效果是：某个确定的广义投影算符$P_(m' n')^((i'))$（$i',m',n'$固定），先将可约表示空间$V$投影到第$i'$个不可约表示空间$V_i'$中，然后${P_(m n)^((i'))}$（$i'$固定）就只在$V_i'$中起作用。

#figure(
  image("pic/2025-05-09-17-37-08.png", width: 40%),
  numbering: none,
)

#example(subname: [$D_3$的投影算符])[
  $V={phi_1,phi_2,...,phi_6}$
  $
    psi = sum_(i=1)^6 C_i phi_i\
  $
  现在希望找到$P_(k k)^((Gamma))$
  $
    P_(1 1)^((Gamma)) psi -> phi_1^((Gamma))\
    P_(2 1)^((Gamma)) phi_1^((Gamma)) -> phi_2^((Gamma))\
  $
  就可以给出$V_Gamma$。
]

=== 表示空间的约化

利用有限群$cal(G)$的一个$S_p$维的不可约表示$A^((p))$，可以构造出$S_p^2$个广义投影算符
$
  {P_(k l)^((p)) | k,l=1,2,...,S_p}\
$
从中选取$S_p$个广义投影算符，并采取以下三个步骤，就可以从荷载 $S$ 维可约表示 $A$ 的表示空间 $V$ 中的某一矢量 $Phi$ 中将荷载 $A^((p))$ 的函数基投影出来，即完成约化。

+ 构造投影算符
  - $G$的表示$A^((p)), p=1,2,...,q$
  $
    {P_(k l)^((p)) | k,l=1,2,...,S_p}\
  $
+ 可约表示$A$，$V={phi.alt_i}$，求出$V^((p))={phi_alpha^((p))|alpha=1,2,...,S_p}$
  $
    P_(k l)^((p)) = S_p / n sum_g A_(k l)^((p)) (g) T_g\
  $
+ 构造$Phi=sum_i phi.alt_i in V$
  + 找到一个$phi_alpha'^((p))$
    如果
    $
      P_1^((p)) Phi tilde phi_i^((p))
    $
    就找到了基分分量，否则有
    $
      P_1^((p)) Phi = 0
    $
    再用另外的投影算符尝试
    $
      P_(n_0)^((p)) Phi = phi_n_0^((p))
    $
    直到找到$phi_n_0^((p))$为止。
  + 利用广义投影算符$P_(n'_0 n_0)^((p))$，将$phi^((p))_n_0$投影到$V^((p))$中
    $
      P_(n'_0 n_0)^((p)) phi^((p))_(n_0) = phi^((p))_n'_0\
    $
    得到剩下的$S_p-1$个基分量$phi^((p))_n'_0$。

#note[
  对于可约表示空间中的某个矢量$Phi$，利用$S_p$个广义投影算符${P_k^((p))|k=1,2,...,S_p}$给出的基${P_k^((p)) Phi | k=1,2,...,S_p}$不一定是归一的，但它们是相互正交的。

  另外，${P_k^((p)) Phi | k=1,2,...,S_p}$不一定是荷载该表示的基。
]

#note[
  有限群的可约表示可以约化成不可约表示的直和，即
  $
    A = sum plus.circle A^((p))\
  $
  该矩阵块结构在等价表示的意义下是唯一的。但在相应的表示空间的约化中，如果$c_i > 1$，那么从荷载 $A$ 的表示空间中选出荷载 $A^((i))$ 的不可约子空间不是唯一的。只有在$c_i > 1$或 $0$ 的情况下，表示空间的约化才是唯一的。
]

#example(subname: [$D_3$的6维表示])[
  $V={phi_1,phi_2,...,phi_6}$投影出荷载$Gamma$的$V^((Gamma))={phi_i^((Gamma))|i=1,2}$

  先计算投影算符
  $
    P_1^((Gamma)) = 2 / 6 sum_g Gamma^(*)_(1 1) (g) T_g = 1 / 3(T_e - 1 / 2 T_d - 1 / 2 T_f ...)
  $
  $
    P_(2 1)^((Gamma)) = sqrt(3) / 6 (T_d - T_f + ...)
  $
  则有
  $
    P_1^((Gamma)) Phi = phi.alt_4 + phi.alt_5 = phi_1^(Gamma)\
    P_(2 1)^((Gamma)) phi_1^((p)) = 1 / 2(phi.alt_1 - phi.alt_2 - 2phi.alt_6) = phi_2^((Gamma))\
  $
  检查
  $
    T_b phi_1^((Gamma)) = T_b (phi.alt_4 + phi.alt_5) = 1 / 2 phi_1^((Gamma)) + sqrt(3) / 2 phi_2^((Gamma))\
  $

  如何找到另一个$Gamma$的基分量？

  事实上
  $
    mat(A^*, O; O, Gamma)
  $
  的$Gamma$的基直接是$phi.alt_5, phi.alt_6$，可以用$phi.alt_i, i=1,...,4$ 来投影出$A^*$中的$Gamma$。

  $
    V_4={phi.alt_1,...,phi.alt_4}, Phi' = sum_(i=1)^4 phi.alt_i\
  $
  $
    P_1^((Gamma)) Phi' = phi.alt_4 = phi_1^((Gamma))\
    P_(2 1)^((Gamma)) phi_1^((p)) = 1 / 2(phi.alt_1 - phi.alt_2) = phi_2^((Gamma))\
  $
]

#note[
  刚才的做法是$Phi=sum phi.alt_i$，其实也可以给其添加系数，也可以用不同的投影算符。核心都是找到投影不为$0$的投影算符。
]



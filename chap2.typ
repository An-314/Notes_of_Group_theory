#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge

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

== 群的表示

$
  G("抽象群") approx A("矩阵群")
$

这就是表示论的基本思想。

- 抽象：同态
- 具体：计算出矩阵

下面我们考虑如何求表示
$
  hat(T) ->^{e_i} mat(T)
$
1. 选空间、基
  $
    V = {phi_i}
  $
2. 把作用作用在基上，得到矩阵
  $
    g_alpha phi_i = sum A(g_alpha)_(i j) phi_j
  $

可以验证保乘性质
$
  g_alpha g_beta phi_i = g_alpha sum_j A(g_beta)_(j i) phi_j = sum_(k,j) A(g_beta)_(j i) A(g_alpha)_(k j) phi_k = sum_k A(g_alpha g_beta)_(k i) phi_k
$

#newpara()

#example(subname: [欧式空间])[
  $
    E^3 = {e_1, e_2, e_3}, braket(e_i, e_j) = delta_(i j)
  $
  作用$g$的*自然表示*
  $
    g e_i = e'_i = sum_j A(g)_(j i) e_j\
    g ->^"表示" A(g)
  $
  对于 $D_3$ 群
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
    g: phi_i (r) |-> phi'_i (r)
  $
  其中变量不同，*并且$phi' tilde phi: phi'_i (r') = phi_i (r)$*
  $
    phi'_i (r) = phi_i (g^(-1) r) = sum_j B(g)_(j i) phi_j (r)
  $
  表示$B$是满足保乘关系的。
]

从主动和被动变换的观点来看得到的
$
  phi'_i (r') = phi_i (r)
$<text.blue>
是一致的。可以理解成算符/变换本身部分主动和被动，只有选择了基才能加以区分。

例如$phi(r) = x^2 - y^2$，$A = 1/2 mat(-1,-sqrt(3);sqrt(3),-1)$，$A mat(x;y)=mat(x';y')$，变量代换就是
$
  phi(r) &= phi(A^(-1) r') = (-1 / 2 x' + sqrt(3) / 2 y')^2 - (-sqrt(3) / 2 x' - 1 / 2 y')^2 \
  &= -1 / 2 (x'^2 - y'^2) - sqrt(3) x' y' := phi'(r')
$
#newpara()

引入新的记号$P_g$，*定义在以$r$为变量的函数空间内*
$
  P_g: phi |-> phi'=P_g phi
$
是*函数（形式）变换*的算符，其中$g$是一个变换
$
  g: vb(r) |-> vb(r)' = g vb(r)
$
$P_g$是由$g$诱导出来的。

有
$
  P_g phi_i (r) = phi_i (g^(-1) r) = sum_j B(P_g)_(j i) phi_j (r) = sum_j B(g)_(j i) phi_j (r)
$

#remark[
  $P_g$的表示就是$g$的表示。
]

#proof[

  我们知道
  $
    cal(G):{g} tilde.equiv cal(G)_P:{P_g}
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
  函数变换$P_T$就是$T$诱导出来的：$e^(-i a dv(,x)) = e^(-i a P_x)$
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
  按照上面的分析，这几乎是显然的。
]

#exercise(subname: [$"SO"(2)$的表示])[

  $
    "SO"(2) = {C_vu(k) (theta)}, C_vu(k)(theta) -> A(C_vu(k) (theta))
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
    mat(x;y;z) = mat(r cos theta; r sin theta;z)
  $
  则
  $
    C(theta) mat(x; y;z) = mat(x'; y';z') = mat(r cos (theta + phi); r sin (theta + phi);z) = mat(cos phi, -sin phi, 0; sin phi, cos phi, 0; 0, 0, 1) mat(x; y;z)
  $
  上面两个都是主动观点，现在考虑被动观点
  $
    mat(x;y;z) = mat(r cos theta; r sin theta;z), mat(x';y';z) = mat(r cos (theta - phi); r sin (theta - phi);z)
  $
  得到的矩阵是
  $
    mat(cos phi, sin phi, 0; -sin phi, cos phi, 0; 0, 0, 1) = mat(cos phi, -sin phi, 0; sin phi, cos phi, 0; 0, 0, 1)^(-1)
  $
]

#exercise(subname: [$D_3$的表示])[
  $
    D_3 = {e,d,f,a,b,c}
  $
]

#solution[

  表示空间是$E^3={vu(i),vu(j),vu(k)}$，考虑$D_3$的生成元$a,b$，对于$b$
  $
    b vu(i) &= vu(i)' = vu(i) 1 / 2 + vu(j) sqrt(3) / 2 + vu(k) 0\
    b vu(j) &= vu(j)' = vu(i) sqrt(3) / 2 + vu(j)(- 1 / 2) + vu(k) 0\
    b vu(k) &= vu(k)' = vu(i) 0 + vu(j) 0 + vu(k) (- 1)
  $
  对应的矩阵是
  $
    A(b) = mat(1 / 2, sqrt(3) / 2, 0; sqrt(3) / 2, - 1 / 2, 0; 0, 0, - 1)
  $
  对于函数的变换，表示空间是$V={phi_i}$，对于$b$
  $
    P_b phi_i (r) = phi_i (b^(-1) r) = phi_i (A(b)^(-1) mat(x;y;z)) = sum_j B(b)_(j i) phi_j (r)
  $

]

#note[
  引入$P_g$只是为了方便讨论，其定义是
  $
    P_g phi(r) = phi(g^(-1) r)
  $
  可以和$g$的表示联系起来，且
  $
    {P_g} tilde.equiv cal(G)
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
  - $P_g$是线性的
  - $phi_i$是完备的
]

#newpara()

对于一个群，最基本的两个性质是其*结构和表示*。同一个作用，对于不同的空间、基，有不同的表示。

#exercise(subname: [原子$d$轨道的函数])[
  $V_5$的函数基是：
  $
    d_1(vb(r)) = 1 / 2 (x^2-y^2), d_2(vb(r))=x y, \
    d_3(vb(r)) = x z, d_4(vb(r)) = y z, d_5(vb(r)) = sqrt(3) / 2 (3z^2 - r^2)
  $
]

#solution[
  #note[$V_5$为什么会少一个组合？
    $
      d_i (g^(-1) vb(r)) in V_5
    $
  ]
  #note[$V_6 ->^"线性组合" V_4$是否能够构造？]
  #note[$V_i (i>=7)$如何构造？]
]

#newpara()

我们用共轭运算$g f g^(-1) = h$给群进行了分类，并给出了共轭子群$g F g^(-1) = H$的概念，共轭是一个等价关系，群就被分成了若干个等价类。我们也可以类似定义等价表示$X A(G) x^(-1) = B(G)$

我们要证明的是这样的$B(G)$也是一个表示，验证其保乘性质即可。

#definition(subname: [等价表示])[
  对群表示$A(G)$，若存在一个双射$X$，使得
  $
    X A(G) X^(-1) = B(G)
  $
  则称$A(G)$和$B(G)$是*等价表示*，记作 $A(G) tilde B(G)$

]
在同一个空间里，在不同的基下的表示是等价的，如 @基选择 所示。

我们下面考虑*表示的可约性*
$
  A = mat(C,N;O,B)
$
其中$A$是保乘的
$
  A(g_alpha) A(g_beta) = A(g_alpha g_beta)
$
且$B,C: g->B(g), g->C(G)$都是保乘的
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
  mat(C,N;O,B) mat(O;x) = mat(C x;B x) in.not macron(W)
$

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
不可约的表示是最本质、最小维数的表示。

先来研究表示的幺正性质（酉性）

#definition(subname: [酉表示，幺正表示])[
  设$A(G)$是群$cal(G)$的一个表示，如果
  $
    A^dagger (g) = A^(-1) (g) = A(g^(-1))
  $
  对任意$g in cal(G)$成立，则称$A(G)$是*酉表示*，或称*幺正表示*。
]

#theorem(subname: [酉定理])[
  酉表示可约则完全可约。
]

#proof[

  意味着表示$A(G)$若左下角为$O$块矩阵，则右上角一定是$O$块矩阵；或者$V = W plus.circle macron(W)$，如果$W$是$cal(G)$不变子空间，则$macron(W)$也是$cal(G)$不变子空间；即*酉表示一定不是不可分表示*。
]

下面我们就要研究$cal(G)$的全部不等价的不可约的酉表示。

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

#definition(subname: [表示])[

  设 $cal(G)={...,g,...}$ 是一个抽象群，$A(cal(G))={...,A(g),...}$ 是线性空间 $R_n$ 上的一个矩阵群。若 $cal(G)$ 同态于 $A(cal(G))$，即 $cal(G) approx A(cal(G))$，则称 $A(cal(G))$ 是群 $cal(G)$ 的一个*矩阵表示*或*线性表示*，简称*表示*。

  同态映射要求保持乘法关系不变，即若 $g_1, g_2 in cal(G)$，则必有
  $
    A(g_1) A(g_2) = A(g_1 g_2)
  $
  #newpara()

  $A(cal(G))$ 的作用空间 $R_n$ 称为群 $cal(G)$ 的*表示空间*，$R_n$ 的矢量基称为荷载群 $cal(G)$ 的*表示的基*， $R_n$ 的维数称为*表示的维数*。
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

例如$phi(r) = x^2 - y^2$，$A = 1/2 mat(-1,-sqrt(3);sqrt(3),-1)$，$A mat(x;y)=mat(x';y')$，变量代换就是
$
  phi(r) &= phi(A^(-1) r') = (-1 / 2 x' + sqrt(3) / 2 y')^2 - (-sqrt(3) / 2 x' - 1 / 2 y')^2 \
  &= -1 / 2 (x'^2 - y'^2) - sqrt(3) x' y' := phi'(r')
$

#figure(
  image("pic/2025-04-13-17-31-12.png", width: 20%),
  numbering: none,
)

为了看清楚 $phi_i$ 与群元素 g 的依赖关系，引入新的记号$P_g$，*定义在以$r$为变量的函数空间内*的*函数（形式）变换*：

#definition(subname: [函数（形式）变换])[
  设$phi(r)$是一个函数，$P_g$是一个算符，$P_g$的作用是把函数$phi(r)$变换成在以$r$为变量的函数空间内的另一个函数$phi'(r)$，即
  $
    P_g: phi |-> phi' = P_g phi
  $
  是*函数（形式）变换*的算符，其中$g$是一个变换
  $
    g: vb(r) |-> vb(r)' = g vb(r)
  $
  $P_g$是由$g$诱导出来的。
]

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

#note[

  意味着表示$A(G)$若左下角为$O$块矩阵，则右上角一定是$O$块矩阵；或者$V = W plus.circle macron(W)$，如果$W$是$cal(G)$不变子空间，则$macron(W)$也是$cal(G)$不变子空间；即*酉表示一定不是不可分表示*。
]

#proof[

]

对于一有限群，求其表示的任务可总结为：*全部的、不等价的、不可约的、幺正表示*。


#example(subname: [$RR_+$的表示])[
  - 1-dim 不可约表示
  $
    x |-> e^(k x), k in K
  $
  有
  $
    e^(k(x_1+x_2)) = e^(k x_1) e^(k x_2)
  $
  - 2-dim 不可分表示
  $
    x |-> mat(1,x;0,1) = A(x)
  $
  有
  $
    A(x_1 + x_2) = A(x_1) A(x_2)
  $
  该表示是可约的，因为$RR_+$的不变子空间$W$，基为
  $
    vu(e)_1 = mat(1;0), vb(r) = mat(r;0), A(x) vb(r) = mat(1,x;0,1) mat(r_1;0) in W
  $
  但它的互补子空间$macron(W)$不是$RR_+$不变的
  $
    macron(vb(r)) = mat(0;r), A(x) macron(vb(r)) = mat(1,x;0,1) mat(0;r) = mat(x;r) in.not macron(W)
  $
  因此无限群$RR_+$的表示$A(x)$是一个不可分表示（可约但不完全可约表示）。
]


#example(subname: [$"SO"(2)$的表示])[
  前面提到过其一个表示为
  $
    A(theta) = mat(cos theta, -sin theta; sin theta, cos theta)
  $
  取
  $
    X = mat(1,i;i,1)
  $
  则
  $
    x^(-1) A(theta) x = mat(e^(i theta),0;0,e^(-i theta))
  $
  是一个完全可约表示。
]

#proposition(lab: "able-ir")[
  Able 群的不可约表示都是一维的。
]

#proof[
  后面给出证明。
]

#example(subname: [$D_3$的表示])[
  $D_3$的自然表示为
  $
    A(g) = mat(Gamma(g), O;O,A'(g))
  $
  其中$A'(g)$是一维的不可约表示，$Gamma(g)$是一个不可约的二维表示。

  事实上，$Gamma$不对易，所以不能同时对角化，所以它不是一个完全可约表示；另外，它是幺正的，所以他不可能是不可分表示，从而它是一个不可约的表示。

  $Gamma$是保距变换，它是幺正的。

  $D_3$的六维表示为
  $
    mat(A^*(g),O;O,Gamma(g))
  $
  其中$Gamma$是二阶不可分表示；$A^*$是一个四阶表示。
]

#remark[
  两个矩阵可以同时对角化当且仅当它们对易。
]

#corollary[
  有限维幺正表示可以分解为有限个不可约幺正表示的直和。
]


如果群 $cal(G)$ 的表示空间（酉空间）$V$ 可分解，那么它一定可以分解为有限个不可再分的 $G$ 不变子空间 $W_i$ ，的直和。


== 有限群表示

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
    braket(x,y) = 1 / n sum_i^n ( A(g_i) x|A(g_i) y )
  $
  于是，利用重排定理得
  $
    braket(A(g_i) x, A(g_i) y) &= 1 / n sum_j^n ( A(g_j) A(g_i) x|A(g_j) A(g_i) y ) \
    &= 1 / n sum_k^n ( A(g_k) x|A(g_k) y ) = braket(x,y)
  $
  即在新定义的内积下， $A$ 是幺正表示。

  我们找基变换，使得原来的内积成为新定义的内积。设$e = {e_1,...,e_n}$是 V 中在内积 $(dot|dot)$ 下的一组基，$f = {f_1,...,f_n}$是 V 中在内积 $braket(dot)$的一组基。它们都是正交归一的，
  $
    (e_i|e_j) = braket(f_i,f_j) = delta_(i j)
  $
  设这两组基由一个非奇异线性变换 $X$ 联系起来，
  $
    f_i = X e_i
  $
  就有
  $
    braket(X x, X y) = sum_(i,j) braket(x_i f_i, y_j f_j) = sum_(i,j) x_i^* y_j braket(f_i,f_j) = sum_i x_i^* y_i = (x|y)
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

推论：有限群的幺正表示可约则完全可约。或表述为：有限群的幺正表示要么是不可约的，要么等价于有限个不可约表示的直和。

对有限群求表示的中心任务：寻求全部的不等价的不可约的幺正表示。

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
    mat(a,b;c,d) mat(cos theta, -sin theta; sin theta, cos theta) = mat(cos theta, -sin theta; sin theta, cos theta) mat(a,b;c,d)
  $
  就有
  $
    a=d,b=-c
  $
  这说明 $A(theta)$ 是可约的。
]

#lemma(subname: [Schur 引理2], lab: "schur-lem-2")[
  设 $A$ 和 $B$ 是群 $cal(G)$ 的两个不等价的不可约表示，它们的维数分别为 $S_A,S_B$，若一个 $S_B times S_A$ 维的矩阵 $M$ 满足：
  $
    M A(g) = B(g) M, forall g in cal(G)
  $
  那么一定有 $M=0$。
]

#proof[
  我们证明 @able-ir ，即 Abel 群的所有不可约表示都是一维的。

  设 $A(cal(G))$ 是 Abel 群 $cal(G)$的一个不可约表示，那么乘法关系保持不变要求对所有 $a, a' in cal(G)$
  $
    A(a) A(a') = A(a') A(a)
  $
  利用 #ref(<schur-lem-1>) ，我们可以得到
]

#example(subname: [求二维旋转群$"SO"(2)$的不可约表示])[

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
  - 群平均$1/n sum$事实上就是$dv(,t)integral dd(theta)$。
]

== 群代数

线性代数是一个集合$R={x,y,z,...}$和数域$KK={alpha,beta,gamma,...}$定义了加法和数乘，在线性空间的定义下，再引入乘法
$
  dot : R times R -> R
$
就构成了线性*代数*。

所以矩阵就构成了线性代数。

== 群函数

为了更简洁地表述和理解正交性定理和完备性定理，先引入群函数的概念。群代数给出了群函数，由此给出群函数空间（线性空间）的概念，其有正交归一基。由群表示诱导出的群函数就给出了一个群表示函数空间的概念。

*群空间*：对于群元素$g_i$，令其作为$V_G$的“基”，定义
$
  x eq.def sum_i^n x_i g_i
$
其中$x_i$是复数，$g_i$是群元素，$V_G$是群的表示空间；$x$就是“向量”。之后定义乘法，而给出*群代数*：
$
  x y = (sum x_alpha g_alpha)(sum y_beta g_beta) = sum_(gamma)(x y)_gamma g_gamma, (x y)_gamma = x_alpha y_(alpha^(-1) gamma)
$
*正则表示*是：
- 空间 $V_G={g_alpha|alpha=1,2,...}$
- 作用 $g_i g_alpha$，$L(g_i) g_alpha = g_i g_alpha = g_alpha'$
之后给出*群函数*
$
  phi : G -> CC , g |-> phi(g)
$

#theorem(subname: [群函数定理])[
  $n$ 阶有限群只有 $n$ 个线性独立的群函数。
]
#proof[
  考虑
  $
    x = sum x_alpha g_alpha = sum x(g_alpha) g_alpha
  $
  记在“基”上的“投影”$x(g_alpha)$是群函数，空间中的一个元素$x$和一个群函数$x(g_alpha)$是一一对应的
  $
    V_G = {x} = {x(g_alpha)}
  $
  在线性空间中，就是线性空间可以用向量表示，也可以在基选择好的情况下，用所有的坐标表示。

  $n$个独立的基给出$n$个独立的群函数。
]
群函数为
$
  g_j (g_i) = delta_(j i)
$
可以写成一个矩阵，其中列是群函数，行是群元素
$
  mat(g_j (g_i))_(n times n)
$
这是有限域的基本性质。

有了群函数就可以定义内积
$
  braket(g_i,g_j) = 1 / n sum_(k=1)^n g_i^* (g_k) g_j (g_k) = 1 / n sum delta_(i j)
$
有正交归一基
$
  V_G = {sqrt(n) g_i (g_t) | i=1,2,...,n}
$

#newpara()

我们知道一个群表示可以诱导出一个群函数，若表示 $A(G)$ 的维数为 $S$，那么该表示总共可以产生 $S^2$ 个群函数 $A_(i j) (g_k)$
$
  A(g_k) = mat(A_(1 1) (g_k), dots, A_(1 S) (g_k);
dots.v, dots.down, dots.v;
A_(S 1) (g_k), dots, A_(S S) (g_k))
$
$n$阶群$cal(G)$有$q$个不可约表示$A^((P))$，维度为$S_P$，那么就有 $S_P^2$ 个群函数 $A^((P))_(i j) (g_k)$。这就给出了正交性定理。

#theorem(subname: [(巨)正交性定理])[
  设 $n$ 阶有限群 $cal(G) = { ..., g_k , ... }$ 有不等价不可约的幺正表示 $A^((p)) (cal(G)), A^((r)) (cal(G))$，它们的维数分别为 $S_p,S_r$。那么由 $A^((p)) (cal(G))$ 产生的群函数 $A^((p))_(mu nu) (g_k)$ 和 $A^((r)) (cal(G))$ 产生的群函数 $A^((r))_(mu' nu;) (g_k)$ 满足
  $
    braket(A^((p))_(mu nu) (g_k), A^((r))_(mu' nu') (g_k)) = 1 / n sum_(k=1)^n A^((p)*)_(mu nu) (g_k) A^((r))_(mu' nu') (g_k) = 1 / S_p delta_(p r) delta_(mu mu') delta_(nu nu')
  $
]

#theorem(subname: [完备性定理])[
  有限群 $cal(G)$ 的全部不等价不可约么正表示 $A^((i)), i=1,2,...,q$ 其中$q$是不等价不可约的酉表示个数；其产生的群表示函数集合
  $
    {A^(i)_(mu nu) (g_k) | i=1,2,...,q; mu,nu=1,2,...,S_i}
  $
  构成了群表示函数空间上的一个完备集。任何群函数$psi(g_k)$可以展开为${A^(i)_(mu nu) (g_k)}$的线性组合，即
  $
    psi(g_k) = sum_(i,mu,nu) C_(mu nu)^((i)) A^((i))_(mu nu) (g_k)
  $
]

#theorem(subname: [Burnside 定理], lab: "burnside")[
  有限群的所有不等价不可约表示的维数平方和等于该群的阶，即
  $
    sum_i^q S_i^2 = n
  $
]

#example(subname: [$D_3$群])[
  群 $D_3$ 的三维表示，通过表示约化技术知，它是由一个一维不可约表示 $A_1$ 和一个二维不可约表示 $Gamma$ 直和而成。由 @burnside
  $
    6 = 2^2 + 1^2 + x
  $
  可解出 $x = 1$ 。表明还剩下一个一维表示，即恒等表示。所以 $D_3$ 只有三个不等价不可约的表示。
]
@burnside 并没有给出 $q$ 的具体值。

约化是把一个可约表示分解为不可约表示的直和。我们可以把 $D_3$ 的表示 $A(g)$ 写成
$
  mat(A) = mat(square,,;,square,;,,square)
$

== 特征标理论

一个群的的特征是其结构和表示，对于其不可约表示，我们想找到一个标度
- 与基无关
- 一一对应
- 映射到数集
这就和矩阵中的迹很像。

$
  A(cal(G)) = {A(g)}, chi^A = {Tr A(g) in CC}
$
其中$chi^A (g)$是群函数，但无法张成一个空间$V_chi$，因为其不满足完备性。

#proposition(subname: [性质])[
  - $chi^A (e)=S_A$
  - $S tilde S' => chi^A = chi^A'$
]

#proposition(subname: [特征表的性质])[
  不可约幺正表示的特征标的模等于 1。
]

#proof[
  $
    braket(chi^((Gamma))) =
  $
]

#proposition(subname: [特征表的性质])[
  不等价的不可约幺正表示的特征标正交，即第 $p$ 个和第 $r$ （ $r != p$）个不可约表
]


#proposition(subname: [特征表的性质])[
  可约表示的特征标等于它所包含的不可约表示的特征标之和。
  $
    A(g_k) = sum_(i=1)^q plus.circle C_p A^((p))\
    chi^A = sum_p C_p chi^((p))\
  $
  其中
  $
    C_p = braket(chi^((p)),chi^A)
  $
]
这给出了约化技术$A = sum_p plus.circle C_p A^((p))$的$C_p$的计算。

由此也可以给出
#corollary(subname: [特征表的性质])[
  $S tilde S' <=> chi^A = chi^A'$
]

#proposition(subname: [特征表的性质])[
  可约表示的特征标的模大于 1。
]

#proposition(subname: [])[
  同类元素的特征标相等。
]

#newpara()
$chi^A (g)$难以张成一个空间，现在我们可以引入类函数，使之可以张成一个空间。类函数
$
  phi: k -> phi(k) in CC
$
同 群函数定理 有，$q$个类上只有$q$的独立的类函数。对这个方阵，就可以构造出$chi^A (k)$可以张成一个空间$V_chi$，并且$V_chi$是一个正交归一且完备的空间。其中
$
  chi(k_g) = chi(g)
$

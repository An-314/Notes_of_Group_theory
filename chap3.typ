#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

= SO(3)和SU(2)群

按照前两章，我们按照如下方式研究这两个群
- 结构：元素、子群、类、直积
- 表示：不可约表示、特征标、直积约化

== 旋转群的一般知识

=== 变换

#definition(subname: [变换])[
  变换是一个映射$hat(A)$，使得
  $
    hat(A) : E^3 -> E^3
  $
  满足
  $
    hat(A) (vb(r)) = vb(r)'
  $
  其中$vb(r)$是一个矢量，$vb(r)'$是变换后的矢量。
]
$
  hat(A) : vb(r) |-> vb(r)' = hat(A) vb(r)
$
一个变换和一个矩阵有对应关系。

==== 正交变换

#definition(subname: [正交变换])[
  $E^3$上的变换$A$满足任意矢量的自身内积都保持不变
  $
    braket(hat(A) vb(r)) = braket(vb(r)) <=> hat(A)^TT hat(A) = E
  $
  则称$A$是一个*正交变换*。相应的矩阵称为正交矩阵。
]
是一个保距变换
$
  bracket(vb(r)') = bracket(vb(r)) <=> sum x'_i^2 = sum x_i^2
$
也意味着旋转变换。

#proposition(subname: [正交变换的性质])[
  $A$是正交矩阵
  - $
      det A = plus.minus 1
    $
  - $
      A^(-1) = A^TT
    $
  - 任意两个矢量的内积在正交变换下不变。
]
正交变换不仅保持矢量的长度不变，而且也保持任意两个矢量间的夹角不变。$E^3$中的原点是正交变换作用下的不动点。

=== 三维实正交群 $"O"(3)$

#definition(subname: [三维实正交群,$"O"(3)$])[
  $E^3$上的所有正交变换的集合构成一个群，称之为*三维实正交群*，记为$"O"(3,RR)$，或$"O"(3)$。
]
很明显，此群与由全部三阶正交矩阵在矩阵乘法下构成的三维实正交矩阵群是同构的，以后就用三维实正交矩阵群来定义
$
  "O"(3) = {hat(A) | hat(A)^TT hat(A) = E} = {A in "GL"(3,RR) |A_(i j)in RR, A^TT A = E}
$
$"O"(3)$是$"GL"(3,RR)$群的一个子群。

我们知道，$"O"(3)$群的元素可以分成两部分，$det A = 1$与$det A = -1$。

#definition(subname: [三维特殊实正交群, $"SO"(3)$])[
  $"O"(3)$中群元素行列式为$1$的矩阵集合在群乘法下也构成一个子群，称之为*三维特殊实正交群*，记为$"SO"(3,RR)$，或$"SO"(3)$。
  $
    "SO"(3) = {A in "O"(3)|det(A) = 1}
  $
]

#proposition(subname: [$"SO"(3)$的性质])[
  $
    "SO"(3) subset "O"(3)
  $
  进一步地
  $
    "SO"(3) lt.tri "O"(3)
  $
]

#newpara()

事实上所有行列式为$-1$的集合组成$"SO"(3)$的陪集$I"SO"(3)$
$
  I"SO"(3) = {macron(A) = I A | A in "SO"(3), I = -E}
$
其中$I$为空间反演操作$det I = -1$。从而有陪集串
$
  "O"(3) = {"SO"(3), I"SO"(3)}
$
从而可以构造商群
$
  "O"(3) \/ "SO"(3) = {"SO"(3), I "SO"(3)} tilde.equiv K
$
事实上$K={e,I}$也是$"O"(3)$的不变子群
$
  "O"(3) \/ K tilde.equiv "SO"(3)
$
事实上$"O"(3)$群同态于$K$（或$"SO"(3)$群），$"SO"(3)$群（或$K$群）是同态核。$"O"(3)$群对$K$（或$"SO"(3)$群）的商群和$"SO"(3)$群（或$K$群）同构。

就有
#proposition(subname: [$"O"(3)$的直积分解])[
  $
    "O"(3) = "SO"(3) times.circle K
  $
]
由于$K$群只有两个一维不可约表示，于是寻求$"O"(3)$群的不可约表示问题实际上只需要研究$"SO"(3)$群的不可约表示即可。


=== SO(3)群参数

#definition(subname: [群参数])[
  Lie群的群元素是由可连续变化的独立的实参数刻画，称之为*群参数*。
]
例如
$
  "SO"(2) = {C_k (theta)}
$
有群参数$theta$，为实数且独立。

在$E^3$上，一般线性变换对应一个三阶方阵，它有 9 个自由参数。对三阶正交矩阵来说，正交条件给这些参数附加了 6 个独立的约束方程，所以三阶正交矩阵只有 3 个自由参数。

#proposition(subname: [$"SO"(3)$的群参数])[
  事实上$"O"(3)$和$"SO"(3)$都只有3个独立的群参数。
]
的群参数的选择不是唯一的：
- 方位角$(theta, phi, psi)$
- Euler角$(alpha, beta, gamma)$

==== 方位角

正交变换存在一个转轴
#theorem[
  对于任意正交变换$A in "SO"(3)$，在$E^3$中总存在一个矢量$vb(n)$使得
  $
    A vb(n) = vb(n)
  $
  即$vb(n)$在$A$的变换下不变。
]
#proof[
  $
    (A - E) vb(n) = 0 => det(A - E) = 0
  $
  注意到
  $
    det(A - E) &= det(A - E)^TT = det(A^(-1) - E)\
    &= det(A^(-1)) det(-E) det(A-E) = - det(A-E)
  $
  从而
  $
    det(A - E) = 0
  $
  从而$(A - E) vb(n) = 0$有非零解。
]

这就是说有转轴$vb(n)$，不妨取单位矢量。$E^3={vu(i),vu(j),vu(k)}$，并令单位矢量$vu(k)$为$vb(n)$的方向，但么保持$vu(k)$的变换$A$是
$
  mat(vu(i)', vu(j)', vu(k)) = mat(vu(i), vu(j), vu(k)) mat(cos psi, -sin psi, 0; sin psi, cos psi, 0; 0, 0, 1)
$


用$theta,phi$标记该轴，用$psi$表示绕轴的转动
$
  A -> C_(vb(n)(theta,phi))(psi)
$
取值范围为
$
  theta in [0, pi], phi in [0, 2pi), psi in [0, pi]
$
#proposition(subname: [$"SO"(3)$的群元素])[
  $"SO"(3)$的任意元素都可以用$C_(vb(n)(theta,phi))(psi)$来表示。
]
文献上常称 $"SO"(3)$ 群为三维旋转群，记为$R_3$。

#figure(
  image("pic/2025-05-08-19-14-15.png", width: 80%),
  numbering: none,
)

*几何意义*：如果把 $(theta, phi, psi)$ 看成是某一个“旋转矢量”的三个球坐标分量——球内一点到原点的连线的方向是转轴的方向 $theta, phi$，而该点距原点的距离即是转角的大小 $psi$，那么该旋转矢量的变化范围就是一个半径为 $pi$ 的球体。

这样可以在群元素与球体内的点之间建立一一对应关系，但球面上的直径两端点（如图中的 $a, b$ 点）对应的是同一群元素，即
$
  C_vb(n) (pi) = C_vb(-n) (pi)
$
所以用 $C_(vb(n) (theta,phi))(psi)$ 来表示不是唯一的。

*固定坐标轴描述*：任意旋转操作$C_n (psi)$可以仅用绕 $k$ 轴的旋转操作和绕 $j$ 轴的旋转操作的组合来描述，即
#proposition(subname: [$"SO"(3)$的固定坐标轴描述])[
  $
    C_(vb(n)(theta,phi))(psi) = C_k (phi) C_j (theta) C_k (psi) C_j^(-1) (theta) C_k^(-1) (phi)
  $
]
此式表明：绕空间某一给定转轴的旋转与连续五次绕固定轴旋转的最后效果是相同的。

矩阵表示为
$
  C_(vb(n)(theta,phi))(psi) = mat(
    C_11, C_12, C_13;
    C_21, C_22, C_23;
    C_31, C_32, C_33
  )
$
其中
$
  C_11 &= sin^2 theta cos^2 phi (1- cos psi) + cos psi &= n_x^2 (1-cos psi) + cos psi\
  C_12 &= sin^2 theta cos phi sin phi (1- cos psi) - cos theta sin psi &= n_x n_y (1-cos psi) - n_z sin psi\
  C_13 &= sin^2 theta cos theta cos phi (1-cos psi) + sin theta sin phi sin psi &= n_x n_z (1-cos psi) + n_y sin psi\
  C_21 &= sin^2 theta cos phi sin phi (1- cos psi) + cos theta sin psi &= n_x n_y (1-cos psi) + n_z sin psi\
  C_22 &= sin^2 theta sin^2 phi (1- cos psi) + cos psi &= n_y^2 (1-cos psi) + cos psi\
  C_23 &= sin theta cos theta sin phi (1-cos psi) - sin theta cos phi sin psi &= n_y n_z (1-cos psi) - n_x sin psi\
  C_31 &= sin theta cos theta cos phi (1-cos psi) - sin theta sin phi sin psi &= n_x n_z (1-cos psi) - n_y sin psi\
  C_32 &= sin theta cos theta sin phi (1-cos psi) + sin theta cos phi sin psi &= n_y n_z (1-cos psi) + n_x sin psi\
  C_33 &= cos^2 theta (1-cos psi) + cos psi &= n_z^2 (1-cos psi) + cos psi
$
其中
$
  n_x = sin theta cos phi\
  n_y = sin theta sin phi\
  n_z = cos theta
$

==== Euler角

Euler 角是由三个连续操作的旋转角 $alpha, beta, gamma$ 来定义的。

它们描述一个 Descartes 坐标系${vu(i), vu(j), vu(k)}$经过一个特定顺序的三个连续旋转操作达到一个具有共同原点的、新的 Descartes 坐标系 ${vu(I), vu(J), vu(K)}$。用 Euler 角来表示的任意旋转操作$g(alpha beta gamma)$由以下三个连续旋转构成：

+ 绕$k$轴转$alpha$角，使得$j$轴与“节线”（$i j$平面与$I J$平面的交线）$N$重合，即有
  $
    C_k (alpha) : {i, j, k} -> {i', j', k'}
  $
  $k'=k$，即$k$在$C_k (alpha)$下不变。
+ 绕$j'$轴转$beta$角，使得$k$轴与$K$轴重合，有
  $
    C_(j') (beta) : {i', j', k'} -> {i'', j'', k''}
  $
  $j''=j'$，$k''=K$，即$j$在$C_(j')(beta)$下不变。
+ 绕$k''=K$轴转$gamma$角，使得使得节线$N$即$j'$轴与$J$轴重合，有
  $
    C_(k'') (gamma) : {i'', j'', k''} -> {I, J, K}
  $
  $k'''=k''=K$，$j'''=J$，即$k$在$C_(k'')(gamma)$下不变。

合成后得
$
  g(alpha, beta, gamma) = C_(k'') (gamma) C_(j') (beta) C_k (alpha)
$
参数$alpha, beta, gamma$的取值范围为
$
  alpha in [0, 2pi), beta in [0, pi], gamma in [0, 2pi)
$
这样的变换一共有三个坐标系，我们希望可以通过同一个坐标系${i,j,k}$描述
#proposition(subname: [$"SO"(3)$的Euler角的矩阵表示])[
  $
    g(alpha, beta, gamma) = C_(k) (alpha) C_(j) (beta) C_(k) (gamma)
  $
]
这事实上是利用若干相似变换得到的，考虑相似变换的坐标变换有：
$
  C_(j') (beta) = C_(k) (alpha) C_(j) (beta) C_(k)^(-1) (alpha)\
  C_(k'') (gamma) = C_(j') (beta) C_(k') (gamma) C_(j')^(-1) (beta)\
$
利用该式可以得到上述表示。可以写成
$
  g(alpha, beta, gamma) = mat(
    cos alpha cos beta cos gamma - sin alpha sin gamma, -cos alpha cos beta sin gamma - sin alpha cos gamma, cos alpha sin beta;
    sin alpha cos beta cos gamma + cos alpha sin gamma, -sin alpha cos beta sin gamma + cos alpha cos gamma, sin alpha sin beta;
    -sin beta cos gamma, sin beta sin gamma, cos beta
  )
$<Euler角的矩阵表示>

#note[
  用 Euler 角刻画 $"SO"(3)$ 群元素不是唯一的。由 @Euler角的矩阵表示 可知，当$beta = 0$，此时 $k , k', k''$ 轴重合，只要 $alpha+beta$ 相同，就代表同一个旋转。当 $beta = pi$ ，只要 $alpha - gamma$ 相同也就代表同一个旋转。除此之外，$alpha,beta,gamma$ 的不同取值代表不同的旋转。

  方位角是$1->2$的对应关系；Euler角有一个$1->oo$的对应关系。
]

=== SO(3) 群的类

已知 $"SO"(3)$ 群的任意元素可以写为 $C_(vb(n)(theta,phi))(psi)$，同类元素是
$
  g C_(vb(n)(theta,phi))(psi) g^(-1)
$
有
$
  (g C_(vb(n)(theta,phi))(psi) g^(-1)) g vb(n) = g vb(n)
$
由于同类元素的特征表相等，有
$
  chi(g^(-1) C_(vb(n)(theta,phi))(psi) g) = chi(C_(vb(n)(theta,phi))(psi)) = 1 + 2 cos(psi)
$
所以$g C_(vb(n)(theta,phi))(psi)g^(-1)$是绕$g vb(n)$轴转$psi$角的一个旋转操作，即
$
  g C_(vb(n)(theta,phi))(psi) g^(-1) = C_(g vb(n)(theta,phi))(psi)
$
由于 $g$ 是任意的，所以用转角 $psi$ 来描述 $"SO"(3)$ 群的类
#proposition(subname: [$"SO"(3)$ 群的类])[
  $"SO"(3)$ 群的类是由转角 $psi$ 来描述的，即
  $
    "SO"(3) = {C_(vb(n)(theta,phi))(psi) | psi in [0, pi]}
  $
]
*所有转角$psi$相同的旋转构成一个类*，因此有无穷多个类，而且每个类中的元素个数也为无穷多。

#note[
  到此，我们已经得到了 $"SO"(3)$ 群的两种表示：
  - 方位角表示：$C_(vb(n)(theta,phi))(psi)$
  - Euler角表示：$g(alpha, beta, gamma)$
  都可以写成三维正交矩阵的形式。
]

== SU(2)群与SO(3)群的同态关系

=== SU(2)群

#definition(subname: [$"U"(2)$群，二维幺正群])[
  $"U"(2)$是在复数域$CC$上，所有二维幺正矩阵的集合在矩阵乘法下构成的群，称为*二维幺正群*
  $
    "U"(2) = "U"(2,CC) = { hat(U) in "GL"(2,CC) | hat(U)^dagger hat(U) = E }
  $
]

因为$"GL"(2,CC)$由8个独立的是参数刻画，幺正条件给出4个实的独立的约束方程，从而$"U"(2)$的群参数的个数为4。

#definition(subname: [$"SU"(2)$群，二维特殊幺正群])[
  $"U"(2)$群中行列式等于 1 的矩阵的集合构成$"U"(2)$群的一个子群，称之为*二维特殊幺正群*（或*二维单模酉群*），
  $
    "SU"(2) = { hat(U) in "U"(2) | det(hat(U)) = 1 }
  $
]
再有一个方程的约束，其群参数的个数为3。


#note[
  在$"U"(2)$中$abs(det(U))=1$，事实上$det(U) = e^(i theta)$，相因子$theta$是一个实参数，在$"SU"(2)$中$theta=0$，即$det(U)=1$。所以
  $
    abs("U"(n)) = abs("SU"(n)) + 1
  $
  但在$"O"$群有
  $
    abs("O"(n)) = abs("SO"(n))
  $
]

#newpara()

考虑到
$
  U = mat(a, b; c, d)
$
由幺正条件有
$
  a a^* + b b^* = 1,
  c c^* + d d^* = 1,
  a c^* + b d^* = 0\
$
以及
$
  a a^* + c c^* = 1,
  b b^* + d d^* = 1,
  a b^* + c d^* = 0\
$
就有
$
  c c^* = b b^*, d d^* = a a^*
$
令
$
  d = a^* m, c = b^* n
$
其中
$
  abs(m) = 1, abs(n) = 1
$
有
$
  a b m^* + a b n^* = 0
$
就有
$
  m^* = - n^* => m = - n
$
再结合行列式
$
  det(U) = a d - b c = a^* a m - b^* b n = abs(a)^2 m - abs(b)^2 n = m (abs(a)^2 + abs(b)^2) = 1
$
得到
$
  m = 1, n = -1
$

#definition(subname: [Cayley-Klien参数])[
  $U$一般形式是
  $
    U = mat(a, b; -b^*, a^*)
  $
  还有
  $
    abs(a)^2 + abs(b)^2 = 1
  $
  参数$a,b$称为*Cayley-Klien参数*。
]

#note[
  这里由Cayley-Klien参数给出了$"SU"(2)$群的一个二维表示$u(a,b)$。
]

=== SU(2)和SO(3)的同态关系

构造*Pauli矩阵*
$
  sigma_x = mat(0, 1; 1, 0), sigma_y = mat(0, -i; i, 0), sigma_z = mat(1, 0; 0, -1)
$
#note[
  $sigma_x,sigma_y,sigma_z$是线性独立的，可以张成一个$Sigma$空间。
]
对于$vb(r) = mat(x; y; z)$，有
$
  h &= vb(r) dot vb(sigma) = x sigma_x + y sigma_y + z sigma_z\
  &= mat(z, x-i y; x+i y, -z)
$
$h$是一个*零迹Hermitian矩阵*，$h^dagger = h$，且有$det h = -(x^2 + y^2 + z^2)$，$tr h = 0$。

对$h$进行一个$"SU"(2)$变换
$
  u h u^dagger = macron(h), u in "SU"(2)
$
我们需要说明$macron(h) in Sigma$，由于
$
  tr macron(h) = tr (u h u^dagger) = tr h = 0
$
进而有
$
  macron(h) = u h u^dagger = mat(z', x'-i y'; x'+i y', -z')\
$
上式说明：每一个二维幺正变换$u in "SU"(2)$都诱导出一个三维坐标变换，设为$R_u$有
$
  vb(r)' = R_u vb(r)
$

#figure(
  diagram(
    cell-size: 15mm,
    $
      edge("d", R_u, ->) vb(r) edge(h = vb(r) dot vb(sigma), "<->") & h edge("d", u, ->)\
      vb(r)' edge(macron(h) = vb(r)' dot vb(sigma), "<->") & macron(h)\
    $,
  ),
)

由于 $det macron(h) = det h$，所以
$
  sum x^('2)_i = sum x^2_i\
$
从而$R_u$是一个正交变换
$
  R_u in "O"(3)
$
现在确定其行列式：对
$
  u = mat(a, b; -b^*, a^*)
$
其诱导的变换为
$
  R_u = mat(
    1 / 2(a^2 + a^(*2) - b^2 - b^(*2)), -i / 2(a^2 - a^(*2) + b^2 - b^(*2)), - (a b + a^* b^*);
    i / 2 (a^2 - a^(*2) - b^2 + b^(*2)), 1 / 2(a^2 + a^(*2) + b^2 + b^(*2)), i(- a b + a^* b^*);
    (a^* b + a b^*), i (a^* b - a b^*), (abs(a)^2 - abs(b)^2)
  )
$
并且
$
  det R_u = f(a,b)
$
是连续函数，且取值只能是$1$或$-1$，所以
$
  u = 1, det R_u = 1\
$
从而
$
  R_u in "SO"(3)
$
下面说明$phi: R_u -> u$是一个同态映射，考虑
$
  (R_u vb(r)) dot vb(sigma) = u (vb(r) dot vb(sigma)) u^dagger
$
就有
$
  (u v) (vb(r) dot vb(sigma)) (u v)^(-1) &= (R_(u v) vb(r)) dot vb(sigma)\
  &= (R_u R_v vb(r)) dot vb(sigma)\
$
从而
$
  R_u R_v = R_(u v)
$
#proposition(subname: [SU(2)和SO(3)的同态关系])[
  $
    "SU"(2) tilde "SO"(3)
  $
]

下面我们需要说明其为满射，并考虑其对应关系
#three-line-table[
  | 构造 $"SO"(3)$ 群元素的“砖块” | 构造 $"SU"(2)$ 群元素的“砖块” |
  | --- | --- |
  | $ R_(u_1) &= mat(cos alpha, -sin alpha, 0; sin alpha, cos alpha, 0; 0, 0, 1) \ &= C_k (alpha) $ | $ u_1 (alpha) = mat(e^(-i alpha / 2), 0; 0, e^(i alpha / 2)) $ |
  | $ R_(u_2) &= mat(cos beta, 0, sin beta; 0, 1, 0; -sin beta, 0, cos beta) \ &= C_j (beta) $ | $ u_2 (beta) = mat(cos beta / 2, -sin beta / 2; sin beta / 2, cos beta / 2) $ |
]

用 Euler 角所描述的旋转操作为
$
  R_u = C_k (alpha) C_j (beta) C_k (gamma) = g (alpha, beta, gamma)
$
把与 $C_k (alpha), C_j (beta), C_k (gamma)$ 对应的 $u_1, u_2$ 相乘有
$
  u_1 (alpha) u_2 (beta) u_1 (gamma) = mat(cos beta / 2 e^(-i / 2 (alpha + gamma)), -sin beta / 2 e^(-i / 2 (alpha - gamma)); sin beta / 2 e^(i / 2 (alpha - gamma)), cos beta / 2 e^(i / 2 (alpha + gamma))) = u(alpha, beta, gamma)
$
容易验证 $u(alpha,beta,gamma)$ 满足么正条件和 $det u(alpha,beta,gamma)=1$，所以 $u(alpha,beta,gamma) in "SU"(2)$，$phi: R_u -> u$ 是一个满射。对比还有
#proposition(subname: [Cayley-Klien参数和Euler角的关系])[
  $
    u(alpha, beta, gamma) = mat(cos beta / 2 e^(-i / 2 (alpha + gamma)), -sin beta / 2 e^(-i / 2 (alpha - gamma)); sin beta / 2 e^(i / 2 (alpha - gamma)), cos beta / 2 e^(i / 2 (alpha + gamma)))
  $
  其中
  $
    a = cos beta / 2 e^(-i / 2 (alpha + gamma)), b = -sin beta / 2 e^(-i / 2 (alpha - gamma))
  $
]
上式给出*了Cayley-Klien参数和Euler角的关系*。

最后讨论对应关系的多重性问题。

由同态核定理知，只需讨论$"SO"(3)$群的单位元素$E_(3times 3)$ 所对应的$"SU"(2)$群元素的个数即可。

利用对应关系，解出$R_u_0 = E_(3 times 3)$所对应的$alpha = 0, 2pi$，从而
$
  R_(u_0) = E_(3 times 3) = mat(1, 0, 0; 0, 1, 0; 0, 0, 1)=> cases(display(mat(e^(-i / 2 0), 0; 0, e^(i / 2 0)) = mat(1, 0; 0, 1)), display(mat(e^(-i pi), 0; 0, e^(i pi)) = - mat(1, 0; 0, 1)))
$
这里
$
  H = {E_(2 times 2), -E_(2 times 2)}
$
为$"SU"(2)$的同态核。因此对任意$u in "SU"(2)$其陪集
$
  u H = {u, -u}
$
对应同一个旋转操作$R_u in "SO"(3)$。

#proposition(subname: [$"SU"(2)$和$"SO"(3)$的同态关系])[
  $
    "SU"(2) tilde^(2:1) "SO"(3)
  $
]


#note[
  按参数空间看$"SU"(2)$的参数$a=x_1 + x_2 i, b = x_3 + x_4 i$就有$sum_(i=1)^4 x_i^2 = 1$是一个球面；$"O"(3)$的参数分两叶。
]

#newpara()

几何意义：在三维欧氏空间，绕某一轴旋转$alpha$角与旋转$alpha + 2pi$角，其效果是一样的。但在二维酉空间，情况就不一样了。
- $E^3$上：
  $
    g (alpha, beta, gamma) = g (alpha + 2pi, beta, gamma)
  $
- $CC^2$上：
  $
    u(alpha, beta, gamma) = - u(alpha + 2pi, beta, gamma) = u(alpha + 4pi, beta, gamma)
  $
这说明在二维酉空间中，转角为$alpha$与$alpha + 2pi$的旋转操作是不同的，$alpha$和$alpha + 4pi$的“旋转”效果才相同。所以二维酉空间中的“旋转”是一种非真实旋转。

在量子力学范畴中，就存在两种不同的旋转概念：真实旋转和非真实旋转。例如，*自旋*就是非真实旋转，常称之为*内秉旋转*，以区别（真实的）*轨道旋转*。

== SU(2)群的表示

已知 $"SU"(2)$ 群的任意元素为 2 阶么正方阵
$
  u = mat(a, b; -b^*, a^*), abs(a)^2 + abs(b)^2 = 1
$
而对于作用空间$CC^2 = {e_1, e_2}, vb(r) in CC^2, vb(r) = sum_i x_i e_i = mat(x_1; x_2)$，作用$u$是
$
  u: vb(r) -> vb(r)' = u vb(r) = mat(a, b; -b^*, a^*) mat(x_1; x_2)\
  mat(e'_1, e'_2) = mat(e_1, e_2) mat(a, b; -b^*, a^*) \
$
需要构造负载表示的其它基函数。作为一种选择，取$x_1, x_2$的*齐次单项式*作为$"SU"(2)$群的表示空间的基函数，如
$
  V_3 &= {x_1^2, x_1 x_2, x_2^2}\
  V_4 &= {x_1^3, x_1^2 x_2, x_1 x_2^2, x_2^3}\
  ... &\
  V_n &= {x_1^n, x_1^(n-1) x_2, x_1^(n-2) x_2^2, ..., x_2^n}\
$
可以验证：$V_i$在$"SU"(2)$作用下是封闭的。而且每个$V_i$不再含有$"SU"(2)$的不变子空间。把$u$作用到$V_i$上，就可得到$"SU"(2)$群的一个$i$维不可约表示。

我们知道*$u$是$"SU"(2)$的一个忠实表示*，我们希望可以通过$u$来构造出其他的表示，考虑到
#example(subname: [$D_3$表示的直积])[
  注意到$D_3$有
  $
    Gamma times.circle Gamma = S plus.circle A plus.circle Gamma
  $
  可以用一个已知表示$Gamma$的表示来构造出新的表示$S, A$。
]
按照同样的方式，对于紧致Lie群$"SU"(2)$，有
$
  u times.circle u = sum plus.circle c_n A^((n))
$
事实上这也对应着荷载空间的约化
$
  CC^2 times.circle CC^2 = sum plus.circle c_n V^((n))
$
注意到
$
  mat(x_1, x_2) times.circle mat(x_1, x_2) = mat(x_1^2, x_1 x_2, x_2 x_1, x_2^2) -> {x_1^2, x_1 x_2, x_2^2} = V^((3))
$
我们需要说明$V^((3))$是一个封闭的（显然）不可约的空间（不变子空间），从而$V^((3))$为载荷可以给出一个不可约表示。再考虑
$
  u times.circle u times.circle u = sum plus.circle c_n V^((n))\
  CC^2 times.circle CC^2 times.circle CC^2 = sum plus.circle c_n V^((n))\
$
这样也能给出一个不可约表示。

#note[
  事实上
  $
    mat(x_1, x_2) times.circle mat(x_1, x_2) = mat(x_1^2, x_1 x_2, x_2 x_1, x_2^2) -> {x_1^2, x_1 x_2, x_2^2} = V^((3))
  $
  这一步做了对称化和反对称化
  $
    {x_1 times.circle x_1, x_1 times.circle x_2, x_2 times.circle x_1, x_2 times.circle x_2}\
    x_1 times.circle x_2 plus.minus x_2 times.circle x_1 = cases(2 x_1 x_2, 0)\
  $
  投影到函数空间$V^((3))$上时，我们可以只选择一个。由于这是同一个矢量的张量，反对称化一定是0。事实上对称化就是投影。

  对称化之后给出的基，当然是不可约的。
]
一般地，
$
  underbrace(u times.circle u times.circle ... times.circle u, k) = sum plus.circle c_n A^((n))\
  underbrace(CC^2 times.circle CC^2 times.circle ... times.circle CC^2, k) = sum plus.circle c_n V^((n))\
$
事实上，统一的表达式便是$x_1^(j+m) x_2^(j-m)$，为了幺正化
$
  f_m^j (x_1, x_2) = (x_1^(j+m) x_2^(j-m)) / sqrt((j+m)! (j-m)!)\
$
是一个$2j$次齐次函数，函数基便是
$
  f^j (vb(r)) = {f_m^j (x_1, x_2) | m = -j, -j+1, ..., j}
$
其中$j$是一个非负整数或半整数，$j=0,1 / 2,1,3 / 2,2,...$。

引入函数变换算符$P(u)$，其作用空间是函数空间
$
  macron(f^j)(vb(r)) = P(u) f^j (vb(r)) = f^j (u vb(r))\
  P(u) f^j_m (vb(r)) = sum A_(m m')^((j)) f^j_m' (vb(r))\
$
保持函数形式不变，而只对其宗量实施变换。
#note[
  事实上前面函数形式变换算符
  $
    P_g f_i (vb(r)) = f_i (g^(-1) vb(r))\
  $
  但在这里
  $
    P(u) f^j (vb(r)) = f^j (u vb(r))\
  $
  没有保乘关系
  $
    P(u v) = P(v) P(u)\
  $
  可以诱导一个表示
  $
    P(u v) f^j_m (vb(r)) = sum_m' A^((j))_(m m') f^j_m' (vb(r))\
    P(v) P(u) f^j_m (vb(r)) = sum_k A^((j))_(m k) f^j_k (vb(r))\ = sum_k sum_m' A^((j))_(m k) A^((j))_(k m') f^j_m' (vb(r))\
  $
  则有
  $
    A^((j)) (u v) = A^((j)) (u) A^((j)) (v)\
  $
  由$u$和$u^(-1)$给出的函数形式变换都能给出一个表示。事实上由函数形式变换
  $
    P_(g_alpha) f_m (vb(r)) = f_m (g_alpha^(-1) vb(r)) = sum A_(m' m) f_m' (vb(r))\
    P(u) f_m (vb(r)) = f_m (u vb(r)) = sum A_(m m') f_m' (vb(r))\
  $
  前者是按照基底展开，后者是按照坐标求和。
  $
    mat(..., e'_i, ...) = mat(..., e_i, ...) mat(T)\
    mat(dots.v; x'_i; dots.v) = mat(T) mat(dots.v; x_i; dots.v) \
  $
  有
  $
    hat(T) e_i = e'_i = sum T_(j i) e_j\
    hat(T) x_i = x'_i = sum T_(i j) x_j\
  $
  与$P$的保乘关系无关，只需保证表示矩阵的保乘。
]
代入有
$
  P(u) f_m^j (vb(r)) &= f_m^j (u vb(r)) = ((a x_1 + b x_2)^(j+m) (-b^* x_1 + a^* x_2)^(j-m)) / sqrt((j+m)! (j-m)!)\
  &= sum_(k=0)^(j+m) sum_(k'=0)^(j-m) ((-)^(j-m-k') sqrt((j+m)! (j-m)!)) / ((j+m-k)! k! (j-m-k')! k'!) a^(j+m-k) b^(k) (-b^*)^(j-m-k') (a^*)^(k') x_1^(j -k - k') x_2^(k + k')\
$
引入$m'=j-k-k'$，则
$
  P(u) f_m^j (vb(r)) = sum_(m'=-j)^(j) sum_k ((-)^(k-m+m')sqrt((j+m)! (j-m)! (j+m')! (j-m')!)) / ((j+m-k)! (j-m'-k)! k! (k-m+m')!) \ a^(j+m-k) a^(* j-m'-k) b^(k) (b^*)^(j-m+m') f_m'^j (vb(r))\
$
即
$
  P(u) f_m^j (vb(r)) = sum_(m'=-j)^(j) A_(m m')^((j)) f_m'^j (vb(r))\
$
其中有
$
  A_(m m')^((j)) = ((-)^(k-m+m') sqrt((j+m)! (j-m)! (j+m')! (j-m')!)) / ((j+m-k)! (j-m'-k)! k! (k-m+m')!) a^(j+m-k) a^(* j-m'-k) b^(k) (b^*)^(j-m+m')\
$<SU2>
其中$k$满足
$
  max(0, m-m') <= k <= min(j+m, j-m')\
$
$A^((j))$给出了$"SU"(2)$群的全部不等价不可约的幺正表示。

#proposition(subname: [SU(2)群的不可约表示])[
  对于$"SU"(2)$群的任意元素$u$，在函数基
  $
    f^j (vb(r)) = {f_m^j (x_1, x_2) | m = -j, -j+1, ..., j}\
    f_m^j (x_1, x_2) = (x_1^(j+m) x_2^(j-m)) / sqrt((j+m)! (j-m)!)
  $
  下的表示为
  $
    P(u) f_m^j (vb(r)) = sum_(m'=-j)^(j) A_(m m')^((j))(u) f_m'^j (vb(r))
  $
]

下表是一些实例
#three-line-table[
  | $j$ | 基函数 | 表示矩阵$A^((j))$ |
  | --- | --- | --- |
  | $0$ | $ f^0_0 (vb(r)) = 1 $ | $ A^((0)) (u) = 1 $ |
  | $1 / 2$ | $ f^(1 / 2)_(1 / 2) (vb(r)) = x_1, f^(1 / 2)_(-1 / 2) (vb(r)) = x_2 $ | $ A^((1 / 2)) (u) = mat(a, b; -b^*, a^*) $ |
  | $1$ | $ f^1_1 (vb(r)) = x_1^2, \ f^1_0 (vb(r)) = x_1 x_2,\ f^1_-1 (vb(r)) = x_2^2 $ | $ A^((1)) (u) = \ mat(a^2, sqrt(2)a b, b^2; -sqrt(2) a b^*, a^* a - b^* b, sqrt(2) a^* b; b^(*2), -sqrt(2) a^* b^*, a^(*2)) $ |
]

下面分析表示的*奇偶性*，$u$和$- u$是$"SU"(2)$群的两个不同元素，
- $j="整数"$
  $
    A^((j)) (-u) = A^((j)) (u)
  $
  表明$u,-u$有相同的表示矩阵，称$j$为非负整数的表示为*偶表示*。
- $j="半整数"$
  $
    A^((j)) (-u) = - A^((j)) (u)
  $
  表明$u,-u$的表示矩阵相反，称$j$为半整数的表示为*奇表示*。

下面可以用特表来说明其完备性。

=== SU(2)群的特征标

首先来确定表示$A^((j))$的特征标。因为任何一个酉矩阵可以通过么正变换对角化，所以任意$u in "SU"(2)$均可以和一个对角矩阵等价
$
  S u S^dagger = u_3 (phi) = mat(e^(-i / 2 phi), 0; 0, e^(i / 2 phi)), phi in [0, 4pi)
$
因为每个类中的元素有相同的特征标，故可以用$u_3 (phi)$来表示$"SU"(2)$的类。

#proposition(subname: [SU(2)群的类])[
  $"SU"(2)$群的类是由对角化后的转角 $phi$ 来描述的，即
  $
    "SU"(2) = {u_3 (phi) | phi in [0, 2pi)}
  $
]

#newpara()

利用 @SU2 ，可以得到$u_3 (phi)$表示矩阵
$
  A^((j)) (u_3 (phi)) = mat(e^(-i j phi), 0, ..., 0; 0, e^(-i (j-1) phi), ..., 0; dots.v, dots.v, dots.down, dots.v; 0, 0, ..., e^(i j) phi)
$
则特征标为
$
  chi^((j)) (phi) = chi^((j)) (u_3 (phi)) = sum_(m=-j)^(j) e^(-i m phi) = sin(((2j+1)phi) / 2) / sin(phi / 2)
$
在$u'$中$phi in [0,4pi)$，在$chi^((j)) (u')$中$phi in [0,2pi)$
$
  u' (phi) tilde u' (-phi)
$

#proposition(subname: [SU(2)群的特征标])[
  $"SU"(2)$群的特征标为
  $
    chi^((j)) (phi) = sin(((2j+1)phi) / 2) / sin(phi / 2), j = 0, 1 / 2, 1, 3 / 2, ...
  $
]

事实上特征标
$
  chi^((0)), chi^((1 / 2)), chi^((1)) - chi^((0)), chi^((3 / 2)) - chi^((1 / 2)) ... \ -> {1, cos(phi / 2), cos(phi), cos(3 / 2 phi), ...}, phi in [0,2pi)\
$
是一套完备的Fourier基；从而得到了完备性。

#remark[
  有限群的所有结论都可以推广到紧致Lie群上。$"SO"(2)$是一个紧致Lie群。

  群平均$1 / n sum -> 1 / pi integral_0^(2pi) sin pi phi / 2$
]
从而可以计算特征标
$
  braket(chi^((j)), chi^((j))) = 1 / 2pi integral_0^(2pi) chi^((j)*) (phi) chi^((j)) (phi) dd(phi) = 1
$
这也说明了$A^((j))$是*不可约*的。

== SO(3) 群的不可约表示

前面给出了 SU(2) 群的不可约表示，如果利用 SU(2) 群与 SO(3) 群的同态关系，就可以得到 SO(3) 群的不可约表示。
$
  A^((j)) (u) tilde.equiv "SU"(2) approx^(2:1) "SO"(3)
$
下面希望建立起
$
  (a b) <-> (alpha beta gamma)\
  A^((j)) (a b) -> D^((j)) (alpha beta gamma)\
$
的关系，再将$D$构造成表示，运用对应关系：
$
  D^((j))_(m m') (alpha, beta, gamma) = sum_k (-1)^k sqrt((j+m)! (j-m)! (j+m')! (j-m')!) / ((j+m-k)! (j-m'-k)! k! (k-m+m')!) \ e^(-i m alpha) (cos beta / 2)^(2j + m - m'- 2k) (sin beta / 2)^(2k - m + m') e^(-i m' gamma)\
$
其中$j$和k的取值都不变：$j = 0, 1 / 2, 1, 3 / 2, ...$，$m, m' = -j, -j+1, ..., j$，$k = max(0, m-m') <= k <= min(j+m, j-m')$。

现在分析$D^((j))$是否为表示。

1. 当$j$为非负整数的时候

  #diagram($
    & u edge(->) & A^((j)) (u) edge("dr", ->)&\
    g(alpha, beta, gamma)edge("ur", ->)edge("dr", ->) & && D(alpha, beta, gamma)\
    & - u edge(->) & A^((j)) (u) edge("ur", ->)&\
  $)

  可以给出一个$D$
  $
    {D^((j)), j = 0,1,2,...}
  $
  即旋转$g(alpha,beta,gamma)$与$D^((j))(alpha,beta,gamma)$是一一对应的，所以非负整数时的$D^((j))$是$"SO"(3)$的表示，称之为*单值表示*。
  $
    chi^((j)) (alpha, beta, gamma) = sum_(m=-j)^j e^(-i m alpha), j = 0,1,2,...\
  $
  $
    {chi^((0)), chi^((1)), ...} = {1, cos alpha, cos 2 alpha, ...}\
  $
  在$alpha in [0,pi)$是一套完备的Fourier基，从而得到了完备性。

  另外，还可以得到$D_(m m')^((j))$的分解：
  $
    D_(m m')^((j)) (alpha beta gamma) = e^(-i m alpha) d_(m m')^((j)) (beta) e^(-i m' gamma)\
  $
  $d_(m m')^((j))$为
  $
    d_(m m')^((j)) (beta) = sum_k (-1)^k sqrt((j+m)! (j-m)! (j+m')! (j-m')!) / ((j+m-k)! (j-m'-k)! k! (k-m+m')!) \ (cos beta / 2)^(2j + m - m' - 2k) (sin beta / 2)^(2k - m + m')
  $
  有对称性：
  - $d^((j))_(m m') (beta) = (-1)^(m - m') d^((j))_(m' m) (beta)$
  - $d^((j))_(m m') (beta) = d^((j))_(-m' -m) (beta)$
  - $d^((j))_(m m') (-beta) = d^((j))_(m' m) (beta)$
  - $d^((j))_(m m') (pi - beta) = (-1)^(j - m') d^((j))_(-m' m) (beta)$

#proposition(subname: [SO(3)群的单值表示])[
  对于$"SO"(3)$群的任意元素$g(alpha, beta, gamma)$，在函数基
  $
    f^j (vb(r)) = {f_m^j (x_1, x_2) | m = -j, -j+1, ..., j}\
    f_m^j (x_1, x_2) = (x_1^(j+m) x_2^(j-m)) / sqrt((j+m)! (j-m)!)
  $
  其中$j$为非负整数，下的表示为
  $
    D^((j))_(m m') (alpha, beta, gamma) = e^(-i m alpha) d_(m m')^((j)) (beta) e^(-i m' gamma)
  $
  是$"SO"(3)$的表示。
]

2. 当$j$为半整数的时候

  #diagram($
    & u edge(->) & A^((j)) (u) edge(->)& A^((j)) (u) = D^((j)) (alpha, beta, gamma) \
    g(alpha, beta, gamma)edge("ur", ->)edge("dr", ->) & &&\
    & u edge(->) & A^((j)) (-u) edge(->)& - A^((j)) (u) = - D^((j)) (alpha, beta, gamma) \
  $)

  $D^((j))(u)$和$D^((j))(-u)$差一个负号，因此，$g(alpha, beta, gamma)$对应到两个不同的矩阵$plus.minus D^((j)) (alpha, beta, gamma)$，不满足群表示的定义，所以$j$为半整数时的$D^((j))$不是$"SO"(3)$的表示。

  例如$g(alpha,beta,gamma)=g(alpha+2pi,beta,gamma)$ 代表同一个旋转，但它们对应的矩阵却不相等（相
差一个负号），$D^((j))(alpha+2pi,beta,gamma)=-D^((j))(alpha,beta,gamma)$。

如果我们推广群表示的定义，即允许群元素与矩阵的对应关系可以相差一个正负号（乘法规律也会相差一个负号），那么$j$为半整数时的$D^((j))$也可以看作是$"SO"(3)$的一个广义表示。我们称这种表示为*双值表示*。

#note[
  双值表示的双由$2:1$的同态给出。

  在4维球面上，$"SU"(2)$是单连通的，$"SO"(3)$是双连通的。

  称覆盖群为$"SU"(2)$，称被覆盖群为$"SO"(3)$。
]

== SU(2) 与 O(3) 群的Lie代数方法

=== Lie代数的定义

#definition(subname: [Lie代数])[
  设 $g$ 是数域 $KK$ 上的线性空间。对于 $x , y in g$ ，定义它们的乘法运算为 $[x , y] = x y - y x$ 。称 $g$ 为*Lie代数*，若该运算满足如下条件：
  - 封闭性
    $
      forall x, y in g, [x , y] in g
    $
  - 双线性
    $
      [a x + b y , z] = a [x , z] + b [y , z], [z , a x + b y] = a [z , x] + b [z , y], a, b in KK
    $
  - 反对易性
    $
      [x , y] = - [y , x]
    $
  - Jacobi 恒等式
    $
      [[x , y] , z] + [[y , z] , x] + [[z , x] , y] = 0
    $
  则称二元运算$[x,y]$为*Lie积*，或*对易子*。
]

#note[
  Lie群是群和流形的结合。Lie代数是线性空间加上Lie积的结构。
]

#definition(subname: [Lie代数的生成元])[
  Lie代数的线性空间的基称为其*生成元*${X_1, X_2, ..., X_n}$
  $
    g = {sum_i alpha_i X_i | alpha_i in KK, i = 1, 2, ..., n}
  $
  独立的基矢量的个数 $n$ 称为Lie代数 $g$ 的*维数*。称Lie积
  $
    [X_i,X_j] = sum_(k=1)^n C_(i j)^k X_k
  $
  为$g$的*代数结构*，其中$C_(i j)^k$是*结构系数*，共$n^3$个，决定了Lie代数的分类。
]

群的代数结构是Cayley表；而Lie代数的代数结构是Lie积，事实上也是一个乘法表。

#proposition(subname: [Lie群结构系数的性质])[
  - $
      C_(i j)^k = - C_(j i)^k
    $
  - $
      sum_(k=1)^n (C_(i j)^k C_(k q)^p + C_(j q)^k C_(k i)^p + C_(q i)^k C_(k j)^p) = 0
    $
]

#note[
  类似Taylor展开的分析手段，从整体到局部，按此方法可以从Lie群得到Lie代数：研究*单位元邻域中的群结构*，即线性化。
]

#newpara()

Lie代数理论是以Lie三定理为基础的。此三定理表明：*Lie群的无穷小群元素满足上述Lie代数的定义。*实际上，Lie代数刻画的是Lie群在单位元邻域的性质。Lie代数的生成元的个数等于相应Lie群的群参数个数。

#proposition(subname: [Lie群的生成元])[
  对于一般的Lie群$G$，其群元和群参数是
  $
    g(vb(alpha)) = g(a_1, a_2, ..., a_n), g(0) = e
  $
  可以用Taylor展开
  $
    f(x) = f(x_0) + f'(x_0) (x - x_0) + ...\
    g(vb(alpha)) = g(0) + sum_r alpha_r X_r + ... , X_r = eval(pdv(g(vb(alpha)), alpha_r))_(vb(alpha)=0)
  $
  这就得到了生成元$X_r$。
]

#newpara()

本章的任务是以最简单的Lie群$"SU"(2)$与$"O"(3)$为例，寻找它们的Lie代数结构，并研究Lie代数的表示，以及与各自群表示的联系等。

=== $"SU"(2)$ 群的Lie代数结构

$"SU"(2)$定义为
$
  "SU"(2) = {u in "GL"(2,CC) | u^dagger u = u u^dagger = E, det(u) = 1}
$
在单位元邻域的群元素可以写成 $2$ 阶单位矩阵 $E$ 与无穷小矩阵 $M$ （需要确定）之和，即
$
  E - i M
$
由么正条件，并略去二阶及二阶以上无穷小量，
$
  (E - i M)^dagger (E - i M) = (E + i M^dagger) (E - i M) = E + i M^dagger - i M + O(M^2) = E
$
即
$
  M^dagger = M
$
即要求 $M$ 为 Hermitian 矩阵。下面为了使用$det u = 1$的性质，考虑二维的 Hermitian 矩阵可以用空间的一组基展开
#remark(subname: [二维的 Hermitian 矩阵的基])[
  二维的 Hermitian 矩阵可以用空间的一组基展开
  $
    E = mat(1, 0; 0, 1), sigma_x = mat(0, 1; 1, 0), sigma_y = mat(0, -i; i, 0), sigma_z = mat(1, 0; 0, -1)
  $
  进一步所有 Pauli 矩阵为二维的零迹 Hermitian 矩阵空间的基。
]
#proof[
  需要说明其线性独立和完备性。独立性是显然的，完备性可以利用：
  $
    [sigma_i, sigma_j] = 2 i epsilon_(i j k) sigma_k
  $
  或者考虑公式
  $
    (vb(r) dot vb(sigma))(vb(r)' dot vb(sigma)) = vb(r) dot vb(r)' + i (vb(r) times vb(r') dot vb(sigma))\
  $
  也可以说明其完备性。
]
$M$可以写成
$
  M = delta_0 E + vb(delta) dot vb(sigma) = mat(delta_0 + delta_z, delta_x - i delta_y; delta_x + i delta_y, delta_0 - delta_z)
$
考虑
$
  det(E - i M) = det mat(1 - i delta_0 - i delta_z, -i delta_x - delta_y; -i delta_x + delta_y, 1 - i delta_0 + i delta_z) = 1 - 2 i delta_0 = 1
$
即
$
  delta_0 = 0
$
于是有
$
  M = vb(delta) dot vb(sigma) = mat(delta_z, delta_x - i delta_y; delta_x + i delta_y, -delta_z)
$
与$"SU"(2)$ 的单位元 $E$ 无限接近的群元素可用三个参数$delta_x, delta_y, delta_z$由$sigma_x, sigma_y, sigma_z$生成，即
$
  E - i vb(delta) dot vb(sigma)
$
从而
#proposition(subname: [$"SU"(2)$的Lie代数$"su"(2)$与代数结构])[
  容易验证$sigma_i$在Lie积下满足满足双线性，反对易性和 Jacobi 恒等式，$"SU"(2)$的*代数*是
  $
    "su"(2) = {sigma_x, sigma_y, sigma_z}\
  $
  其*代数结构*是
  $
    [sigma_i, sigma_j] = 2 i epsilon_(i j k) sigma_k
  $
]

这样，$"su"(2)$的任意元素$X$都可以由生成元$sigma_i$线性组合而成
$
  X = vb(r) dot vb(sigma) = mat(z, x-i y; x+i y, -z)
$
其中$vb(r) = mat(x; y; z) in E^3$且，$r = sqrt(x^2+y^2+z^2)$。

现在考虑 $"su"(2)$ 的生成元与 $"SU"(2)$ 群的元素间联系。

考虑到*无穷小线性变换*的无穷多次乘积为一有限变换，并利用极限定义
$
  lim_(n->oo) (1 + T / n)^n = e^T
$
可以有
$
  lim_(n->oo) (E - i X / n)^n &= e^(-i X) =e^(- i vb(r) dot vb(sigma)) = sum_(n=0)^oo ( - i vb(r) dot vb(sigma))^n / n!\
  &= mat(cos r - i z / r sin r, -i x / r sin r - y / r sin r; -i x / r sin r + y / r sin r, cos r + i z / r sin r)\
$
此二阶方阵满足幺正条件，且其行列式为 1，所以 $e^(- i vb(r) dot vb(sigma))in"SU"(2)$ 群元素。

#proposition(subname: [SU(2)群元素与$"su"(2)$的关系])[
  $"SU"(2)$ 群的任意元素 $u$ 可以用指数映射
  $
    u = e^(- i vb(r) dot vb(sigma))\
  $
  来表示，其中 $vb(r) = mat(x; y; z)$。
]

#note[
  #diagram($
    "SU"(2) edge("r", #[Taylor], ->, bend: #10deg) &edge("l", #[Exp], ->, bend: #10deg) "su"(2)\
  $)

  一般地，一个Lie群进行线性化就给出了一个Lie代数，反之一个Lie代数也可以通过指数映射给出一个Lie群。
]

有
$
  g(alpha beta gamma) = C_k (alpha) C_j (beta) C_k (gamma) = u_1 (alpha) u_2 (beta) u_1 (gamma) = e^(- i alpha sigma_z) e^(- i beta sigma_y) e^(- i gamma sigma_z) = U(alpha beta gamma)
$
以及
$
  g(theta phi psi) = C_k (phi) C_j (theta) C_k (psi) C_j^(-1) (theta) C_k^(-1) (phi) = U(theta phi psi) = cos psi / 2 - i (vb(r) dot vb(sigma)) sin psi / 2
$

=== $"SO"(3)$的代数结构

$"SO"(3)$的定义为
$
  "SO"(3) = {A in "GL"(3,RR) | A^TT A = A A^TT = E, det(A) = 1}
$
在单位元邻域的群元素可以写成三阶单位矩阵 $E$ 与无穷小矩阵 $M$ 之和，即
$
  E + M
$
由正交条件，并略去二阶及二阶以上无穷小量，得到
$
  M^TT + M = 0
$
即要求 $M$ 是一个反对称矩阵。

选择三维实空间中的一组独立的反对称矩阵
$
  I_x = mat(0, 0, 0; 0, 0, -1; 0, 1, 0), I_y = mat(0, 0, 1; 0, 0, 0; -1, 0, 0), I_z = mat(0, -1, 0; 1, 0, 0; 0, 0, 0)
$
它们是反Hermitian矩阵$I_i^dagger = -I_i$，这样$M$
$
  M = delta vb(psi) dot vb(I) = delta psi vb(n) dot vb(I)
$
其中$delta vb(psi) = mat(delta psi_x; delta psi_y; delta psi_z)$是一阶无穷小矢量，$vb(n) = mat(cos theta sin phi; sin theta sin phi; cos phi)$，$I = mat(I_x; I_y; I_z)$。所以，与 $"SO"(3)$ 的单位元无限接近的群元素写为
$
  E + delta vb(psi) dot vb(I)
$
若将 $I_i$ 变成Hermitian的
$
  J_i = i I_i
$
具体形式为
$
  J_x = mat(0, 0, 0; 0, 0, -i; 0, i, 0), J_y = mat(0, 0, i; 0, 0, 0; -i, 0, 0), J_z = mat(0, -i, 0; i, 0, 0; 0, 0, 0)
$
它们满足$J_i^dagger = J_i$，那么与 $"SO"(3)$ 的单位元无限接近的群元素为
$
  E - i delta vb(psi) dot vb(J)
$

最终得到
$
  C_vb(n) (psi) = e^(- i psi vb(n) dot vb(J))
$

#proposition(subname: [SO(3)的Lie代数])[
  $"SO"(3)$的*Lie代数*是
  $
    "so"(3) = {J_x, J_y, J_z}\
  $
  其*代数结构*是
  $
    [J_i, J_j] = i epsilon_(i j k) J_k
  $
]

$
  g(alpha beta gamma) = e^(- i alpha J_z) e^(- i beta J_y) e^(- i gamma J_z) = C_k (alpha) C_j (beta) C_k (gamma)\
$

实际上，$J_i$就是量子力学中我们熟知的角动量算符 $vb(J)$ 的三个分量，所以有的文献上也称$"o"(3)$ 为角动量代数。

同样可以证明：把绕 $vb(n)$ 轴的无穷小旋转连续操作无穷多次将给出绕 $vb(n)$ 轴的一个有限旋转
$
  lim_(n->oo) (E - i (vb(psi) dot vb(J)) / m)^m = e^(- i psi vb(n) dot vb(J)) = C_vb(n) (psi)
$
和前面的矩阵一致。

=== $"su"(2)$和$"o"(3)$的同构

与群的同构概念类似，Lie代数也可以定义同构的概念：若两个Lie代数 $g$ 与 $g'$ 的生成元之间存在一一对应关系，且此对应关系保持Lie积不变，则称 $g$ 与 $g'$ 是同构的，记作 $g tilde.equiv g'$。

两个同构的Lie代数从抽象数学的角度讲是完全一样的。

重新标度$"su"(2)$的生成元
$
  vb(J)' = 1 / 2 vb(sigma)
$
那么$vb(J)'$满足与 $"o"(3)$ 的生成元 $vb(J)$ 相同的对易关系，从而
#proposition(subname: [su(2)与o(3)的同构])[
  $"su"(2)$与$"o"(3)$是同构的，记作
  $
    "su"(2) tilde.equiv "o"(3)
  $
]

Lie代数 $"su"(2)$ 和 $"o"(3)$ 的生成元通过指数映射将分别得到Lie群 $"SU"(2)$ 和 $"SO"(3)$ 的元素，且形式上很像

#figure(
  three-line-table[
    | Lie代数 | 生成元 | Lie群 | 群元素 |
    | --- | --- | --- | --- |
    | $"su"(2)$ | $vb(sigma)$ | $"SU"(2)$ | $e^(- i vb(r) dot vb(sigma)) = e^(- i vb(r)' dot vb(J)')$ |
    | $"o"(3)$ | $vb(J)$ | $"SO"(3)$ | $e^(- i vb(r) dot vb(J))$ |
  ],
  caption: "su(2)与o(3)的同构关系",
)

$"su"(2)$的$vb(r)'$的参数空间是$RR^3$中的一个半径为$2 pi$的球。
- 球心在原点，$r=0$对应$"SU"(2)$的单位元
- 球内每一点与$"SU"(2)$群元有一一对应关系
- 球面上的所有点$2 pi vu(r)'$都和$"SU"(2)$的$-E$对应
$"o"(3)$的$vb(psi)$的参数空间是$RR^3$中的一个半径为$pi$的球。
- 球心在原点，$psi=0$对应$"SO"(3)$的单位元
- 球内每一点与$"SO"(3)$群元有一一对应关系
- 球面上的所有点$pi vb(n)$和$-pi vb(n)$对应同一个元素

尽管它们在单位元邻域同构，但它们各自映射参数的取值范围不同，所以由它们生成的$"SU"(2)$和$"SO"(3)$的群元素是不同的。

#note[
  #diagram($
    "SU"(2)"单连通" edge("d", approx, <->) edge("r", tilde^(2:1), <-->)& "SO"(3)"多联通" edge("dl", approx, <-->) \
    "su"(2) tilde.equiv "so"(3)\
  $)

  事实上，一般的Lie群有这样的性质，对于同一个Lie代数，诱导出的Lie群只有唯一一个单连通的，其他都是多连通的。

  也就是说，虽然拓扑不同，但是在0附近的性质是一样的。
]
=== $"o"(3)$ 的不可约表示

与Lie群的任务类似，研究Lie代数主要任务也是计算Lie代数的不可约Hermitian表示。
$
  U = e^(- i vb(r) dot vb(J))\
$
如果$U$是酉的，$J$就是Hermitian的。所以我们对于Lie代数，要求其不等价的不可约的Hermitian表示。

Lie群与其Lie代数的关系告诉我们：只要计算出Lie代数表示（即生成元的矩阵表示），原则上就可以利用指数映射得到相应的Lie群表示。

求表示的基本步骤：
- 选择一组基；
- 把Lie代数的生成元作用到基上，再用基展开。

==== 角动量方法

已知 $"o"(3)$ 的生成元为Hermitian算符$J_i$
$
  [J_i, J_j] = i epsilon_(i j k) J_k
$
引入角动量算符
$
  vb(J)^2 = J_x^2 + J_y^2 + J_z^2
$
其特点是与$J_i$都对易
$
  [vb(J)^2, J_i] = 0
$
称为$"o"(3)$的 *Casimir 算符*。以及升降算符（$J_i$的*球谐形式*）
$
  J_(plus.minus 1) = minus.plus 1 / sqrt(2) (J_x plus.minus i J_y)\
  J_0 = J_z\
$
对易关系变成（球谐形式）
$
  [J_0, J_(plus.minus 1)] = plus.minus J_(plus.minus 1)\
  [J_(plus 1), J_(minus 1)] = - J_0\
$
以及
$
  J_0^dagger = J_0, J_(plus.minus 1)^dagger = J_(minus.plus 1)\
$
#newpara()
${vb(J)^2,J_z}$是一个*完备集*，存在*共同本征态*
$
  ket(phi m)\
$
有
$
  vb(J)^2 ket(phi m) &= phi ket(phi m)\
  J_z ket(phi m) &= m ket(phi m)\
$
作用为$J_i (i=0,plus.minus 1)$，考虑到
$
  [J_0, J_(plus.minus 1)] ket(phi m) &= plus.minus J_(plus.minus 1) ket(phi m)\
  J_0 J_(plus.minus 1) ket(phi m) &= (m plus.minus 1) J_0 ket(phi m)\
$
从而
$
  J_(plus.minus 1) ket(phi m) tilde ket(m plus.minus 1)
$
因 $J_(plus.minus)$ 只改变 $J_0$ 的本征值 $m$ ，而不改变 $vb(J)^2$ 的本征值 $phi$，所以称 $J_(+1)$ 为*升算符*，$J_(-1)$ 为*降算符*。

又考虑到
$
  braket(phi m, J_(+1) J_(-1), phi m) &= braket(phi m, J_(-1) J_(+1), phi m) - m\
  braket(phi m, J_(+1), phi m-1) braket(phi m-1, J_(-1), phi m) &= braket(phi m, J_(-1), phi m+1) braket(phi m+1, J_(+1), phi m) - m
$
利用厄米共轭条件
$
  braket(phi m, J_(+1), phi m-1) = braket(phi m-1, J_(+1)^dagger, phi m)^* = - braket(phi m-1, J_(-1), phi m)^*\
$
可得 $J_(plus.minus 1)$ 的矩阵元满足如下递推关系：
$
  abs(braket(phi m-1, J_(-1), phi m))^2 = abs(braket(phi m, J_(-1), phi m+1))^2 + m\
  abs(braket(phi m+1, J_(+1), phi m))^2 = abs(braket(phi m, J_(+1), phi m-1))^2 - m\
$
由于是有限维不可约表示空间，故$m$有最大值（最高权）$overparen(m)$和最小值（最低权）$underparen(m)$。当 $m$ 取最大值 $overparen(m)$ 时，有
$
  braket(phi overparen(m), J_(-1), phi overparen(m) + 1) = 0\
$
以及
$
  abs(braket(phi overparen(m) - 1, J_(-1), phi overparen(m)))^2 = overparen(m)\
  abs(braket(phi overparen(m)-2, J_(-1), phi overparen(m) -1))^2 = 2 overparen(m) - 1\
  abs(braket(phi overparen(m)-3, J_(-1), phi overparen(m) -2))^2 = 3 overparen(m) - 3\
$
得到
$
  abs(braket(phi overparen(m) - (i+1), J_(-1), phi overparen(m) - i))^2 = (i+1) (overparen(m) - i / 2)
$
设 $m$ 是最小值 $underparen(m) = overparen(m) - i_0$，则
$
  abs(braket(phi overparen(m) - (i_0 + 1), J_(-1), phi overparen(m) - i_0))^2 =0
$
得到
$
  i_0 = 2 overparen(m), underparen(m) = - overparen(m)\
$
同理，对升算符有
$
  abs(braket(phi underparen(m) + (i+1), J_(+1), phi underparen(m) + i))^2 = - (i+1) (underparen(m) + i / 2)\
$
通常记最高权为$j = overparen(m)$，最低权为$-j = underparen(m)$，$i_0$为整数则有$j$为半整数
$
  j = 0, 1 / 2, 1, 3 / 2, 2, ...\
$
对于给定的$j$，$m$的取值范围为
$
  m = -j, -j+1, ..., j
$
矩阵元可以写为
$
  abs(braket(phi m - 1, J_(-1), phi m))^2 = 1 / 2 (j+m) (j-m + 1)\
  abs(braket(phi m + 1, J_(+1), phi m))^2 = 1 / 2 (j-m) (j+m + 1)\
$
但上两式只能决定到平方项，还有相因子不能确定。通常选取* Conden-Shortley 惯例*，于是得到
$
  braket(phi m - 1, J_(-1), phi m) = sqrt(1 / 2 (j+m) (j-m + 1))\
  braket(phi m + 1, J_(+1), phi m) = - sqrt(1 / 2 (j-m) (j+m + 1))\
$
最后计算 $vb(J)^2$ 在基 $ket(phi m)$ 上的本征值。有
$
  phi &= braket(phi m, vb(J)^2, phi m) = braket(phi m, -J_(+1) J_(-1) - J_(-1) J_(+1) + J_0^2, phi m)\
  &= (j-m) (j+m + 1) + m (m + 1) \
  &= j (j + 1)\
$
$phi$ 只与最高权 $j$ 有关，而与 $m$ 无关。$j$决定了不可约表示，所以*可以用$j$来标记$"o"(3)$的不可约表示*。相应的不可约表示空间$V^j$的基矢量为
$
  ket(j m) = ket(phi m)\
$
其维数是 $2j+1$。

所有的结果总结为
#proposition(subname: [o(3)的不可约表示])[
  $"o"(3)$的不可约表示为
  - 基矢量 $ket(j m)$，其中 $j = 0, 1 / 2, 1, 3 / 2, 2, ...$，$m = -j, -j+1, ..., j$
  $
    vb(J)^2 ket(j m) = j (j + 1) ket(j m)\
    J_0 ket(j m) = m ket(j m)\
    braket(j m-1, J_(-1), j m) = sqrt(1 / 2 (j+m) (j-m + 1))\
    braket(j m + 1, J_(+1), j m) = - sqrt(1 / 2 (j-m) (j+m + 1))\
  $
]
这样就得到了 $"o"(3)$ 在基 $ket(j m)$ 上的不可约表示。

不可约可以用不变子空间验证。对$j$相同的基向量，$J_(plus.minus 1)$作用下，最小的非平凡不变子空间就是${ket(j m) | m = -j, -j+1, ..., j}$，所以$j$是不可约的。

#note[
  由于$"SU"(2)$的群表示为$A^((j)), j=0,1 / 2,1,...$，并且$"su"(2)$的表示$j =0,1 / 2,1,...$，二者一一对应，似乎$j$就给出所有$"su"(2)$的不可约表示。

  物理上，$"so"(3)$的表示为$j=0,1,2,...$和$"SO"(3)$进行对应。
]

我们说*$j$是不可约表示的标记*：
- $j$是一个数
- 每一个表示和$j$一一对应

#figure(
  image("pic/2025-05-16-08-06-48.png", width: 50%),
  caption: [升算子$J_(+1)$和降算子$U_(-1)$在基$ket(j m)$上的而作用行为。每一行代表一个不可约表示$j$，最右端的点该表最高权态$ket(j j)$，最左端的点代表最低权态$ket(j -j)$。],
)

称氢原子/在中心势场中运动的粒子为*角动量系统*，
$
  Psi_(n,j,m)
$
这是由于角动量守恒$J_i$，$"so"(3)$的不可约表示为角动量的不可约表示，不可约表示的标记$j$就是角动量的量子数。

#figure(
  three-line-table[
    | 角动量 | Lie代数 |
    | --- | --- |
    | 三个分量$J_i$ | 生成元 $X_i$ |
    | 角动量的对易关系 $[J_i, J_j] = i epsilon_(i j k) J_k$ | 代数结构 $[X_i, X_j] = C_(i j)^k X_k$ |
    | 角动量平方 $J^2$，$[J^2,J_i]=0$ | Casimir算符 $C_g$，$[C_g,X_i]=0$ |
    | 升降算符 $J_(plus.minus) = J_1 plus.minus i J_2$ | 升降算符 $E_(plus.minus q) = sum C_i X_i$|
    | 完备集 ${J^2, J_3}$ | 完备集 ${C_g^((1)), C_g^((2)), ..., underbrace(#[$H_1, H_2, ...$], [H_1, H_j] = 0) }$ Cartan算符$H_i$ |
    | 共同本征态 ${ket(j m)}$ | 共同本征态 ${ket(vb(alpha))}$ |
    | 作用 $expval(J_(plus.minus))$ | 作用 $expval(E_(plus.minus q))$ |
  ],
  caption: [角动量和 Lie 代数的关系],
)

#figure(
  three-line-table[
    | Lie 群 | Lie 代数 |
    | --- | --- |
    | $U_n$ | $A_(n-1)$ |
    | $"SO"$ | $B_n$ , $D_n$ Gelfond|
    | $S_P_(2n)$ | $C_n$ |
  ],
  caption: [Lie 群和 Lie 代数的关系],
)

==== Boson实现方法

*Heisenberg代数*：Boson算符$a$与其Hermitian共轭算符$a^dagger$与粒子数算符$N=
a^dagger a$满足对易关系
$
  [a, a^dagger] = 1\
  [N,a^dagger] = a^dagger\
  [N,a] = - a\
$
#note[
  Heisenberg代数${1,a,a^dagger,n}$是一个特殊的Lie代数。

  $N$不是Casimir算符，因为$[N,a]!=0$
]
其表示${ket(n) | n=0,1,...}$
$
  N ket(n) = n ket(n)\
  ket(n) = (a^dagger)^n / sqrt(n!) ket(0)\
$
产生湮灭算符。作用为
$
  a ket(n) = sqrt(n) ket(n-1)\
  a^dagger ket(n) = sqrt(n+1) ket(n+1)\
$
#newpara()

做二次量子化，力学量用Boson子展开。Schwinger发现：角动量算符$vb(J)$的三个分量可以用两组不同的Boson子算符$a_i, a_i^dagger$描述
$
  vb(J) = 1 / 2 A^dagger vb(sigma) A
$
其中
$
  A = mat(a_1; a_2), vb(sigma) = mat(sigma_x; sigma_y; sigma_z)\
$
$vb(sigma)$为Pauli矩阵。展开上式，并写成升降算符的形式
$
  J_(+1) = - 1 / sqrt(2) J_+ = - 1 / sqrt(2) (a_1^dagger a_2)\
  J_(-1) = 1 / sqrt(2) J_- = 1 / sqrt(2) (a_2^dagger a_1)\
  J_0 = 1 / 2 (a_1^dagger a_1 - a_2^dagger a_2) = 1 / 2 (N_1 - N_2)\
  vb(J)^2 = 1 / 4 (N_1 + N_2) (N_1 + N_2 + 2)\
$
不难验证它们满足 $"o"(3)$ 的对易关系式，称之为*角动量算符的Boson子实现*。

设$ket(n_1 n_2)$为总粒子数算符$N=N_1+N_2$的属于本征值$n=n_1+n_2$的本征态
$
  ket(n_1 n_2) = ((a_1^dagger)^(n_1) (a_2^dagger)^(n_2)) / sqrt(n_1! n_2!) ket(0 0)\
$
由于$N$与$vb(J)^2$和$J_0$对易，所以$ket(n_1 n_2)$也是 $vb(J)^2$和$J_0$的共同本征态，有
$
  J_0 ket(n_1 n_2) = 1 / 2 (n_1 - n_2) ket(n_1 n_2)\
  vb(J)^2 ket(n_1 n_2) = 1 / 4 (n_1 + n_2) (n_1 + n_2 + 2) ket(n_1 n_2)\
$
就有*量子数对应关系*
$
  m = 1 / 2 (n_1 - n_2), j = 1 / 2 (n_1 + n_2)\
$
这样
$
  ket(j m) = ((a_1^dagger)^(j+m) (a_2^dagger)^(j-m)) / sqrt((j+m)! (j-m)!) ket(0 0)\
$
把$J_(plus.minus 1)$的Boson实现作用在$ket(j m)$上
$
  J_(-1) ket(j m) &= 1 / sqrt(2) (a_2^dagger a_1) ket(j m)\
  &= 1 / sqrt(2) sqrt((j-m+1)(j+m)) ((a_1^dagger)^(j+m-1) (a_2^dagger)^(j-m+1)) / sqrt((j+m-1)! (j-m+1)!) ket(0 0)\
  &= 1 / sqrt(2) sqrt((j-m+1)(j+m)) ket(j m-1)\
$
$
  J_(+1) ket(j m) &= 1 / sqrt(2) (a_1^dagger a_2) ket(j m)\
  &= - 1 / sqrt(2) sqrt((j+m+1)(j-m)) ((a_1^dagger)^(j+m+1) (a_2^dagger)^(j-m-1)) / sqrt((j+m+1)! (j-m-1)!) ket(0 0)\
  &= - 1 / sqrt(2) sqrt((j+m+1)(j-m)) ket(j m+1)\
$
其中用到了
$
  [a_i,(a_j^dagger)^k] = delta_(i j) k (a_j^dagger)^(k-1)\
$
这样，利用 $"o"(3)$ Boson子实现的方法，再次得到了$"o"(3)$在基$ket(j m)$上的不可约表示。

#note[
  Holstein-Primakoff实现
  $
    J_+ = sqrt(2j - N) a\
    J_- = a^dagger sqrt(2j-N)\
    J_z = j- N
  $
  但一组Boson子给出的本征值无法满足角动量的$j,m$的条件。（$n$组Boson子实现：$n=1$欠，$n>=3$过）
]

==== 微分方法

Boson子算符与*微分算符*之间存在对应关系。例如，对一维情况，有
$
  a <-> pdv(, x); a^dagger <-> x
$
因为它们满足相同的对易关系
$
  [a, a^dagger] = 1 <-> [pdv(, x),x] = 1\
$
但这种对应关系不是唯一的。

这样可以从角动量算符$vb(J)$的Boson子实现直接得到其微分实现
$
  J_(+1) = - 1 / sqrt(2) x_1 pdv(, x_2)\
  J_(-1) = 1 / sqrt(2) x_2 pdv(, x_1)\
  J_0 = 1 / 2 (x_1 pdv(, x_1) - x_2 pdv(, x_2))\
$
容易验证它们也满足 $"o"(3)$ 的对易关系式。

#remark(subname: [角动量的微分实现])[
  $
    vb(L) = vb(r) times vb(p) = vb(r) times (-i hbar vb(x))\
    L_z = - i hbar (x pdv(, y) - y pdv(, x))\
  $
]

角动量的微分实现的作用空间应该是坐标函数空间：
$
  ket(j m) = (x_1^(j+m) x_2^(j-m)) / sqrt((j+m)! (j-m)!) = f_m^j (x_1, x_2)\
$
把$J_0,J_(plus.minus 1)$的微分实现分别作用到$ket(j m)$上，可以得到
$
  J_0 ket(j m) &= 1 / 2 (x_1 pdv(, x_1) - x_2 pdv(, x_2)) ket(j m) \
  &= m (x^(j+m) x_2^(j-m)) / sqrt((j+m)! (j-m)!)\
  &= m ket(j m)
$
$
  J_(+1) ket(j m) &= - 1 / sqrt(2) x_1 pdv(, x_2) ket(j m)\
  &= - 1 / sqrt(2) sqrt((j+m+1)(j-m)) (x_1^(j+m+1) x_2^(j-m-1)) / sqrt((j+m+1)! (j-m-1)!)\
  &= - 1 / sqrt(2) sqrt((j+m+1)(j-m)) ket(j m + 1)\
$
$
  J_(-1) ket(j m) &= 1 / sqrt(2) x_2 pdv(, x_1) ket(j m)\
  &= 1 / sqrt(2) sqrt((j-m+1)(j+m)) (x_1^(j+m-1) x_2^(j-m+1)) / sqrt((j+m-1)! (j-m+1)!)\
  &= 1 / sqrt(2) sqrt((j-m+1)(j+m)) ket(j m - 1)\
$
利用$"o"(3)$的微分算符实现也得到了$"o"(3)$的在基矢量$ket(j m)$上的不可约表示。

=== $"o"(3)$不可约表示与$"SO"(3)$不可约表示的关系

从微分实现的角度已经看到，基 $ket(j m)$ 与函数基 $f_m^j$ 是一样的，所以 $"SO"(3)$ 群的表示为
$
  D_(m' m)^j (alpha,beta,gamma) &= braket(j m', R(alpha, beta, gamma), j m)\
  &= braket(j m', e^(- i alpha J_z) e^(- i beta J_y) e^(- i gamma J_z), j m)\
  &= braket(j m', e^(- i alpha J_z), j m') braket(j m', e^(- i beta J_y), j m) braket(j m, e^(- i gamma J_z), j m)\
  &= e^(- i m' alpha) braket(j m', e^(- i beta J_y), j m) e^(- i m gamma)\
  &= e^(- i m' alpha) d_(m' m)^j (beta) e^(- i m gamma)\
$
因此利用$"o"(3)$的不可约表示，即 $J_y$ 的矩阵表示，就可以得到$"SO"(3)$群的不可约表示。

#example(subname: [$j=1 / 2$的表示])[
  不可约表示空间$V^(1 / 2)$是二维的，其基矢量为
  $
    ket(1 / 2 1 / 2), ket(1 / 2 -1 / 2)
  $
  $"o"(3)$ 的不可约矩阵
  $
    J_(+1) = - 1 / sqrt(2) mat(0, 1; 0, 0), J_(-1) = - 1 / sqrt(2) mat(0, 0; 1, 0)
  $
  将它们组合成$J_y$的表示矩阵
  $
    J_y = i / 2 mat(0, 1; -1, 0)\
  $
  于是计算可得
  $
    e^(i beta J_y) = e^(beta / 2 mat(0, -1; 1, 0)) = mat(cos(beta / 2), -sin(beta / 2); sin(beta / 2), cos(beta / 2))\
  $
  这就是$d^((1 / 2))(beta)$矩阵。
]

== $"SO"(3)$ 群表示的直积

=== 两个不可约表示的直积

一个群$cal(G)$的不可约的酉表示$A^((s))$就有
$
  A^((i)) times.circle A^((j)) = sum_l plus.circle a_k A^((k))
$
可以利用特征标求出其系数。

$"SO"(3)$群的不可约表示$D^((j))$是一个酉表示，所以其两个不可约表示$D^((j_1)), D^((j_2))$的直积$D^((j_1)) times.circle D^((j_2))$也是一个酉表示，但一般是可约的。

可以进一步分解为不可约表示的直和
$
  D^((j_1)) times.circle D^((j_2)) = sum_(j) plus.circle a_j D^((j))\
$

#note[物理上的理解是，两个有对称性的群表示的直积一般无对称性。]

$D^((j))$的特征标是
$
  chi^((j)) (phi) = Tr D^((j)) (phi,0,0) = sum_(m=-j)^j e^(- i m phi)\
$
从而直积的特征标为
$
  chi^((j_1 times j_2)) (phi) &= chi^((j_1)) (phi) chi^((j_2)) (phi)\
  &= sum_(m_1=-j_1)^(j_1) e^(- i m_1 phi) sum_(m_2=-j_2)^(j_2) e^(- i m_2 phi)\
  &= sum_(m_1 =-j_1)^(j_1) sum_(m_2=-j_2)^(j_2) e^(- i (m_1+m_2) phi)\
  &= sum_(j=abs(j_1-j_2))^(j_1+j_2) sum_(m=-j)^(j) e^(- i m phi)\
  &= sum_(j=abs(j_1-j_2))^(j_1+j_2) chi^((j)) (phi)\
$
式中求和指标替换的简单解释见 @直积指标变换。

#figure(
  image("pic/2025-05-21-10-06-23.png", width: 80%),
  caption: [直积的特征标的求和指标替换],
)<直积指标变换>

上式表明 $j$ 只能取如下$2 min(j_1, j_2) + 1$个值
$
  j = abs(j_1-j_2), abs(j_1-j_2)+1, ..., j_1+j_2
$
其中每个值出现的次数均为$1$，即$a_j = 1$。

也就是说，$D^((j_1)) times.circle D^((j_2))$的不可约表示为
#theorem(subname: [Clebsch-Gordon 定理])[
  对于$"SO"(3)$群的不可约表示$D^((j_1))$和$D^((j_2))$，它们的直积表示为
  $
    D^((j_1)) times.circle D^((j_2)) = sum_(j=abs(j_1-j_2))^(j_1+j_2) plus.circle D^((j))\
  $
]

#note[
  在物理中，这事实上就是LS耦合和JJ耦合：
  $
    cases(j = abs(j_1-j_2) \, dots\, j_1+j_2, m = m_1 + m_2)\
  $
]

#remark(subname: [一个检验])[
  我们用维度来检验该分解
  $
    (2j_1 + 1)(2j_2 + 1) = sum_(j=abs(j_1-j_2))^(j_1+j_2) (2j + 1)\
  $
]

=== Clebsch-Gordon 系数

$D^((j_1)) times.circle D^((j_2))$是酉的，即存在酉矩阵$S$
$
  S (D^((j_1)) times.circle D^((j_2))) S^dagger = mat(
    D^((j_1+j_2)), O, ..., O;
    O, D^((j_1+j_2-1)), ..., O;
    O, dots.v, dots.down, dots.v;
    O, O, ..., D^((abs(j_1-j_2)));
  ) = M\
$

由于$D^((j_1)) times.circle D^((j_2))$的行和列是用两个指标$m_1, m_2$来标记的，所以矩阵$S$和$M$的行和列也都需要两个指标，它们分别是
$
  S_(j m, m_1 m_2)^(j_1 j_2) = S_(j m, m_1 m_2), M_(j' m', j m) = delta_(j' j) D_(m' m)^((j))\
$
分量形式为
$
  sum_(m_1' m_2' m_1 m_2) S_(j' m', m'_1 m'_2) (D^((j_1)) times.circle D^((j_2)))_(m_1' m_2', m_1 m_2) S^*_(j m, m_1 m_2) = delta_(j' j) D_(m' m)^((j))\
$
矩阵元$S_(j m, m_1 m_2)$称为$"SO"(3)$群的*Clebsch-Gordon系数*，简称*CG系数*。

从表示空间的角度看。

$psi_(j_1 m_1)$和$psi_(j_2 m_2)$是分别是荷载 $"SO"(3)$ 群的不可约表示 $D^((j_1))$和$D^((j_2))$的基，这样
$
  psi_(j_1 m_1 j_2 m_2) = psi_(j_1 m_1) psi_(j_2 m_2)\
$
就是荷载直积表示$D^((j_1)) times.circle D^((j_2))$的基。再设$psi_(j m)$是载荷$"SO"(3)$群相应不可约表示$D^((j))$的基（耦合基）。

那么，矩阵$S$的作用就是把非耦合基线性组合为耦合基，即
$
  psi_(j m) = sum_(m_1 m_2) S^*_(m_1 m_2, j m) psi_(j_1 m_1 j_2 m_2)\
$
利用 $S$ 的么正性，上式还可以写成
$
  psi_(j_1 m'_1 j_2 m'_2) = sum_(j' m') S_(j' m', m'_1 m'_2) psi_(j' m')\
$
利用 $D^((j))$的表达式，经过复杂的计算，可得到 $S$ 的显式为
$
  S_(j m, m_1 m_2) = delta_(m, m_1 + m_2) sqrt(((2j+1)(j+j_1-j_2)!(j-j_1+j_2)!(-j+j_1+j_2)!(j+m)!(j-m)!) / ((j+j_1+j+2+1)!(j_1+m_1)!(j_1-m_1)!(j_2+m_2)!(j_2-m_2)!)) \ times sum_k ((-1)^(j_1-m_!+k)(j+j_1-m_2-k)!(j_2_m_2+k)!) / (k!(j-m-k)!(j+j_1-j_2-k)!(k-j_1+j_2+m)!)\
$
在计算过程中，我们选择了 *Condon-Shortly 相因子*，即
$
  S_(j,j_1 - j_2,j_1,-j_2) = abs(S_(j,j_1 - j_2,j_1,-j_2))
$
所以矩阵 $S$ 是实么正的。

== 直积群的表示/耦合系统的角动量（角动量的耦合）

=== 两个角动量系统的耦合

考虑两个系统，他们有各自的旋转：
$
  P_i (alpha_i, beta_i, gamma_i) = e^(- i alpha_i J_(i z)) e^(- i beta_i J_(i y)) e^(- i gamma_i J_(i z))\
$
或者
$
  P_i (vb(n)_i, phi_i) = e^(- i phi_i vb(n)_i dot vb(J)_i)\
$
其中$vb(J)_1$和$vb(J)_2$是两个角动量系统的角动量算符。

系统 1 的旋转算符$P_1$和系统 2 的旋转算符$P_2$都构成旋转群$"SO"(3)_1, "SO"(3)_2$。$psi_(j_1 m_1) (vb(r)_1)$荷载$"SO"(3)_1$的$D^((j_1))$变换，$psi_(j_2 m_2) (vb(r)_2)$荷载$"SO"(3)_2$的$D^((j_2))$变换。有
$
  P_1 (alpha_1, beta_1, gamma_1) psi_(j_1 m_1) (vb(r)_1) = sum_(m'_1) D^((j_1))_(m'_1 m_1) (g_1) psi_(j_1 m'_1) (vb(r)_1)\
  P_2 (alpha_2, beta_2, gamma_2) psi_(j_2 m_2) (vb(r)_2) = sum_(m'_2) D^((j_2))_(m'_2 m_2) (g_2) psi_(j_2 m'_2) (vb(r)_2)\
$
如果这两个系统之间没有相互作用，那么描述该总系统的群应该是直积群
$
  "SO"(3)_1 times.circle "SO"(3)_2 (="SO"(4))
$
其元素为
$
  P (alpha_1, beta_1, gamma_1) times.circle P (alpha_2, beta_2, gamma_2)\
$
它有 6 个群参数：$alpha_1, beta_1, gamma_1, alpha_2, beta_2, gamma_2$。直积表示$D^((j_1)) times.circle D^((j_2))$是$"SO"(3)_1 times.circle "SO"(3)_2$的*不可约么正表示*。相应地，非耦合本征函数$psi_(j_1 m_1 j_2 m_2) (vb(r)_1, vb(r)_2) = psi_(j_1 m_1) (vb(r)_1) psi_(j_2 m_2) (vb(r)_2)$是按$D^((j_1)) times.circle D^((j_2))$变换的。

如果这两个系统之间有相互作用，使得它们*耦合*在一起作同样的旋转（$alpha_1=alpha_2$，$beta_1=beta_2$，$gamma_1=gamma_2$），那么描述该总系统的群应该是$"SO"(3)$，其元素为
$
  P (alpha, beta, gamma) = P_1 (alpha, beta, gamma) times.circle P_2 (alpha, beta, gamma) = e^(- i alpha J_(z)) e^(- i beta J_(y)) e^(- i gamma J_(z))\
$
其中
$
  vb(J) = vb(J)_1 + vb(J)_2\
$
是耦合系统的总角动量。称$P(alpha, beta, gamma)$为总旋转算符，有3个群参数。

#note[
  耦合成$"SO"(3)$是规定的。除此之外也可以耦合成${e}$，点群等等。这里我们讨论的是$"SO"(3)$的耦合。

  例如可以取$alpha_1=alpha_2, beta_1=beta_2=gamma_1=gamma_2=0$，就得到了$"SO"(2)$同样可以分解
  $
    D^((j_1)) times.circle D^((j_2)) = sum plus.circle C_m A^((m))
  $
]

由 $vb(J)$ 生成的 $"SO"(3)$ 群（总旋转群）是 $"SO"(3)_1 times.circle "SO"(3)_2$ 群（非耦合旋转群）的子群。
$
  "SO"(3) subset "SO"(3)_1 times.circle "SO"(3)_2\
$
从而$"SO"(3)_1 times.circle "SO"(3)_2$的不可约表示$D^((j_1)) times.circle D^((j_2))$也是$"SO"(3)$的一个表示，一般是可约的。

利用群表示直积的矩阵$S$，可将$D^((j_1)) times.circle D^((j_2))$的不可约表示分解为$"SO"(3)$的不可约表示
$
  psi_(j m) (vb(r)_1, vb(r)_2) = sum_(m_1 m_2) S_(m_1 m_2, j m) psi_(j_1 m_1 j_2 m_2) (vb(r)_1, vb(r)_2)\
$

#note[
  这个公式和上一小节的长得一样。但事实上他们的物理含义不同。一个是不可约表示的直积，一个是两个群的耦合。
]

=== 计算 CG 系数的代数方法

#figure(
  three-line-table[
    | \ | 群 | 代数 |
    | --- | --- | --- |
    | 非耦合 | $"SO"(3)_1 times.circle "SO"(3)_2$ |$"so"(3)_1 plus.circle "so"(3)_2$ |
    | 耦合 | $"SO"(3)$ | $"so"(3)$ |
  ],
  caption: [耦合和非耦合的关系],
)

#note[
  由于群元$e^(- i vb(J)_1 dot vb(r)) times e^(- i vb(J)_2 dot vb(r)) = e^(- i vb(J) dot vb(r))$。从而对于群是直积，而对于群代数是直和。
]
系统 1 的角动量$vb(J)_1$生成Lie代数（角动量代数）$"so"(3)_1$，系统 2 的角动量$vb(J)_2$生成Lie代数（角动量代数）$"so"(3)_2$，并且有对易关系
$
  [vb(J)_1, vb(J)_2] = 0\
$
#newpara()

非耦合的力学量完备集
$
  {vb(J)_1^2, J_(1z), vb(J)_2^2, J_(2z)}\
$
本征态为
$
  ket(j_1 m_1 j_2 m_2)
$
满足
$
  vb(J)_1^2 ket(j_1 m_1 j_2 m_2) = j_1 (j_1 + 1) ket(j_1 m_1 j_2 m_2)\
  J_(1z) ket(j_1 m_1 j_2 m_2) = m_1 ket(j_1 m_1 j_2 m_2)\
  vb(J)_2^2 ket(j_1 m_1 j_2 m_2) = j_2 (j_2 + 1) ket(j_1 m_1 j_2 m_2)\
  J_(2z) ket(j_1 m_1 j_2 m_2) = m_2 ket(j_1 m_1 j_2 m_2)\
$
若这两个体系*耦合在一起作同样的旋转*，那么耦合系统的总角动量
$
  vb(J) = vb(J)_1 + vb(J)_2\
$
生成的Lie代数$"so"(3)$，有力学量完备集
$
  {vb(J)^2, J_z, vb(J)_1^2, vb(J)_2^2}\
$
共同本征态为$ket(j m j_1 j_2) = ket(j m)$，满足
$
  vb(J)^2 ket(j m) = j (j + 1) ket(j m)\
  J_z ket(j m) = m ket(j m)\
  vb(J)_1^2 ket(j m) = j_1 (j_1 + 1) ket(j m)\
  vb(J)_2^2 ket(j m) = j_2 (j_2 + 1) ket(j m)\
$
设非耦合本征态与耦合本征态间由下式联系起来
$
  ket(j m) = sum_(m_1 m_2) S_(m_1 m_2, j m) ket(j_1 m_1 j_2 m_2)\
  S_(m_1 m_2, j m) = braket(j_1 m_1 j_2 m_2, j m)\
$
其中$braket(j_1 m_1 j_2 m_2, j m)$就是$"o"(3)$的 CG 系数，因为把上式投影到坐标空间，有
$
  braket(vb(r_1) vb(r_2), j m) = sum_(m_1 m_2) braket(j_1 m_1 j_2 m_2, j m) braket(vb(r_1), j_1 m_1) braket(vb(r_2), j_2 m_2)\
$
#newpara()

与量子力学中波函数的物理意义类似CG系数为某一时刻$ket(j_1 m_1)$和$ket(j_2 m_2)$耦合成$ket(j m)$的概率振幅，CG系数的平方为相应的概率。

下面来计算CG系数的显式。
1. 确定非零 CG 系数的选择定则
  - $m$ 的取值
    $
      J_z ket(j m) &= m ket(j m) = sum_(m_1 m_2) m ket(j_1 m_1 j_2 m_2) braket(j_1 m_1 j_2 m_2, j m)\
      J_z ket(j m) &= (J_(1z) + J_(2z)) sum_(m_1 m_2) ket(j_1 m_1 j_2 m_2) braket(j_1 m_1 j_2 m_2, j m)\
      &= sum_(m_1, m_2)(m_1 + m_2) ket(j_1 m_1 j_2 m_2) braket(j_1 m_1 j_2 m_2, j m)\
    $
    比较系数得
    $
      m = m_1 + m_2\
    $
  - $j$ 的取值
    $
      (2j_1 + 1)(2j_2 + 1) = sum_(j=abs(j_1-j_2))^(j_1+j_2) (2j + 1)\
    $
    其实就给出了$j$的取值范围
    $
      j = abs(j_1-j_2), abs(j_1-j_2)+1, ..., j_1+j_2\
    $
2. 计算 CG 系数
基本思路：将算符 $J_(plus.minus), J_(1 plus.minus), J_(2 plus.minus)$ 作用到$ket(j m)$式两边，可以得到 CG 系数满足的递推方程。之后化简即可，这里略去。

#note[
  CG系数有许多不同的名称和符号，如，*Wigner系数*或 *3j系数*
  $
    mat(j_1, j_2, j; m_1, m_2, m)\
  $
]

#proposition(subname: [CG系数的正交归一性])[
  $
    sum_(m_1, m_2) braket(j m, j_1 m_1 j_2 m_2) braket(j_1 m_1 j_2 m_2, j' m') = delta_(j j') delta_(m m')\
  $
  $
    sum_(j, m) braket(j_1 m_1 j_2 m_2, j m) braket(j m, j_1 m_1' j_2 m_2') = delta_(m_1 m_1') delta_(m_2 m_2')\
  $
  或者用3j系数
  $
    sum_(m_1, m_2) (2j + 1) mat(j_1, j_2, j; m_1, m_2, m) mat(j_1, j_2, j'; m_1, m_2, m') = delta_(j j') delta_(m m') delta(j_1 j_2 j)
  $
]

#proposition(subname: [Wigner 系数展现出的对称性])[
  $
    mat(j_1, j_2, j; m_1, m_2, m) = (-1)^(j_1+j_2+j) mat(j_2, j_1, j; m_2, m_1, m) = (-1)^(j_1+j_2+m) mat(j_1, j_2, j; -m_1, -m_2, -m)\
  $
  明显地，列的一次偶置换不改变3j系数的值。
]

#proposition(subname: [Wigner 符号与 Regge 符号的关系])[
  $
    mat(j_1, j_2, j; m_1, m_2, m) = mat(-j_1 + j_2 + j, j_1 - j_2 +j, j_1 + j_2 - j; j_1 + m_1, j_2 + m_2, j + m; j_1 - m_1, j_2 - m_2, j - m; delim: "[")\
  $
]


#remark(subname: [Racah系数])[
  三个角动量的耦合给出了 Racah 系数
  $
    vb(J)_1 times.circle vb(J)_2 times.circle vb(J)_3
  $
  不可约表示$j_i$以及本征态$ket(j_i m_i)$。先将$j_1,j_2$耦合再和$j_3$耦合，与$j_1$与$j_2,j_3$耦合的结果耦合的两种结果之间的耦合系数为
  $
    braket((j_1 j_2)j_12\,j_3\,J, j_1 \, (j_2 j_3)j_23\,J)\
  $
  也有符号，6-j系数
  $
    mat(j_1, j_2, j_3; j_12, J, j_23; delim: "{")
  $
  可以写成四个CG系数的乘积。
  #figure(
    diagram(
      spacing: 8em,
      node((0, 0)),
      node((1, 0)),
      node((0, 1)),
      node((1, 1)),

      edge((0, 0), (1, 0), $j_3$),
      edge((0, 1), (1, 1), $j_1$),
      edge((0, 0), (0, 1), $J$),
      edge((1, 0), (1, 1), $j_2$),
      edge((0, 0), (1, 1), $j_23$),
      edge((0, 1), (1, 0), $j_12$),
    ),
    caption: [6j系数],
  )
  这样的系数可以推广到$3n(n>=3)$-$j$系数。

  例如双电子系统，分别有轨道和自旋角动量
  $
    l_1,s_1;l_2,s_2
  $
  在非耦合的情况下，力学量完备集为
  $
    {vb(L)_1^2, L_(1z), vb(S)_1^2, S_(1z), vb(L)_2^2, L_(2z), vb(S)_2^2, S_(2z)}\
  $
  本征态记为
  $
    ket(l_1 m_1 s_1 m_(s 1) l_2 m_2 s_2 m_(s 2))\
  $
  先考虑LS耦合
  $
    vb(L) = vb(L)_1 + vb(L)_2, vb(S) = vb(S)_1 + vb(S)_2, vb(J) = vb(L) + vb(S)\
  $
  力学量完备集为
  $
    {vb(L)_1^2, vb(L)_2^2, vb(S)_1^2, vb(S)_2^2, vb(L)^2, vb(S)^2, vb(J)^2, J_z}\
  $
  本征态为
  $
    ket(l_1 l_2 s_1 s_2 L S J M)
  $
  再考虑JJ耦合
  $
    vb(J)_1 = vb(L)_1 + vb(S)_1, vb(J)_2 = vb(L)_2 + vb(S)_2, vb(J) = vb(J)_1 + vb(J)_2\
  $
  力学量完备集为
  $
    {vb(L)_1^2, vb(L)_2^2, vb(S)_1^2, vb(S)_2^2, vb(J)_1^2, vb(J)_2^2, vb(J)^2, J_z}\
  $
  本征态为
  $
    ket(l_1 s_1 l_2 s_2 J_1 J_2 J M)
  $
  两者之间的耦合系数是
  $
    braket(l_1 l_2 s_1 s_2 L S J M, l_1 s_1 l_2 s_2 J_1 J_2 J M)\
  $
  一个9-j系数
  $
    mat(l_1, s_1, J_1; l_2, s_2, J_2; L, S, J; delim: "{")\
  $
  为6个CG系数的乘积。
]

== 不可约张量算符

引入不可约张量算符的原因有二：
+ 算符分类。在坐标发生变化时，不可约张量算符有确定的变换规则。
+ 可以简化不可约张量算符在角动量本征态之间的矩阵元的计算。

#example(subname: [$D_3$的函数基])[
  例如$D_3$的6维表示的约化为
  $
    mat(S, , , ; , A, , ; , , Gamma, ; , , , Gamma)
  $
  对应的基约化为
  $
    {phi.alt_i} -> {phi_i^((p))|p=S,A,Gamma}
  $
  有
  $
    P_g phi_i^Gamma = sum_j Gamma_(j i) (g) phi_j^Gamma\
  $
  其中$phi_j^Gamma$是按照不可约表示$Gamma$进行变换的，这就给出了一个分类：将原先基线性组合后得到新的基，这些基可以进行分类。
]

=== 算符变换

在旧坐标中，一个函数$phi(vb(r))$经过算符$hat(T)(vb(r))$的作用后变成另一个函数$psi(vb(r))$
$
  psi(vb(r)) = hat(T)(vb(r)) phi(vb(r))\
$
同函数形式变换算符$P_g$
$
  g: vb(r) -> vb(r)' = g vb(r)\
  phi(vb(r)) = phi' (vb(r)') = P_g phi(vb(r)) = phi(g^(-1) vb(r))\
$
同样地，我们有
$
  g: hat(T) (vb(r)) -> hat(T)' (vb(r)')\
  phi'(vb(r)') = hat(T)' (vb(r)') phi(vb(r)')\
  P_g phi(vb(r)) = T' (vb(r)) P_g phi(vb(r))\
$
从而
$
  phi(vb(r)) = P_g^(-1) T' (vb(r)) P_g phi(vb(r))\
$
我们称
$
  T'(vb(r)) = P_g T(vb(r)) P_g^dagger\
$

=== 不可约张量算符

$
  {V_q^k,(q=-k,...,k)}
$
是群的 $k$ 秩不可约张量算符
$
  P_g V_q^k P_g^dagger = sum_q D_(q' q)^((k)) V_q'^k
$

#newpara()

考虑
$
  R phi_m (vb(r)) = sum_j D_(m' m)^((j)) phi_m' (vb(r))\
$
就说${phi_m}$是按照不可约张量算符$D^((j))$变换的，给出了表示的一个分类。

==== 代数的观点

称$V^k$为$"SO"(3)$群的$k$秩不可约张量算符，如果它的$2k+1$个分量算符$V_q^k$满足
$
  [J_z, V_q^k] = q V_q^k\
  [J_(plus.minus), V_q^k] = sqrt((k minus.plus q)(k minus.plus q + 1)) V_(q plus.minus 1)^k\
$

#example()[
  例如$H$的不可约张量算符$V^0$为0秩的。
]

#example(subname: [角动量算符$vb(J)$的笛卡尔分量])[
  $
    vb(J) = {J_1, J_2, J_3}\
  $
  ITO的1秩不可约张量算符$J_q^1$有*球谐形式*
  $
    J_0 = J_3,\
    J_(plus.minus 1) = minus.plus 1 / sqrt(2) (J_1 plus.minus i J_2),\
  $
  这和量子力学中
  $
    J_0 \
    J_(plus.minus) = J_1 plus.minus i J_2\
  $
  不一致，有
  $
    J_(plus.minus 1) = minus.plus 1 / sqrt(2) J_(plus.minus)\
  $
  #newpara()

  在$"SO"(3)$的作用下，角动量算符的球谐分量（不可约张量）按$D^((1))$不可约表示进行变换。

  而笛卡尔形式有变换
  $
    mat(J_1'; J_2'; J_3') = mat(R(alpha,beta,gamma))mat(J_1; J_2; J_3)\
  $
]

对一般的矢量$vb(r), vb(p)$，也可以化成球谐的形式，将基
$
  {vu(e)_i} => {vu(epsilon)_mu | mu = plus.minus 1, 0}\
$
有
$
  vu(epsilon)_0 = vu(e)_3,\
  vu(epsilon)_(plus.minus 1) = minus.plus 1 / sqrt(2) (vu(e)_1 plus.minus i vu(e)_2)\
$
定义了三维Euclidean空间的球谐基。有
$
  vu(e)_i dot vu(e)_j = delta_(i j)
$
以及
$
  vu(epsilon)_mu^* vu(epsilon)_nu = delta_(mu nu)\
$
其中有
$
  vu(epsilon)_mu^* = (-)^(mu) vu(epsilon)_(- mu)\
$
对于矢量积
$
  vu(e)_i times vu(e)_j = vu(e)_k\
$
对于球谐基
$
  vu(epsilon)_mu times vu(epsilon)_nu &= i sgn(mu - nu) vu(epsilon)_(mu plus nu)\
  &= i sqrt(2) braket(1 mu 1 nu, 1 mu + nu) vu(epsilon)_(mu plus nu)\
$
对于
$
  vb(A) &= sum_i A_i vu(e)_i\
  &= sum_mu A_mu vu(epsilon)^*_mu = sum_mu (-)^mu A_mu vu(epsilon)_(- mu)\
$
就有
$
  A_0 = A_3\
  A_(plus.minus 1) = minus.plus 1 / sqrt(2) (A_1 plus.minus i A_2)\
$
内积为
$
  vb(A) dot vb(B) &= sum_i A_i B_i\
  &= sum_mu A_mu B_mu^* = sum_mu_mu (-1)^(mu) A_mu B_(- mu)\
$
外积为
$
  vb(A) times vb(B) &= sum_i sum_j A_i B_j vu(e)_i times vu(e)_j\
  &= sum_mu sum_nu A_mu B_nu vu(epsilon)_mu^* times vu(epsilon)_nu\
$

=== 不可约张量算符的厄米共轭运算

下面我们希望有Hermitian共轭的不可约张量算符$V_q^k$，即
$
  (V_q^k)^dagger = V_(-q)^k\
$
对多分量的不可约张量算符$vb(V)^k(k != 0)$其Hermitian共
轭$vb(V)^(k dagger)$一般不再是不可约张量算符了。

对于
$
  P_g V_q^k P_g^dagger = sum_q' D_(q' q)^((k)) V_q'^k\
$
取共轭
$
  P_g V_q^(k dagger) P_g^dagger &= sum_q' D_(q' q)^((k)*) (V_(q')^k)^dagger\
  &= sum_q' (-)^(q-q') D_(-q' -q)^((k)) (V_(q')^k)^dagger\
$
作替换 $q->-q, q'->-q'$变为
$
  P_g ((-1)^q (V_(-q)^k)^dagger) P_g^dagger = sum_q' D_(q' q)^((k)) ((-1)^q (V_(- q')^k)^dagger)\
$
此式说明 $(-1)^q (V_(-q)^k)^dagger$也是不可约张量算符。定义
$
  V_q^(k dagger) = (-)^(q) (V_(-q)^k)^dagger\
$
这样$vb(V)^(k dagger)$是一个不可约张量算符。

这样定义有
$
  (V_q^k)^dagger = (-1)^q V_(-q)^k\
  V_q^(k dagger) = V_q^k
$
这意味着$vb(V)^k$是 Hermitian 的。

有
$
  J_0^dagger = J_0,\
  J_(+1)^dagger = J_(-1),\
$

=== 不可约张量算符的张量积（耦合）

对于$A,B$的张量积
$
  mat(A_1 B_1, A_1 B_2, A_1 B_3; A_2 B_1, A_2 B_2, A_2 B_3; A_3 B_1, A_3 B_2, A_3 B_3)
$
其中迹为
$
  S = sum_i A_i B_i
$
一共1个，反对称化为
$
  A_i B_j - A_j B_i
$
一共有3个，做无迹对称化
$
  a (A_i B_j + A_j B_i) - b S delta_(i j)
$
一共5个。这样就得到了9个分量。

不可约张亮算符的耦合
$
  V^(k_1) times.circle V^(k_2) = V^k
$
其中有
$
  V^k_q = sum_(q_1 q_2) braket(k_1 q_1 k_2 q_2, k q) V^((k_1))_(q_1) V^((k_2))_(q_2)\
$
这里的$braket(k_1 q_1 k_2 q_2, k q)$是 Clebsch-Gordon 系数，使得$V^k$拥有对称性。

对于
$
  [vb(J)_1 times.circle vb(J)_2]^k = sum_(q_1,q_2) braket(1 q_1 1 q_2, k q) J_(q_1)^k_1 J_(q_2)^k_2\
$
因此$k=0,1,2$
$
  [vb(J)_1 times.circle vb(J)_2]^0 = vb(J)_1 dot vb(J)_2\
  [vb(J)_1 times.circle vb(J)_2]^1 = vb(J)_1 times vb(J)_2\
$

=== Wigner-Eckart 定理

不可约张量算符在标准角动量本征态间的矩阵元可以分成两个因子的乘积
$
  braket(j' m', V_q^k, j m) = braket(j, abs(V^k), j') braket(j' m', k q j m) \
$

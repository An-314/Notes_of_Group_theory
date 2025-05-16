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
$
  C_(vb(n)(theta,phi))(psi)= C_k (phi) C_j (theta) C_k (psi) C_j^(-1) (theta) C_k^(-1) (phi)
$
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
  $k''=K$，$j=J$，即$k$在$C_(k'')(gamma)$下不变。

合成后得
$
  g(alpha, beta, gamma) = C_(k'') (gamma) C_(j') (beta) C_k (alpha)
$
参数$alpha, beta, gamma$的取值范围为
$
  alpha in [0, 2pi), beta in [0, pi], gamma in [0, 2pi)
$
这样的变换一共有三个坐标系，我们希望可以通过同一个坐标系${i,j,k}$描述
$
  g(alpha, beta, gamma) = C_(k) (alpha) C_(j) (beta) C_(k) (gamma)
$
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
由于 $g$ 是任意的，所以用转角 $psi$ 来描述 $"SO"(3)$ 群的类——*所有转角$psi$相同的旋转构成一个类*，因此有无穷多个类，而且每个类中的元素个数也为无穷多。

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
$
  a = cos beta / 2 e^(-i / 2 (alpha + gamma)), b = -sin beta / 2 e^(-i / 2 (alpha - gamma))
$
上式给出了Cayley-Klien参数和Euler角的关系。

最后讨论对应关系的多重性问题。

由同态核定理知，只需讨论$"SO"(3)$群的单位元素$E_(3times 3)$ 所对应的$"SU"(2)$群元素的个数即可。

利用对应关系，解出$R_u_0 = E_(3 times 3)$所对应的$alpha = 0, 2pi$，从而
$
  R_(u_0) = E_(3 times 3) = mat(1, 0, 0; 0, 1, 0; 0, 0, 1)=> cases(display(mat(e^(-i / 2), 0; 0, e^(i / 2)) = mat(1, 0; 0, 1)), display(mat(e^(-i pi), 0; 0, e^(i pi)) = - mat(1, 0; 0, 1)))
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

我们知道$u$是$"SU"(2)$的一个忠实表示，我们希望可以通过$u$来构造出其他的表示，考虑到
#note[
  注意到$D_3$有
  $
    Gamma times.circle Gamma = S plus.circle A plus.circle Gamma
  $
  可以用一个已知表示$Gamma$的表示来构造出新的表示$S, A$。
]
对于紧致Lie群$"SU"(2)$，有
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
  投影到函数空间$V^((3))$上时，我们可以只选择一个。

  事实上这是由于这是同一个矢量的张量，反对称化一定是0。事实上对称化就是投影。

  对称化之后给出的基，当然是不可约的。
]
一般地，
$
  underbrace(u times.circle u times.circle ... times.circle u, k) = sum plus.circle c_n A^((n))\
  underbrace(u times.circle u times.circle ... times.circle u, k) = sum plus.circle c_n V^((n))\
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
  但事实上由$u$和$u^(-1)$给出的函数形式变换都能给出一个表示。事实上由函数形式变换
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
$
其中$k$满足
$
  max(0, m-m') <= k <= min(j+m, j-m')\
$
$A^((j))$给出了$"SU"(2)$群的全部不等价不可约的幺正表示。

下表是一些实例
#three-line-table[
  | $j$ | 基函数 | 表示矩阵$A^((j))$ |
  | --- | --- | --- |
  | $0$ | $ f^0_0 (vb(r)) = 1 $ | $ A^((0)) (u) = 1 $ |
  | $1 / 2$ | $ f^1 / 2_(1 / 2) (vb(r)) = x_1, f^1 / 2_(-1 / 2) (vb(r)) = x_2 $ | $ A^((1 / 2)) (u) = mat(a, b; -b^*, a^*) $ |
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
  S u S^dagger = u_3 (phi) = mat(e^(-i / 2 phi), 0; 0, e^(i / 2 phi))
$
因为每个类中的元素有相同的特征标，故可以用$u_3 (phi)$来表示$"SU"(2)$的类。可以得到表示矩阵
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
事实上特征标
$
  chi^((0)), chi^((1 / 2)), ... -> {1, cos(phi / 2), cos(phi) ...}\
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
  - $d^((j))_(m m') (beta) = (-1)^(m - m')) d^((j))_(m' m) (beta)$
  - $d^((j))_(m m') (beta) = d^((j))_(-m' -m) (beta)$
  - $d^((j))_(m m') (-beta) = d^((j))_(m' m) (beta)$
  - $d^((j))_(m m') (pi - beta) = (-1)^(j - m') d^((j))_(-m' m) (beta)$

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

== SU(2) 与 O(3) 群的李代数方法

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


#note[
  回顾：群的代数结构是Cayley表。Lie代数的代数结构是Lie积，事实上也是一个乘法表。
]

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

Lie代数理论是以Lie三定理为基础的。此三定理表明：Lie群的无穷小群元素满足上述Lie代数的定义。实际上，Lie代数刻画的是Lie群在单位元邻域的性质。Lie代数的生成元的个数等于相应Lie群的群参数个数。

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
#proposition(subname: [$"SU"(2)$的Lie代数与代数结构])[
  容易验证$sigma_i$在Lie积下满足满足双线性，反对易性和 Jacobi 恒等式，$"SU"(2)$的代数是
  $
    "su"(2) = {sigma_x, sigma_y, sigma_z}\
  $
  其代数结构是
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

考虑到无穷小线性变换的无穷多次乘积为一有限变换，并利用极限定义
$
  lim_(n->oo) (1 + T / n)^n = e^T
$
可以有
$
  lim_(n->oo) (E - i X / n)^n &= e^(-i X) =e^(- i vb(r) dot vb(sigma)) = sum_(n=0)^oo ( - i vb(r) dot vb(sigma))^n / n!\
  &= mat(cos r - i z / r sin r, -i x / r sin r - y / r sin r; -i x / r sin r + y / r sin r, cos r + i z / r sin r)\
$
此二阶方阵满足幺正条件，且其行列式为 1，所以 $e^(- i vb(r) dot vb(sigma))in"SU"(2)$ 群元素。

#note[
  #diagram($
    "SU"(2) edge("r", #[Taylor], ->, bend: #10deg) &edge("l", #[Exp], ->, bend: #10deg) "su"(2)\
  $)

  一般地，一个Lie群进行线性化就给出了一个Lie代数，反之一个Lie代数也可以通过指数映射给出一个Lie群。
]

考虑到
$
  g(alpha beta gamma) = C_k (alpha) C_j (beta) C_k (gamma) = u_1 (alpha) u_2 (beta) u_1 (gamma) = U(alpha beta gamma)
$
以及
$
  g(theta phi psi) = C_k (theta) C C C C = U(theta phi psi) = cos psi / 2 - i (vb(r) dot vb(sigma)) sin psi / 2
$

=== $"SO"(3)$的代数结构

$"SO"(3)$的定义为
$
  "SO"(3) = {A in "GL"(3,RR) | A^T A = A A^T = E, det(A) = 1}
$
在单位元邻域的群元素可以写成三阶单位矩阵 $E$ 与无穷小矩阵 $M$ 之和，即
$
  E + M
$
由正交条件，并略去二阶及二阶以上无穷小量，得到
$
  M^T + M = 0
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
其中$delta vb(psi) = mat(delta psi_x; delta psi_y; delta psi_z)$，$vb(n) = mat(cos theta sin phi; sin theta sin phi; cos phi)$，$I = mat(I_x; I_y; I_z)$。所以，与 $"SO"(3)$ 的单位元无限接近的群元素写为
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
$
  g(alpha beta gamma) = e^(- i alpha J_z) e^(- i beta J_y) e^(- i gamma J_z) = C_k (alpha) C_j (beta) C_k (gamma)\
$

=== $"su"(2)$和$"o"(3)$的同构

$
  vb(J) = 1 / 2 vb(sigma)
$
$
  "su"(2) tilde.equiv "o"(3)
$
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
称为$"o"(3)$的 Casimir 算符。以及升降算符
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
${vb(J)^2,J_z}$是一个完备集，存在共同本征态
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
  &= braket(phi m, J_(+1), phi m-1) braket(phi m-1, J_(-1), phi m)\
  &= braket(phi m, J_(-1), phi m+1) braket(phi m+1, J_(+1), phi m) - m
$
利用厄米共轭条件

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
但上两式只能决定到平方项，还有相因子不能确定。通常选取 Conden-Shortley 惯例，于是得到
$
  braket(phi m - 1, J_(-1), phi m) = sqrt(1 / 2 (j+m) (j-m + 1))\
  braket(phi m + 1, J_(+1), phi m) = sqrt(1 / 2 (j-m) (j+m + 1))\
$
最后计算 $vb(J)^2$ 在基 $ket(phi m)$ 上的本征值。有
$
  phi &= braket(phi m, vb(J)^2, phi m) = braket(phi m, -J_(+1) J_(-1) - J_(-1) J_(+1) + J_0^2, phi m)\
  &= (j-m) (j+m + 1) + m (m + 1) \
  &= j (j + 1)\
$
$phi$ 只与最高权 $j$ 有关，而与 $m$ 无关。$j$决定了不可约表示，所以可以用$j$来标记$"o"(3)$的不可约表示。相应的不可约表示空间$V^j$的基矢量为
$
  ket(j m) = ket(phi m)\
$
其维数是 $2j+1$。

所有的结果总结为
$
  vb(J)^2 ket(j m) = j (j + 1) ket(j m)\
  J_0 ket(j m) = m ket(j m)\
  braket(j m-1, J_(-1), j m) = sqrt(1 / 2 (j+m) (j-m + 1))\
  braket(j m + 1, J_(+1), j m) = sqrt(1 / 2 (j-m) (j+m + 1))\
$
这样就得到了 $"o"(3)$ 在基 $ket(j m)$ 上的不可约表示。


不可约可以用不变子空间验证。对$j$相同的基向量，$J_(plus.minus)$作用下，最小的非平凡不变子空间就是${ket(j m) | m = -j, -j+1, ..., j}$，所以$j$是不可约的。

#note[
  由于$"SU"(2)$的群表示为$A^((j)), j=0,1 / 2,1,...$，并且$"su"(2)$的表示$j =0,1 / 2,1,...$，二者一一对应，似乎$j$就给出所有$"su"(2)$的不可约表示。

  物理上，$"so"(3)$的表示为$j=0,1,2,...$和$"SO"(3)$进行对应。
]

我们说$j$是不可约表示的标记：
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

*Heisenberg代数*：Boson算符$a$与其Hermitian共轭算符$a^dagger$满足对易关系
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
就有量子数对应关系
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

Boson子算符与微分算符之间存在对应关系。例如，对一维情况，有
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
  D_(m' m)^j (alpha,beta,gamma) &= braket(j m'; , R(alpha, beta, gamma), j m)\
  &= braket(j m'; , e^(- i alpha J_z) e^(- i beta J_y) e^(- i gamma J_z), j m)\
  &= e^(- i m' alpha) braket(j m'; , e^(- i beta J_y), j m) e^(- i m gamma)\
  &= e^(- i m' alpha) d_(m' m)^j (beta) e^(- i m gamma)\
$

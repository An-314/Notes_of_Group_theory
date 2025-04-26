#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

= SO(3)和SU(2)群

按照前两章，我们按照如下方式研究这两个群
- 结构：元素、子群、类、直积
- 表示：不可约表示、特征标、直积约化

== 旋转群的一般知识

=== 变换

$
  hat(A) : vb(r) |-> vb(r)' = hat(A) vb(r)
$
一个变换和一个矩阵有对应关系。

==== 正交变换

$E^3$上的正交变换满足
$
  braket(hat(A) vb(r)) = braket(vb(r)) <=> hat(A)^dagger hat(A) = 1
$
是一个保距变换
$
  bracket(vb(r)') = bracket(vb(r)) <=> sum x'_i^2 = sum x_i^2
$
也意味着旋转变换。

=== O(3)群

$
  "O"(3) = {hat(A)| hat(A)^dagger hat(A) = E} = {A|A_(i j)in RR, A^T A = E}
$
其中
$
  det(A) = plus.minus 1
$
定义$"O"(3)$
$
  "SO"(3) = {A in "O"(3)|det(A) = 1}
$
且有
$
  "SO"(3) subset "O"(3)
$
进一步地
$
  "SO"(3) lt.tri "O"(3)
$
可以构造商群
$
  "O"(3) \/ "SO"(3) = {"SO"(3), I "SO"(3)} tilde.equiv K
$
意味着$"O"(3)$为$"SO"(3)$和$I "SO"(3)$的并，其中$I$是空间反演变换，有$det(I) = -1$

事实上$K={e,I}$也是$"O"(3)$的不变子群
$
  "O"(3) \/ K tilde.equiv "SO"(3)
$
$
  "O"(3) = "SO"(3) times.circle K
$

$"O"(3)$和$"SO"(3)$都只有3个独立的群参数。

=== SO(3)群表示

$
  "SO"(2) = {C_k (theta)}
$
有群参数$theta$，为实数且独立。我们先找$"SO"(3)$的群参数。

有3个群参数
- 方位角$(theta, phi, psi)$
- Euler角$(alpha, beta, gamma)$

==== 方位角

$
  forall A in "SO"(3), exists vb(n) in E^3 \
  A vb(n) = vb(n)
$
事实上这就是变换的转轴
$
  (A - E) vb(n) = 0 => det(A - E) = 0
$
用$theta,phi$标记该轴，用$psi$表示绕轴的转动
$
  A -> C_(vb(n)(theta,phi))(psi)
$
取值范围为
$
  theta in [0, pi], phi in [0, 2pi), psi in [0, pi]
$

*固定坐标轴描述*：任意旋转操作$C_n (psi)$可以仅用绕$k$轴的旋转操作和绕$j$轴的旋转操作的组合来描述，即
$
  C_(vb(n)(theta,phi))(psi)= C_k (phi) C_j (theta) C_k (psi) C_j^(-1) (theta) C_k^(-1) (phi)
$

=== SO(3) 群的类

已知 $"SO"(3)$ 群的任意元素可以写为 $C_(vb(n)(theta,phi))(psi)$，同类元素是
$
  g^(-1) C_(vb(n)(theta,phi))(psi) g
$
有
$
  (g vb(n))^(-1) C_(vb(n)(theta,phi))(psi) g vb(n) = C_(vb(n)(theta,phi))(psi)
$
由于同类元素的特征表相等，有
$
  chi(g^(-1) C_(vb(n)(theta,phi))(psi) g) = chi(C_(vb(n)(theta,phi))(psi)) = 1 + 2 cos(psi)
$
所以$C_(vb(n)(theta,phi))(psi)$是绕$g vb(n)$轴转$psi$角的一个旋转操作，即
$
  g C_(vb(n)(theta,phi))(psi) g^(-1) = C_(g vb(n)(theta,phi))(psi)
$
由于 $g$ 是任意的，所以用转角 $psi$ 来描述 $"SO"(3)$ 群的类——所有转角$psi$相同的旋转构成一个类，因此有无穷多个类，而且每个类中的元素个数也为无穷多。

=== Euler角

Euler 角是由三个连续操作的旋转角 $alpha, beta, gamma$ 来定义的。

它们描述一个 Descartes 坐标系${i , j , k}$经过一个特定顺序的三个连续旋转操作达到一个具有共同原点的、新的 Descartes 坐标系 ${ I , J , K}$。用 Euler 角来表示的任意旋转操作$g(alpha beta gamma)$由以下三个连续旋转构成：

+ 绕$k$轴转$alpha$角，使得$j$轴与“节线”（$i j$平面与$I J$平面的交线）$N$重合，即有
  $
    C_k (alpha) : {i, j, k} -> {i', j', k'}
  $
  $k'=k$，即$k$在$C_k (alpha)$下不变。
+ 绕$j'$轴转$beta$角，使得$k$轴与$K$轴重合，有
  $
    C_(j'') (beta) : {i', j', k'} -> {i'', j'', k''}
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
  g(alpha, beta, gamma) = mat( cos alpha cos beta cos gamma - sin alpha sin gamma, -cos alpha cos beta sin gamma - sin alpha cos gamma, cos alpha sin beta;
  sin alpha cos beta cos gamma + cos alpha sin gamma, -sin alpha cos beta sin gamma + cos alpha cos gamma, sin alpha sin beta;
  -sin beta cos gamma, sin beta sin gamma, cos beta)
$<Euler角的矩阵表示>

#note[
  用 Euler 角刻画 $"SO"(3)$ 群元素不是唯一的。由 @Euler角的矩阵表示 可知，当$beta = 0$，此时 $k , k', k''$ 轴重合，只要 $alpha+beta$ 相同，就代表同一个旋转。当 $beta = pi$ ，只要 $alpha - gamma$ 相同也就代表同一个旋转。除此之外，$alpha,beta,gamma$ 的不同取值代表不同的旋转。

  方位角是$1->2$的对应关系；Euler角有一个$1->oo$的对应关系。
]

== SU(2)群与SO(3)群的同态关系

=== SU(2)群

$"U"(2)$是在复数域$CC$上，所有二维幺正矩阵的集合在矩阵乘法下构成的群，称为二维幺正群
$
  "U"(2) = "U"(2,CC) = { hat(U) in "GL"(2,CC) | hat(U)^dagger hat(U) = E }
$
因为$"GL"(2,CC)$由8个独立的是参数刻画，幺正条件给出4个实的独立的约束方程，从而$"U"(2)$的群参数的个数为4。

$"U"(2)$群中行列式等于 1 的矩阵的集合构成$"U"(2)$群的一个子群，称之为二维特殊幺正群（或二维单模酉群），
$
  "SU"(2) = { hat(U) in "U"(2) | det(hat(U)) = 1 }
$
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

$U$一般形式是
$
  U = mat(a,b;-b^*,a^*)
$(为什么？)
还有
$
  abs(a)^2 + abs(b)^2 = 1
$
参数$a,b$称为*Cayley-Klein参数*。

=== SU(2)和SO(3)的同态关系

构造Pauli矩阵
$
  sigma_x = mat(0,1;1,0), sigma_y = mat(0,-i;i,0), sigma_z = mat(1,0;0,-1)
$
#note[
  $sigma_x,sigma_y,sigma_z$是线性独立的，可以张成一个$Sigma$空间。
]
对于$vb(r) = mat(x;y;z)$，有
$
  h &= vb(r) dot vb(sigma) = x sigma_x + y sigma_y + z sigma_z\
  &= mat(z,x-i y; x+i y,z)
$
$h$是一个Hermitian矩阵，$h^dagger = h$，且有$det h = -(x^2 + y^2 + z^2)$，$Tr h = 0$。

对$h$进行一个$"SU"(2)$变换
$
  u h u^dagger = macron(h), u in "SU"(2)
$
我们需要说明$macron(h) in Sigma$，由于
$
  Tr macron(h) = Tr (u h u^dagger) = Tr h = 0
$
进而有
$
  macron(h) = u h u^dagger = mat(z',x'-i y'; x'+i y',z')\
$
上式说明：每一个二维幺正变换$u in "SU"(2)$都诱导出一个三维坐标变换，设为$R_u$有
$
  vb(r)' = R_u vb(r)
$
#diagram()

由于 $det macron(h) = det h$，所以
$
  sum x^('2)_i = sum x^2_i\
$
从而$R_u$是一个正交变换
$
  R_u in "O"(3)
$
现在确定其行列式
$
  (R_u vb(r)) dot vb(sigma) = u (vb(r) dot vb(sigma)) u^dagger
$

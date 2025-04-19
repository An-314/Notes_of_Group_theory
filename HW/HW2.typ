#import "@preview/scripst:1.1.1": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

#show: scripst.with(
  template: "article",
  title: [群论],
  info: [第二次作业],
  author: "Anzreww",
  time: datetime.today().display("[year]/[month]/[day]"),
  /* preface parameter not available if template sets to 'article'*/
  matheq-depth: 2,
  lang: "zh",
)

#exercise[

  设$A(g_alpha)$是群$cal(G)={g_alpha}$的一个表示，证明：转置逆矩阵$(A^TT (g_alpha))^(-1)$，Hermitian共轭矩阵$(A^dagger (g_alpha))^(-1)$也是$cal(G)$的表示。并且当$A(g_alpha)$是不可约或幺正的，则它们也是不可约或幺正的。试问$A^TT (g_alpha)$和$A^dagger (g_alpha)$是否也是$cal(G)$的表示？
]

#proof[

  + $cal(G)$表示

    如果$A(g_alpha)$是群$cal(G)={g_alpha}$的一个表示，则有
    $
      A(g_alpha) A(g_beta) = A(g_alpha g_beta), forall g_alpha, g_beta in cal(G)
    $
    则对转置逆矩阵$(A^TT (g_alpha))^(-1)$，有
    $
      (A^TT (g_alpha))^(-1) (A^TT (g_beta))^(-1) = (A^TT (g_beta) A^TT (g_alpha))^(-1) = ((A(g_alpha) A(g_beta))^TT)^(-1) = (A^TT (g_alpha g_beta))^(-1)
    $
    所以$(A^TT (g_alpha))^(-1)$也是$cal(G)$的表示。同样地，对于Hermitian共轭矩阵$(A^dagger (g_alpha))^(-1)$，有
    $
      (A^dagger (g_alpha))^(-1) (A^dagger (g_beta))^(-1) = (A^dagger (g_beta) A^dagger (g_alpha))^(-1) = ((A(g_alpha) A(g_beta))^dagger)^(-1) = (A^dagger (g_alpha g_beta))^(-1)
    $

  + 可约性质

    若$(A^TT (g_alpha))^(-1)$是可约的意味着它相似于一个上三角分块矩阵
    $
      (A^TT (g_alpha))^(-1) tilde mat(P,Q;O,R)
    $
    其中$P$和$R$是可逆矩阵，$O$是零矩阵。则有
    $
      A^TT (g_alpha) tilde mat(P,Q;O,R)^(-1) = mat(P^(-1), -P^(-1) Q R; O, R^(-1))\
      A (g_alpha) tilde mat(P^(-1 TT), O; (P^(-1) Q R)^(TT), R^(-1 TT))
    $
    其中$P$是一个$m times m$的矩阵，$R$是一个$n times n$的矩阵，我们$A$表示空间$V$的后$n$个基构成的子空间$V_2$中的向量$vb(x)=mat(O;x)$则有
    $
      mat(P^(-1 TT), O; (P^(-1) Q R)^(TT), R^(-1 TT)) mat(O;x) = mat(O;R^(-1 TT) x)\
    $
    这证明子空间$V_2$是$V$的一个$cal(G)$不变子空间。从而$A$是可约的，矛盾！

    如果是Hermitian共轭矩阵$(A^dagger (g_alpha))^(-1)$，里用反证法，同理可知$A$是可约的，矛盾！

    这就意味着$(A^TT (g_alpha))^(-1)$和$(A^dagger (g_alpha))^(-1)$也是不可约的。

  + 幺正性质

    设$A(g_alpha)$是幺正的，则有$A^dagger (g_alpha) A(g_alpha) = A (g_alpha) A^dagger (g_alpha) = I$，则有
    $
      (A^TT (g_alpha))^(-1 dagger) (A^TT (g_alpha))^(-1) = (A^(dagger) (g_alpha) A (g_alpha))^(TT -1) = I
    $
    $
      (A^dagger (g_alpha))^(-1) (A^dagger (g_alpha))^(-1 dagger) = (A (g_alpha) A^dagger (g_alpha))^(TT -1) = I
    $
    从而$(A^TT (g_alpha))^(-1)$和$(A^dagger (g_alpha))^(-1)$也是幺正的。

  + 对于$A^TT (g_alpha)$与$A^dagger (g_alpha)$

    表示一定要满足保乘性质，即
    $
      A^TT (g_alpha) A^TT (g_beta) = A^TT (g_alpha g_beta)\
    $
    而
    $
      A^TT (g_alpha) A^TT (g_beta) = (A (g_beta) A (g_alpha))^TT = A^TT (g_beta g_alpha)\
    $
    如果两个表示是等价的，则有
    $
      A(g_alpha) A(g_beta) = A(g_beta) A(g_alpha), forall g_alpha, g_beta in cal(G)\
    $
    进一步意味着$A(g_alpha)$是可交换的，所以当且仅当$A(g_alpha)$是可交换的时，$A^TT (g_alpha)$与$A^dagger (g_alpha)$也是$cal(G)$的表示。

]

#exercise[

  设$A(g_alpha)$是群$cal(G)={g_alpha}$的一个不可约表示，$C$是$cal(G)$中的一个共轭类，$lambda$是常数，$I$是单位矩阵，证明：
  $
    sum_(g_alpha in C) A(g_alpha) = lambda I
  $
]

#proof[

  我们考虑使用 Schur引理 1 来证明该问题。

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
  对于$A(g), g in cal(G)$有
  $
    &[A(g), A(g_alpha)]\
    =&A(g) sum_(g_alpha in C) A(g_alpha) - sum_(g_alpha in C) A(g_alpha) A(g)\
    =&sum_(g_alpha in C) (A(g) A(g_alpha) - A(g_alpha) A(g))\
    =&sum_(g_alpha in C) (A(g) A(g_alpha) A(g^(-1)) - A(g_alpha)) A(g)\
    =&(sum_(g_alpha in C) A(g g_alpha g^(-1)) - A(g_alpha)) A(g)\
  $
  下面我们说明在$g_alpha$遍历$C$时，$g g_alpha g$也遍历$C$。
  - 首先，$g g_alpha g^(-1) in C$，因为$C$是共轭类。
  - 我们再说明，不同元素在做$g$共轭变换后仍然是不同的元素。

    设$g g_alpha g^(-1) = g g_beta g^(-1)$，则有$g_alpha = g_beta$，这就意味着$g_alpha$和$g_beta$是同一个元素。

  这样，在$g_alpha$遍历$C$时，$g g_alpha g$也遍历$C$。从而
  $
    &[A(g), A(g_alpha)]\
    =&(sum_(g_alpha in C) A(g g_alpha g^(-1)) - A(g_alpha)) A(g)\
    =&0
  $
  这就意味着$A(g)$与$sum_(g_alpha in C) A(g_alpha)$对易。由 Schur引理1可知，$sum_(g_alpha in C) A(g_alpha)$是单位矩阵的倍数，即
  $
    sum_(g_alpha in C) A(g_alpha) = lambda I\
  $
]

#exercise[
  写出4阶循环群$Z_4$的左正则表示和右正则表示。
]

#solution[
  4阶循环群
  $
    Z_4 = {a, a^2, a^3, a^4 = e}
  $
  其乘法表为
  #let tab = (
    ([$dot$], vlinex(), [$e$], [$a$], [$a^2$], [$a^3$]),
    hlinex(),
    ([$e$], [$e$], [$a$], [$a^2$], [$a^3$]),
    ([$a$], [$a$], [$a^2$], [$a^3$], [$e$]),
    ([$a^2$], [$a^2$], [$a^3$], [$e$], [$a$]),
    ([$a^3$], [$a^3$], [$e$], [$a$], [$a^2$]),
  )
  #figure(tablex(columns: 5, align: center, auto-vlines: false, auto-hlines: false, ..tab.flatten()))

  表示空间是
  $
    V_4 = {e, a, a^2, a^3}
  $
  其左右正则表示满足
  $
    L(g_1) g_2 = g_1 g_2, R(g_1) g_2 = g_2 g_1^(-1), g_1, g_2 in cal(G)
  $
  其左正则表示为
  $
    L(a) = mat(0,0,0,1; 1,0,0,0; 0,1,0,0; 0,0,1,0), L(a^2) = L(a)^2 = mat(0,0,1,0; 0,0,0,1; 1,0,0,0; 0,1,0,0)\
    L(a^3) = L(a)^3 = mat(0,1,0,0; 0,0,1,0; 0,0,0,1; 1,0,0,0), L(e) = I = mat(1,0,0,0; 0,1,0,0; 0,0,1,0; 0,0,0,1)
  $
  其右正则表示为
  $
    R(a) = mat(0,1,0,0; 0,0,1,0; 0,0,0,1; 1,0,0,0), R(a^2) = R(a)^2 = mat(0,0,1,0; 0,0,0,1; 1,0,0,0; 0,1,0,0)\
    R(a^3) = R(a)^3 = mat(0,0,0,1; 1,0,0,0; 0,1,0,0; 0,0,1,0), R(e) = I = mat(1,0,0,0; 0,1,0,0; 0,0,1,0; 0,0,0,1)
  $
  其中$L(a)$和$R(a)$分别是左正则表示和右正则表示的矩阵形式。
]

#exercise[
  设$A^p (g_alpha)$和$A^r (g_alpha)$是群$cal(G)={h_alpha}$的两个不等价不可约表示，证明：直积表示$A^p (g_alpha) times.circle A^(r*) (g_alpha)$不包含恒等表示，而$A^p (g_alpha) times.circle A^(p*) (g_alpha)$包含恒等表示一次且仅一次。
]

#proof[

  设$A^p (g_alpha), A^r (g_alpha)$的特征标是$chi^p (g_alpha), chi^r (g_alpha)$，则有
  $
    chi^(p times.circle r*) (g_alpha) = chi^p (g_alpha) chi^(r*) (g_alpha)\
  $
  恒等表示的特征标是$chi^e (g_alpha) = 1$，所以有
  $
    braket(chi^(p times.circle r*), chi^S) = sum_(i=1)^n chi^p (g_i) chi^(r*) (g_i) = braket(chi^p, chi^r) = delta_(p,r)\
  $
  而直积分解
  $
    chi^(p times.circle r*) = sum_(p=1)^q m_p chi^p
  $
  其中
  $
    m_i = braket(chi^p, chi^r) = delta_(p,r)\
  $
  所以当$p!=r$时，$A^p (g_alpha) times.circle A^(r*) (g_alpha)$不包含恒等表示；当$p=r$时，$A^p (g_alpha) times.circle A^(p*) (g_alpha)$包含恒等表示一次且仅一次。
]

#exercise[
  阶为$2n$的$D_(2n)$群由两个生成元$a$和$b$生成，它们满足如下定义关系
  $
    a^n = b^2 = e\
    b^(-1)a b a = e
  $
  其中$n(>=3)$为奇数。计算$D_(2n)$群的全部不等价不可约酉表示。
]

#solution[

  上次作业已经给$D_(2n)$群做出了分类：$n$ 是奇数时，$D_(2n)$ 有 $(n+1)/2 + 1$ 个共轭类，分别是：
  - ${a^alpha, a^(n-alpha)}$，$0 <= alpha < n$
  - ${b, a b, a^2 b, ..., a^(n-1) b}$

  由Burnside定理可知，这些表示的维度$S_p$有关系
  $
    sum_(p=1)^q S_p^2 = 2n, q = (n+1) / 2 + 1
  $
  且一定有恒等表示$S_S=1$。
  $
    2n = 1^2 times 2 + 2^2 times (n-1) / 2
  $
  - 1-dim表示
    $
      A(a) = a, A(b) = b\
      a^n = 1, b^2 = 1, a^2 = 1
    $
    有两个表示
    $
      cases(a=1,b=1),cases(a=1,b=-1)
    $
  - 2-dim表示
    $
      A(a) = mat(e^(( 2 k pi)/n i) ,0; 0, e^(-(2 k pi)/n i)), A(b) = mat(0,1; 1,0), k = 1,...,n-1\
    $
    可以验证满足乘法
    $
      A(a)^n = I, A(b)^2 = I, A(b)^(-1) A(a) A(b) A(a) = I\
    $

  这一共是$(n+3)/2$个表示，由前面的Burnside定理可知这些表示是完备的：
  - 1-dim表示有$2$个
    - $A_1(a) = 1, A_1(b) = 1$
    - $A_2(a) = 1, A_2(b) = -1$
  - 2-dim表示有$(n-1)/2$个
    - $A_3(a) = mat(e^(( 2 k pi)/n i) ,0; 0, e^(-(2 k pi)/n i)), A_3(b) = mat(0,1; 1,0), k = 1,...,n-1$

]

#exercise[
  计算$D_3$群在4维空间
  $
    V_4 = {phi_1 = x^3, phi_2 = x^2 y, phi_3 = x y^2, phi_4 = y^3}
  $
  中的表示，并对该表示的矩阵和函数基分别进行约化。
]

#solution[

  对于基函数$phi_1, phi_2, phi_3, phi_4$，经过$D_3$群的作用。

  对于$a=a^(-1)$
  $
    P_a phi_1 (vb(r)) = phi_1 (a^(-1) vb(r)) = phi_1 mat(-x;y) = - phi_1 (vb(r))\
    P_a phi_2 (vb(r)) = phi_2 (a^(-1) vb(r)) = phi_2 mat(-x;y) = phi_2 (vb(r))\
    P_a phi_3 (vb(r)) = phi_3 (a^(-1) vb(r)) = phi_3 mat(-x;y) = - phi_3 (vb(r))\
    P_a phi_4 (vb(r)) = phi_4 (a^(-1) vb(r)) = phi_4 mat(-x;y) = phi_4 (vb(r))\
  $
  从而
  $
    A(a) = mat(-1,0,0,0; 0,1,0,0; 0,0,-1,0; 0,0,0,1)
  $
  以及$b=b^(-1)$
  $
    P_b phi_1 (vb(r)) &= phi_1 (b^(-1) vb(r)) = phi_1(mat(1/2,sqrt(3)/2;sqrt(3)/2,-1/2) mat(x;y)) = phi_1 mat(1/2x+sqrt(3)/2y; sqrt(3)/2x-1/2y) \
    &= 1 / 8 phi_1(vb(r)) + (3sqrt(3)) / 8 phi_2(vb(r)) + 9 / 8 phi_3(vb(r)) + (3sqrt(3)) / 8 phi_4(vb(r))\
    P_b phi_2 (vb(r)) &= phi_2 (b^(-1) vb(r)) = phi_2(mat(1/2,sqrt(3)/2;sqrt(3)/2,-1/2) mat(x;y)) = phi_2 mat(1/2x+sqrt(3)/2y; sqrt(3)/2x-1/2y) \
    &= sqrt(3) / 8 phi_1(vb(r)) + 5 / 8 phi_2(vb(r)) + sqrt(3) / 8 phi_3(vb(r)) - 3 / 8 phi_4(vb(r))\
    P_b phi_3 (vb(r)) &= phi_3 (b^(-1) vb(r)) = phi_3(mat(1/2,sqrt(3)/2;sqrt(3)/2,-1/2) mat(x;y)) = phi_3 mat(1/2x+sqrt(3)/2y; sqrt(3)/2x-1/2y) \
    &= 3 / 8 phi_1(vb(r)) + sqrt(3) / 8 phi_2(vb(r)) - 5 / 8 phi_3(vb(r)) + sqrt(3) / 8 phi_4(vb(r))\
    P_b phi_4 (vb(r)) &= phi_4 (b^(-1) vb(r)) = phi_4(mat(1/2,sqrt(3)/2;sqrt(3)/2,-1/2) mat(x;y)) = phi_4 mat(1/2x+sqrt(3)/2y; sqrt(3)/2x-1/2y) \
    &= (3sqrt(3)) / 8 phi_1(vb(r)) - 9 / 8 phi_2(vb(r)) + (3 sqrt(3)) / 8 phi_3(vb(r)) - 1 / 8 phi_4(vb(r))\
  $
  从而
  $
    A(b) = mat(1/8,(3sqrt(3))/8,9/8,(3sqrt(3))/8; sqrt(3)/8,5/8,sqrt(3)/8,-3/8; 3/8,sqrt(3)/8,-5/8,sqrt(3)/8; (3sqrt(3))/8,-9/8,(3sqrt(3))/8,-1/8)
  $
  另外可以有乘法关系得到剩下的矩阵
  $
    A(c) = A(b) A(a) A(b) = mat(1/8,-(3sqrt(3))/8,9/8,-(3sqrt(3))/8; -sqrt(3)/8,5/8,-sqrt(3)/8,-3/8; 3/8,-sqrt(3)/8,-5/8,-sqrt(3)/8; -(3sqrt(3))/8,-9/8,-(3sqrt(3))/8,-1/8)
  $
  $
    A(e) = I
  $
  $
    A(d) = A(a) A(b) = mat(-1/8,-(3sqrt(3))/8,-9/8,-(3sqrt(3))/8; sqrt(3)/8,5/8,sqrt(3)/8,-3/8; -3/8,-sqrt(3)/8,5/8,-sqrt(3)/8; (3sqrt(3))/8,-9/8,(3sqrt(3))/8,-1/8)
  $
  $
    A(f) = A(b) A(a) = mat(-1/8,(3sqrt(3))/8,-9/8,(3sqrt(3))/8;- sqrt(3)/8,5/8,-sqrt(3)/8,-3/8; -3/8,sqrt(3)/8,5/8,sqrt(3)/8; -(3sqrt(3))/8,-9/8,-(3sqrt(3))/8,-1/8)
  $
  这就得到了所有的表示。

  现在求该表示的特征标
  #three-line-table[
    | $g$ | $e$ | $d$ | $f$ | $a$ | $b$ | $c$ |
    | --- | -- | -- | -- | -- | -- | -- |
    | $chi^A (g)$ | $4$ | $1$ | $1$ | $0$ | $0$ | $0$ |
    | $chi^S (g)$ | $1$ | $1$ | $1$ | $1$ | $1$ | $1$ |
    | $chi^(A_1) (g)$ | $1$ | $1$ | $1$ | $-1$ | $-1$ | $-1$ |
    | $chi^Gamma (g)$ | $2$ | $-1$ | $-1$ | $0$ | $0$ | $0$ |
  ]
  就有
  $
    A(g) = sum_(i=1)^3 m_i A^i (g), i ={S,A_1,Gamma}
  $
  其中
  $
    m_i = braket(chi^i, chi^A)
  $
  从而
  $
    m_S = 1, m_A = 1, m_Gamma = 1\
  $
  从而有
  $
    A(g) = S(g) plus.circle A_1(g) plus.circle Gamma(g)\
  $
  这些空间所对应的函数基分别是
  $
    V_S = {1}, V_A_1 = {z}, V_Gamma = {x,y}\
  $

]

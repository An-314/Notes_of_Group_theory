#import "@preview/scripst:1.1.1": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

#show: scripst.with(
  template: "article",
  title: [群论],
  info: [第三次作业],
  author: "Anzreww",
  time: datetime.today().display("[year]/[month]/[day]"),
  /* preface parameter not available if template sets to 'article'*/
  matheq-depth: 2,
  lang: "zh",
)

#exercise[
  求出二维转动群的所有不等价不可约表示和双值表示。
]

#solution[
  #proposition(lab: "able-ir")[
    Able 群的所有不可约表示都是一维的。
  ]

  #proof[

    设 $A(cal(G))$ 是 Abel 群 $cal(G)$的一个不可约表示，那么乘法关系保持不变要求对所有 $a, a' in cal(G)$
    $
      A(a) A(a') = A(a') A(a)
    $
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
    利用 Schur 引理:#ref(<schur-lem-1>) ，我们可以得到对于每一个 $a' in cal(G)$，都有
    $
      A(a') = M(a') I
    $
    其中 $M(a')$ 是依赖于 $a'$ 的常复数。因此，若 $A(a)$ 是一个不可约表示，那么 $A(a)$ 只能是一个一维的表示。
  ]
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
  完备性由特征标的完备性给出。

  若为双值表示，则有
  $
    a(theta + 2 pi) = - a(theta)
  $
  从而有
  $
    a(theta) = e^(i m theta), m in ZZ + 1 / 2
  $
  这就得到了所有的 $"SO"(2)$ 的双值表示。
]

#exercise[
  推导$D_(m' m)^((j)) (alpha beta gamma)$满足的微分方程式
  $
    i pdv(, alpha) D^j_(m' m) (alpha beta gamma) = m' D^((j))_(m' m) (alpha beta gamma)\
    i pdv(, gamma) D^j_(m' m) (alpha beta gamma) = m D^((j))_(m' m) (alpha beta gamma)\
    (-pdv(, beta, 2) + cot beta pdv(, beta) + 1 / (sin^2 beta) (pdv(, alpha, 2) + pdv(, gamma, 2) - 2 cos beta pdv(, alpha, gamma))) D^((j))_(m' m) (alpha beta gamma) = j(j+1) D^((j))_(m' m) (alpha beta gamma)
  $
]

#proof[
  我们先证明
  #lemma[
    $
      R(psi vb(n)) (vb(l) dot vb(J)) R^(-1) (psi vb(n)) = (R(psi vb(n)) vb(l)) dot vb(J)
    $
  ]
  #proof[
    考虑$R(alpha vu(k))$以及$R(beta vu(j))$，有
    $
      R(alpha vu(k)) = C_z (alpha) = mat(cos alpha, -sin alpha, 0; sin alpha, cos alpha, 0; 0, 0, 1)\
      R(beta vu(j)) = C_y (beta) = mat(cos beta, 0, sin beta; 0, 1, 0; -sin beta, 0, cos beta)
    $
    再结合
    $
      J_x = mat(0, 0, 0; 0, 0, -i; 0, i, 0), J_y = mat(0, 0, i; 0, 0, 0; -i, 0, 0), J_z = mat(0, -i, 0; i, 0, 0; 0, 0, 0)
    $
    可以得到
    $
      R(alpha vu(k)) (vb(l) dot vb(J)) R^(-1) (alpha vu(k)) =(R(alpha vu(k)) vb(l)) dot vb(J)\
      R(beta vu(j)) (vb(l) dot vb(J)) R^(-1) (beta vu(j)) = (R(beta vu(j)) vb(l)) dot vb(J)
    $
    并且
    $
      R(alpha beta gamma) = e^(- i alpha J_z) e^(- i beta J_y) e^(- i gamma J_z) = R(alpha vu(k)) R(beta vu(j)) R(gamma vu(k))
    $
    由此可得
    $
      (R(alpha vu(k)) R(beta vu(j)) R(gamma vu(k))) (vb(l) dot vb(J)) (R(alpha vu(k)) R(beta vu(j)) R(gamma vu(k)))^(-1) = (R(alpha vu(k)) R(beta vu(j)) R(gamma vu(k)) vb(l)) dot vb(J)
    $
  ]
  回到原问题，对
  $
    R(alpha beta gamma) = e^(- i psi vb(n) dot vb(J)) = e^(- i alpha J_z) e^(- i beta J_y) e^(- i gamma J_z)
  $
  做偏微分有
  $
    pdv(, alpha) R(alpha beta gamma) &= - i J_z R(alpha beta gamma)\
    pdv(, beta) R(alpha beta gamma) &= - i (- sin alpha J_x + cos alpha J_z) R(alpha beta gamma)\
    pdv(, gamma) R(alpha beta gamma) &= - i (cos alpha sin beta J_x + sin alpha cos beta J_y + cos beta J_z) R(alpha beta gamma)
  $
  整理得到
  $
    J_z R(alpha beta gamma) = i pdv(, alpha) R(alpha beta gamma)\
    R(alpha beta gamma) J_z = i pdv(, gamma) R(alpha beta gamma)\
    J_x R(alpha beta gamma) = i (- cos alpha cot beta pdv(, alpha) - sin alpha pdv(, beta) + (cos alpha) / (sin beta) pdv(, gamma)) R(alpha beta gamma)\
    J_y R(alpha beta gamma) = i (- sin alpha cot beta pdv(, alpha) + cos alpha pdv(, beta) + (sin alpha) / (sin beta) pdv(, gamma)) R(alpha beta gamma)\
    vb(J)^2 R(alpha beta gamma) = - (-pdv(, beta, 2) + cot beta pdv(, beta) + 1 / (sin^2 beta) (pdv(, alpha, 2) + pdv(, gamma, 2) - 2 cos beta pdv(, alpha, gamma)) ) R(alpha beta gamma)
  $
  再结合
  $
    vb(J)^2 ket(j m) = j(j+1) ket(j m), J_z ket(j m) = m ket(j m)
  $
  以及
  $
    D^((j))_(m' m) = braket(j m', R(alpha, beta, gamma), j m)
  $
  可以得到
  $
    i pdv(, alpha) D^j_(m' m) (alpha beta gamma) = m' D^((j))_(m' m) (alpha beta gamma)\
    i pdv(, gamma) D^j_(m' m) (alpha beta gamma) = m D^((j))_(m' m) (alpha beta gamma)\
    (-pdv(, beta, 2) + cot beta pdv(, beta) + 1 / (sin^2 beta) (pdv(, alpha, 2) + pdv(, gamma, 2) - 2 cos beta pdv(, alpha, gamma))) D^((j))_(m' m) (alpha beta gamma) = j(j+1) D^((j))_(m' m) (alpha beta gamma)
  $
]

#exercise[
  设$2j + 1$个向量$ket(j m), m = j, j-1, ..., -j$在空间转动下按$D^((j))$变换，即
  $
    R(alpha beta gamma) ket(j m) = sum_(m') D^((j))_(m' m) (alpha beta gamma) ket(j m')
  $
  证明：$ket(j m)$必为$vb(J)^2$和$J_z$的共同本征矢，$vb(J)^2$和$J_z$的本征值分别为$j(j+1)$和$m$。
]

#proof[
  考虑$J_z$的作用：
  $
    D^((j)) (alpha 0 0) ket(j m) &= sum_m' D^((j))_(m' m) (alpha 0 0) ket(j m')\
    &:= e^(-i alpha J_z) ket(j m)\
  $
  而另一方面有
  $
    D^((j))_(m' m) (alpha 0 0) = e^(-i alpha m) delta_(m' m)
  $
  则有
  $
    e^(-i alpha J_z) ket(j m) = e^(-i alpha m) ket(j m)\
    J_z ket(j m) = m ket(j m)
  $
  而由于$vb(J)^2$再Lie代数中满足
  $
    [vb(J)^2, J_i] = 0, i = x,y,z
  $
  因此$vb(J)^2$与所有旋转生成元$J_i$对易，也就与整个表示$D^((j)) = e^(i psi vb(n) dot vb(J))$对易
  $
    [vb(J)^2, D^((j))] = 0
  $
  由 Schur 引理:#ref(<schur-lem-1>)
  $
    vb(J)^2 = lambda I
  $
  即
  $
    vb(J)^2 ket(j m) = lambda ket(j m)
  $
  现在确定$lambda$的具体值。

  对于升降算符
  $
    J_(plus.minus 1) = minus.plus 1 / sqrt(2) (J_x plus.minus i J_y), J_0 = J_z\
  $
  $
    braket(j m - 1, J_(-1), j m) = sqrt(1 / 2 (j+m) (j-m + 1))\
    braket(j m + 1, J_(+1), j m) = - sqrt(1 / 2 (j-m) (j+m + 1))\
  $
  有
  $
    lambda &= braket(j j, vb(J)^2, j j) = braket(j j, -J_(+1) J_(-1) - J_(-1) J_(+1) + J_0^2, j j)\
    &= (j-m) (j+m + 1) + m (m + 1) \
    &= j (j + 1)\
  $
  从而本征值为$j(j+1)$，即
  $
    vb(J)^2 ket(j m) = j(j+1) ket(j m)\
    J_z ket(j m) = m ket(j m)
  $
]

#exercise[
  设$vb(J)^2, J_z$和$B$是一组力学量完全集，$ket(j m b)$是它们的共同本征矢，
  $
    vb(J)^2 ket(j m b) = j(j+1) ket(j m b)\
    J_z ket(j m b) = m ket(j m b)\
    B ket(j m b) = b ket(j m b)
  $
  证明：算符
  $
    V^j_m = sum_(m_1, m_2) (-)^(j_2 - m_2) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) ketbra(j_1 m_1 b_1, j_2 m_2 b_2)
  $
  是$"SO"(3)$群的$j$秩不可约张量。
]

#proof[
  只需要验证
  $
    [J_z, V_q^k] = q V_q^k\
    [J_(plus.minus), V_q^k] = sqrt((k minus.plus q)(k plus.minus q + 1)) V_(q plus.minus 1)^k\
  $
  其中
  $
    J_plus.minus = J_x plus.minus i J_y\
  $
  1. $[J_z, V_q^k] = q V_q^k$
    $
      [J_z, V_q^k] = sum_(m_1, m_2) (-)^(j_2 - m_2) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) [J_z, ketbra(j_1 m_1 b_1, j_2 m_2 b_2)]\
    $
    考虑到
    $
      J_z ket(j_1 m_1 b_1) = m_1 ket(j_1 m_1 b_1), bra(j_2 m_2 b_2) J_z = m_2 bra(j_2 m_2 b_2)
    $
    $
      [J_z, ketbra(j_1 m_1 b_1, j_2 m_2 b_2)] &= J_z ketbra(j_1 m_1 b_1, j_2 m_2 b_2) - ketbra(j_1 m_1 b_1, j_2 m_2 b_2) J_z \
      &= (m_1 - m_2) ketbra(j_1 m_1 b_1, j_2 m_2 b_2)\
    $
    从而
    $
      [J_z, V_q^k] &= (m_1 - m_2) sum_(m_1, m_2) (-)^(j_2 - m_2) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) ketbra(j_1 m_1 b_1, j_2 m_2 b_2)\
      &= m sum_(m_1, m_2) (-)^(j_2 - m_2) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) ketbra(j_1 m_1 b_1, j_2 m_2 b_2)\
      &= m V_q^k
    $
  2. $[J_(plus.minus), V_q^k] = sqrt((k minus.plus q)(k plus.minus q + 1)) V_(q plus.minus 1)^k$
    $
      [J_(plus.minus), V_q^k] = sum_(m_1, m_2) (-)^(j_2 - m_2) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) [J_(plus.minus), ketbra(j_1 m_1 b_1, j_2 m_2 b_2)]\
    $
    而又考虑到
    $
      J_(plus.minus) ket(j_1 m_1 b_1) = sqrt((j_1 minus.plus m_1)(j_1 plus.minus m_1 + 1)) ket(j_1 m_1 plus.minus 1 b_1),\
      bra(j_2 m_2 b_2) J_(plus.minus)= - sqrt((j_2 plus.minus m_2)(j_2 minus.plus m_2 + 1)) bra(j_2 m_2 minus.plus 1 b_2)
    $
    $
      [J_(plus.minus), ketbra(j_1 m_1 b_1, j_2 m_2 b_2)] =& J_(plus.minus) ketbra(j_1 m_1 b_1, j_2 m_2 b_2) - ketbra(j_1 m_1 b_1, j_2 m_2 b_2) J_(plus.minus)\
      =& sqrt((j_1 minus.plus m_1)(j_1 plus.minus m_1 + 1)) ketbra(j_1 m_1 plus.minus 1 b_1, j_2 m_2 b_2)\
      &- sqrt((j_2 plus.minus m_2)(j_2 minus.plus m_2 + 1)) ketbra(j_1 m_1 b_1, j_2 m_2 minus.plus 1 b_2)\
    $
    注意到CG系的递推式
    $
      &sqrt((j plus.minus m + 1)(j minus.plus m)) braket(j_1 m_1 j_2 m_2, j m plus.minus 1)\ = &sqrt((j_1 minus.plus m_1)(j_1 plus.minus m_1 + 1)) braket(j_1 m_1 minus.plus 1 j_2 m_2, j m) + sqrt((j_2 minus.plus m_2)(j_2 plus.minus m_2 + 1)) braket(j_1 m_1 j_2 m_2 minus.plus 1, j m)
    $
    继续化简
    $
      &sum_(m_1, m_2) (-)^(j_2-m_2) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) sqrt((j_1 minus.plus m_1)(j_1 plus.minus m_1 + 1)) ketbra(j_1 m_1 plus.minus 1 b_1, j_2 m_2 b_2)\
      =&sum_(m'_1, m_2) (-)^(j_2-m_2) braket(j_1 m'_1 minus.plus 1 j_2 -m_2, j_1 j_2 j m) sqrt((j_1 minus.plus (m'_1 minus.plus 1))(j_1 plus.minus (m'_1 minus.plus 1) + 1)) ketbra(j_1 m'_1 b_1, j_2 m_2 b_2)\
    $
    而且
    $
      &sum_(m_1, m_2) (-)^(j_2-m_2) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) (-) sqrt((j_2 plus.minus m_2)(j_2 minus.plus m_2 + 1)) ketbra(j_1 m_1 b_1, j_2 m_2 minus.plus 1 b_2)\
      =&sum_(m_1, m'_2) (-)^(j_2-m'_2 plus.minus 1) braket(j_1 m_1 j_2 -(m'_2 plus.minus 1), j_1 j_2 j m) sqrt((j_2 plus.minus (m'_2 plus.minus 1))(j_2 minus.plus (m'_2 plus.minus 1) + 1)) ketbra(j_1 m_1 b_1, j_2 m'_2 b_2)\
    $
    由此可得
    $
      &[J_(plus.minus), V_q^k] \
      = &sum_(m_1, m_2) ((-)^(j_2-m_2) braket(j_1 m_1 minus.plus 1 j_2 -m_2, j_1 j_2 j m) sqrt((j_1 minus.plus (m_1 minus.plus 1))(j_1 plus.minus (m_1 minus.plus 1) + 1)) ketbra(j_1 m_1 b_1, j_2 m_2 b_2) + \
        &braket(j_1 m_1 j_2 -(m'_2 plus.minus 1), j_1 j_2 j m) sqrt((j_2 plus.minus (m'_2 plus.minus 1))(j_2 minus.plus (m'_2 plus.minus 1) + 1)) ketbra(j_1 m_1 b_1, j_2 m'_2 b_2))\
      =& sum_(m_1, m_2) (-)^(j_2 - m_2) sqrt((j minus.plus m)(j plus.minus m + 1)) braket(j_1 m_1 j_2 -m_2, j_1 j_2 j m) ketbra(j_1 m_1 b_1, j_2 m_2 plus.minus 1 b_2)\
      =& sqrt((k minus.plus q)(k plus.minus q + 1)) V_(q plus.minus 1)^k
    $
  综上：
  $
    [J_z, V_q^k] = q V_q^k,\
    [J_(plus.minus), V_q^k] = sqrt((k minus.plus q)(k plus.minus q + 1)) V_(q plus.minus 1)^k
  $
  即$V^j_m$是$"SO"(3)$群的$j$秩不可约张量。
]

#exercise[
  设$mat(1; 0), mat(0; 1)$让自旋为$1 / 2$的粒子，$S_z$为$1 / 2$和$-1 / 2$的本征矢，$Y_(l m)$是轨道角动量本征态。求出总角动量为$j$，投影为$m$，轨道角动量$l = j +1 / 2$的态$Psi^(j m)_(l = j +1 / 2)$。试问：当空间绕$x$轴转$pi$时，$Psi^(j m)_(l = j +1 / 2)$如何改变？
]

#solution[
  轨道角动量$l$和自旋角动量$s$的耦合态可以用球协张量算符表示：
  $
    Psi^(j m)_(l = j + 1 / 2) = sum_(m_l, m_s) braket(l m_l s m_s, j m) Y_(l m_l) S_(m_s)
  $
  对它作用绕$x$轴转动$pi$的算符
  $
    R_x (pi) = e^(- i pi J_x) = R_z (pi / 2) R_y (pi) R_z (-pi / 2)
  $
  只依赖于总角动量生成元
  $
    vb(J) = vb(L) + vb(S)
  $
  可以分开写作
  $
    R_x (pi) = P_x^"orb" (pi) times.circle P_x^"spin" (pi)
  $
  考虑到$beta=pi$有
  $
    d_(m'_l m_l)^l (pi) = (-1)^(l + m_l) delta_(m'_l ,-m_l),\
  $
  此时
  $
    R_x (pi) Y_(l m_l) = sum_m'_l d_(m'_l m_l)^l (pi) Y_(l m'_l) = (-1)^(l + m_l) Y_(l -m_l)
  $
  同样对自旋态
  $
    R_x (pi) S_(m_s) = -i S_(-m_s)
  $
  把两部分合成，再按CG系数展开，总态变换为
  $
    R_x (pi) Psi^(j m)_(l = j + 1 / 2) &= sum_(m_l, m_s) (-i) (-1)^(l + m_l) braket(l -m_l s -m_s, j m) Y_(l -m_l) S_(-m_s)\
    &= sum_(m_l, m_s) (-i) (-1)^(2l + s - j) braket(l -m_l s -m_s, j m) Y_(l -m_l) S_(-m_s)\
    &= (-i) (-1)^(2l + s - j) Psi^(j -m)_(l = j + 1 / 2)\
    &= (-i) (-1)^(j - 1 / 2) Psi^(j -m)_(l = j + 1 / 2)
  $
]

#exercise[
  用方位角参数表达$"SU"(2)$群元素$u$。
]

#solution[
  $"SU"(2)$的群元素可以写成
  $
    u = e^(- i (vb(r) dot vb(sigma))) = mat(cos r - i z / r sin r, -i x / r sin r - y / r sin r; -i x / r sin r + y / r sin r, cos r + i z / r sin r)\
  $
  其中$vb(r) = mat(x; y; z)$，替换成方位角参有
  $
    x = r sin theta cos phi,\
    y = r sin theta sin phi,\
    z = r cos theta,\
    r = psi
  $
  代入上式得到
  $
    u = mat(cos psi - i cos theta sin psi, -i sin theta cos phi sin psi - i sin theta sin phi sin psi; -i sin theta cos phi sin psi + i sin theta sin phi sin psi, cos psi + i cos theta sin psi)
  $
]

#exercise[
  证明：
  $
    d_(m m')^((j)) (beta) = (-1)^(m - m') d_(m' m)^((j)) (beta)
  $
  并给出$d_(m m')^((j)) (0)$和$d_(m m')^((j)) (pi)$的值。
]

#proof[
  $
    d_(m m')^((j)) (beta) = sum_k (-1)^k sqrt((j+m)! (j-m)! (j+m')! (j-m')!) / ((j+m-k)! (j-m'-k)! k! (k-m+m')!) \ (cos beta / 2)^(2j + m - m' - 2k) (sin beta / 2)^(2k - m + m')
  $
  观察上式，将索引替换
  $
    m <-> m', k->((j - m') - (j-m)) +k=k+(m-m')
  $
  而幂次也恰好交换：
  $
    2j + m - m' -2k <-> 2j + m' - m - 2(k + (m - m'))
  $
  和sin,cos 指数一一对应。其余各阶乘组合在交换 后不变。因此总体得
  $
    d_(m m')^((j)) (beta) = (-1)^(m - m') d_(m' m)^((j)) (beta)
  $
  特别地
  - $beta=0$
    sin的指数是$m' - m + 2k$要使项非零，必须有
    $
      m' - m + 2k = 0
    $
    由于$k>=0$必须有$m' = m$，因此
    $
      d_(m m')^((j)) (0) = delta_(m m')
    $
  - $beta=pi$
    cos的指数是$2j + m - m' - 2k$要使项非零，必须有
    $
      2j + m - m' - 2k = 0
    $
    由于$k>=0$必须有$m' = -m, k = j - m$，因此
    $
      d_(m m')^((j)) (pi) = (-1)^(j + m') d_(m -m')^((j)) (pi)
    $
]

#exercise[
  利用公式
  $
    e^A B e^(-A) = B + 1 / 1! [A, B] + 1 / 2! [A, [A, B]] + ...
  $
  证明
  $
    u(vb(n), psi) sigma_i u(vb(n), psi)^(-1) = sum_(j=1)^3 R_(j i) (vb(n), psi) sigma_j
  $
  其中$u(vb(n), psi) = e^(- i psi (vb(n) dot vb(sigma)) / 2) in "SU"(2)$，$R(vb(n), psi) = e^(- i psi vb(n) dot vb(J)) in "SO"(3)$。
]

#proof[
  我们知道
  $
    u(vb(n), psi) = e^(- i psi (vb(n) dot vb(sigma)) / 2)
  $
  从而
  $
    "LHS" = e^(- i psi (vb(n) dot vb(sigma)) / 2) sigma_i e^(i psi (vb(n) dot vb(sigma)) / 2)
  $
  Pauli 矩阵的对易关系
  $
    [sigma_i, sigma_j] = 2 i epsilon_(i j k) sigma_k
  $
  令
  $
    A = - i psi (vb(n) dot vb(sigma)) / 2, B = sigma_i
  $
  从而有
  $
    [A,B] = [- i psi (vb(n) dot vb(sigma)) / 2, sigma_i] = - (i psi) / 2 [vb(n) dot vb(sigma), sigma_i] = psi sum_(j=1)^3 epsilon_(i j k) n_j sigma_k = psi (vb(n) times vb(sigma))_i
  $
  同理可以得到
  $
    [A,[A,B]] = psi epsilon_(a i j) n_a [A, sigma_j] = psi epsilon_(a i j) n_a (psi epsilon_(b j k) n_b sigma_k) =psi^2 (vb(n) times (vb(n) times vb(sigma)))_i
  $
  依此类推，第$k$阶对易子会出现
  $
    [A, [...[A, B]...]] = psi^(k) (vb(n) times ... (vb(n) times vb(sigma)))_i
  $
  因此
  $
    e^A B e^(-A) &= B + 1 / 1! [A, B] + 1 / 2! [A, [A, B]] + ... \
    &= sigma_i + psi (vb(n) times vb(sigma))_i + psi^2 / 2! (vb(n) times (vb(n) times vb(sigma)))_i + ...\
  $
  利用
  $
    vb(n) times (vb(n) times vb(X)) = vb(n)(vb(n) dot vb(X)) - vb(X)
  $
  偶数项$k=2m$：
  $
    sum_(m=0)^oo psi^(2m) / (2m)! ((vb(n) times)^(2m) sigma_i) = sigma_i cos psi + (1-cos psi) n_i (vb(n) dot vb(sigma))
  $
  奇数项$k=2m+1$：
  $
    sum_(m=0)^oo psi^(2m+1) / (2m+1)! ((vb(n) times)^(2m+1) sigma_i) = sin psi (vb(n) times vb(sigma))_i
  $
  因此
  $
    e^A B e^(-A) &= sigma_i cos psi + (1-cos psi) n_i (vb(n) dot vb(sigma)) + sin psi (vb(n) times vb(sigma))_i\
    &= sum_(j=1)^3 R_(j i) (vb(n), psi) sigma_j
  $
]

#exercise[
  求电偶极跃迁的矩阵元$braket(j_1 m_1, e vb(r), j_2 m_2)$。提示：把$vb(r)$用球协函数/球协张量算符$Y_(1m)$展开，然后用 WE 定理。
]

#solution[
  先将电偶极算符$e vb(r)$用球协张量算符表示：
  $
    vb(r)_q = sqrt((4 pi) / 3) Y^1_q, q=1, 0, -1
  $
  $
    braket(j_1 m_1, r Y^1_q, j_2 m_2) = braket(j_1, abs(r Y^1), j_2) braket(j_1 m_1, 1 q, j_2 m_2)
  $
  从而最终
  $
    braket(j_1 m_1, e vb(r), j_2 m_2) = e sqrt((4 pi) / 3) braket(j_1, abs(r Y^1), j_2) sum_(q=-1)^1 braket(j_1 m_1, 1 q, j_2 m_2)
  $
  其中
  $
    braket(j_1, abs(r Y^1), j_2) = integral_0^oo R_(n_1 l_1) (r) r R_(n_2 l_2) (r) r^2 dd(r)
  $
  是含径向波函数的径向积分。
]

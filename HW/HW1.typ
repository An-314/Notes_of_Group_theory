#import "@preview/scripst:1.1.1": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx

#show: scripst.with(
  template: "article",
  title: [群论],
  info: [第一次作业],
  author: "刘骥安 2022013054",
  // author: ("AnZrew", "AnZrew"),
  time: datetime.today().display("[year]/[month]/[day]"),
  /* preface parameter not available if template sets to 'article'*/
  matheq-depth: 2,
  lang: "zh",
)

#exercise[

  求 $6$ 阶循环群的所有不变子群，以及其对应的商群。 ]

#solution[

  $6$ 阶循环群 $C^6 = {e, a, a^2, a^3, a^4, a^5}$ 的所有子群有
  - $H_1 = {e, a, a^2, a^3, a^4, a^5}$
  - $H_2 = {e, a^2, a^4}$
  - $H_3 = {e, a^3}$
  - $H_4 = {e}$
  由于循环群是 Abel 群，所以所有子群都是不变子群。这些群对应的商群分别为
  - $C^6 \/ H_1 = {H_1}$
  - $C^6 \/ H_2 = {H_2, a H_2}$
  - $C^6 \/ H_3 = {H_3, a H_3, a^2 H_3}$
  - $C^6 \/ H_4 = {H_4, a H_4, a^2 H_4, a^3 H_4, a^4 H_4, a^5 H_4}$
]

#exercise[

  设群 $G$ 只有一个阶为 $2$ 的元素 $h$，证明：对任意 $g in G$，有 $g h = h g$。 ]

#proof[

  若存在 $g in G$ 使得 $g h != h g$，即$g h g^(-1) != h$。记$g h g^(-1) = h'$则有
  $
    h'^2 = g h g^(-1) g h g^(-1) = g h^2 g^(-1) = g g^(-1) = e
  $
  这就意味着有不同于 $h$ 的阶为 2 的元素 $h'$，与题设矛盾！

  从而对任意 $g in G$，有 $g h = h g$。
]

#exercise[

  设 $G = G_1 times.circle G_2$，证明：商群 $G \/ G_1$ 同构于 $G_2$。 ]

#proof[

  取$g_(1 gamma) g_(2 delta) in cal(G)$，则
  $
    (g_(1 gamma) g_(2 delta)) g_(1 alpha) (g_(1 gamma) g_(2 delta))^(-1) = g_(1 gamma) g_(2 delta) g_(1 alpha) g_(2 delta)^(-1) g_(1 gamma)^(-1) \
    = g_(1 gamma) g_(1 alpha) g_(2 delta) g_(2 delta)^(-1) g_(1 gamma)^(-1) = g_(1 gamma) g_(1 alpha) g_(1 gamma)^(-1) in cal(G)_1
  $
  从而
  $
    cal(G)_1 lt.tri cal(G)
  $
  同理
  $
    cal(G)_2 lt.tri cal(G)
  $
  从而可以构造商群；下面说明商群的同构，$cal(G)_1$是$cal(G)$的不变子群，取$cal(G)_2$构造其陪集串
  $
    {cal(G)_1, g_(21) cal(G)_1, g_(22) cal(G)_1, ...}
  $
  该陪集串能够把$cal(G)$完全分割，这是因为$g_(2i) != g_(2j) => g_(2i) cal(G)_1 != g_(2j) cal(G)_1$，否则与$g_(1 alpha) g_(2 beta)$的唯一性矛盾。从而
  $
    cal(G)\/cal(G)_1 = {cal(G)_1, g_(21) cal(G)_1, g_(22) cal(G)_1, ...}
  $
  从而
  $
    cal(G)\/cal(G)_1 tilde.equiv cal(G)_2
  $
]


#exercise[

  试构造出 $4$ 阶群的所有独立的乘法表。 ]

#solution[

  $4$ 阶群的所乘法表至少如下：
  #let tab = (
    ([$dot$], vlinex(), [$e$], [$a$], [$b$], [$c$]),
    hlinex(),
    ([$e$], [$e$], [$a$], [$b$], [$c$]),
    ([$a$], [$a$], [$$], [$$], [$$]),
    ([$b$], [$b$], [$$], [$$], [$$]),
    ([$c$], [$c$], [$$], [$$], [$$]),
  )
  #figure(tablex(columns: 5, align: center, auto-vlines: false, auto-hlines: false, ..tab.flatten()))
  由 Lagrange 定理，$4$ 阶群的阶数只能是 $1, 2, 4$。
  - 若有元素的阶数为 $4$，则有 $a, a^2, a^3 in G$，而 $abs(G)=4$，该群是一个循环群 $C^4$ ，乘法表为：
    #let tab = (
      ([$dot$], vlinex(), [$e$], [$a$], [$b$], [$c$]),
      hlinex(),
      ([$e$], [$e$], [$a$], [$b$], [$c$]),
      ([$a$], [$a$], [$b$], [$c$], [$e$]),
      ([$b$], [$b$], [$c$], [$e$], [$a$]),
      ([$c$], [$c$], [$e$], [$a$], [$b$]),
    )
    #figure(tablex(columns: 5, align: center, auto-vlines: false, auto-hlines: false, ..tab.flatten()))
  - 所有元素的阶都是 $1$ 或 $2$，那么 $a^2 = b^2 = c^2 = e$，乘法表为：
    #let tab = (
      ([$dot$], vlinex(), [$e$], [$a$], [$b$], [$c$]),
      hlinex(),
      ([$e$], [$e$], [$a$], [$b$], [$c$]),
      ([$a$], [$a$], [$e$], [$$], [$$]),
      ([$b$], [$b$], [$$], [$e$], [$$]),
      ([$c$], [$c$], [$$], [$$], [$e$]),
    )
    #figure(tablex(columns: 5, align: center, auto-vlines: false, auto-hlines: false, ..tab.flatten()))
    由于乘法表每行每列都是群元素的重排，第二行最后两个元素只能是 $c, b$ ，由此可以定出一个表：
    #let tab = (
      ([$dot$], vlinex(), [$e$], [$a$], [$b$], [$c$]),
      hlinex(),
      ([$e$], [$e$], [$a$], [$b$], [$c$]),
      ([$a$], [$a$], [$e$], [$c$], [$b$]),
      ([$b$], [$b$], [$c$], [$e$], [$a$]),
      ([$c$], [$c$], [$b$], [$a$], [$e$]),
    )
    #figure(tablex(columns: 5, align: center, auto-vlines: false, auto-hlines: false, ..tab.flatten()))
    还需要验证结合率
    $
      (a a) b = e b = b &, a (a b) = a c = b\
      (a b) a = c a = b &, a (b a) = a c = b \
      (a b) b = c b = a &, b (b a) = b c = a \
      (a b) c = c c = e &, a (b c) = a a = e \
    $
    再结合$a,b,c$是对称的，可以得到结合率成立，所以这是一个群。

  由此可知，$4$ 阶群的所有独立的乘法表有两个。
]

#exercise[

  任取两个 Pauli 矩阵，把它们作为生成元生成一个群，请写出所有群元素和最少数量的定义关系，并证明该群是 $"GL"(2,CC)$ 的一个子群。
]

#solution[

  Pauli 矩阵为
  $
    sigma_x = mat(0,1;1,0), sigma_y = mat(0,-i;i,0), sigma_z = mat(1,0;0,-1) = -i sigma_x sigma_y\
    sigma_i sigma_j = delta_(i j) + i epsilon_(i j k) sigma_k
  $
  选择 $sigma_x$ 和 $sigma_y$ 作为生成元，那么群元素为
  $
    sigma_x, sigma_y, sigma_x^2 = sigma_y^2 = e,\
    sigma_x sigma_y, (sigma_x sigma_y)^2 = -e
  $
  从而所有元素是
  $
    e, -e, sigma_x, sigma_y, - sigma_x, - sigma_y, i sigma_z, - i sigma_z
  $
  共 $8$ 个元素，最少需要的定义关系为
  $
    sigma_x^2 = sigma_y^2 = e, - (sigma_x sigma_y)^2 = e
  $
  满足群的封闭性，结合律，单位元，逆元，从而是一个群。

  只需证明该群是 $"GL"(2,CC)$ 的一个子集即可。
  $
    det(sigma_x) = det(sigma_y) = 1
  $
  从而该群所有元素的行列式都是 $1$，所以是 $"GL"(2,CC)$ 的一个子群。
]

#exercise[

  保持正 $n$ 边形不变的群为 $D_(2n)$，$abs(D_(2n)) = 2n$，它由两个生成元 $a$ 和 $b$ 生成，且满足定义关系 $a^n = e, b^2 = e, (a b)^2 = e$，其中 $n >= 3$ 为自然数。分别计算 $n$ 为偶数和奇数时，该群的共轭类。
]

#solution[

  注意到
  $
    b^(-1) = b, a b = (a b)^(-1) = b^(-1) a^(-1) = b a^(-1)
  $
  $
    b a^m = b a^(-1) a^(m+1) = a b a^(m+1) = a^2 b a^(m+2) = a^(n-m) b = a^(-m) b
  $
  所以所有的群元都可以化简为
  $
    a^alpha b^beta, 0 <= alpha < n, beta = 0, 1
  $
  上面的定义关系可以化简为
  $
    b^beta a^alpha = a^((-1)^beta alpha) b^beta
  $
  的形式，共 $2n$ 个元素。

  $
    (a^mu b^nu) a^alpha b^beta (a^mu b^nu)^(-1) &= a^mu b^nu a^alpha b^beta b^(-nu) a^(-mu) = a^mu a^((-1)^nu alpha) b^(nu + beta-nu) a^(-mu)\ &= a^(mu + (-1)^nu alpha - (-1)^(beta) mu) b^beta & (0 <= mu ,alpha < n, 0 <= nu, beta <= 1)
  $
  - $beta = 0$
    $
      a^alpha tilde a^((-1)^nu alpha), nu = 0, 1, 0 <= alpha < n
    $
    这就意味着
    $
      { a^alpha, a^(n-alpha)}
    $
    是一个共轭类，共 $cases(n/2 + 1 &\, n "为偶数", (n+1)/2 &\, n "为奇数")$ 个。
  - $beta = 1$
    $
      a^alpha b tilde a^(2mu + (-1)^nu alpha) b, nu = 0, 1, 0 <= alpha, mu < n
    $
    $2mu + (-1)^nu alpha$取遍$alpha, alpha+2, alpha+4, ..., - alpha, - alpha + 2, - alpha + 4, ...$，所以
    - $n$ 是偶数时，取遍与$alpha$同奇偶的所有数，共 $n/2$ 个

      这就意味着只有两个共轭类
      $
        {a b, a^3 b, ..., a^(n-1) b}, {b, a^2 b, a^4 b, ..., a^(n-2) b}
      $
    - $n$ 是奇数时，取遍所有元素，共 $n$ 个

      这就意味着只有一个共轭类
      $
        {b, a b, a^3 b, ..., a^(n-1) b}
      $

  综上所述：
  - $n$ 是偶数时，$D_(2n)$ 有 $n/2 + 3$ 个共轭类，分别是：
    - ${a^alpha, a^(n-alpha)}$，$0 <= alpha < n$
    - ${a b, a^3 b, ..., a^(n-1) b}$
    - ${b, a^2 b, a^4 b, ..., a^(n-2) b}$
  - $n$ 是奇数时，$D_(2n)$ 有 $(n+1)/2 + 1$ 个共轭类，分别是：
    - ${a^alpha, a^(n-alpha)}$，$0 <= alpha < n$
    - ${b, a b, a^3 b, ..., a^(n-1) b}$
]

#exercise[

  设 $G$ 是一个 Abel 群，证明：$G$ 中所有阶数有限的元素的集合
  $
    H = {g in G | h^k = e, k in NN}
  $
  是 $G$ 的一个不变子群，且商群 $G \/ H$ 中任一陪集的阶数都是无限的。
]

#proof[

  我们先证明 $H$ 是一个子群：
  - 结合律：对于任意 $g, h in H, g^k=e, h^l = e$，有
    $
      (g h)^(k l) = g^(k l) h^(k l) = e
    $
    从而 $g h in H$。
  - 单位元：$e^k = e$，所以 $e in H$。
  - 逆元：对于任意 $g in H$，有 $g^k = e$，所以 $g^(-k) = e$，从而 $g^(-1) in H$。
  从而 $H$ 是 $G$ 的一个子群。

  考虑 $H$ 中的元素 $h$，对于任意 $g in G$
  $
    (g h g^(-1))^k = g h^k g^(-1) = g e g^(-1) = e
  $
  从而 $g h g^(-1) in H$，所以 $H$ 是 $G$ 的一个不变子群。

  下面证明 $G \/ H$ 中任一陪集的阶数都是无限的。假设 $g H$ 的阶数是有限的，那么存在 $k in NN$ 使得 $(g H)^k = H$，即 $g^k H = H$，从而 $g^k in H$，这与陪集定理矛盾！

  从而 $G \/ H$ 中任一陪集的阶数都是无限的。
]

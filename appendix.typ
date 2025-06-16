#import "@preview/scripst:1.1.1": *
#import "@preview/tablex:0.0.9": tablex, gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge


= 附录

== 不可约表示与对称性

我们常说，不可约表示和确定的变换对称性是对应的。
$g$的作用为
$
  g: vb(r) -> vb(r)' = g vb(r)
$
变换$T_g$有
$
  H psi &= E psi\
  T_g H psi &= E(T_g psi)\
  T_g H T_g^(-1) T_g psi &= E T_g psi\
  H' (T_g psi) &= E (T_g psi)\
$
若$H'=H$就有
$
  H (T_g psi) = E (T_g psi)
$
这就说明，在波函数的对称变换$T_g$下，Schrödinger方程保持不变。

从而有对易关系
$
  [H, T_g] = 0
$
称$G tilde.equiv {T_g}$为$H$的对称群。

其不可约表示$D^(j)$，其中$j$为不可约表示的标记，也就是量子数。不可约表示的维数$dim D^(j)$代表能级的简并度。

$
  H psi_(n alpha) = E_n psi_(n alpha), alpha = 1, 2,..., p
$
将$T_g$作用上去有
$
  H (T_g psi_(n alpha)) = E_n (T_g psi_(n alpha))
$
其中
$
  T_g psi_(n alpha) (vb(r)) = psi_(n alpha) (g^(-1) vb(r)) = sum_beta A_(n, beta alpha) psi_(beta) (vb(r))
$
$A$为不可约表示的矩阵元。从而表示的维数$dim A = p$，即为简并度。

关于其不可约性，做出以下规定。我们将简并分为：正常简并与偶然简并。正常简并是指完全由不可约表示也就是对称性决定的简并。偶然简并是指调整某些参数或者可约表示给出的简并。下正常简并的情况下，表示的维数等于简并度。

== 动力学对称性

$n$维氢原子有$"SO"(n+1)$对称性。

// 三维氢原子的Runge-Lenz量为
// $
//   vb(R) = 1 / (2 mu) (vb(p) times vb(L) - vb(L) times vb(p)) - vb(r) / r = 1 / (2 mu) (vb(p) times vb(L) - i hbar vb(p)) - vb(r) / r
// $
// 也有对易关系
// $
//   [vb(R), H] = 0, [vb(L), H] = 0
// $
// 给出了6个守恒量。

$"O"(4)$给出了一个群链
$
  &"O"(4) supset &"O"(3) supset &"O"(2)\
  "不可约表示，量子数" & (n_1,n_2) &l &m\
  "本征态" & ket((n_1,n_2) l m) = ket(n l m) = psi_(n l m)\
  "分支率/量子数的取值限制" & "O"(4) supset "O"(3) : l = n-1, n-2, ..., 0\
  &"O"(3) supset "O"(2) : m = l, l-1, ..., -l\
$
氢原子的Hamiltonian为
$
  - (mu e^4) / 2 1 / H - hbar^2 = vb(R)^2 + vb(L)^2
$
Casimir算符为
$
  C_"O"(4) = vb(R)^2 + vb(L)^2
$
有
$
  [vb(L)^2 , L_i] = 0, C_"O"(3) = vb(L)^2\
  [C_"O"(4), L_i] = 0, [C_"O"(4), R_i] = 0
$
$H$用$"O"(4)$表示就是
$
  H = C_"O"(4) / (2 mu) - hbar^2 / (2 mu r^2)
$
其期望
$
  braket(n l m, C_"O"(4), n l m) = (n^2 - 1) hbar^2
$
从而有能级
$
  E_n = - mu e^4 / (2 n^2) + hbar^2 / (2 mu n^2)
$

#proposition(subname: [动力学对称性])[
  量子系统有动力学对称群$G_1$且有群链
  $
    G_1 supset G_2 supset G_3 supset ...
  $
  这给出了
  - 不可约表示：$alpha beta gamma ...$
  - 本征态：$ket(alpha beta gamma ...)$ 分支率给出物理约束
  - Hamiltonian：$H = f(C_G_1) + f(C_G_2) + f(C_G_3) + ...$ 其中$C_G_i$为群$G_i$的Casimir算符
  - 能级：$E_n = braket(alpha beta gamma ..., H, alpha beta gamma ...)$
]

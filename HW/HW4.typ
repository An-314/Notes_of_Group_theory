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
  求 5 阶对称群$S_5$的类，并指出$S_5$的那些Young图是自共轭的，那些Young图是互为共轭的。
]

#exercise[
  求 4 阶对称群$S_4$的的所有不变子群. 指出哪个不变子群的商群和$S_3$同构。
]

#exercise[
  设$A_n$是$n$阶对称群$S_n$的偶置换子群，证明：$A_n$是$S_n$的一个不变子群，并求出其商群$S_n\/A_n$.
]

#exercise[
  5阶对称群$S_5$有多少个不等价不可约表示？每个维数是多少？
]

#exercise[
  求4阶对称群$S_4$的不可约表示$[Lambda] = [2,2]$。
]

#exercise[
  利用$S_4$的特征标，计算$S_4$的以下两个不可约表示的直积分解：
  - $[4] times.circle [3,1]$
  - $[3,1] times.circle [3,1]$
  - $[2,2] times.circle [1^4]$
]

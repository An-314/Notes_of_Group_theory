(* 定义变换函数 *)
TransformFunction2D[func_, matrix_, {x_, y_}, {x1_, y1_}] := Module[
  {invMatrix, oldVars},
  invMatrix = Inverse[matrix];
  oldVars = invMatrix.{x1, y1};
  Collect[
    Expand[
      Simplify[func /. {x -> oldVars[[1]], y -> oldVars[[2]]}]
    ],
    {x1, y1}
  ]
];

(* 定义变换矩阵 *)
matrices = <|
  "Ta" -> {{-1, 0}, {0, 1}},
  "Tb" -> {{1/2, Sqrt[3]/2}, {Sqrt[3]/2, -1/2}},
  "Tc" -> {{1/2, -Sqrt[3]/2}, {-Sqrt[3]/2, -1/2}},
  "Te" -> {{1, 0}, {0, 1}},
  "Td" -> {{-1/2, -Sqrt[3]/2}, {Sqrt[3]/2, -1/2}},
  "Tf" -> {{-1/2, Sqrt[3]/2}, {-Sqrt[3]/2, -1/2}}
|>;

(* 原函数 *)
phi = x^3 + 3 * x^2 y + 3 * x y^2 + y^3;

(* 存储结果 *)
results = <||>;

(* 应用变换并存储 *)
KeyValueMap[
  (results[#1] = TransformFunction2D[phi, #2, {x, y}, {x1, y1}]) &,
  matrices
];

(* 打印结果 *)
KeyValueMap[
  (Print[#1, ": ", #2]) &,
  results
];

(* 给定权重列表 *)
weightsS = {1/6, 1/6, 1/6, 1/6, 1/6, 1/6};
weightsA = {-1/6, -1/6, -1/6, 1/6, 1/6, 1/6};
weightsGamma11 = {1/3, -1/6, -1/6, -1/3, 1/6, 1/6};

(* 按照矩阵顺序提取结果表达式 *)
exprList = Lookup[results, {"Ta", "Tb", "Tc", "Te", "Td", "Tf"}];

(* 求和后的表达式 *)
weightedSumS = Total[MapThread[#1 * #2 &, {weightsS, exprList}]];
weightedSumA = Total[MapThread[#1 * #2 &, {weightsA, exprList}]];
weightedSumGamma11 = Total[MapThread[#1 * #2 &, {weightsGamma11, exprList}]];

(* 化简并合并同类项 *)
finalExprS = Collect[Simplify[Expand[weightedSumS]], {x1, y1}];
finalExprA = Collect[Simplify[Expand[weightedSumA]], {x1, y1}];
finalExprGamma11 = Collect[Simplify[Expand[weightedSumGamma11]], {x1, y1}];

(* 打印最终结果 *)

(* 打印最终表达式 *)
Print["Final simplified expression S: ", finalExprS];
Print["Final simplified expression A: ", finalExprA];
Print["Final simplified expression Gamma11: ", finalExprGamma11];

phi1 = (-3*x^3)/2 - (3*x*y^2)/2
results1 = <||>;
KeyValueMap[
  (results1[#1] = TransformFunction2D[phi1, #2, {x, y}, {x1, y1}]) &,
  matrices
];
KeyValueMap[
  (Print[#1, ": ", #2]) &,
  results1
];
weightsGamma21 = {0, Sqrt[3]/6, -Sqrt[3]/6, 0, Sqrt[3]/6, -Sqrt[3]/6};
exprList1 = Lookup[results1, {"Ta", "Tb", "Tc", "Te", "Td", "Tf"}];
weightedSumGamma21 = Total[MapThread[#1 * #2 &, {weightsGamma21, exprList1}]];
finalExprGamma21 = Collect[Simplify[Expand[weightedSumGamma21]], {x1, y1}];
Print["Final simplified expression Gamma21: ", finalExprGamma21];
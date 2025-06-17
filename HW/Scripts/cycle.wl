(* 定义 S3 群元素 *)
S3 = {
   Cycles[{}],
   Cycles[{{1, 2}}],
   Cycles[{{1, 3}}],
   Cycles[{{2, 3}}],
   Cycles[{{1, 2, 3}}],
   Cycles[{{1, 3, 2}}]
};

(* 定义 G 子群 *)
G = {
   Cycles[{}],
   Cycles[{{1, 2}, {3, 4}}],
   Cycles[{{1, 3}, {2, 4}}],
   Cycles[{{1, 4}, {2, 3}}]
};

(* 计算所有陪集 G * s for s in S3 *)
rightCosets = Table[
   SortBy[
     DeleteDuplicates[
       PermutationProduct[#, s] & /@ G
     ],
     ToString
   ],
   {s, S3}
];

(* 去掉重复的陪集（用集合方式） *)
uniqueCosets = DeleteDuplicates[rightCosets];

(* 输出 *)
Length[uniqueCosets]
uniqueCosets

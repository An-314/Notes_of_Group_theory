#import "@preview/scripst:1.1.1": *

#show: scripst.with(
  template: "book",
  title: [群论],
  author: ("Anzreww",),
  time: "乙巳春夏于清华园",
  contents: true,
  content-depth: 3,
  matheq-depth: 3,
  lang: "zh",
)

#include "chap1.typ"

#pagebreak()

#include "chap2.typ"

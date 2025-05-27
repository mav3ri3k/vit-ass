#import "lib.typ": *


#show: doc => assignment(
  title: "Digital Assignment - I",
  course: "Compiler Design Lab",
  author: "Apurva Mishra: 22BCE2791",
  date: "09 July, 2025",
  doc,
)

= Question

#card("filled")[
  #question(): Write a C program to implement code optimization technique.
]

#tags("c", "compiler")

== Answer
#lorem(50)

== Codes

#link("https://github.com/mav3ri3k/college")

#code-card(
  ctitle: "main.c",
  ```c
#include <stdio.h>

// Simple hello world
int main() {
    print("Hello, World!");

    return 0
}
  ```,
)

#code-card(
  ctitle: "run.sh",
  ```bash
  #!/bin/bash

  gcc main.c -o main
  ./main
  ```,
)

== Output

The given code applies following two optimisations:
- Common Subexpressions Elimination
- Constant Folding

#image-card("Sample Output", "q1.png")


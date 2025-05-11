#let blue = rgb("#0065e0")
#let bg = rgb("#f2f4f7")

#let counter_codes = counter("codes")

#let counter_questions = counter("questions")
#let question() = text[
  #counter_questions.step()
  *Question #context counter_questions.display()*
]

#let radius = 15pt
#let radius-smol = 10pt

#let code-block(ctitle: "Code", cbody) = {
  block(
    clip: true,
    breakable: true,
    radius: radius,
    stroke: 2pt + bg,
  )[
    #block(
      fill: bg,
      breakable: false,
      width: 100%,
      spacing: 0pt,
      inset: (x: 1em, y: 0.65em),
    )[
      *#counter_codes.step()
      Code #context counter_questions.display(): #ctitle*
    ]

    #block(
      width: 100%,
      breakable: true,
      inset: (x: 1em, y: 0.65em),
    )[
      #cbody
    ]
  ]
}

#let cblock(cbody) = {
  block(
    fill: bg,
    breakable: true,
    radius: radius-smol,
    width: 100%,
    inset: (x: 1em, y: 0.65em),
  )[#cbody]
}

#let assignment(
  title: "Digital Assignment",
  course: "Compiler Design",
  author: "Apurva Mishra",
  date: none,
  doc,
) = {
  // Define metadados do documento

  show link: it => text(fill: blue)[#it]
  show ref: it => text(fill: blue)[#it]
  show highlight: it => text(fill: blue)[*#it.body*]

  show raw: code => if code.block [
    #set text(font: "JetBrainsMono NF", fallback: false, size: 11pt)
    #show raw.line: line => {
      box(width: radius)[
        #align(right)[
          #text(fill: gray)[#line.number]
        ]
      ]
      h(10pt)
      line.body
    }
    #code
  ] else [
    #set text(font: "JetBrainsMono NF", fallback: false, size: 11pt)
    #box(
      fill: rgb("#f2f4f7"),
      outset: (x: 2pt, y: 3pt),
      radius: 4pt,
    )[#code]
  ]

  set text(font: "Nebula Sans", fallback: false, size: 12pt)

  // rounded images
  show image: it => block(
    radius: radius,
    clip: true,
  )[#it]

  set document(title: title, author: author)
  set page(
    numbering: "1",
    paper: "a4",
margin: 2cm,
    //margin: (top: 1cm, bottom: 1cm, left: 1cm, right: 1cm),
  )
  // TODO: verificar se há necessidade de colocar espaçamento de 1.5
  set par(
    first-line-indent: 0cm,
    justify: true,
    leading: 0.65em,
    linebreaks: "optimized",
  )
  set heading(numbering: "1.1.1")
  set math.equation(numbering: "(1)")


  block(
    fill: bg,
    breakable: true,
    radius: radius,
    width: 100%,
    inset: (x: 2em, y: 1.3em),
  )[
    #align(center)[
      #image("title.png", width: 35em)
      #text(size: 17pt, weight: "semibold", fill: rgb("#383434"))[
        B.Tech. Fall Semester 2025-26\
        School Of Computer Science and Engineering\
        (SCOPE)\
      ]
      \
      #text(weight: "bold", size: 25pt)[#title\ ]
      #text(weight: "semibold", size: 20pt)[#course\ ]
    ]
    \
    *#author*\
    *Date:* #date


  ]


  show outline.entry.where(level: 1): it => {
    v(10pt)
    strong(it)
  }
  show outline.entry.where(level: 2): it => {
    h(15pt)
    it
  }

  set text(blue)
  outline(depth: 2, title: text(black)[Contents])
  set text(black)

  pagebreak()

  doc
}


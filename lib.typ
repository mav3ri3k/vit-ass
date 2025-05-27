/*
  https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
*/

#let color_deg = 290deg
#let primary = oklch(50%, 0.22, color_deg)
#let surface0 = oklch(94%, 0.015, color_deg)
#let base = oklch(98%, 0.01, color_deg)

// automatically keep track of question number
#let counter_questions = counter("questions")
#let question() = text[
  #counter_questions.step()
  *Question #context counter_questions.display()*
]

#let radius = 15pt
#let radius-smol = 10pt

// single tag
#let tag(body) = {
  box(
    radius: radius,
    stroke: 1pt + primary,
    inset: (x: 0.5em, y: 0.3em),
  )[
    #body
  ]
}

// Array of tags
// Example: tags("nvim", "vim", "helix")
#let tags(..items) = {
  for item in items.pos() {
    tag(item); h(0.4em)
  }
}

#let card(type, cbody) = {
  if type == "filled" {
    block(
      fill: surface0,
      breakable: true,
      radius: radius,
      width: 100%,
      inset: (x: 1em, y: 0.65em),
    )[#cbody]
  } else if type == "outlined" {
    block(
      clip: true,
      breakable: true,
      radius: radius,
      width: 100%,
      stroke: 2pt + surface0,
      inset: (x: 1em, y: 0.65em),
    )[#cbody]
  }
}

#let code-card(ctitle: "Code", cbody) = {
  block(
    clip: true,
    breakable: true,
    radius: radius,
    stroke: 2pt + surface0,
    inset: 4pt,
  )[
    #block(
      fill: surface0,
      breakable: false,
      width: 100%,
      radius: radius,
      spacing: 0pt,
      inset: (x: 0.5em, y: 0.5em),
    )[
      #align(
        center, [#text(weight: "semibold")[#ctitle]]
      )
    ]

    #block(
      width: 100%,
      breakable: true,
      inset: (x: 0.5em, y: 0.65em),
    )[
      #cbody
    ]
  ]
}

#let image-card(ctitle, path) = {
  show image: img => block(
    radius: radius,
    clip: true,
  )[#img]

  block(
    breakable: false,
    width: 100%,
  )[
    #image(path)

    #align(center, [
      #block(
        breakable: false,
        radius: radius,
        fill: surface0,
        inset: (x: 1em, y: 1em),
      )[*#ctitle*]

      ]
    )
  ]
}

#let assignment(
  title: "Digital Assignment",
  course: "Compiler Design",
  author: "Apurva Mishra",
  date: none,
  doc,
) = {
  // Define metadados do documento

  show link: it => text(fill: primary, weight: "semibold")[
    #it
  ]
  show ref: it => text(fill: primary)[#it]
  show highlight: it => text(fill: primary)[*#it.body*]

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

  show image: img => block(
    radius: radius,
    clip: true,
  )[#img]

  set page(fill: base)
  set text(font: "Nebula Sans", fallback: false, size: 12pt)

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
  set heading(numbering: "1.a.i")
  set math.equation(numbering: "(1)")


  block(
    fill: surface0,
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

  set text(primary)
  outline(depth: 2, title: text(black)[Contents])
  set text(black)

  pagebreak()

  doc
}


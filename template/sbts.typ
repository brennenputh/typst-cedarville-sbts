#let sbts(
  author: [],
  date: [],
  subtitle: [],
  professor: [],
  course: [],
  citation_file: "main.bib",
  doc
) = {
  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in)
  )

  set text(
    font: "Times New Roman",
    size: 12pt
  )
  show heading: set text(size: 12pt)

  // All subtext should be 10pt
  show figure.caption: set text(size: 10pt)
  show figure: set text(size: 10pt)
  show table.cell: set text(size: 10pt)
  show footnote.entry: set text(size: 10pt)

  show heading: set block(
      below: 1em, 
      above: 2em)
  show heading.where(level: 1): set align(center)
  // This is technically correct, but third-level headings should just be bolded text.
  show heading.where(level: 3): it => block(inset: (left: 0.5in), it)
  show heading.where(level: 3): it => strong(it.body) + [ ]

  set par(
    first-line-indent: (amount: 0.5in, all: true),
    leading: 1.3em,
    spacing: 2.5em
  )

  show bibliography: set par(
    first-line-indent: 0pt,
    hanging-indent: 0.5in
  )

  show bibliography: bib-it => {
    show block: block-it => context {
      // if it body is auto or styled()
      if block-it.body == auto or block-it.body.func() == text(fill: red)[].func() {
        block-it
        // if its body isn't sequence(), for example: pdf-marker-tag
      } else if block-it.body.func() != [].func() {
        par(block-it.body)
      } else {
        par(block-it.body)
      }
    }

    bib-it
  }

  page(
    margin: (top: 2in),
    align(center,
      stack(
        dir: ttb,
        spacing: 8.5em,
        {
          stack(
            spacing: 2em,
            upper(context(document.title)),
            upper(subtitle)
          )
        },
        {
          stack(
            spacing: 2em,
            text([A Paper]),
            text([Presented to]),
            professor,
            text([Cedarville University]),
          )
        },
        {
          stack(
            spacing: 2em,
            text([In Partial Fulfillment]),
            text([of the Requirements for ] + course),
          )
        },
        {
          stack(
            spacing: 2em,
            text([by]),
            author,
            date
          )
        }
      )
    )
  )
  
  show quote: set pad(x: 0.5in)
  set enum(
    indent: 0.5in
  )

  show table: it => block(inset: (left: 0.5in), it)

  set footnote.entry(
    gap: 1.5em
  )
  show footnote.entry: it => {
    let loc = it.note.location()

    h(0.5in)

    counter(footnote).display(
      at: loc,
      "1. ",
    )

    it.note.body
  }

  doc

  show heading: it => upper(it)
  show heading: set text(weight: "regular")
  show heading: set block(
    below: 2.5em
  )
  page(
    bibliography(citation_file, style: "./cedarville_sbts_notes_bibliography.csl")
  )
}

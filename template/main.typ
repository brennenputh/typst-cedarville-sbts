#import "./sbts.typ": sbts

#set document(title: [
  Paper Title
])

#show: sbts.with(
  author: [Brennen Puth],
  date: [October 24, 2026],
  subtitle: [Paper Subtitle],
  professor: [Dr. Alligood],
  course: [BTGE-3755-01 Theology 1],
  citation_file: path("./main.bib")
)

= First-Level Heading

#lorem(50)

== Second-Level Heading

#lorem(50)

// It is important that there is no line break between the third-level 
// heading and the text immediately following it. A blank line adds a 
// linebreak between the heading and the text following, which is not 
// the preferred style of the style guide.
=== Third-Level Heading.
#lorem(50)

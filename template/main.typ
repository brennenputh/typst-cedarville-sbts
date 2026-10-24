#import "./src/sbts.typ": sbts

#set document(title: [
  Paper Title
])

#show: sbts.with(
  author: [John Doe],
  date: [October 24, 2026],
  subtitle: [Paper Subtitle],
  professor: [Dr. Doe],
  course: [BTGE-3755-01 Theology 1],
  citation_file: path("./main.bib")
)

// =====================================================================
//  STATECRAFT — Typst booklet theme for "Javne politike u Hrvatskoj"
//  Palette + typography mirror _brand.yml / styles/custom.scss.
//  Proof-of-concept theme for the citizen-guide booklet (A5).
// =====================================================================

// ---- STATECRAFT palette ----------------------------------------------
#let paper        = rgb("#F2EDE3")   // warm cream — never pure white
#let paper-soft   = rgb("#EAE3D4")
#let ink          = rgb("#1C1916")   // near-black, brown undertone
#let ink-soft     = rgb("#3A332D")
#let ink-mute     = rgb("#6B6357")
#let verdigris    = rgb("#4A6B5C")   // primary accent
#let verdigris-deep = rgb("#3A5648")
#let oxblood      = rgb("#6B1F26")   // emphasis
#let ochre        = rgb("#C8985E")   // archival accent
#let ochre-deep   = rgb("#9A6F38")

// ---- type registers --------------------------------------------------
#let serif = "Newsreader 16pt"       // body + display (Newsreader var. font)
#let sans  = "Public Sans"           // labels / running heads / eyebrows
#let mono  = "IBM Plex Mono"         // folios / metadata

// A small tracked-out label in the sans register.
#let eyebrow-label(body, color: ink-mute, size: 9pt) = {
  text(font: sans, size: size, fill: color, weight: 600, tracking: 0.28em)[#upper(body)]
}

// Redefine pandoc's horizontalrule (`---`) to a quiet end-of-part fleuron.
// Part dividers carry the real separation, so this stays subtle.
#let horizontalrule = block(width: 100%, above: 1.1em, below: 1.1em)[
  #align(center)[#text(font: serif, fill: ochre, size: 12pt, baseline: -1pt)[\u{2042}]]
]

#let article(
  title: none,
  subtitle: none,
  authors-line: none,
  date: none,
  eyebrow: none,
  toc: false,
  toc-title: [Sadržaj],
  toc-depth: 3,
  doc,
) = {

  // -------- global text & paragraph rules ----------------------------
  set text(
    font: serif,
    size: 10.5pt,
    fill: ink,
    lang: "hr",
    region: "HR",
    hyphenate: true,
  )
  set par(
    justify: true,
    leading: 0.64em,
    spacing: 0.64em,
    first-line-indent: (amount: 1.3em, all: false),
  )

  // links pick up the verdigris accent
  show link: set text(fill: verdigris)
  show ref: set text(fill: verdigris)

  // emphasis / strong tuned for the cream ground
  show strong: set text(fill: ink, weight: 600)

  // -------- headings --------------------------------------------------
  // Level 2 = parts ("Dio …", "Uvod"): framed divider, opens a new page.
  show heading.where(level: 2): it => {
    pagebreak(weak: true)
    v(2.4em)
    block(width: 100%, breakable: false)[
      #line(length: 100%, stroke: 0.9pt + ochre)
      #v(0.8em)
      #set par(justify: false, leading: 0.44em, first-line-indent: 0pt)
      #text(font: serif, size: 22pt, weight: 500, fill: ink)[#it.body]
      #v(0.8em)
      #line(length: 100%, stroke: 1.4pt + verdigris)
    ]
    v(1.7em)
  }

  // Level 3 = numbered sections ("1. Zašto …"): verdigris serif head.
  show heading.where(level: 3): it => {
    v(1.5em, weak: true)
    block(breakable: false, below: 0.7em)[
      #set par(justify: false, leading: 0.46em, first-line-indent: 0pt)
      #text(font: serif, size: 14.5pt, weight: 600, fill: verdigris-deep)[#it.body]
    ]
  }

  // anything deeper: quiet sans label
  show heading.where(level: 4): it => {
    v(1em, weak: true)
    text(font: sans, size: 10pt, weight: 600, fill: ink-soft)[#it.body]
    parbreak()
  }

  // figures (the guide-plate illustrations)
  show figure: set block(breakable: false)
  show figure.caption: set text(font: sans, size: 8pt, fill: ink-mute)

  // -------- running head + folio (body pages only) -------------------
  set page(
    header: context {
      set align(center)
      set text(font: sans, size: 7.5pt, fill: ink-mute, tracking: 0.32em)
      upper[Država i javne politike u malom]
      v(3pt)
      line(length: 100%, stroke: 0.4pt + ochre)
    },
    footer: context {
      set align(center)
      set text(font: mono, size: 8pt, fill: ink-mute)
      [#counter(page).get().first()]
    },
  )

  // ===================================================================
  //  TITLE PAGE  (no running head / folio)
  // ===================================================================
  page(header: none, footer: none, numbering: none)[
    #set par(justify: false, leading: 0.5em, first-line-indent: 0pt)
    #set text(hyphenate: false)
    #v(2.6cm)
    #if eyebrow != none { eyebrow-label(eyebrow) }
    #v(0.7em)
    #line(length: 100%, stroke: 1pt + verdigris)
    #v(1.5em)
    #text(font: serif, size: 33pt, weight: 500, fill: ink)[#title]
    #if subtitle != none {
      v(0.7em)
      text(font: serif, size: 13pt, style: "italic", fill: ink-soft)[#subtitle]
    }
    #v(1fr)
    #line(length: 100%, stroke: 0.5pt + ochre)
    #v(0.8em)
    #if authors-line != none {
      text(font: sans, size: 9.5pt, weight: 500, fill: ink, tracking: 0.04em)[#authors-line]
    }
    #if date != none {
      v(0.5em)
      text(font: mono, size: 8.5pt, fill: ink-mute)[#upper[#date]]
    }
  ]

  // ===================================================================
  //  TABLE OF CONTENTS  (no running head / folio)
  // ===================================================================
  if toc {
    page(header: none, footer: none, numbering: none)[
      #set par(justify: false, first-line-indent: 0pt)
      #v(0.4cm)
      #eyebrow-label(toc-title, color: verdigris, size: 10pt)
      #v(0.6em)
      #line(length: 100%, stroke: 0.6pt + verdigris)
      #v(1.1em)

      #show outline.entry.where(level: 2): set text(font: serif, size: 11.5pt, weight: 600, fill: ink)
      #show outline.entry.where(level: 2): set block(above: 1.1em)
      #show outline.entry.where(level: 3): set text(font: serif, size: 10pt, weight: 400, fill: ink-soft)
      #set outline.entry(fill: box(width: 1fr, repeat[#text(fill: ochre)[.]#h(3pt)]))

      #outline(title: none, depth: toc-depth, indent: 1.1em)
    ]
  }

  // ===================================================================
  //  BODY
  // ===================================================================
  counter(page).update(1)
  doc
}

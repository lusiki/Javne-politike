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

// Plain-text extraction from heading content (for splitting "Dio … · Title").
#let _sp = [ ]
#let stringify(c) = {
  if c == none { "" }
  else if type(c) == str { c }
  else if c.has("text") { c.text }
  else if c.has("children") { c.children.map(stringify).join("") }
  else if c.has("body") { stringify(c.body) }
  else if c == _sp { " " }
  else { "" }
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
    leading: 0.72em,
    spacing: 0.72em,
    first-line-indent: (amount: 1.3em, all: false),
  )

  // links / refs pick up the deep verdigris (unifies every verdigris mark)
  show link: set text(fill: verdigris-deep)
  show ref: set text(fill: verdigris-deep)
  show strong: set text(fill: ink, weight: 600)

  // -------- headings --------------------------------------------------
  // Level 2 = parts ("Dio …", "Uvod"): eyebrow + title + verdigris rule,
  // opens a new page. Headings never hyphenate.
  show heading.where(level: 2): it => {
    pagebreak(weak: true)
    set text(hyphenate: false)
    let s = stringify(it.body)
    let segs = s.split(" · ")
    v(2.4em)
    block(width: 100%, breakable: false)[
      #set par(justify: false, leading: 0.46em, first-line-indent: 0pt)
      #if segs.len() > 1 {
        eyebrow-label(segs.at(0), color: verdigris, size: 9.5pt)
        v(0.6em)
        text(font: serif, size: 24pt, weight: 600, fill: ink)[#segs.slice(1).join(" · ")]
      } else {
        text(font: serif, size: 24pt, weight: 600, fill: ink)[#s]
      }
      #v(0.85em)
      #line(length: 100%, stroke: 1.4pt + verdigris)
    ]
    v(1.7em)
  }

  // Level 3 = numbered sections ("1. Zašto …"): verdigris serif head.
  show heading.where(level: 3): it => {
    set text(hyphenate: false)
    v(1.5em, weak: true)
    block(breakable: false, below: 0.7em)[
      #set par(justify: false, leading: 0.5em, first-line-indent: 0pt)
      #text(font: serif, size: 14.5pt, weight: 500, fill: verdigris-deep)[#it.body]
    ]
  }

  // anything deeper: quiet sans label
  show heading.where(level: 4): it => {
    set text(hyphenate: false)
    v(1em, weak: true)
    text(font: sans, size: 10pt, weight: 600, fill: ink-soft)[#it.body]
    parbreak()
  }

  // figures (the guide-plate illustrations)
  // Bare images aren't locatable, so wrap each in a (caption-less) figure;
  // this makes plate pages queryable for running-head/folio suppression and
  // centres the plate. Only the two frontispiece plates are images here.
  show image: it => figure(it, caption: none, supplement: none, numbering: none)
  show figure: set block(breakable: false)
  show figure.caption: set text(font: sans, size: 8pt, fill: ink-mute)

  // -------- running head + folio --------------------------------------
  // Suppressed on part-opener pages (running head) and on full-page
  // illustration pages (both), so plates and openers breathe.
  set page(
    header: context {
      let pg = here().page()
      let openers = query(heading.where(level: 2)).map(h => h.location().page())
      let plates = query(figure).map(f => f.location().page())
      if not (openers.contains(pg) or plates.contains(pg)) {
        set align(center)
        set text(font: sans, size: 7.5pt, fill: ink-mute, tracking: 0.32em)
        upper[Država i javne politike u malom]
        v(3pt)
        line(length: 100%, stroke: 0.4pt + ochre)
      }
    },
    footer: context {
      let pg = here().page()
      let plates = query(figure).map(f => f.location().page())
      if not plates.contains(pg) {
        set align(center)
        set text(font: mono, size: 8pt, fill: ink-mute)
        [#counter(page).get().first()]
      }
    },
  )

  // ===================================================================
  //  TITLE PAGE  (no running head / folio)
  // ===================================================================
  page(header: none, footer: none, numbering: none)[
    #set par(justify: false, leading: 0.5em, first-line-indent: 0pt)
    #set text(hyphenate: false)
    #v(1fr)
    #if eyebrow != none { eyebrow-label(eyebrow) }
    #v(0.7em)
    #line(length: 100%, stroke: 1pt + verdigris)
    #v(1.5em)
    #text(font: serif, size: 33pt, weight: 500, fill: ink)[#title]
    #if subtitle != none {
      v(0.7em)
      text(font: serif, size: 13pt, style: "italic", fill: ink-soft)[#subtitle]
    }
    #v(1.4fr)
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
      #set outline.entry(fill: box(width: 1fr, repeat[#text(fill: ink-mute, size: 7pt)[.]#h(2.5pt)]))

      #outline(title: none, depth: toc-depth, indent: 1.1em)
    ]
  }

  // ===================================================================
  //  BODY  (counter starts at 0 so the leading plate is unnumbered and
  //  the first prose page — Uvod — carries folio 1)
  // ===================================================================
  counter(page).update(0)
  doc

  // ===================================================================
  //  COLOPHON  (deliberate bookend, mirrors the title-page grammar)
  // ===================================================================
  page(header: none, footer: none, numbering: none)[
    #set par(justify: false, first-line-indent: 0pt)
    #set text(hyphenate: false)
    #v(1fr)
    #eyebrow-label("Kolofon", color: verdigris)
    #v(0.6em)
    #line(length: 100%, stroke: 0.5pt + ink-mute)
    #v(1em)
    #text(font: serif, style: "italic", size: 11.5pt, fill: ink-soft)[Sve što želite znati o državi i javnim politikama u Hrvatskoj]
    #v(1.2em)
    #if authors-line != none {
      text(font: sans, size: 9pt, weight: 500, fill: ink, tracking: 0.05em)[#authors-line]
    }
    #v(0.5em)
    #text(font: mono, size: 8.5pt, fill: ink-mute)[lusiki.github.io/Javne-politike]
    #if date != none {
      linebreak()
      text(font: mono, size: 8.5pt, fill: ink-mute)[#upper[#date]]
    }
    #v(1.3fr)
  ]
}

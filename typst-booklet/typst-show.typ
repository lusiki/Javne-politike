#show: doc => article(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
  authors-line: [$for(by-author)$$it.name.literal$$sep$ · $endfor$],
$if(date)$
  date: [$date$],
$endif$
  eyebrow: [Priručnik za građane],
$if(toc)$
  toc: $toc$,
$endif$
$if(toc-title)$
  toc-title: [$toc-title$],
$endif$
  toc-depth: $toc-depth$,
  doc,
)

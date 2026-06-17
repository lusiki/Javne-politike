suppressMessages(library(stringr))
clean_inline_links <- function(line) {
  line <- str_replace_all(line, "!\\[([^\\]]*)\\]\\([^)]*\\)", "\\1")
  line <- str_replace_all(line, "\\[([^\\]]+)\\]\\((https?://[^)]+)\\)", "\\1 (\\2)")
  line <- str_replace_all(line, "\\[([^\\]]+)\\]\\([^)]*\\)", "\\1")
  line <- str_replace_all(line, "\\[([^\\]]+)\\]\\{[^}]*\\}", "\\1")
  line <- str_replace(line, "\\s*\\{[#.][^}]*\\}\\s*$", "")
  str_trim(line, side = "right")
}
tests <- c(
  "vidi [tekst](https://ex.com) i kraj",
  "interni [naslov](#sec-uvod) link",
  "slika ![opis](slika.png) tu",
  "matematika $f(x) = [a,b]$ interval",
  "lista [1] i [2] reference",
  "[link s (zagradama)](http://ex.com/a(b)) test",
  "naslov {#sec-x}",
  "raspon $[0,1]$ te [pojam]{.var} kraj",
  "url bez sheme [tekst](mailto:a@b.com)",
  "dvostruko [a](u1) i [b](u2)"
)
for (t in tests) cat("IN : ", t, "\nOUT: ", clean_inline_links(t), "\n\n", sep="")

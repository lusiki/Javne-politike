suppressMessages(library(stringr))
tests <- c(
  "@misc{hmt,\n  author    = {{HM Treasury}},\n  year = {2020}\n}",
  "@misc{oecd,\n  author       = {{OECD}},\n  year         = {2019}\n}",
  "@article{dalbo,\n  author  = {Dal B\\'{o}, Ernesto},\n  year = {2006}\n}",
  "@article{cost,\n  author  = {Costinot, Arnaud and Werning, Iv\\'{a}n},\n  year = {2018}\n}",
  "@book{epc,\n  author       = {{European Parliament and Council of the European Union}},\n  year         = {2016}\n}"
)
for (e in tests) {
  author <- str_match(e, "(?is)author\\s*=\\s*[{\"](.*?)[}\"]\\s*,?\\s*\\n")[, 2]
  cat("author-capture: [", author, "]\n", sep="")
  if (!is.na(author)) {
    first <- str_trim(str_split(author, "\\s+and\\s+")[[1]][1])
    surname <- if (str_detect(first, ",")) str_trim(str_split(first, ",")[[1]][1]) else str_extract(first, "\\S+$")
    cat("  surname: [", surname, "]\n", sep="")
  }
}

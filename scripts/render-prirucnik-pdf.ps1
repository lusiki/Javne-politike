# Reproducible build for the citizen guide's standalone A5 Typst PDF.
#
# The book project itself cannot emit Typst ("The typst format is not
# supported by book projects"), so prirucnik.qmd must be rendered STANDALONE,
# in a temp directory OUTSIDE the project tree (otherwise Quarto walks up and
# finds _quarto.yml and treats it as part of the book). The finished PDF is
# then installed into pdf/ and docs/pdf/.
#
# The frontispiece illustration (images/prirucnik/ph2.jpg) is gated in
# prirucnik.qmd with `.content-hidden when-format="latex"`, so it appears in
# this Typst PDF and in the HTML, but NOT in the book's LaTeX PDF.
#
# Usage:  pwsh -File scripts/render-prirucnik-pdf.ps1
# Output: pdf/Prirucnik.pdf  (+ copy in docs/pdf/Prirucnik.pdf)

$ErrorActionPreference = "Stop"

# RStudio-bundled Quarto ships its own Typst engine; no TinyTeX/R needed here
# (prirucnik.qmd is pure prose with echo:false, and a standalone render runs no
# project pre-render hook).
$quarto = "C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe"
if (-not (Test-Path $quarto)) { throw "Quarto not found: $quarto" }

$root = Split-Path $PSScriptRoot -Parent
$tmp  = Join-Path ([System.IO.Path]::GetTempPath()) ("prirucnik-pdf-" + [System.Guid]::NewGuid().ToString("N").Substring(0, 8))

New-Item -ItemType Directory -Path (Join-Path $tmp "images\prirucnik") -Force | Out-Null
try {
  Copy-Item (Join-Path $root "prirucnik.qmd")                (Join-Path $tmp "prirucnik.qmd")
  Copy-Item (Join-Path $root "images\prirucnik\ph2.jpg")     (Join-Path $tmp "images\prirucnik\ph2.jpg")

  & $quarto render (Join-Path $tmp "prirucnik.qmd") --to typst -M papersize:a5
  if ($LASTEXITCODE -ne 0) { throw "quarto typst render failed (exit $LASTEXITCODE)" }

  $pdf = Join-Path $tmp "prirucnik.pdf"
  if (-not (Test-Path $pdf)) { throw "expected PDF not produced: $pdf" }

  New-Item -ItemType Directory -Force -Path (Join-Path $root "docs\pdf") | Out-Null
  Copy-Item $pdf (Join-Path $root "pdf\Prirucnik.pdf")       -Force
  Copy-Item $pdf (Join-Path $root "docs\pdf\Prirucnik.pdf")  -Force
  Write-Host "Prirucnik.pdf rebuilt (A5 Typst) -> pdf/Prirucnik.pdf + docs/pdf/Prirucnik.pdf"
} finally {
  Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
}

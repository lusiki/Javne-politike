# Reproducible PDF render helper.
#
# The Quarto, R, and TinyTeX binaries are installed but not on the default
# (non-login) shell PATH on this machine. This shim prepends their locations
# so `quarto render --profile pdf` runs the same way every time.
#
# Usage:
#   pwsh -File scripts/render-pdf.ps1            # full book PDF -> pdf/Javne-politike.pdf
#   pwsh -File scripts/render-pdf.ps1 chapters/03-distribucijska-funkcija.qmd   # single file
#
# Output: pdf/Javne-politike.pdf (full book) — see _quarto-pdf.yml.

param(
  [string]$Target = ""
)

$ErrorActionPreference = "Stop"

# --- Locate the toolchain (RStudio-bundled Quarto, system R, user TinyTeX) ---
$quarto = "C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe"
$rbin   = "C:\Program Files\R\R-4.5.2\bin"
$tinytex = "C:\Users\lsikic\AppData\Roaming\TinyTeX\bin\windows"

foreach ($p in @($quarto, $rbin, $tinytex)) {
  if (-not (Test-Path $p)) { throw "Toolchain path missing: $p" }
}

$env:PATH = "$rbin;$tinytex;" + (Split-Path $quarto) + ";" + $env:PATH

# --- Render ---
if ($Target -ne "") {
  & $quarto render $Target --profile pdf
} else {
  & $quarto render --profile pdf
}

if ($LASTEXITCODE -ne 0) { throw "quarto render failed (exit $LASTEXITCODE)" }
Write-Host "PDF render complete -> pdf/Javne-politike.pdf"

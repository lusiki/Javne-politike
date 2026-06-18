# Reproducible build for the book PDF (pdf/Javne-politike.pdf).
#
# WHY THIS SCRIPT EXISTS: the PDF should carry only the bibliography as an
# appendix, while the website keeps the full appendix set (pojmovnik, vodic,
# prirucnik, resursi, alat, podaci, uci-s-AI, predavanja, silabus, raspored). Quarto profiles merge
# book.appendices arrays ADDITIVELY, so _quarto-pdf.yml cannot shrink the list:
# a short list there just gets appended to the full list in _quarto.yml.
#
# So this script temporarily rewrites the appendices block in _quarto.yml to
# references-only, runs the PDF render, copies the result into docs/pdf/, and then
# ALWAYS restores _quarto.yml (try/finally - even on error or interruption). The
# HTML build is never affected; _quarto.yml is byte-identical after this runs.
#
# NOTE: keep this file ASCII-only. Windows PowerShell 5.1 reads .ps1 as the ANSI
# codepage, so non-ASCII (em-dashes, Croatian diacritics) in the source corrupts
# string terminators and breaks parsing.
#
# Usage:  powershell -File scripts/render-book-pdf.ps1
# Output: pdf/Javne-politike.pdf  (+ copy in docs/pdf/Javne-politike.pdf)

$ErrorActionPreference = "Stop"

$root  = Split-Path $PSScriptRoot -Parent
$cfg   = Join-Path $root "_quarto.yml"
$bak   = Join-Path $root "_quarto.yml.pdfbuild.bak"

if (-not (Test-Path $cfg)) { throw "_quarto.yml not found at $cfg" }

# Locate quarto (PATH first, then the RStudio-bundled copy used elsewhere in scripts/).
$quarto = (Get-Command quarto -ErrorAction SilentlyContinue).Source
if (-not $quarto) { $quarto = "C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe" }
if (-not (Test-Path $quarto)) { throw "Quarto not found (not on PATH, not at $quarto)" }

# Snapshot the real config so we can restore it no matter what.
Copy-Item $cfg $bak -Force

try {
  # Rewrite the `  appendices:` block (a book-level, two-space-indented key) to
  # references-only. Done line-by-line on structure (not regex): copy lines until
  # `  appendices:`, emit the references-only block, then SKIP the old block body
  # (its `    - ...` children, `  #` comments, and interleaved blank lines) and
  # resume at the next `  `-level key (e.g. bibliography:). This can never spill
  # into bibliography:/crossref:/format: the way a greedy regex did.
  $lines = Get-Content $cfg -Encoding UTF8
  $out = New-Object System.Collections.Generic.List[string]
  $i = 0; $found = $false
  while ($i -lt $lines.Count) {
    if ($lines[$i] -match '^  appendices:\s*$') {
      $found = $true
      $out.Add('  appendices:')
      $out.Add('    - references.qmd')
      $i++
      while ($i -lt $lines.Count) {
        $l = $lines[$i]
        if ($l -match '^    ' -or $l -match '^  #' -or $l -match '^\s*$') { $i++; continue }
        break
      }
      $out.Add('')
      continue
    }
    $out.Add($lines[$i]); $i++
  }

  if (-not $found) {
    throw "appendices block not found in _quarto.yml; aborting (config untouched)"
  }
  $patchedText = ($out -join "`r`n") + "`r`n"
  if ($patchedText -notmatch '(?m)^  appendices:\r?\n    - references\.qmd\r?\n') {
    throw "patched _quarto.yml does not look right; aborting (will restore)"
  }
  if (($patchedText -notmatch '(?m)^bibliography:') -or ($patchedText -notmatch '(?m)^crossref:')) {
    throw "patch removed bibliography or crossref; aborting (will restore)"
  }

  # Write the temporary references-only config (UTF-8, no BOM, to match Quarto's reader).
  [System.IO.File]::WriteAllText($cfg, $patchedText, (New-Object System.Text.UTF8Encoding($false)))

  Write-Host "Rendering book PDF with references-only appendices..."
  & $quarto render --profile pdf
  if ($LASTEXITCODE -ne 0) { throw "quarto render failed (exit $LASTEXITCODE)" }

  $pdf = Join-Path $root "pdf\Javne-politike.pdf"
  if (-not (Test-Path $pdf)) { throw "expected PDF not produced: $pdf" }

  New-Item -ItemType Directory -Force -Path (Join-Path $root "docs\pdf") | Out-Null
  Copy-Item $pdf (Join-Path $root "docs\pdf\Javne-politike.pdf") -Force
  Write-Host "Book PDF rebuilt -> pdf/Javne-politike.pdf + docs/pdf/Javne-politike.pdf"
}
finally {
  # Always restore the canonical _quarto.yml.
  if (Test-Path $bak) {
    Copy-Item $bak $cfg -Force
    Remove-Item $bak -Force -ErrorAction SilentlyContinue
    Write-Host "_quarto.yml restored."
  }
}

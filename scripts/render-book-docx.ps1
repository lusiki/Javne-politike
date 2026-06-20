# Reproducible build for the book Word document (word/Javne-politike.docx).
#
# This is the DOCX twin of scripts/render-book-pdf.ps1. The Word file is a local
# manuscript artifact: it is NOT served from the website (nothing is copied into
# docs/) and word/ is gitignored except the canonical .docx.
#
# This script makes TWO temporary, always-restored edits to the source tree, then
# renders the book to a single Word file, then restores everything (try/finally,
# even on error or interruption). After it runs the tree is byte-identical.
#
#   1) APPENDICES. The manuscript should carry only the bibliography as an
#      appendix, while the website keeps the full appendix set (pojmovnik, vodic,
#      prirucnik, resursi, alat, podaci, uci-s-AI, predavanja, silabus, raspored).
#      Quarto profiles merge book.appendices arrays ADDITIVELY, so _quarto-docx.yml
#      cannot shrink the list. So this script rewrites the appendices block in
#      _quarto.yml to references-only for the duration of the render.
#
#   2) FIGURE TWINS. Every figure is a twin pair: an OJS interactive chart gated
#      `.content-visible when-format="html"` and a static R "print" chart gated
#      `.content-visible when-format="pdf"`. For DOCX neither gate matches, so both
#      twins are stripped and the Word file would have almost no figures. Quarto
#      resolves when-format BEFORE any user filter and does not honour multi-format
#      gate values, so the only fix is to make the gate literally say "docx": this
#      script rewrites `when-format="pdf"` -> `when-format="docx"` in the chapters
#      for the render, surfacing the same static figures the book PDF shows.
#
# Because the chapter source changes for the render, Quarto re-executes the R code
# (no docx freeze is reused); a full build runs every chapter once.
#
# NOTE: keep this file ASCII-only. Windows PowerShell 5.1 reads .ps1 as the ANSI
# codepage, so non-ASCII (em-dashes, Croatian diacritics) in the source corrupts
# string terminators and breaks parsing. (Chapter content is read/written as UTF-8
# below, so Croatian diacritics in the .qmd files are preserved.)
#
# Usage:  powershell -File scripts/render-book-docx.ps1
# Output: word/Javne-politike.docx

$ErrorActionPreference = "Stop"

$root        = Split-Path $PSScriptRoot -Parent
$cfg         = Join-Path $root "_quarto.yml"
$bak         = Join-Path $root "_quarto.yml.docxbuild.bak"
$chaptersDir = Join-Path $root "chapters"
$utf8        = New-Object System.Text.UTF8Encoding($false)
$gateFrom    = 'when-format="pdf"'
$gateTo      = 'when-format="docx"'

if (-not (Test-Path $cfg)) { throw "_quarto.yml not found at $cfg" }

# Restore any file from a sibling .docxbuild.bak, then delete the .bak. Used both
# as a pre-flight (recover from a crashed prior run) and in the finally block.
function Restore-DocxBaks {
  $suffix = ".docxbuild.bak"
  @(Get-ChildItem -Path $root -Filter "*$suffix" -File -ErrorAction SilentlyContinue) +
  @(Get-ChildItem -Path $chaptersDir -Filter "*$suffix" -File -ErrorAction SilentlyContinue) |
    ForEach-Object {
      $orig = $_.FullName.Substring(0, $_.FullName.Length - $suffix.Length)
      Copy-Item $_.FullName $orig -Force
      Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
    }
}

# Pre-flight: if a previous run crashed mid-build, recover the original sources
# BEFORE we snapshot anything (otherwise we would back up already-patched files).
Restore-DocxBaks

# Locate quarto (PATH first, then the RStudio-bundled copy used elsewhere in scripts/).
$quarto = (Get-Command quarto -ErrorAction SilentlyContinue).Source
if (-not $quarto) { $quarto = "C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe" }
if (-not (Test-Path $quarto)) { throw "Quarto not found (not on PATH, not at $quarto)" }

# Snapshot the real config so we can restore it no matter what.
Copy-Item $cfg $bak -Force

try {
  # --- (1) Rewrite the `  appendices:` block to references-only -----------------
  # Done line-by-line on structure (not regex): copy lines until `  appendices:`,
  # emit the references-only block, then SKIP the old block body (its `    - ...`
  # children, `  #` comments, and interleaved blank lines) and resume at the next
  # `  `-level key (e.g. bibliography:).
  $lines = Get-Content $cfg -Encoding UTF8
  $out = New-Object System.Collections.Generic.List[string]
  $i = 0; $found = $false
  while ($i -lt $lines.Count) {
    if ($lines[$i] -match '^  pre-render:\s*$') {
      # Drop the pre-render hook (R/build-ai-exports.R) for the DOCX build. It
      # regenerates the website AI exports from the chapters, but here the
      # chapters are temporarily gate-swapped, so letting it run would dirty the
      # tracked docs/ai/*, docs/llms*.txt and data/ai-exports.json with content
      # derived from the transient build state. The Word build does not need them.
      $i++
      while ($i -lt $lines.Count) {
        $l = $lines[$i]
        if ($l -match '^    ' -or $l -match '^  #' -or $l -match '^\s*$') { $i++; continue }
        break
      }
      continue
    }
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
  [System.IO.File]::WriteAllText($cfg, $patchedText, $utf8)

  # --- (2) Swap the print-twin gate when-format="pdf" -> "docx" in chapters ------
  $swapped = 0
  Get-ChildItem -Path $chaptersDir -Filter *.qmd -File | ForEach-Object {
    $text = [System.IO.File]::ReadAllText($_.FullName, $utf8)
    if ($text.Contains($gateFrom)) {
      Copy-Item $_.FullName ($_.FullName + ".docxbuild.bak") -Force
      [System.IO.File]::WriteAllText($_.FullName, $text.Replace($gateFrom, $gateTo), $utf8)
      $swapped++
    }
  }
  Write-Host "Swapped print-twin gate to docx in $swapped chapter files."

  Write-Host "Rendering book DOCX (references-only appendices, print figures shown)..."
  & $quarto render --to docx --profile docx
  if ($LASTEXITCODE -ne 0) { throw "quarto render failed (exit $LASTEXITCODE)" }

  $docx = Join-Path $root "word\Javne-politike.docx"
  if (-not (Test-Path $docx)) { throw "expected DOCX not produced: $docx" }

  Write-Host "Book DOCX rebuilt -> word/Javne-politike.docx"
}
finally {
  # Always restore the canonical _quarto.yml and any patched chapter files.
  if (Test-Path $bak) {
    Copy-Item $bak $cfg -Force
    Remove-Item $bak -Force -ErrorAction SilentlyContinue
  }
  Restore-DocxBaks
  Write-Host "Source tree restored."
}

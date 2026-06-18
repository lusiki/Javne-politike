# DEV render of the statecraft book PDF to a SCRATCH output dir (_pdfdev/).
#
# Why scratch: a book PDF render with output-dir=pdf cleans the whole pdf/ dir
# (would delete Prirucnik.pdf / Prirucnik-statecraft.pdf and can hit file locks).
# During development we render to _pdfdev/ and only copy the final PDF into pdf/
# at the end. Mirrors scripts/render-book-pdf.ps1's references-only appendix
# rewrite so the dev PDF matches the final one.
#
# Keep ASCII-only (Windows PowerShell 5.1 / ANSI codepage).
# Usage:  powershell -File tex/render-statecraft-dev.ps1
# Output: _pdfdev/Javne-politike.pdf

$ErrorActionPreference = "Stop"

$root = Split-Path $PSScriptRoot -Parent
$cfg  = Join-Path $root "_quarto.yml"
$bak  = Join-Path $root "_quarto.yml.scdev.bak"

if (-not (Test-Path $cfg)) { throw "_quarto.yml not found at $cfg" }

$quarto = (Get-Command quarto -ErrorAction SilentlyContinue).Source
if (-not $quarto) { $quarto = "C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe" }
if (-not (Test-Path $quarto)) { throw "Quarto not found." }

Copy-Item $cfg $bak -Force
try {
  # Rewrite the book-level `  appendices:` block to references-only.
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
  if (-not $found) { throw "appendices block not found; aborting (config untouched)" }
  $patched = ($out -join "`r`n") + "`r`n"
  if ($patched -notmatch '(?m)^  appendices:\r?\n    - references\.qmd\r?\n') { throw "patch looks wrong; aborting" }
  [System.IO.File]::WriteAllText($cfg, $patched, (New-Object System.Text.UTF8Encoding($false)))

  Write-Host "Rendering statecraft book PDF to _pdfdev/ ..."
  & $quarto render --profile pdf --to pdf --output-dir _pdfdev
  if ($LASTEXITCODE -ne 0) { throw "quarto render failed (exit $LASTEXITCODE)" }

  $pdf = Join-Path $root "_pdfdev\Javne-politike.pdf"
  if (-not (Test-Path $pdf)) { throw "expected PDF not produced: $pdf" }
  Write-Host "OK -> _pdfdev/Javne-politike.pdf"
}
finally {
  if (Test-Path $bak) {
    Copy-Item $bak $cfg -Force
    Remove-Item $bak -Force -ErrorAction SilentlyContinue
    Write-Host "_quarto.yml restored."
  }
}

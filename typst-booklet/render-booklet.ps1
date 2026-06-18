# Renders the citizen-guide booklet with the STATECRAFT Typst theme (A5).
#
# Proof of concept: reuses the prose from prirucnik.qmd verbatim (single-sourced)
# and only swaps its `format:` block for a Typst format wired to the statecraft
# partials in this directory. Renders STANDALONE in a temp dir outside the project
# tree (the book project itself cannot emit Typst), then installs the PDF and a
# set of page-preview PNGs.
#
# Keep this file ASCII-only (Windows PowerShell 5.1 reads .ps1 as the ANSI
# codepage). All Croatian text comes from the UTF-8 source files, never typed here.
#
# Usage:  powershell -File typst-booklet/render-booklet.ps1
# Output: pdf/Prirucnik-statecraft.pdf  +  typst-booklet/preview/p*.png

$ErrorActionPreference = "Stop"

$here = $PSScriptRoot
$root = Split-Path $here -Parent

$quarto = (Get-Command quarto -ErrorAction SilentlyContinue).Source
if (-not $quarto) { $quarto = "C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe" }
if (-not (Test-Path $quarto)) { throw "Quarto not found." }

$src = Join-Path $root "prirucnik.qmd"
if (-not (Test-Path $src)) { throw "prirucnik.qmd not found at $src" }

# ---- Build booklet.qmd: original front matter minus its format: block, plus a
#      Typst format block wired to the statecraft partials. -------------------
$utf8 = New-Object System.Text.UTF8Encoding($false)
$lines = [System.IO.File]::ReadAllLines($src, $utf8)

# Locate the YAML front matter (first two '---' fences).
if ($lines[0].Trim() -ne "---") { throw "expected front matter fence on line 1" }
$close = -1
for ($i = 1; $i -lt $lines.Count; $i++) { if ($lines[$i].Trim() -eq "---") { $close = $i; break } }
if ($close -lt 0) { throw "front matter closing fence not found" }

$fm   = $lines[1..($close-1)]
$body = if ($close + 1 -le $lines.Count - 1) { $lines[($close+1)..($lines.Count-1)] } else { @() }

# Drop the existing `format:` key and its indented children.
$fmOut = New-Object System.Collections.Generic.List[string]
$skip = $false
foreach ($l in $fm) {
  if ($l -match '^format:\s*$') { $skip = $true; continue }
  if ($skip) {
    if ($l -match '^\s' -or $l -match '^\s*$') { continue } else { $skip = $false }
  }
  $fmOut.Add($l)
}

# ASCII-only Typst format block (no Croatian text here).
# shift-heading-level-by: 0 keeps markdown ## -> Typst level 2 (parts),
# ### -> level 3 (sections); Quarto otherwise auto-shifts by -1.
$fmtBlock = @(
  'shift-heading-level-by: 0'
  'format:'
  '  typst:'
  '    keep-typ: true'
  '    papersize: a5'
  '    font-paths:'
  '      - fonts'
  '    template-partials:'
  '      - page.typ'
  '      - typst-template.typ'
  '      - typst-show.typ'
)

$qmd = New-Object System.Collections.Generic.List[string]
$qmd.Add('---')
foreach ($l in $fmOut) { $qmd.Add($l) }
foreach ($l in $fmtBlock) { $qmd.Add($l) }
$qmd.Add('---')
foreach ($l in $body) { $qmd.Add($l) }

# ---- Stage a temp render dir OUTSIDE the project tree. ----------------------
$tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("booklet-statecraft-" + [System.Guid]::NewGuid().ToString("N").Substring(0,8))
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $tmp "images\prirucnik") | Out-Null

try {
  [System.IO.File]::WriteAllLines((Join-Path $tmp "booklet.qmd"), $qmd, $utf8)

  Copy-Item (Join-Path $here "page.typ")            (Join-Path $tmp "page.typ")
  Copy-Item (Join-Path $here "typst-template.typ")  (Join-Path $tmp "typst-template.typ")
  Copy-Item (Join-Path $here "typst-show.typ")      (Join-Path $tmp "typst-show.typ")
  Copy-Item (Join-Path $root "fonts")               (Join-Path $tmp "fonts") -Recurse
  Copy-Item (Join-Path $root "images\prirucnik\ph2.jpg")      (Join-Path $tmp "images\prirucnik\ph2.jpg")
  Copy-Item (Join-Path $root "images\prirucnik\ph-vodic.png") (Join-Path $tmp "images\prirucnik\ph-vodic.png")

  Push-Location $tmp
  try {
    & $quarto render "booklet.qmd" --to typst
    if ($LASTEXITCODE -ne 0) { throw "quarto render failed (exit $LASTEXITCODE)" }

    if (-not (Test-Path "booklet.pdf")) { throw "expected booklet.pdf not produced" }
    if (-not (Test-Path "booklet.typ")) { throw "expected booklet.typ not produced (keep-typ)" }

    # Page-preview PNGs straight from Typst (no external rasterizer needed).
    New-Item -ItemType Directory -Force -Path "preview" | Out-Null
    & $quarto typst compile "booklet.typ" "preview/p{p}.png" --font-path "fonts" --ppi 200
    if ($LASTEXITCODE -ne 0) { throw "typst png preview failed (exit $LASTEXITCODE)" }
  } finally { Pop-Location }

  # ---- Install outputs. -----------------------------------------------------
  New-Item -ItemType Directory -Force -Path (Join-Path $root "pdf") | Out-Null
  Copy-Item (Join-Path $tmp "booklet.pdf") (Join-Path $root "pdf\Prirucnik-statecraft.pdf") -Force

  $prevDst = Join-Path $here "preview"
  if (Test-Path $prevDst) { Remove-Item $prevDst -Recurse -Force }
  New-Item -ItemType Directory -Force -Path $prevDst | Out-Null
  Copy-Item (Join-Path $tmp "preview\*.png") $prevDst -Force

  $n = (Get-ChildItem $prevDst -Filter *.png | Measure-Object).Count
  Write-Host "OK -> pdf/Prirucnik-statecraft.pdf  ($n preview pages in typst-booklet/preview/)"
}
finally {
  Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
}

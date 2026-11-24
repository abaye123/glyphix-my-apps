# Draws the launcher icon (four tiles) and the text reader row icon.
# Usage: .\tools\render-icon.ps1 -OutDir (Resolve-Path src\assets)
param([string]$OutDir)
Add-Type -AssemblyName System.Drawing

function Draw-Icon($name, $c1, $c2, $paint) {
  $big = New-Object System.Drawing.Bitmap 768, 768
  $g = [System.Drawing.Graphics]::FromImage($big)
  $g.SmoothingMode = 'AntiAlias'
  $g.Clear([System.Drawing.Color]::Transparent)
  $g.ScaleTransform(4, 4)
  $rect = New-Object System.Drawing.Rectangle(0, 0, 192, 192)
  $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, [System.Drawing.ColorTranslator]::FromHtml($c1), [System.Drawing.ColorTranslator]::FromHtml($c2), 60.0)
  $g.FillEllipse($bg, 1, 1, 190, 190)
  & $paint $g
  $small = New-Object System.Drawing.Bitmap 192, 192
  $s = [System.Drawing.Graphics]::FromImage($small)
  $s.InterpolationMode = 'HighQualityBicubic'
  $s.DrawImage($big, 0, 0, 192, 192)
  $small.Save((Join-Path $OutDir $name), [System.Drawing.Imaging.ImageFormat]::Png)
}

$white = [System.Drawing.Brushes]::White
Draw-Icon 'icon.png' '#2aa7c9' '#3a3fb0' {
  param($g)
  foreach ($x in 54, 101) { foreach ($y in 54, 101) { $g.FillEllipse($white, $x, $y, 38, 38) } }
}
Draw-Icon 'reader.png' '#35b57a' '#176b8a' {
  param($g)
  $g.FillRectangle($white, 60, 46, 72, 100)
  $pen = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#176b8a')), 7
  foreach ($y in 68, 86, 104) { $g.DrawLine($pen, 72, $y, 120, $y) }
  $g.DrawLine($pen, 92, 122, 120, 122)
}
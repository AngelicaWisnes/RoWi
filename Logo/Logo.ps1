
$logoRoot = $PSScriptRoot
$logo = "$logoRoot\Images\AW_LOGO_IMAGE.png" | Resolve-Path
$logo_text = "$logoRoot\Images\AW_LOGO_TEXT.txt" | Resolve-Path
$selfie_image = "$logoRoot\Images\W_SELFIE_IMAGE.png" | Resolve-Path
$selfie_text = "$logoRoot\Images\W_SELFIE_TEXT.txt" | Resolve-Path
$heart_text = "$logoRoot\Images\HEART_TEXT.txt" | Resolve-Path

function Convert-ImageToAsciiArt {
  param(
    [Parameter(Mandatory)][String] $Path,
    [bool]$BinaryPixelated = $false
  )
  
  Add-Type -AssemblyName System.Drawing # Load drawing functionality
  $imageFromFile = [Drawing.Image]::FromFile($path) 
  $characters = (& { If ($BinaryPixelated) { '# ' } Else { '$#H&@*+;:-,. ' } }).ToCharArray() # Characters from dark to light  
  $charCount = $characters.count 
  
  $charHeightWidthRatio = 2 # A pixel has a H/W-ratio of 1/1, while a char has a H/W-ratio of 2/1  
  $inputWidth = $imageFromFile.Width
  $inputHeight = $imageFromFile.Height / $charHeightWidthRatio
  
  $_, $outputWidth, $outputHeight = Get-OutputSizes @($inputWidth, $inputHeight)

  $bitmap = new-object Drawing.Bitmap($imageFromFile , $outputWidth, $outputHeight) 
  
  $sb = [System.Text.StringBuilder]::new()
  [void]$sb.AppendLine() 

  for ($y = 0; $y -lt $outputHeight; $y++) {
    for ($x = 0; $x -lt $outputWidth; $x++) {
      $color = $bitmap.GetPixel($x, $y)
      $brightness = $color.GetBrightness()

      $offset = [Math]::Floor($brightness * $charCount)
      $ch = $characters[$offset]
      If (-not $ch) { $ch = $characters[-1] }
      
      [void]$sb.Append($ch)
    }
    [void]$sb.AppendLine()
  }

  $imageFromFile.Dispose()
  Return $sb.ToString()
} 

function Resize-AsciiArt {
  param(
    [Parameter(Mandatory)][String] $Path,
    [int[]] $widthHeightDivisors = @(1,1)
    )

  [string[]]$imageArrayFromFile = Get-Content -Path $Path
  
  $inputWidth = $imageArrayFromFile[0].Length
  $inputHeight = $imageArrayFromFile.Length 
  
  $outputScale, $outputWidth, $outputHeight = Get-OutputSizes @($inputWidth, $inputHeight) $widthHeightDivisors
  
  $sb = [System.Text.StringBuilder]::new()
  [void]$sb.AppendLine()
  
  # Nearest-neighbor interpolation
  for ($y = 0; $y -lt $outputHeight; $y++) {
    $nearestY = [Math]::Floor($y / $outputScale)
    $line = $imageArrayFromFile[$nearestY]
  
    for ($x = 0; $x -lt $outputWidth; $x++) {
      $nearestX = [Math]::Floor($x / $outputScale)
      $pixel = $line.Substring($nearestX, 1)
      [void]$sb.Append($pixel)
    }
    [void]$sb.AppendLine()
  }

  Return $sb.ToString()
} 

function Get-OutputSizes {
  param(
    [Parameter(Mandatory)][int[]] $inputDimensions,
    [Parameter(Mandatory)][int[]] $widthHeightDivisors
  ) 
  $inputWidth, $inputHeight = $inputDimensions

  $windowWidth, $windowHeight = Get-WindowDimensions
  $adjustedWindowWidth = $windowWidth / $widthHeightDivisors[0]
  $adjustedWindowHeight = $windowHeight / $widthHeightDivisors[1]
  
  $minScaleWidth = $adjustedWindowWidth / $inputWidth
  $minScaleHeight = $adjustedWindowHeight / $inputHeight

  $outputScale = [Math]::Min($minScaleWidth, $minScaleHeight)
  $outputWidth = [Math]::Floor($inputWidth * $outputScale)
  $outputHeight = [Math]::Floor($inputHeight * $outputScale)

  Return @($outputScale, $outputWidth, $outputHeight)
}

function Get-Logo {
  $randomColor = $global:colors.Values.GetEnumerator() | Get-Random -Count 1
  $colorChartString, $explanation = Get-ColorChartStringAndExplanation

  If ($colorChartString) { $coloredLogo = Get-ArtRGB -colorChartString:$colorChartString }
  Else { $coloredLogo = OUT $(PE -txt:$(Get-LogoAsString) -fg:$randomColor) }

  Get-HeartStampedLogo -text:$coloredLogo -logoColorChart:$colorChartString

  If ($explanation) { Get-Explanation -expl:$explanation }

  Get-RainbowSlimLine
  Get-TransSlimLine -NoNewlineStart
  OUT
}
Add-ToFunctionList -category 'Other' -name 'Get-Logo' -value 'Get Logo'

function Get-ColorChartStringAndExplanation {
  switch -Regex (Get-Date -Format "dd.MM") {
    "23.01" { $colorChartString = "norway"; $explanation = "Birthday"; Break }
    "24.01" { $colorChartString = "norway"; $explanation = "Birthday"; Break }
    ".*.01" { $colorChartString = "colorfull"; $explanation = ""; Break }
    "09.04" { $colorChartString = "norway"; $explanation = "Birthday"; Break }
    "31.03" { $colorChartString = "trans"; $explanation = "International Transgender Day Of Visibility"; Break }
    "04.05" { $colorChartString = "starWars"; $explanation = "May the 4th be with you"; Break }
    ".*.06" { $colorChartString = "rainbow"; $explanation = "Pride Month"; Break }
    ".*.05" { $colorChartString = "norway"; $explanation = "Norwegian National Day (May 17th)"; Break }
    ".*.07" { $colorChartString = "nonbinary"; $explanation = "Nonbinary Awareness Week (approx. 14th)"; Break }
    "^(?:0[0-9])\.09$" { $colorChartString = "blueRibbon"; $explanation = "Prostate Cancer Awareness Month"; Break }
    ".*.09" { $colorChartString = "bisexual"; $explanation = "Bisexual Awareness Week (approx. 16th-23rd)"; Break }
    ".*.10" { $colorChartString = "pinkRibbon"; $explanation = "Breast Cancer Awareness Month"; Break }
    ".*.11" { $colorChartString = "trans"; $explanation = "Trans Awareness Month"; Break }
    default { $colorChartString = ""; $explanation = ""; Break }
  }
  
  Return $colorChartString, $explanation
}

function Get-AllLogoColors {
  Get-ArtRGB -colorChartString:"norway"
  Get-ArtRGB -colorChartString:"rainbow"
  Get-ArtRGB -colorChartString:"nonbinary"
  Get-ArtRGB -colorChartString:"bisexual"
  Get-ArtRGB -colorChartString:"trans"
  Get-ArtRGB -colorChartString:"pinkRibbon"
  Get-ArtRGB -colorChartString:"blueRibbon"
  Get-ArtRGB -colorChartString:"starWars"
  OUT $(PE -txt:$(Get-LogoAsString) -fg:$global:colors.DeepPink)
  OUT
}
Add-ToFunctionList -category 'Other' -name 'Get-AllLogoColors' -value 'Get all Logo colors'

function Get-LogoRainbow {
  $outputString = Get-LogoAsString
  $lines = $outputString.Split("`n")
  $colors = @( "DarkRed", "Red", "Yellow", "Green", "Blue", "Magenta" )
  $colorNumber = -1
  $linesOfEachColor = [int]($lines.Count / $colors.Count)

  for ($i = 0; $i -lt $lines.Count; $i++) {
    If ($i % $linesOfEachColor -eq 0 -and $colorNumber -lt ($colors.Count - 1)) { $colorNumber++ }
    Write-Host -ForegroundColor $colors[$colorNumber] $lines[$i]
    #Write-Host -BackgroundColor $colors[$colorCount] -ForegroundColor Black $logoLines[$i]
  }
}

function Get-ArtRGB {
  param( 
    [string][string]$colorChartString,
    [string]$outputString = $(Get-LogoAsString)
  )
  $lines = $outputString.Split("`n")
  
  If ($null -ne $colorChartString) {
    $fg_colorNumber = -1
    $fg_colors = $global:colorChart[$colorChartString].fg
    $fg_linesOfEachColor = If ($null -ne $fg_colors) { [int]($lines.Count / $fg_colors.Count) } 
    
    $bg_colorNumber = -1
    $bg_colors = $global:colorChart[$colorChartString].bg
    $bg_linesOfEachColor = If ($null -ne $bg_colors) { [int]($lines.Count / $bg_colors.Count) } 
  }

  $sb = [System.Text.StringBuilder]::new()
  for ($i = 0; $i -lt $lines.Count; $i++) {
      If ($null -ne $fg_colors -and $i % $fg_linesOfEachColor -eq 0 -and $fg_colorNumber -lt ($fg_colors.Count - 1)) { $fg_colorNumber++ }
      If ($null -ne $bg_colors -and $i % $bg_linesOfEachColor -eq 0 -and $bg_colorNumber -lt ($bg_colors.Count - 1)) { $bg_colorNumber++ }

      $fg_color = If ($null -ne $fg_colors) { $fg_colors[$fg_colorNumber] }
      $bg_color = If ($null -ne $bg_colors) { $bg_colors[$bg_colorNumber] }

      [void]$sb.Append($(OUT $(PE -txt:$lines[$i] -fg:$fg_color -bg:$bg_color) -NoNewline -NoNewlineStart:$($i -eq 0) -ForceString))
  }
  
  Return $sb.ToString()
}


function Get-Selfie {
  OUT $(PE -txt:$(Get-SelfieAsString) -fg:$global:colors.DeepPink)
}
Add-ToFunctionList -category 'Other' -name 'Get-Selfie' -value 'Get selfie'

function Get-SelfieAsString {
  $selfieImageExists = Test-Path -Path $selfie_image -PathType Leaf
  $selfieTextExists = Test-Path -Path $selfie_text -PathType Leaf

  If ($global:SYSTEM_OS.Contains('Windows') -and $selfieImageExists) { 
    Return Convert-ImageToAsciiArt -Path $selfie_image 
  }
  Elseif ($selfieTextExists) { Return Resize-AsciiArt -Path $selfie_text }
  Else { Return "Could not print selfie, as the file is missing" }
}

function Get-LogoAsString {
  $logoImageExists = Test-Path -Path $logo -PathType Leaf
  $logoTextExists = Test-Path -Path $logo_text -PathType Leaf

  If ($global:SYSTEM_OS.Contains('Windows') -and $logoImageExists) { 
    Return Convert-ImageToAsciiArt -Path $logo -BinaryPixelated $true
  }
  Elseif ($logoTextExists) { Return Resize-AsciiArt -Path $logo_text }
  Else { Return "Could not print logo, as the file is missing" }
}


function Get-Explanation {
  param( [Parameter(Mandatory)][string]$expl )

  $windowWidth, $_ = Get-WindowDimensions
  $leftPadding = $windowWidth - $expl.Length
  $padding = [string]::new(' ', [Math]::Max(0, $leftPadding))
  
  OUT $(PE -txt:$($padding + $expl) -fg:$global:colors.DeepPink) -NoNewlineStart
}


function Get-HeartAsString {
  $heartTextExists = Test-Path -Path $heart_text -PathType Leaf

  If ($heartTextExists) { Return Resize-AsciiArt -Path:$heart_text -widthHeightDivisors:@(5,3) }
}


function Get-HeartStampedLogo {
  param (
      [Parameter(Mandatory)][string]$text,
      [Parameter(Mandatory)][string]$logoColorChart
  )
  If ( $logoColorChart -eq "trans" ) { $colorChartString = "rainbow" } Else { $colorChartString = "trans" }

  $heightOffset = 2
  $widthOffset = 3
  $widthOffsetString = " " * $widthOffset

  $heart = Get-HeartAsString
  $coloredHeart = Get-ArtRGB -colorChartString:$colorChartString -outputString:$heart

  $startPosition = [Math]::Max($text.IndexOf('m'), 0)

  $outputLines = $text -split "`n"
  $heartLines = $heart -split "`n"
  $coloredHeartLines = $coloredHeart -split "`n"
  $linesToOverwrite = [Math]::Min($outputLines.Length, $coloredHeartLines.Length)
  
  for ($i = 0; $i -lt $linesToOverwrite; $i++) {
    $line = $outputLines[$i + $heightOffset]
    $heartLine = $widthOffsetString + $heartLines[$i]
    $coloredHeartLine = $widthOffsetString + $coloredHeartLines[$i]
    $line = $coloredHeartLine + $line.Substring(0, $startPosition) + $line.Substring($startPosition + $heartLine.Length)
    $outputLines[$i + $heightOffset] = $line
  }

  Return $outputLines -join "`n"
}
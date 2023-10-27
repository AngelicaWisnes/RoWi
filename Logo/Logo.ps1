
$logoRoot = $PSScriptRoot
$logo = "$logoRoot\Images\AW_LOGO_IMAGE.png" | Resolve-Path
$logo_text = "$logoRoot\Images\AW_LOGO_TEXT.txt" | Resolve-Path
$selfie_image = "$logoRoot\Images\W_SELFIE_IMAGE.png" | Resolve-Path
$selfie_text = "$logoRoot\Images\W_SELFIE_TEXT.txt" | Resolve-Path

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
  $null = $sb.AppendLine() 

  for ($y = 0; $y -lt $outputHeight; $y++) {
    for ($x = 0; $x -lt $outputWidth; $x++) {
      $color = $bitmap.GetPixel($x, $y)
      $brightness = $color.GetBrightness()

      $offset = [Math]::Floor($brightness * $charCount)
      $ch = $characters[$offset]
      If (-not $ch) { $ch = $characters[-1] }
      
      $null = $sb.Append($ch)
    }
    $null = $sb.AppendLine()
  }

  $imageFromFile.Dispose()
  Return $sb.ToString()
} 

function Resize-AsciiArt {
  param([Parameter(Mandatory)][String] $Path)

  [string[]]$imageArrayFromFile = Get-Content -Path $Path
  
  $inputWidth = $imageArrayFromFile[0].Length
  $inputHeight = $imageArrayFromFile.Length 
  
  $outputScale, $outputWidth, $outputHeight = Get-OutputSizes @($inputWidth, $inputHeight)
  
  $sb = [System.Text.StringBuilder]::new()
  $null = $sb.AppendLine()
  
  # Nearest-neighbor interpolation
  for ($y = 0; $y -lt $outputHeight; $y++) {
    $nearestY = [Math]::Floor($y / $outputScale)
    $line = $imageArrayFromFile[$nearestY]
  
    for ($x = 0; $x -lt $outputWidth; $x++) {
      $nearestX = [Math]::Floor($x / $outputScale)
      $pixel = $line.Substring($nearestX, 1)
      $null = $sb.Append($pixel)
    }
    $null = $sb.AppendLine()
  }

  Return $sb.ToString()
} 

function Get-OutputSizes {
  param([Parameter(Mandatory)][int[]] $inputDimensions) 
  $inputWidth, $inputHeight = $inputDimensions

  $windowHeightPadding = 10
  $windowWidthPadding = 1

  $windowWidth = $Host.UI.RawUI.WindowSize.Width - $windowWidthPadding
  $windowHeight = $Host.UI.RawUI.WindowSize.Height - $windowHeightPadding
  $minScaleWidth = $windowWidth / $inputWidth
  $minScaleHeight = $windowHeight / $inputHeight

  $outputScale = [Math]::Min($minScaleWidth, $minScaleHeight)
  $outputWidth = [Math]::Floor($inputWidth * $outputScale)
  $outputHeight = [Math]::Floor($inputHeight * $outputScale)

  Return @($outputScale, $outputWidth, $outputHeight)
}

function Get-Logo {
  $randomColor = $global:colors.Values.GetEnumerator() | Get-Random -Count 1

  switch -Regex (Get-Date -Format "dd.MM") {
    "23.01" { Get-LogoRGB -fg_colorChartString "norway"; Break }    # Birthday
    "24.01" { Get-LogoRGB -fg_colorChartString "norway"; Break }    # Birthday
    "09.04" { Get-LogoRGB -fg_colorChartString "norway"; Break }    # Birthday
    "31.03" { Get-LogoRGB -fg_colorChartString "trans"; Break }     # International Transgender Day Of Visibility
    "04.05" { OUT $(PE -txt:$(Get-LogoAsString) -fg:$global:colors.Yellow -bg:$global:colors.Black); Break }     # May the 4th be with you
    ".*.06" { Get-LogoRGB -fg_colorChartString "rainbow"; Break }   # Pride Month
    ".*.05" { Get-LogoRGB -fg_colorChartString "norway"; Break }    # Norwegian National Day (May 17th)
    ".*.07" { Get-LogoRGB -fg_colorChartString "nonbinary"; Break } # Nonbinary Awareness Week (approx. 14th)
    ".*.09" { Get-LogoRGB -fg_colorChartString "bisexual"; Break }  # Bisexual Awareness Week (approx. 16th-23rd)
    ".*.11" { Get-LogoRGB -fg_colorChartString "trans"; Break }     # Trans Awareness Month
    default { OUT $(PE -txt:$(Get-LogoAsString) -fg:$randomColor); Break }
  }

  Get-RainbowSlimLine
  Get-TransSlimLine -NoNewlineStart
  Write-Host
}
Add-ToFunctionList -category 'Other' -name 'Get-Logo' -value 'Get Logo'

function Get-AllLogoColors {
  Get-LogoRGB -fg_colorChartString "norway"
  Get-LogoRGB -fg_colorChartString "rainbow"
  Get-LogoRGB -fg_colorChartString "nonbinary"
  Get-LogoRGB -fg_colorChartString "bisexual"
  Get-LogoRGB -fg_colorChartString "trans"
  OUT $(PE -txt:$(Get-LogoAsString) -fg:$global:colors.Yellow -bg:$global:colors.Black)
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

function Get-LogoRGB {
  param( [string]$fg_colorChartString, [string]$bg_colorChartString )
  $outputString = Get-LogoAsString
  $lines = $outputString.Split("`n")

  $fg_colorNumber = -1
  $fg_colors = If ($null -ne $fg_colorChartString) { $global:colorChart[$fg_colorChartString] }
  $fg_linesOfEachColor = If ($null -ne $fg_colors) { [int]($lines.Count / $fg_colors.Count) } 

  $bg_colorNumber = -1
  $bg_colors = If ($null -ne $bg_colorChartString) { $global:colorChart[$bg_colorChartString] }
  $bg_linesOfEachColor = If ($null -ne $bg_colors) { [int]($lines.Count / $bg_colors.Count) } 

  for ($i = 0; $i -lt $lines.Count; $i++) {
      If ($null -ne $fg_colors -and $i % $fg_linesOfEachColor -eq 0 -and $fg_colorNumber -lt ($fg_colors.Count - 1)) { $fg_colorNumber++ }
      If ($null -ne $bg_colors -and $i % $bg_linesOfEachColor -eq 0 -and $bg_colorNumber -lt ($bg_colors.Count - 1)) { $bg_colorNumber++ }

      $fg_color = If ($null -ne $fg_colors) { $fg_colors[$fg_colorNumber] }
      $bg_color = If ($null -ne $bg_colors) { $bg_colors[$bg_colorNumber] }

      OUT $(PE -txt:$lines[$i] -fg:$fg_color -bg:$bg_color) -NoNewlineStart
  }
}


function Get-Selfie {
  OUT $(PE -txt:$(Get-SelfieAsString) -fg:$global:colors.DeepPink)
}
Add-ToFunctionList -category 'Other' -name 'Get-Selfie' -value 'Get selfie'

function Get-SelfieAsString {
  $selfieImageExists = Test-Path -Path $selfie_image -PathType Leaf
  $selfieTextExists = Test-Path -Path $selfie_text -PathType Leaf

  If ($global:SYSTEM_OS.Contains('Windows') -AND $selfieImageExists) { 
    Return Convert-ImageToAsciiArt -Path $selfie_image 
  }
  Elseif ($selfieTextExists) { Return Resize-AsciiArt -Path $selfie_text }
  Else { Return "Could not print selfie, as the file is missing" }
}

function Get-LogoAsString {
  $logoImageExists = Test-Path -Path $logo -PathType Leaf
  $logoTextExists = Test-Path -Path $logo_text -PathType Leaf

  If ($global:SYSTEM_OS.Contains('Windows') -AND $logoImageExists) { 
    Return Convert-ImageToAsciiArt -Path $logo -BinaryPixelated $true
  }
  Elseif ($logoTextExists) { Return Resize-AsciiArt -Path $logo_text }
  Else { Return "Could not print logo, as the file is missing" }
}

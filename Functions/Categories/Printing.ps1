
##############################
# Printing-related functions #
##############################
$global:FunctionSubList_PRINTING = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_PRINTING.Add( $FunctionSubList_BREAK )
function addToList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_PRINTING.Add(( [FunctionListElement]@{ category = "Printing"; name = $name; value = $value } ))
}

<#
  Example formatting for ansi- and rgb-colors:
  ANSI:   $([char]0x1b)[38;5;252m'Sample Text'$([char]0x1b)[0m
  RGB:    $([char]0x1b)[38;2;255;255;255m'Sample Text'$([char]0x1b)[0m

  Breakdown of the formatting:
  ANSI:   1111111111111 2 XX 2 Y 2 AAA             2 VVVVVVVVVVVVV 1111111111111 444
  ANSI:   $([char]0x1b) [ 38 ; 5 ; 252             m 'Sample Text' $([char]0x1b) [0m
  RGB:    $([char]0x1b) [ 38 ; 2 ; 255 ; 255 ; 255 m 'Sample Text' $([char]0x1b) [0m
  RGB:    1111111111111 2 XX 2 Y 2 RRR 3 GGG 3 BBB 2 VVVVVVVVVVVVV 1111111111111 444

  Where:
  1 = Escape-sequence
  2 = Common separators/elements for color-code
  3 = RGB-separators
  4 = Color-reset code
  X = 48 for background-color, OR 38 for foregrount-color
  Y = 5 for ansi-color, OR 2 for rgb-color
  V = The text to be colored
  A = The color-values for ANSI
  R, G, B = The color-values for RGB
#>

class RGB { [int]$r; [int]$g; [int]$b; } 
class COLOR { [string]$hex; [int]$r; [int]$g; [int]$b; } 
$global:colors = [ordered]@{
  # Light colors
  Red                = [COLOR]@{ hex = "#FF0000"; r = 255; g = 0; b = 0; };
  Orange             = [COLOR]@{ hex = "#FF8000"; r = 255; g = 128; b = 0; };
  Yellow             = [COLOR]@{ hex = "#FFFF00"; r = 255; g = 255; b = 0; };
  Chartreuse         = [COLOR]@{ hex = "#80FF00"; r = 128; g = 255; b = 0; };
  Lime               = [COLOR]@{ hex = "#00FF00"; r = 0; g = 255; b = 0; };
  SpringGreen        = [COLOR]@{ hex = "#00FF80"; r = 0; g = 255; b = 128; };
  Cyan               = [COLOR]@{ hex = "#00FFFF"; r = 0; g = 255; b = 255; };
  DarkCyan           = [COLOR]@{ hex = "#3A96DD"; r = 58; g = 150; b = 221; };
  DodgerBlue         = [COLOR]@{ hex = "#0080FF"; r = 0; g = 128; b = 255; };
  Blue               = [COLOR]@{ hex = "#0000FF"; r = 0; g = 0; b = 255; };
  ElectricIndigo     = [COLOR]@{ hex = "#8000FF"; r = 128; g = 0; b = 255; };
  Magenta            = [COLOR]@{ hex = "#FF00FF"; r = 255; g = 0; b = 255; };
  DeepPink           = [COLOR]@{ hex = "#FF0080"; r = 255; g = 0; b = 128; };
  MonaLisa           = [COLOR]@{ hex = "#FF8080"; r = 255; g = 128; b = 128; };
  MintGreen          = [COLOR]@{ hex = "#80FF80"; r = 128; g = 255; b = 128; };
  LightSlateBlue     = [COLOR]@{ hex = "#8080FF"; r = 128; g = 128; b = 255; };
  # Dark colors
  Maroon             = [COLOR]@{ hex = "#800000"; r = 128; g = 0; b = 0; };
  Olive              = [COLOR]@{ hex = "#808000"; r = 128; g = 128; b = 0; };
  Green              = [COLOR]@{ hex = "#008000"; r = 0; g = 128; b = 0; };
  Teal               = [COLOR]@{ hex = "#008080"; r = 0; g = 128; b = 128; };
  Navy               = [COLOR]@{ hex = "#000080"; r = 0; g = 0; b = 128; };
  Purple             = [COLOR]@{ hex = "#800080"; r = 128; g = 0; b = 128; };
  # Contrasts
  White              = [COLOR]@{ hex = "#FFFFFF"; r = 255; g = 255; b = 255; };
  Silver             = [COLOR]@{ hex = "#C0C0C0"; r = 192; g = 192; b = 192; };
  Gray               = [COLOR]@{ hex = "#808080"; r = 128; g = 128; b = 128; };
  Black              = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
  # SystemColors   Get their RGB values by foreach ($color in [System.ConsoleColor].GetEnumValues()) {[System.Drawing.Color]::FromName($color)}
  System_Black       = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
  System_DarkBlue    = [COLOR]@{ hex = "#00008B"; r = 0; g = 0; b = 139; };
  System_DarkGreen   = [COLOR]@{ hex = "#006400"; r = 0; g = 100; b = 0; };
  System_DarkCyan    = [COLOR]@{ hex = "#008B8B"; r = 0; g = 139; b = 139; };
  System_DarkRed     = [COLOR]@{ hex = "#8B0000"; r = 139; g = 0; b = 0; };
  System_DarkMagenta = [COLOR]@{ hex = "#8B008B"; r = 139; g = 0; b = 139; };
  System_DarkYellow  = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
  System_Gray        = [COLOR]@{ hex = "#808080"; r = 128; g = 128; b = 128; };
  System_DarkGray    = [COLOR]@{ hex = "#A9A9A9"; r = 169; g = 169; b = 169; };
  System_Blue        = [COLOR]@{ hex = "#0000FF"; r = 0; g = 0; b = 255; };
  System_Green       = [COLOR]@{ hex = "#008000"; r = 0; g = 128; b = 0; };
  System_Cyan        = [COLOR]@{ hex = "#00FFFF"; r = 0; g = 255; b = 255; };
  System_Red         = [COLOR]@{ hex = "#FF0000"; r = 255; g = 0; b = 0; };
  System_Magenta     = [COLOR]@{ hex = "#FF00FF"; r = 255; g = 0; b = 255; };
  System_Yellow      = [COLOR]@{ hex = "#FFFF00"; r = 255; g = 255; b = 0; };
  System_White       = [COLOR]@{ hex = "#FFFFFF"; r = 255; g = 255; b = 255; };
  # Colornames are taken from https://www.color-blindness.com/color-name-hue/
  # Hex-codes can visualize the corresponding color in VS-Code with this extention: https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
  # Pride-specific codes
  PrideWhite         = [COLOR]@{ hex = "#FFFFFF"; r = 255; g = 255; b = 255; };
  PridePink          = [COLOR]@{ hex = "#FFAFC7"; r = 255; g = 175; b = 199; };
  PrideCyan          = [COLOR]@{ hex = "#73D7EE"; r = 115; g = 215; b = 238; };
  PrideBrown         = [COLOR]@{ hex = "#613915"; r = 97; g = 57; b = 21; };
  PrideBlack         = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
  PrideRed           = [COLOR]@{ hex = "#E50000"; r = 229; g = 0; b = 0; };
  PrideOrange        = [COLOR]@{ hex = "#FF8D00"; r = 255; g = 141; b = 0; };
  PrideYellow        = [COLOR]@{ hex = "#FFEE00"; r = 255; g = 238; b = 0; };
  PrideGreen         = [COLOR]@{ hex = "#028121"; r = 2; g = 129; b = 33; };
  PrideBlue          = [COLOR]@{ hex = "#004CFF"; r = 0; g = 76; b = 255; };
  PridePurple        = [COLOR]@{ hex = "#730088"; r = 115; g = 0; b = 136; };
  PrideBiPink        = [COLOR]@{ hex = "#B00B69"; r = 176; g = 11; b = 105; };
  PrideBiPurple      = [COLOR]@{ hex = "#A55EA7"; r = 165; g = 94; b = 167; };
  PrideBiBlue        = [COLOR]@{ hex = "#1D1CC9"; r = 29; g = 28; b = 201; };
}






$global:colorChart = @{
  rainbow  = @( $colors.PrideRed, $colors.PrideOrange, $colors.PrideYellow, $colors.PrideGreen, $colors.PrideBlue, $colors.PridePurple );
  trans    = @( $colors.PrideCyan, $colors.PridePink, $colors.PrideWhite, $colors.PridePink, $colors.PrideCyan );
  bisexual = @( $colors.PrideBiPink, $colors.PrideBiPurple, $colors.PrideBiBlue );
  norway   = @( $colors.Red, $colors.White, $colors.Blue, $colors.White, $colors.Red );
}



function dad { 
  If ($PSVersionTable.PSVersion.Major -eq 7) { dad_PowerShell7 }
  Else { dad_PowerShell5 }
}
addToList -name 'dad' -value 'Print random dad-joke'


function dad_PowerShell5 { 
  $dadContent = Invoke-WebRequest https://icanhazdadjoke.com/
  $dadJoke = ($dadContent.AllElements | Where-Object { $_.Class -eq "subtitle" }).innerText
  OUT "$dadJoke", $global:colors.Cyan
}


function dad_PowerShell7 { 
  [console]::ForegroundColor = 'Cyan'
  Write-Host
  curl https://icanhazdadjoke.com/
  Write-Host 
  [console]::ResetColor()
}


function dance {
  $frames = @( 
    "(>'-')>   ^('-')^   <('-'<)" , 
    "^('-')^   <('-')>   ^('-')^" , 
    "<('-'<)   ^('-')^   (>'-')>" , 
    "^('-')^   <('-')>   ^('-')^" 
  )
  $loopCount = 10    # number of animation sets
  $frameDelay = 200   # milliseconds
  
  try {
    $cursorSave = (Get-Host).UI.RawUI.cursorsize
    (Get-Host).UI.RawUI.cursorsize = 0
    Write-Host

    for ( $n = 0; $n -lt $LoopCount; $n++ ) {
      for ( $i = 0; $i -lt $frames.count; $i++ ) {
        Write-Host -ForegroundColor Cyan "`r`t$($frames[$i])" -NoNewline
        Start-Sleep -Milliseconds $frameDelay
      }
    }
  }
  finally {
    (Get-Host).UI.RawUI.cursorsize = $cursorSave
    Write-Host
  }
}
addToList -name 'dance' -value 'See the PowerShell DanceSquad'


function Get-AllAnsiColors {
  Param ([switch]$Background)

  If ($Background) { $X = 48 }
  Else { $X = 38 }
  $esc = $global:COLOR_ESCAPE

  0..255 | ForEach-Object {
    $sample = "{0, 4}" -f $_
    $text = "$esc[$X;5;{0}m{1}$global:RESET_SEQUENCE" -f $_, $sample
    Write-Host $text -NoNewline
    If ( ($_ - 15) % 36 -eq 0 ) { Write-Host "" }
  }
}
Set-Alias allAnsi Get-AllAnsiColors
addToList -name 'allAnsi' -value 'See all available ansi-colors'


function Get-AllRGBColors {
  Param ([switch]$Background)

  If ($Background) { $X = 48 }
  Else { $X = 38 }
  
  $rs = 0..255
  $gs = 0..255
  $bs = 0..255

  for ($r = 0; $r -lt $rs.Count; $r += 15) {
    for ($g = 0; $g -lt $gs.Count; $g += 15) {
      for ($b = 0; $b -lt $bs.Count; $b += 15) {
        $colorSequence = $global:RGB_SEQUENCE -f $X, $r, $g, $b
        Write-Host $colorSequence "#" $global:RESET_SEQUENCE -NoNewline
        If ( ($b + 1) % 256 -eq 0 ) { Write-Host "" }
      }
      If ( ($g + 1) % 256 -eq 0 ) { Write-Host "" }
    }
  }
}
Set-Alias allRgb Get-AllRGBColors
addToList -name 'allRgb' -value 'See all available RGB-colors'


function Get-ImplementedRGBColors {
  $sample = " " * 15
 
  foreach ($color in $colors.GetEnumerator()) {
    $rgb = Get-Rgb $color.value
    $colorName = "{0, 20} " -f $color.Name
    $hexAndRgbValue = " HEX: {0}   RGB: {1, 3}, {2, 3}, {3, 3}" -f $color.value.hex, $rgb.r, $rgb.g, $rgb.b

    OUT $colorName, $sample, $rgb, $True, $hexAndRgbValue
  }
}
Set-Alias implColors Get-ImplementedRGBColors
addToList -name 'implColors' -value 'See implemented RGB-colors'




class PrintElement { [string]$text; [RGB]$color; [switch]$background; } 

function Get-PrintableRGBs {
  param( [Parameter(Mandatory)][Object[]]$printElements )
  $printables = @()
  foreach ($element in $printElements) {
    If ( $element.GetType() -eq [string] ) { $printables += [PrintElement]@{ text = $element } }
    If ( $element.GetType() -eq [RGB] ) { ($printables[-1]).color = $element }
    If ( $element.GetType() -eq [COLOR] ) { ($printables[-1]).color = Get-Rgb $element }
    If ( $element.GetType() -eq [bool] ) { ($printables[-1]).background = $element }
  }
  Return $printables
}


function OUT {
  param( 
    [Parameter(Mandatory)][Object[]]$printElements,
    [switch]$NoNewline = $False,
    [switch]$NoNewlineStart = $False
  )

  $printables = Get-PrintableRGBs $printElements
  $sb = new-object -TypeName System.Text.StringBuilder
  If (-Not $NoNewlineStart) { $sb.Append("`n") > $null }
  
  Foreach ($element in $printables) {
    If ($null -eq $element.color) { $sb.AppendFormat( "{0}", $element.text ) > $null }
    Else { $sb.AppendFormat( "{0}", (Get-RGBFormattedString $element) ) > $null }
  }

  Write-Host $sb.ToString() -NoNewline:$NoNewline
}


function Get-RGBFormattedString {
  param( [Parameter(Mandatory)][PrintElement]$element )
  If ($element.text.Length -eq 0) { Return "" }
  
  If ($element.background) { $X = 48 }
  Else { $X = 38 }
  
  $colorSequence = $global:RGB_SEQUENCE -f $X, $element.color.r, $element.color.g, $element.color.b
  $trimmed = ($element.text).Replace("`n", "")
  
  Return ($element.text).Replace($trimmed, $colorSequence + $trimmed + $global:RESET_SEQUENCE)
}


function Get-Rgb {
  param( [Parameter(Mandatory)][COLOR]$color )

  if ($color.r -and $color.g -and $color.b) {
    Return [RGB]@{ r = $color.r ; g = $color.g ; b = $color.b }
  }

  Return Convert-HexToRgb $color
}


function Convert-HexToRgb {
  param( [Parameter(Mandatory)][COLOR]$color )
  $hex = $color.hex
  
  $red = [convert]::ToInt32($hex.Substring(1, 2), 16)
  $green = [convert]::ToInt32($hex.Substring(3, 2), 16)
  $blue = [convert]::ToInt32($hex.Substring(5, 2), 16)

  Return [RGB]@{ r = $red ; g = $green ; b = $blue }
}

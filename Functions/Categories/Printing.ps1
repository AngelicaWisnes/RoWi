
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
class HEX { [string]$hex; } 
$global:HEXs = @{
  # Light colors
  Red                = [HEX]@{ hex = "#FF0000" };
  Orange             = [HEX]@{ hex = "#FF8000" };
  Yellow             = [HEX]@{ hex = "#FFFF00" };
  Chartreuse         = [HEX]@{ hex = "#80FF00" };
  Lime               = [HEX]@{ hex = "#00FF00" };
  SpringGreen        = [HEX]@{ hex = "#00FF80" };
  Cyan               = [HEX]@{ hex = "#00FFFF" };
  DarkCyan           = [HEX]@{ hex = "#3A96DD" };
  DodgerBlue         = [HEX]@{ hex = "#0080FF" };
  Blue               = [HEX]@{ hex = "#0000FF" };
  ElectricIndigo     = [HEX]@{ hex = "#8000FF" };
  Magenta            = [HEX]@{ hex = "#FF00FF" };
  DeepPink           = [HEX]@{ hex = "#FF0080" };
  MonaLisa           = [HEX]@{ hex = "#FF8080" };
  MintGreen          = [HEX]@{ hex = "#80FF80" };
  LightSlateBlue     = [HEX]@{ hex = "#8080FF" };
  # Dark colors
  Maroon             = [HEX]@{ hex = "#800000" };
  Olive              = [HEX]@{ hex = "#808000" };
  Green              = [HEX]@{ hex = "#008000" };
  Teal               = [HEX]@{ hex = "#008080" };
  Navy               = [HEX]@{ hex = "#000080" };
  Purple             = [HEX]@{ hex = "#800080" };
  # Contrasts
  White              = [HEX]@{ hex = "#FFFFFF" };
  Silver             = [HEX]@{ hex = "#C0C0C0" };
  Gray               = [HEX]@{ hex = "#808080" };
  Black              = [HEX]@{ hex = "#000000" };
  # SystemColors   Get their RGB values by foreach ($color in [System.ConsoleColor].GetEnumValues()) {[System.Drawing.Color]::FromName($color)}
  System_Black       = [HEX]@{ hex = "#000000" };
  System_DarkBlue    = [HEX]@{ hex = "#00008B" };
  System_DarkGreen   = [HEX]@{ hex = "#006400" };
  System_DarkCyan    = [HEX]@{ hex = "#008B8B" };
  System_DarkRed     = [HEX]@{ hex = "#8B0000" };
  System_DarkMagenta = [HEX]@{ hex = "#8B008B" };
  System_DarkYellow  = [HEX]@{ hex = "#000000" };
  System_Gray        = [HEX]@{ hex = "#808080" };
  System_DarkGray    = [HEX]@{ hex = "#A9A9A9" };
  System_Blue        = [HEX]@{ hex = "#0000FF" };
  System_Green       = [HEX]@{ hex = "#008000" };
  System_Cyan        = [HEX]@{ hex = "#00FFFF" };
  System_Red         = [HEX]@{ hex = "#FF0000" };
  System_Magenta     = [HEX]@{ hex = "#FF00FF" };
  System_Yellow      = [HEX]@{ hex = "#FFFF00" };
  System_White       = [HEX]@{ hex = "#FFFFFF" };
  # Colornames are taken from https://www.color-blindness.com/color-name-hue/
  # Hex-codes can visualize the corresponding color in VS-Code with this extention: https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
  # Pride-specific codes
  PrideWhite         = [HEX]@{ hex = "#FFFFFF" };
  PridePink          = [HEX]@{ hex = "#FFAFC7" };
  PrideCyan          = [HEX]@{ hex = "#73D7EE" };
  PrideBrown         = [HEX]@{ hex = "#613915" };
  PrideBlack         = [HEX]@{ hex = "#000000" };
  PrideRed           = [HEX]@{ hex = "#E50000" };
  PrideOrange        = [HEX]@{ hex = "#FF8D00" };
  PrideYellow        = [HEX]@{ hex = "#FFEE00" };
  PrideGreen         = [HEX]@{ hex = "#028121" };
  PrideBlue          = [HEX]@{ hex = "#004CFF" };
  PridePurple        = [HEX]@{ hex = "#730088" };
}

$global:colorChart = @{
  rainbow = @( $HEXs.PrideRed, $HEXs.PrideOrange, $HEXs.PrideYellow, $HEXs.PrideGreen, $HEXs.PrideBlue, $HEXs.PridePurple )
  trans   = @( $HEXs.PrideCyan, $HEXs.PridePink, $HEXs.PrideWhite, $HEXs.PridePink, $HEXs.PrideCyan )
}



function dad { 
  If ($PSVersionTable.PSVersion.Major -eq 7) { dad_PowerShell7 }
  Else { dad_PowerShell5 }
}
addToList -name 'dad' -value 'Print random dad-joke'


function dad_PowerShell5 { 
  $dadContent = Invoke-WebRequest https://icanhazdadjoke.com/
  $dadJoke = ($dadContent.AllElements | Where-Object { $_.Class -eq "subtitle" }).innerText
  OUT "$dadJoke", $global:HEXs.Cyan
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
addToList -name 'Get-AllAnsiColors' -value 'See all available ansi-colors'


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
addToList -name 'Get-AllRGBColors' -value 'See all available RGB-colors'


function Get-ImplementedRGBColors {
  $sample = " " * 15
 
  foreach ($hex in $HEXs.GetEnumerator()) {
    $rgb = Convert-HexToRgb $hex.value
    $colorName = "{0, 20} " -f $hex.Name
    $rgbValue = " RGB: {0, 3} , {1, 3} , {2, 3}" -f $rgb.r, $rgb.g, $rgb.b

    OUT $colorName, $sample, $rgb, $True, $rgbValue
  }
}
addToList -name 'Get-ImplementedRGBColors' -value 'See implemented RGB-colors'




class PrintElement { [string]$text; [RGB]$color; [switch]$background; } 

function Get-PrintableRGBs {
  param( [Parameter(Mandatory)][Object[]]$printElements )
  $printables = @()
  foreach ($element in $printElements) {
    If ( $element.GetType() -eq [string] ) { $printables += [PrintElement]@{ text = $element } }
    If ( $element.GetType() -eq [RGB] ) { ($printables[-1]).color = $element }
    If ( $element.GetType() -eq [HEX] ) { ($printables[-1]).color = Convert-HexToRgb $element }
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


function Convert-HexToRgb {
  param( [Parameter(Mandatory)][HEX]$hexObject )
  $hex = $hexObject.hex
  
  $red = [convert]::ToInt32($hex.Substring(1, 2), 16)
  $green = [convert]::ToInt32($hex.Substring(3, 2), 16)
  $blue = [convert]::ToInt32($hex.Substring(5, 2), 16)

  Return [RGB]@{ r = $red ; g = $green ; b = $blue }
}

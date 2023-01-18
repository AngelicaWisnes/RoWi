
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
class HEX { [string]$h; } 
$global:HEXs = @{
  # Light colors
  Red                = [HEX]@{ h = "#FF0000" };
  Orange             = [HEX]@{ h = "#FF8000" };
  Yellow             = [HEX]@{ h = "#FFFF00" };
  Chartreuse         = [HEX]@{ h = "#80FF00" };
  Lime               = [HEX]@{ h = "#00FF00" };
  SpringGreen        = [HEX]@{ h = "#00FF80" };
  Cyan               = [HEX]@{ h = "#00FFFF" };
  DarkCyan           = [HEX]@{ h = "#3A96DD" };
  DodgerBlue         = [HEX]@{ h = "#0080FF" };
  Blue               = [HEX]@{ h = "#0000FF" };
  ElectricIndigo     = [HEX]@{ h = "#8000FF" };
  Magenta            = [HEX]@{ h = "#FF00FF" };
  DeepPink           = [HEX]@{ h = "#FF0080" };
  MonaLisa           = [HEX]@{ h = "#FF8080" };
  MintGreen          = [HEX]@{ h = "#80FF80" };
  LightSlateBlue     = [HEX]@{ h = "#8080FF" };
  # Dark colors
  Maroon             = [HEX]@{ h = "#800000" };
  Olive              = [HEX]@{ h = "#808000" };
  Green              = [HEX]@{ h = "#008000" };
  Teal               = [HEX]@{ h = "#008080" };
  Navy               = [HEX]@{ h = "#000080" };
  Purple             = [HEX]@{ h = "#800080" };
  # Contrasts
  White              = [HEX]@{ h = "#FFFFFF" };
  Silver             = [HEX]@{ h = "#C0C0C0" };
  Gray               = [HEX]@{ h = "#808080" };
  Black              = [HEX]@{ h = "#000000" };
  # SystemColors   Get their RGB values by foreach ($color in [System.ConsoleColor].GetEnumValues()) {[System.Drawing.Color]::FromName($color)}
  System_Black       = [HEX]@{ h = "#000000" };
  System_DarkBlue    = [HEX]@{ h = "#00008B" };
  System_DarkGreen   = [HEX]@{ h = "#006400" };
  System_DarkCyan    = [HEX]@{ h = "#008B8B" };
  System_DarkRed     = [HEX]@{ h = "#8B0000" };
  System_DarkMagenta = [HEX]@{ h = "#8B008B" };
  System_DarkYellow  = [HEX]@{ h = "#000000" };
  System_Gray        = [HEX]@{ h = "#808080" };
  System_DarkGray    = [HEX]@{ h = "#A9A9A9" };
  System_Blue        = [HEX]@{ h = "#0000FF" };
  System_Green       = [HEX]@{ h = "#008000" };
  System_Cyan        = [HEX]@{ h = "#00FFFF" };
  System_Red         = [HEX]@{ h = "#FF0000" };
  System_Magenta     = [HEX]@{ h = "#FF00FF" };
  System_Yellow      = [HEX]@{ h = "#FFFF00" };
  System_White       = [HEX]@{ h = "#FFFFFF" };
  # Colornames are taken from https://www.color-blindness.com/color-name-hue/
  # Hex-codes can visualize the corresponding color in VS-Code with this extention: https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
  # Pride-specific codes
  PrideWhite         = [HEX]@{ h = "#FFFFFF" };
  PridePink          = [HEX]@{ h = "#FFAFC7" };
  PrideCyan          = [HEX]@{ h = "#73D7EE" };
  PrideBrown         = [HEX]@{ h = "#613915" };
  PrideBlack         = [HEX]@{ h = "#000000" };
  PrideRed           = [HEX]@{ h = "#E50000" };
  PrideOrange        = [HEX]@{ h = "#FF8D00" };
  PrideYellow        = [HEX]@{ h = "#FFEE00" };
  PrideGreen         = [HEX]@{ h = "#028121" };
  PrideBlue          = [HEX]@{ h = "#004CFF" };
  PridePurple        = [HEX]@{ h = "#730088" };
}


function dad { 
  if ($PSVersionTable.PSVersion.Major -eq 7) {
    dad_PowerShell7
  }
  else {
    dad_PowerShell5
  }

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


function ansiColors_all {
  Param ([switch]$Background)

  If ($Background) { $X = 48 }
  Else { $X = 38 }
  $esc = $global:COLOR_ESCAPE

  $ansiFormat = "$esc[$X;5;{0}m{1}$esc[0m"

  0..255 | ForEach-Object {
    $sample = "{0, 4}" -f $_
    $text = $ansiFormat -f $_, $sample
    # $text = $colorFormat -f $_, "TEST "

    Write-Host $text -NoNewline
    If ( ($_ - 15) % 36 -eq 0 ) { Write-Host "" }
  }
}
addToList -name 'ansiColors_all' -value 'See all available ansi-colors'


function rgbColors_all {
  Param ([switch]$Background)

  If ($Background) { $X = 48 }
  Else { $X = 38 }
  $esc = $global:COLOR_ESCAPE

  $rs = 0..255
  $gs = 0..255
  $bs = 0..255
  $rgbFormat = "$esc[$X;2;{0};{1};{2}m{3}$esc[0m"

  for ($r = 0; $r -lt $rs.Count; $r += 15) {
    for ($g = 0; $g -lt $gs.Count; $g += 15) {
      for ($b = 0; $b -lt $bs.Count; $b += 15) {
        $sample = "#"
        $text = $rgbFormat -f $r, $g, $b, $sample
        # $text = $colorFormat -f $_, "TEST "
    
        Write-Host $text -NoNewline
        If ( ($b + 1) % 256 -eq 0 ) { Write-Host "" }
      }
      If ( ($g + 1) % 256 -eq 0 ) { Write-Host "" }
    }
  }
}
addToList -name 'rgbColors_all' -value 'See all available RGB-colors'


function rgbColors {
  $sample = " " * 15
 
  foreach ($hex in $HEXs.GetEnumerator()) {
    $rgb = Convert-HexToRgb $hex
    $colorName = "{0, 20} " -f $rgb.Name
    $color = $rgb.Value
    $rgbValue = " RGB: {0, 3} , {1, 3} , {2, 3}" -f $color.r, $color.g, $color.b
    OUT $colorName, $sample, $color, $True, $rgbValue
  }
}
addToList -name 'rgbColors' -value 'See implemented RGB-colors'




class PrintElement { [string]$text; [RGB]$color; [switch]$background; } 

function getPrintableRGBs {
  param( [Parameter(Mandatory)][Object[]]$printElements )
  $PrintableRGBs = @()
  foreach ($element in $printElements) {
    If ( $element.GetType() -eq [string] ) { $PrintableRGBs += [PrintElement]@{ text = $element } }
    If ( $element.GetType() -eq [RGB] ) { ($PrintableRGBs[-1]).color = $element }
    If ( $element.GetType() -eq [HEX] ) { ($PrintableRGBs[-1]).color = Convert-HexToRgb $element }
    If ( $element.GetType() -eq [bool] ) { ($PrintableRGBs[-1]).background = $element }
  }
  Return $PrintableRGBs
}


function OUT {
  param( 
    [Parameter(Mandatory)][Object[]]$printElements,
    [switch]$NoNewline = $False,
    [switch]$NoNewlineStart = $False
  )

  $PrintableRGBs = getPrintableRGBs $printElements
  $sb = new-object -TypeName System.Text.StringBuilder
  if (-Not $NoNewlineStart) {
    $sb.Append("`n") > $null
  }
  
  Foreach ($element in $PrintableRGBs) {
    If ($null -eq $element.color) { $sb.AppendFormat( "{0}", $element.text ) > $null }
    Else { $sb.AppendFormat( "{0}", (getRGBFormattedString $element) ) > $null }
  }

  if ($NoNewline) {
    Write-Host $sb.ToString() -NoNewline
  }
  else {
    Write-Host $sb.ToString()
  }
}


function getRGBFormattedString {
  param( [Parameter(Mandatory)][PrintElement]$element )

  If ($element.background) { $X = 48 }
  Else { $X = 38 }
  $esc = $global:COLOR_ESCAPE
  
  $rgbCode = "{0};{1};{2}" -f $element.color.r, $element.color.g, $element.color.b
  $startSequence = "$esc[$X;2;{0}m" -f $rgbCode
  $endSequence = "$esc[0m"
  
  if ($element.text.Length -eq 0) {
    Return ""
  }
  
  $trimmed = ($element.text).Replace("`n", "")
  
  $result = ($element.text).Replace($trimmed, $startSequence + $trimmed + $endSequence)
  
  Return $result
  # $rgbFormat = "$esc[$X;2;{0}m{1}$esc[0m"
  #  Return ($rgbFormat -f $rgbCode, $element.text)      
}



#"$([char]0x1b)[48;0x00FFFFFFm'TEST'$([char]0x1b)[0m"






# An alternative implementation of OUT
# function createPrintElement {
#   param( 
#     [Parameter(Mandatory, Position = 0)][string]$text, 
#     [Parameter(Position = 1)][RGB]$color, 
#     [Parameter(Position = 2)][switch]$background 
#   )
#   Return [PrintElement]@{ text = $text ; color = $color ; background = $background }
# }
# Set-Alias pe createPrintElement
# 
# function OUT {
#   param( [Parameter(Mandatory)][PrintElement[]]$printElements )
#   foreach ($el in $printElements) { Write-Host "Testing: " $el.text }
# }
# 
# OUT (pe "Y" $HEXs.ElectricIndigo), (pe "T" $HEXs.ElectricIndigo -b) 




function Convert-HexToRgb {
  param( [Parameter(Mandatory)][HEX]$hexObject )
  $hex = $hexObject.h -replace '#', '' # Remove the '#' from the string

  $Red = $HEX.Remove(2, 4)
  $Green = $HEX.Remove(4, 2)
  $Green = $Green.remove(0, 2)
  $Blue = $hex.Remove(0, 4)
  $Red = [convert]::ToInt32($red, 16)
  $Green = [convert]::ToInt32($green, 16)
  $Blue = [convert]::ToInt32($blue, 16)

  Return [RGB]@{ r = $Red ; g = $Green ; b = $Blue }
}


function Convert-HexToRgb_Strings {
  param( [Parameter(Mandatory)][String]$hex )
  $hex = $hex -replace '#', '' # Remove the '#' from the string

  $Red = $HEX.Remove(2, 4)
  $Green = $HEX.Remove(4, 2)
  $Green = $Green.remove(0, 2)
  $Blue = $hex.Remove(0, 4)
  $Red = [convert]::ToInt32($red, 16)
  $Green = [convert]::ToInt32($green, 16)
  $Blue = [convert]::ToInt32($blue, 16)

  $rgbCode = "{0};{1};{2}" -f $red, $green, $blue

  Return $rgbCode
}
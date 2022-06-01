
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
$global:RGBs = @{
  # Light colors
  Red            = [RGB]@{ r = 255 ; g = 0   ; b = 0 } ; #FF0000 
  Orange         = [RGB]@{ r = 255 ; g = 128 ; b = 0 } ; #FF8000 
  Yellow         = [RGB]@{ r = 255 ; g = 255 ; b = 0 } ; #FFFF00 
  Chartreuse     = [RGB]@{ r = 128 ; g = 255 ; b = 0 } ; #80FF00 
  Lime           = [RGB]@{ r = 0   ; g = 255 ; b = 0 } ; #00FF00 
  SpringGreen    = [RGB]@{ r = 0   ; g = 255 ; b = 128 } ; #00FF80 
  Cyan           = [RGB]@{ r = 0   ; g = 255 ; b = 255 } ; #00FFFF 
  DodgerBlue     = [RGB]@{ r = 0   ; g = 128 ; b = 255 } ; #0080FF 
  Blue           = [RGB]@{ r = 0   ; g = 0   ; b = 255 } ; #0000FF 
  ElectricIndigo = [RGB]@{ r = 128 ; g = 0   ; b = 255 } ; #8000FF 
  Magenta        = [RGB]@{ r = 255 ; g = 0   ; b = 255 } ; #FF00FF 
  DeepPink       = [RGB]@{ r = 255 ; g = 0   ; b = 128 } ; #FF0080 
  MonaLisa       = [RGB]@{ r = 255 ; g = 128 ; b = 128 } ; #FF8080 
  MintGreen      = [RGB]@{ r = 128 ; g = 255 ; b = 128 } ; #80FF80 
  LightSlateBlue = [RGB]@{ r = 128 ; g = 128 ; b = 255 } ; #8080FF 
  # Dark colors
  Maroon         = [RGB]@{ r = 128 ; g = 0   ; b = 0 } ; #800000 
  Olive          = [RGB]@{ r = 128 ; g = 128 ; b = 0 } ; #808000 
  Green          = [RGB]@{ r = 0   ; g = 128 ; b = 0 } ; #008000 
  Teal           = [RGB]@{ r = 0   ; g = 128 ; b = 128 } ; #008080 
  Navy           = [RGB]@{ r = 0   ; g = 0   ; b = 128 } ; #000080 
  Purple         = [RGB]@{ r = 128 ; g = 0   ; b = 128 } ; #800080 
  # Contrasts
  White          = [RGB]@{ r = 255 ; g = 255 ; b = 255 } ; #FFFFFF 
  Silver         = [RGB]@{ r = 192 ; g = 192 ; b = 192 } ; #C0C0C0 
  Gray           = [RGB]@{ r = 128 ; g = 128 ; b = 128 } ; #808080 
  Black          = [RGB]@{ r = 0   ; g = 0   ; b = 0 } ; #000000 
  # Colornames are taken from https://www.color-blindness.com/color-name-hue/
  # Hex-codes can visualize the corresponding color in VS-Code with this extention: https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
}


function dad { 
  $dadContent = Invoke-WebRequest https://icanhazdadjoke.com/
  $dadJoke = ($dadContent.AllElements | Where-Object { $_.Class -eq "subtitle" }).innerText
  OUT "`n$dadJoke`n", $RGBs.Cyan
}
addToList -name 'dad' -value 'Print random dad-joke'


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
    "`n" 
    
    for ( $n = 0; $n -lt $LoopCount; $n++ ) {
      for ( $i = 0; $i -lt $frames.count; $i++ ) {
        Write-Host -ForegroundColor Cyan "`r`t$($frames[$i])" -NoNewline
        Start-Sleep -Milliseconds $frameDelay
      }
    }
  }
  finally {
    (Get-Host).UI.RawUI.cursorsize = $cursorSave
    "`n`n"
  }
}
addToList -name 'dance' -value 'See the PowerShell DanceSquad'


function rainbow {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = " " * $windowWidth
  OUT "`n", $spaceLength, $RGBs.Red, $True,
      "`n", $spaceLength, $RGBs.Orange, $True,
      "`n", $spaceLength, $RGBs.Yellow, $True,
      "`n", $spaceLength, $RGBs.Green, $True,
      "`n", $spaceLength, $RGBs.Blue, $True,
      "`n", $spaceLength, $RGBs.ElectricIndigo, $True, "`n"
}


function rainbow2 {
  OUT "   ", $RGBs.Red, $True,
      "   ", $RGBs.Orange, $True,
      "   ", $RGBs.Yellow, $True,
      "   ", $RGBs.Green, $True,
      "   ", $RGBs.Blue, $True,
      "   ", $RGBs.ElectricIndigo, $True
}


function trans {
  $spaceLength = " " * 15
  OUT "`n", $spaceLength, $RGBs.Cyan, $True,
      "`n", $spaceLength, $RGBs.Magenta, $True,
      "`n", $spaceLength, $RGBs.White, $True,
      "`n", $spaceLength, $RGBs.Magenta, $True,
      "`n", $spaceLength, $RGBs.Cyan, $True, "`n"
}


function ansiColors_all {
  Param ([switch]$Background)

  If ($Background) { $X = 48 }
  Else { $X = 38 }

  If ($iscoreclr) { $esc = "`e" } # For PS version > 7
  Else { $esc = $([char]0x1b) }   # For PS version < 7

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

  If ($iscoreclr) { $esc = "`e" } # For PS version > 7
  Else { $esc = $([char]0x1b) }   # For PS version < 7

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
 
  foreach ($rgb in $RGBs.GetEnumerator()) {
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
    If ( $element.GetType() -eq [string] ) {$PrintableRGBs += [PrintElement]@{ text = $element}}
    If ( $element.GetType() -eq [RGB] ) {($PrintableRGBs[-1]).color = $element}
    If ( $element.GetType() -eq [bool] ) {($PrintableRGBs[-1]).background = $element }
  }
  Return $PrintableRGBs
}


function OUT {
  param( [Parameter(Mandatory)][Object[]]$printElements )

  $PrintableRGBs = getPrintableRGBs $printElements
  $sb = new-object -TypeName System.Text.StringBuilder
  
  Foreach ($element in $PrintableRGBs) {
    If ($null -eq $element.color) { $sb.AppendFormat( "{0}", $element.text ) > $null }
    Else { $sb.AppendFormat( "{0}", (getRGBFormattedString $element) ) > $null }
  }

  Write-Host $sb.ToString()
}


function getRGBFormattedString {
  param( [Parameter(Mandatory)][PrintElement]$element )

  If ($element.background) { $X = 48 }
  Else { $X = 38 }

  If ($iscoreclr) { $esc = "`e" } # For PS version > 7
  Else { $esc = $([char]0x1b) }   # For PS version < 7

  $rgbCode = "{0};{1};{2}" -f $element.color.r, $element.color.g, $element.color.b
  $rgbFormat = "$esc[$X;2;{0}m{1}$esc[0m"
 
  Return ($rgbFormat -f $rgbCode, $element.text)      
}









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
# OUT (pe "Y" $RGBs.ElectricIndigo), (pe "T" $RGBs.ElectricIndigo -b) 
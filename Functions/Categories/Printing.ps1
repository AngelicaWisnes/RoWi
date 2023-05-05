
##############################
# Printing-related functions #
##############################

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


function dad { 
  If ($PSVersionTable.PSVersion.Major -eq 7) { dad_PowerShell7 }
  Else { dad_PowerShell5 }
}
addToList -category "Printing" -name 'dad' -value 'Print random dad-joke'


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
addToList -category "Printing" -name 'dance' -value 'See the PowerShell DanceSquad'


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
addToList -category "Printing" -name 'allAnsi' -value 'See all available ansi-colors'


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
addToList -category "Printing" -name 'allRgb' -value 'See all available RGB-colors'


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
addToList -category "Printing" -name 'implColors' -value 'See implemented RGB-colors'



class RGB { [int]$r; [int]$g; [int]$b; } 

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

# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()

######################
###      SETUP     ###
######################
Clear-Host

$global:ROWI = $PSScriptRoot
. $global:ROWI\Setup\Setup.ps1

# Set start-path for PS-profile-reload. For a different start path, set the `$startPath variable in function 'rr'. 
# It is recommended to set $startPath to 'Get-Location'.
If ($startPath) { Push-Location $startPath }
Else { Push-Location $global:DEFAULT_START_PATH }


############################
###      AFTER SETUP     ###
############################

PRINT_LOGO
PRINT_FUNCTION_LIST_GENERATOR_INFO
PRINT_UPGRADER_INFO
dad


############################

function t {
  Write-Host -ForegroundColor Red "This is a function-name available for testing scripts in the profile. It is not currently in use."
}




function dance {
  $frames = @( "(>'-')>" , "^('-')^" , "<('-'<)" , "^('-')^" )
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

function rainbow {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  Write-Host -BackgroundColor DarkRed (" " * $windowWidth)
  Write-Host -BackgroundColor Red (" " * $windowWidth)
  Write-Host -BackgroundColor Yellow (" " * $windowWidth)
  Write-Host -BackgroundColor Green (" " * $windowWidth)
  Write-Host -BackgroundColor Cyan (" " * $windowWidth)
  Write-Host -BackgroundColor Blue (" " * $windowWidth)
  Write-Host -BackgroundColor Magenta (" " * $windowWidth)
}

function rainbow2 {
  Write-Host -BackgroundColor DarkRed "   " -NoNewline
  Write-Host -BackgroundColor Red "   " -NoNewline
  Write-Host -BackgroundColor Yellow "   " -NoNewline
  Write-Host -BackgroundColor Green "   " -NoNewline
  Write-Host -BackgroundColor Cyan "   " -NoNewline
  Write-Host -BackgroundColor Blue "   " -NoNewline
  Write-Host -BackgroundColor Magenta "   " -NoNewline
}

function trans {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  Write-Host ""
  Write-Host -BackgroundColor Cyan (" " * $windowWidth)
  Write-Host -BackgroundColor Magenta (" " * $windowWidth)
  Write-Host -BackgroundColor White (" " * $windowWidth)
  Write-Host -BackgroundColor Magenta (" " * $windowWidth)
  Write-Host -BackgroundColor Cyan (" " * $windowWidth)
  Write-Host ""
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

  # Example formatting:
  # $([char]0x1b)[38;5;252m'Sample Text'$([char]0x1b)[0m

  # Breakdown of the formatting:
  # $([char]0x1b) [ 38 ;5; 252 m 'Sample Text' $([char]0x1b) [0m
  # AAAAAAAAAAAAA B XX BBB YYY B ZZZZZZZZZZZZZ AAAAAAAAAAAAA CCC

  # Where:
  # A, B, C = Constants
  # X = 48 for background-color, or 38 for foregrount-color
  # Y = The color-value (between 0 and 255)
  # Z = The text that should be colored
}

function rgbColors_all {
  Param ([switch]$Background)

  If ($Background) { $X = 48 }
  Else { $X = 38 }

  If ($iscoreclr) { $esc = "`e" } # For PS version > 7
  Else { $esc = $([char]0x1b) }   # For PS version < 7

  # Each of R, G and B have a value between 0 and 255
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

  # Example formatting:
  # $([char]0x1b)[38;5;66;245;138m'Sample Text'$([char]0x1b)[0m

  # Breakdown of the formatting:
  # $([char]0x1b) [ 38 ;2; 66 ; 245 ; 138 m 'Sample Text' $([char]0x1b) [0m
  # 1111111111111 2 XX 222 RR 2 GGG 2 BBB 2 YYYYYYYYYYYYY 1111111111111 333

  # Where:
  # 1, 2, 3 = Constants
  # X = 48 for background-color, or 38 for foregrount-color
  # Y = The text that should be colored
  # R, G, B = The color-values for RGB
}


class RGB { [int]$r; [int]$g; [int]$b; } 
$mainRGBs = @{
  # Light colors
  Red            = @{ r = 255 ; g = 0   ; b = 0 } ; #FF0000 
  Orange         = @{ r = 255 ; g = 128 ; b = 0 } ; #FF8000 
  Yellow         = @{ r = 255 ; g = 255 ; b = 0 } ; #FFFF00 
  Chartreuse     = @{ r = 128 ; g = 255 ; b = 0 } ; #80FF00 
  Lime           = @{ r = 0   ; g = 255 ; b = 0 } ; #00FF00 
  SpringGreen    = @{ r = 0   ; g = 255 ; b = 128 } ; #00FF80 
  Cyan           = @{ r = 0   ; g = 255 ; b = 255 } ; #00FFFF 
  DodgerBlue     = @{ r = 0   ; g = 128 ; b = 255 } ; #0080FF 
  Blue           = @{ r = 0   ; g = 0   ; b = 255 } ; #0000FF 
  ElectricIndigo = @{ r = 128 ; g = 0   ; b = 255 } ; #8000FF 
  Magenta        = @{ r = 255 ; g = 0   ; b = 255 } ; #FF00FF 
  DeepPink       = @{ r = 255 ; g = 0   ; b = 128 } ; #FF0080 
  MonaLisa       = @{ r = 255 ; g = 128 ; b = 128 } ; #FF8080 
  MintGreen      = @{ r = 128 ; g = 255 ; b = 128 } ; #80FF80 
  LightSlateBlue = @{ r = 128 ; g = 128 ; b = 255 } ; #8080FF 
  # Dark colors
  Maroon         = @{ r = 128 ; g = 0   ; b = 0 } ; #800000 
  Olive          = @{ r = 128 ; g = 128 ; b = 0 } ; #808000 
  Green          = @{ r = 0   ; g = 128 ; b = 0 } ; #008000 
  Teal           = @{ r = 0   ; g = 128 ; b = 128 } ; #008080 
  Navy           = @{ r = 0   ; g = 0   ; b = 128 } ; #000080 
  Purple         = @{ r = 128 ; g = 0   ; b = 128 } ; #800080 
  # Contrasts
  White          = @{ r = 0   ; g = 0   ; b = 0 } ; #FFFFFF 
  Silver         = @{ r = 192 ; g = 192 ; b = 192 } ; #C0C0C0 
  Gray           = @{ r = 128 ; g = 128 ; b = 128 } ; #808080 
  Black          = @{ r = 255 ; g = 255 ; b = 255 } ; #000000 
  # Colornames are taken from https://www.color-blindness.com/color-name-hue/
  # Hex-codes can visualize the corresponding color in VS-Code with this extention: https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
}

function rgbColor {
  Param ([switch]$Background)

  If ($Background) { $X = 48 }
  Else { $X = 38 }

  If ($iscoreclr) { $esc = "`e" } # For PS version > 7
  Else { $esc = $([char]0x1b) }   # For PS version < 7

  $rgbFormat = "$esc[$X;2;{0};{1};{2}m{3}$esc[0m"
  $sample = "#" + (" " * 25)
 
  foreach ($rgb in $mainRGBs.Values) {
    $text = $rgbFormat -f $rgb.r, $rgb.g, $rgb.b, $sample
      
    Write-Host $text
  }
}

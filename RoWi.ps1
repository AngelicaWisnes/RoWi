
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

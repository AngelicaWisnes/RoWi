
$logoRoot = $PSScriptRoot
$rw_logo = "$logoRoot\Images\RW_LOGO.png"
$rw_image = "$logoRoot\Images\RW_IMAGE.png"
$rw_logo_150 = "
                                                                                                                                         ############
                                                                                                                                    #################
                                                                                                                                 ##########          
                           #########################          #############                           ##                     #########               
                      ##################################  ###################                       #####                 ########                   
                   ###########                     ############          ######                   ######                #######                      
               ##########                           #########              #####                #######              #######                         
             ########                             ############              #####              #######             ######                            
           ########      ##########             #####    ######             ######           ########            ######                              
         #######     ################         ######      #####             ######         #########           ######                                
       ########    #########      ####      ######        #####             #######       #########          ######                                  
      #######    ########          ###     ######        ######             #######     ##########         ######                                    
     ######    #######            ####   #######        #######             ######     ###########        #####                                      
    ######    ######              ###   ######        ########             #######   ############       #####                                        
    #####    ######              ####  #####################              #######   ############      #####                                          
   #####     ####              #####  ####################               ######## #####  #######    ######                                           
   #####     ###             #####  ######## #######                     ####### #####  #######    #####                                             
   #####     ####          ######  ########    #####                    ############   ########  #####                                               
    ####     ######      ######   #######      #####                   ############    ####### ######                                                
     #####    ####    #######   ########       #####                  ###########     ####### #####                                                  
       ######       ########   ########       ######                 ###########     #############                                                   
  #####   ##############     #########        ######                ##########      ############                                                     
 #######   #########       ##########        ######               ##########       ###########                                                       
 ########                ##########          ######              #########         #########                                                         
 #######               ##########            #####              #########         ########                                                           
 #####             ###########                ####            #########          ########                                                            
  ########### #############                   ####     ##    #######            #######                                                              
     ################                          ##########  #######            ######                                                                 
                                                 ######  #######            ######                                                                   
                                                         ####               ####                                                                     
" 



function Convert-ImageToAsciiArt {
  param(
    [Parameter(Mandatory)][String]
    $Path,
    [bool]$BinaryPixelated = $false
  )

  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $windowHeight = $Host.UI.RawUI.WindowSize.Height - 1
  $charHeightWidthRatio = 2#1.5
  $characters = (& { If ($BinaryPixelated) { '# ' } Else { '$#H&@*+;:-,. ' } }).ToCharArray() # Characters from dark to light  
  $c = $characters.count 
  
  
  Add-Type -AssemblyName System.Drawing # Load drawing functionality
  $image = [Drawing.Image]::FromFile($path) # Load image
  $maxheight = $image.Height / ($image.Width / $windowWidth) / $charHeightWidthRatio # Get image size

  # Make sure the output fits inside the window
  If ($windowHeight -lt $maxheight) {
    $sizeRatio = $windowHeight / $maxheight
    $windowWidth = $windowWidth * $sizeRatio
    $maxheight = $maxheight * $sizeRatio
  }

  $bitmap = new-object Drawing.Bitmap($image , $windowWidth, $maxheight) # Paint image on a bitmap with the desired size
  
  # Use a string builder to store the characters
  [System.Text.StringBuilder]$sb = ""
  $null = $sb.AppendLine() # Add a new line

  # Take each pixel line...
  for ($y = 0; $y -lt $bitmap.Height; $y++) {
    # Take each pixel column...
    for ($x = 0; $x -lt $bitmap.Width; $x++) {
      # Examine pixel
      $color = $bitmap.GetPixel($x, $y)
      $brightness = $color.GetBrightness()

      # Choose the character that best matches the pixel brightness
      $offset = [Math]::Floor($brightness * $c)
      $ch = $characters[$offset]
      If (-not $ch) { $ch = $characters[-1] }
      
      $null = $sb.Append($ch) # Add character to line
    }
    $null = $sb.AppendLine() # Add a new line
  }

  $image.Dispose() # Clean up before returning string
  Return $sb.ToString()
} 

function PRINT_LOGO {
  If ( (Get-Date -Format MM) -eq "06" ) { PRINT_LOGO_RAINBOW }
  Else { PRINT_LOGO_STANDARD }
}

function PRINT_LOGO_STANDARD {
  $logoExists = Test-Path -Path $rw_logo -PathType Leaf
  If ($logoExists) { $logo = Convert-ImageToAsciiArt -Path $rw_logo -BinaryPixelated $true }
  Else { $logo = $rw_logo_150 }
  Write-Host -ForegroundColor Red $logo
}

function PRINT_LOGO_RAINBOW {
  $logoExists = Test-Path -Path $rw_logo -PathType Leaf
  If ($logoExists) { $logo = Convert-ImageToAsciiArt -Path $rw_logo -BinaryPixelated $true }
  Else { $logo = $rw_logo_150 }

  $logoLines = $logo.Split("`n")
  $colors = @( "DarkRed", "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta" )
  $colorCount = -1
  $linesOfEachColor = [int]($logoLines.Count / $colors.Count)

  for ($i = 0; $i -lt $logoLines.Count; $i++) {
    If ($i % $linesOfEachColor -eq 0) { $colorCount++ }
    Write-Host -ForegroundColor $colors[$colorCount] $logoLines[$i]
  }

}

function PRINT_IMAGE {
  $logoExists = Test-Path -Path $rw_image -PathType Leaf
  If ($logoExists) { $image = Convert-ImageToAsciiArt -Path $rw_image }
  Else { $image = "Could not print RW, as the image is missing" }
  Write-Host -ForegroundColor Red $image
}

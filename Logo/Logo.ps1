
$logoRoot = $PSScriptRoot
$rw_logo = "$logoRoot\Images\RW_LOGO.png" | Resolve-Path
$rw_logo_text = "$logoRoot\Images\RW_LOGO_TEXT.txt" | Resolve-Path
$rw_image = "$logoRoot\Images\RW_IMAGE.png" | Resolve-Path
$rw_image_text = "$logoRoot\Images\RW_IMAGE_TEXT.txt" | Resolve-Path
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
    [Parameter(Mandatory)][String] $Path,
    [bool]$BinaryPixelated = $false
  )
  
  Add-Type -AssemblyName System.Drawing # Load drawing functionality
  $image = [Drawing.Image]::FromFile($path) # Load image
  $characters = (& { If ($BinaryPixelated) { '# ' } Else { '$#H&@*+;:-,. ' } }).ToCharArray() # Characters from dark to light  
  $c = $characters.count 
  
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $windowHeight = $Host.UI.RawUI.WindowSize.Height - 10
  $charHeightWidthRatio = 2#1.5
  
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


function Resize-AsciiArt {
  param([Parameter(Mandatory)][String] $Path)

  [string[]]$imageArrayFromFile = Get-Content -Path $Path
  
  $inputImageWidth = $imageArrayFromFile[0].Length
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $minScaleWidth = $windowWidth / $inputImageWidth

  $inputImageHeight = $imageArrayFromFile.Length 
  $windowHeight = $Host.UI.RawUI.WindowSize.Height - 10
  $minScaleHeight = $windowHeight / $inputImageHeight

  $minOutputScale = [Math]::Min($minScaleWidth, $minScaleHeight)
  $outputWidth = [Math]::Floor($inputImageWidth * $minOutputScale)
  $outputHeight = [Math]::Floor($inputImageHeight * $minOutputScale)
  
  $outputImageArray = [string[]]::new($outputHeight)
  
  # Nearest-neighbor interpolation
  for ($y = 0; $y -lt $outputHeight; $y++) {
    $nearestY = [Math]::Floor($y / $minOutputScale)
    $line = $imageArrayFromFile[$nearestY]
    
    for ($x = 0; $x -lt $outputWidth; $x++) {
      $nearestX = [Math]::Floor($x / $minOutputScale)
      $pixel = $line.Substring($nearestX, 1)
      $outputImageArray[$y] += $pixel
    }
  }

  Return $outputImageArray
} 


function Get-Logo {
  Switch (Get-Date -Format MM) {
    "06" { Get-LogoRainbowRGB }
    "11" { Get-LogoTransRGB }
    default { Write-Host -ForegroundColor Red $(Get-LogoAsString) }
  }
  Get-RainbowSlimLine 
  Get-TransSlimLine -NoNewlineStart
  Write-Host
}

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

function Get-LogoRainbowRGB {
  $outputString = Get-LogoAsString
  $lines = $outputString.Split("`n")
  $colors = @( $HEXs.PrideRed, $HEXs.PrideOrange, $HEXs.PrideYellow, $HEXs.PrideGreen, $HEXs.PrideBlue, $HEXs.PridePurple )
  $colorNumber = -1
  $linesOfEachColor = [int]($lines.Count / $colors.Count)

  for ($i = 0; $i -lt $lines.Count; $i++) {
    If ($i % $linesOfEachColor -eq 0 -and $colorNumber -lt ($colors.Count - 1)) { $colorNumber++ }
    OUT $lines[$i], $colors[$colorNumber] -NoNewlineStart
  }
}

function Get-LogoTransRGB {
  $outputString = Get-LogoAsString
  $lines = $outputString.Split("`n")
  $colors = @( $HEXs.PrideCyan, $HEXs.PridePink, $HEXs.PrideWhite, $HEXs.PridePink, $HEXs.PrideCyan )

  $colorNumber = -1
  $linesOfEachColor = [int]($lines.Count / $colors.Count)

  for ($i = 0; $i -lt $lines.Count; $i++) {
    If ($i % $linesOfEachColor -eq 0 -and $colorNumber -lt ($colors.Count - 1)) { $colorNumber++ }
    OUT $lines[$i], $colors[$colorNumber] -NoNewlineStart
  }
}

function Get-Selfie {
  $imageExists = Test-Path -Path $rw_image -PathType Leaf
  $imageTextExists = Test-Path -Path $rw_image_text -PathType Leaf

  If ($global:SYSTEM_OS.Contains('Windows') -AND $imageExists) { 
    $image = Convert-ImageToAsciiArt -Path $rw_image 
  }
  Elseif ($imageTextExists) { Return Resize-AsciiArt -Path $rw_image_text }
  Else { $image = "Could not print RW, as the image is missing" }
  Write-Host -ForegroundColor Red $image
}

function Get-LogoAsString {
  $logoImageExists = Test-Path -Path $rw_logo -PathType Leaf
  $logoTextExists = Test-Path -Path $rw_logo_text -PathType Leaf

  If ($global:SYSTEM_OS.Contains('Windows') -AND $logoImageExists) { 
    Return Convert-ImageToAsciiArt -Path $rw_logo -BinaryPixelated $true
  }
  Elseif ($logoTextExists) { Return Resize-AsciiArt -Path $rw_logo_text }
  Else { Return $rw_logo_150 }  
}

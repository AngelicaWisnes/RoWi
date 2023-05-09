
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
  $imageFromFile = [Drawing.Image]::FromFile($path) 
  $characters = (& { If ($BinaryPixelated) { '# ' } Else { '$#H&@*+;:-,. ' } }).ToCharArray() # Characters from dark to light  
  $charCount = $characters.count 
    
  $inputImageWidth = $imageFromFile.Width
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $minScaleWidth = $windowWidth / $inputImageWidth
  
  $charHeightWidthRatio = 2 # A pixel has a H/W-ratio of 1/1, while a char has a H/W-ratio of 2/1
  $inputImageHeight = $imageFromFile.Height / $charHeightWidthRatio
  $windowHeight = $Host.UI.RawUI.WindowSize.Height - 10
  $minScaleHeight = $windowHeight / $inputImageHeight

  $minOutputScale = [Math]::Min($minScaleWidth, $minScaleHeight)
  $outputWidth = [Math]::Floor($inputImageWidth * $minOutputScale)
  $outputHeight = [Math]::Floor($inputImageHeight * $minOutputScale)

  $bitmap = new-object Drawing.Bitmap($imageFromFile , $outputWidth, $outputHeight) 
  
  [System.Text.StringBuilder]$sb = ""
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
  
  $inputImageWidth = $imageArrayFromFile[0].Length
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $minScaleWidth = $windowWidth / $inputImageWidth

  $inputImageHeight = $imageArrayFromFile.Length 
  $windowHeight = $Host.UI.RawUI.WindowSize.Height - 10
  $minScaleHeight = $windowHeight / $inputImageHeight

  $minOutputScale = [Math]::Min($minScaleWidth, $minScaleHeight)
  $outputWidth = [Math]::Floor($inputImageWidth * $minOutputScale)
  $outputHeight = [Math]::Floor($inputImageHeight * $minOutputScale)
  
  [System.Text.StringBuilder]$sb = ""
  $null = $sb.AppendLine()
  
  # Nearest-neighbor interpolation
  for ($y = 0; $y -lt $outputHeight; $y++) {
    $nearestY = [Math]::Floor($y / $minOutputScale)
    $line = $imageArrayFromFile[$nearestY]
  
    for ($x = 0; $x -lt $outputWidth; $x++) {
      $nearestX = [Math]::Floor($x / $minOutputScale)
      $pixel = $line.Substring($nearestX, 1)
      $null = $sb.Append($pixel)
    }
    $null = $sb.AppendLine()
  }

  Return $sb.ToString()
} 


function Get-Logo {
  switch -Regex (Get-Date -Format "dd.MM") {
    "23.01" { Get-LogoRGB -colorChartString "norway"; Break }    # Birthday
    "24.01" { Get-LogoRGB -colorChartString "norway"; Break }    # Birthday
    "09.04" { Get-LogoRGB -colorChartString "norway"; Break }    # Birthday
    "31.03" { Get-LogoRGB -colorChartString "trans"; Break }     # International Transgender Day Of Visibility
    ".*.06" { Get-LogoRGB -colorChartString "rainbow"; Break }   # Pride Month
    ".*.05" { Get-LogoRGB -colorChartString "norway"; Break }    # Norwegian National Day (May 17th)
    ".*.07" { Get-LogoRGB -colorChartString "nonbinary"; Break } # Nonbinary Awareness Week (approx. 14th)
    ".*.09" { Get-LogoRGB -colorChartString "bisexual"; Break }  # Bisexual Awareness Week (approx. 16th-23rd)
    ".*.11" { Get-LogoRGB -colorChartString "trans"; Break }     # Trans Awareness Month
    default { Write-Host -ForegroundColor Red $(Get-LogoAsString); Break }
  }
  Get-RainbowSlimLine
  Get-TransSlimLine -NoNewlineStart
  Write-Host
}
Add-ToFunctionList -category "Other" -name 'Get-Logo' -value 'Get RW-Logo'

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
  param( [Parameter(Mandatory)][string]$colorChartString )
  $outputString = Get-LogoAsString
  $lines = $outputString.Split("`n")
  $colorNumber = -1
  $colors = $global:colorChart[$colorChartString]
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
Add-ToFunctionList -category "Other" -name 'Get-Selfie' -value 'Get selfie'


function Get-LogoAsString {
  $logoImageExists = Test-Path -Path $rw_logo -PathType Leaf
  $logoTextExists = Test-Path -Path $rw_logo_text -PathType Leaf

  If ($global:SYSTEM_OS.Contains('Windows') -AND $logoImageExists) { 
    Return Convert-ImageToAsciiArt -Path $rw_logo -BinaryPixelated $true
  }
  Elseif ($logoTextExists) { Return Resize-AsciiArt -Path $rw_logo_text }
  Else { Return $rw_logo_150 }  
}

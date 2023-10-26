
###########################
# Pride-related functions #
###########################
function Get-RainbowLine {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = (" " * $windowWidth)
  
  OUTnew $(PE -txt:$spaceLength -bg:$colors.PrideRed), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PrideOrange), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PrideYellow), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PrideGreen), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PrideBlue), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PridePurple)
}


function Get-TransLine {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = (" " * $windowWidth)
  
  OUTnew $(PE -txt:$spaceLength -bg:$colors.PrideCyan), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PridePink), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PrideWhite), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PridePink), $(PE -txt:"`n"),
  $(PE -txt:$spaceLength -bg:$colors.PrideCyan)
}


function Get-RainbowSlimLine {
  param( [switch]$NoNewlineStart = $False )

  $windowWidth = $Host.UI.RawUI.WindowSize.Width
  $spaceLength = [math]::floor($windowWidth / 6)
  $spaces = " " * $spaceLength
  $restSpaceLength = $windowWidth - ($spaceLength * 6)
  $restSpaces = " " * $restSpaceLength

  OUTnew $(PE -txt:$spaces -bg:$colors.PrideRed),
  $(PE -txt:$spaces -bg:$colors.PrideOrange),
  $(PE -txt:$spaces -bg:$colors.PrideYellow),
  $(PE -txt:$spaces -bg:$colors.PrideGreen),
  $(PE -txt:$spaces -bg:$colors.PrideBlue),
  $(PE -txt:$spaces -bg:$colors.PridePurple),
  $(PE -txt:$restSpaces -bg:$colors.PridePurple) -NoNewlineStart:$NoNewlineStart
}


function Get-TransSlimLine {
  param( [switch]$NoNewlineStart = $False )

  $windowWidth = $Host.UI.RawUI.WindowSize.Width
  $spaceLength = [math]::floor($windowWidth / 5)
  $spaces = " " * $spaceLength
  $restSpaceLength = $windowWidth - ($spaceLength * 5)
  $restSpaces = " " * $restSpaceLength

  OUTnew $(PE -txt:$spaces -bg:$colors.PrideCyan),
  $(PE -txt:$spaces -bg:$colors.PridePink),
  $(PE -txt:$spaces -bg:$colors.PrideWhite),
  $(PE -txt:$spaces -bg:$colors.PridePink),
  $(PE -txt:$spaces -bg:$colors.PrideCyan),
  $(PE -txt:$restSpaces -bg:$colors.PrideCyan) -NoNewlineStart:$NoNewlineStart
}


function Get-RainbowSlimShortLine {
  $spaceLength = "   "
  OUTnew $(PE -txt:$spaceLength -bg:$colors.PrideRed),
  $(PE -txt:$spaceLength -bg:$colors.PrideOrange),
  $(PE -txt:$spaceLength -bg:$colors.PrideYellow),
  $(PE -txt:$spaceLength -bg:$colors.PrideGreen),
  $(PE -txt:$spaceLength -bg:$colors.PrideBlue),
  $(PE -txt:$spaceLength -bg:$colors.PridePurple)
}


function Get-PrideSmall {
  OUTnew $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  $(PE -txt:"##" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  $(PE -txt:"#" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  $(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##############################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  $(PE -txt:"##" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#############################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  $(PE -txt:"##" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#############################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  $(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##############################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  $(PE -txt:"#" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  $(PE -txt:"##" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################" -fg:$colors.PridePurple)
}


function Get-PrideMedium { 
  OUTnew <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#############################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"##" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"############################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###########################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"#" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##########################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#########################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#######################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"##" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"###" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#####################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"#####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"######" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"######" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"#####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"###" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#####################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"##" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#######################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#########################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"#" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##########################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###########################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"##" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"############################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#############################################################################" -fg:$colors.PridePurple)
}


function Get-PrideLarge { 
  OUTnew <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <##>$(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##################################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <##>$(PE -txt:"###" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"################################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"#####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##############################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"#######" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"############################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"#########" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##########################################################################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"###########" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"#############" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"###############" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"#################" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##################################################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"#################" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"###############" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"#############" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"###########" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"#########" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##########################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"#######" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"############################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"#####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##############################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"###" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"################################################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##################################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"####################################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################################" -fg:$colors.PridePurple)
}


function Get-PrideLogo { 
  OUTnew <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##########################################################################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################################################################" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <##>$(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#########################################################################################################       ####" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <##>$(PE -txt:"###" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"#################################################################################################              ###" -fg:$colors.PrideRed), $(PE -txt:"`n"),
  <##>$(PE -txt:"#####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###########################################################################################          ###########" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"#######" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######                      ######             ####################    ##############         ################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"#########" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"#  " -fg:$colors.PrideBlack), $(PE -txt:"         #############               ###       ################      ###########        ####################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"###########" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"## " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:"   " -fg:$colors.PrideBlack), $(PE -txt:"  #####################       ###########      ############       ##########       #######################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"#############" -fg:$colors.PrideWhite), $(PE -txt:"#  " -fg:$colors.PridePink), $(PE -txt:"   " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##################            ##########      #########        #########      ##########################" -fg:$colors.PrideOrange), $(PE -txt:"`n"),
  <##>$(PE -txt:"###########    " -fg:$colors.PrideWhite), $(PE -txt:"   " -fg:$colors.PridePink), $(PE -txt:" ##" -fg:$colors.PrideCyan), $(PE -txt:"## " -fg:$colors.PrideBrown), $(PE -txt:"   " -fg:$colors.PrideBlack), $(PE -txt:"      #########      ##      #########      #######        ########       ############################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"#########       #" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"   " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:"   " -fg:$colors.PrideBlack), $(PE -txt:"     ######      ####      #########       ####          ######       ##############################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"########      ###  " -fg:$colors.PrideWhite), $(PE -txt:"   " -fg:$colors.PridePink), $(PE -txt:"   " -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"## " -fg:$colors.PrideBlack), $(PE -txt:"    ####      #####      #########       ###          #####       ################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"#######     ####     " -fg:$colors.PrideWhite), $(PE -txt:" ##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"   " -fg:$colors.PrideBlack), $(PE -txt:"  ###     ######       ########        #            ####      ##################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"######     ###      ###" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:"  #" -fg:$colors.PrideBlack), $(PE -txt:"#      #####        #########       #            ###      ####################################" -fg:$colors.PrideYellow), $(PE -txt:"`n"),
  <##>$(PE -txt:"######    ####     ####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"## " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:" ##" -fg:$colors.PrideBlack), $(PE -txt:"                 ###########                    ##      ######################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"######     ####      " -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"## " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:" ##" -fg:$colors.PrideBlack), $(PE -txt:"#             ###############                    ##      #######################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"#######    ########" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"## " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:" ##" -fg:$colors.PrideBlack), $(PE -txt:"#       ##      ##############            #              #########################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"########     ####" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"   " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:" ##" -fg:$colors.PrideBlack), $(PE -txt:"#        ###      #############            #             ###########################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"##########     " -fg:$colors.PrideWhite), $(PE -txt:"   " -fg:$colors.PridePink), $(PE -txt:"   " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##        ###       ############           ##             ############################################" -fg:$colors.PrideGreen), $(PE -txt:"`n"),
  <##>$(PE -txt:"#############" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##         ####       ###########          ####           ##############################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"####     ##" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##         #####        ##########          ####          ################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"####     " -fg:$colors.PrideWhite), $(PE -txt:" ##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##         #######       ##########         #####         ##################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"####   " -fg:$colors.PrideWhite), $(PE -txt:"  #" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##         ##########     ##########        ######         ###################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"#####" -fg:$colors.PrideWhite), $(PE -txt:"   " -fg:$colors.PridePink), $(PE -txt:"   " -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"## " -fg:$colors.PrideBlack), $(PE -txt:"          #############     ##  ####        #######        #####################################################" -fg:$colors.PrideBlue), $(PE -txt:"`n"),
  <##>$(PE -txt:"###" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"#  " -fg:$colors.PrideCyan), $(PE -txt:"   " -fg:$colors.PrideBrown), $(PE -txt:"   " -fg:$colors.PrideBlack), $(PE -txt:"       ####################        ##       ########      ########################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <##>$(PE -txt:"#" -fg:$colors.PrideWhite), $(PE -txt:"###" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"###############################    ###     #########      ##########################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite),#> $(PE -txt:"##" -fg:$colors.PridePink), $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"######################################################################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"###" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"########################################################################################################################" -fg:$colors.PridePurple), $(PE -txt:"`n"),
  <#$(PE -txt:"" -fg:$colors.PrideWhite), $(PE -txt:"" -fg:$colors.PridePink),#> $(PE -txt:"#" -fg:$colors.PrideCyan), $(PE -txt:"###" -fg:$colors.PrideBrown), $(PE -txt:"###" -fg:$colors.PrideBlack), $(PE -txt:"##########################################################################################################################" -fg:$colors.PridePurple)
}


function Get-PrideCollection {
  Get-RainbowLine
  Get-TransLine
  Get-RainbowSlimLine
  Get-TransSlimLine
  Get-RainbowSlimShortLine
  Get-PrideSmall
  Get-PrideMedium
  Get-PrideLarge
  Get-PrideLogo
}

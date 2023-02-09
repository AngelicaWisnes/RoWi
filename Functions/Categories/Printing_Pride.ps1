
###########################
# Pride-related functions #
###########################
$global:FunctionSubList_PRINTING_PRIDE = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_PRINTING_PRIDE.Add( $FunctionSubList_BREAK )
function addToList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_PRINTING_PRIDE.Add(( [FunctionListElement]@{ category = "Pride"; name = $name; value = $value } ))
}


function Get-RainbowLine {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = (" " * $windowWidth)
  
  OUT $spaceLength, $HEXs.PrideRed, $True, "`n",
  $spaceLength, $HEXs.PrideOrange, $True, "`n",
  $spaceLength, $HEXs.PrideYellow, $True, "`n",
  $spaceLength, $HEXs.PrideGreen, $True, "`n",
  $spaceLength, $HEXs.PrideBlue, $True, "`n",
  $spaceLength, $HEXs.PridePurple, $True
}


function Get-RainbowSlimLine {
  param( [switch]$NoNewlineStart = $False )

  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = [math]::floor($windowWidth / 6)
  $spaces = " " * $spaceLength
  $restSpaceLength = $windowWidth - ($spaceLength * 6)
  $restSpaces = " " * $restSpaceLength

  OUT $spaces, $HEXs.PrideRed, $True,
  $spaces, $HEXs.PrideOrange, $True,
  $spaces, $HEXs.PrideYellow, $True,
  $spaces, $HEXs.PrideGreen, $True,
  $spaces, $HEXs.PrideBlue, $True,
  $spaces, $HEXs.PridePurple, $True,
  $restSpaces, $HEXs.PridePurple, $True -NoNewlineStart:$NoNewlineStart
}


function Get-TransSlimLine {
  param( [switch]$NoNewlineStart = $False )

  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = [math]::floor($windowWidth / 5)
  $spaces = " " * $spaceLength
  $restSpaceLength = $windowWidth - ($spaceLength * 5)
  $restSpaces = " " * $restSpaceLength

  OUT $spaces, $HEXs.PrideCyan, $True,
  $spaces, $HEXs.PridePink, $True,
  $spaces, $HEXs.PrideWhite, $True,
  $spaces, $HEXs.PridePink, $True,
  $spaces, $HEXs.PrideCyan, $True,
  $restSpaces, $HEXs.PrideCyan, $True -NoNewlineStart:$NoNewlineStart
}


function Get-RainbowSlimShortLine {
  $spaceLength = "   "
  OUT $spaceLength, $HEXs.PrideRed, $True,
  $spaceLength, $HEXs.PrideOrange, $True,
  $spaceLength, $HEXs.PrideYellow, $True,
  $spaceLength, $HEXs.PrideGreen, $True,
  $spaceLength, $HEXs.PrideBlue, $True,
  $spaceLength, $HEXs.PridePurple, $True
}


function Get-Trans {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = (" " * $windowWidth)
  
  OUT $spaceLength, $HEXs.PrideCyan, $True, "`n",
  $spaceLength, $HEXs.PridePink, $True, "`n",
  $spaceLength, $HEXs.PrideWhite, $True, "`n",
  $spaceLength, $HEXs.PridePink, $True, "`n",
  $spaceLength, $HEXs.PrideCyan, $True
}


function Get-PrideSmall {
  OUT "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################", $HEXs.PrideRed, "`n",
  "##", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###################################", $HEXs.PrideRed, "`n",
  "#", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#################################", $HEXs.PrideOrange, "`n",
  "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "################################", $HEXs.PrideOrange, "`n",
  "#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##############################", $HEXs.PrideYellow, "`n",
  "##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#############################", $HEXs.PrideYellow, "`n",
  "##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#############################", $HEXs.PrideGreen, "`n",
  "#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##############################", $HEXs.PrideGreen, "`n",
  "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "################################", $HEXs.PrideBlue, "`n",
  "#", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#################################", $HEXs.PrideBlue, "`n",
  "##", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###################################", $HEXs.PridePurple, "`n",
  "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################", $HEXs.PridePurple
}


function Get-PrideMedium { 
  OUT <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#############################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "##", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "############################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###########################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite,#> "#", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#########################################################################", $HEXs.PrideOrange, "`n",
  <#"", $HEXs.PrideWhite,#> "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################", $HEXs.PrideOrange, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#######################################################################", $HEXs.PrideOrange, "`n",
  <##>"##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################", $HEXs.PrideOrange, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#####################################################################", $HEXs.PrideYellow, "`n",
  <##>"####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################", $HEXs.PrideYellow, "`n",
  <##>"#####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###################################################################", $HEXs.PrideYellow, "`n",
  <##>"######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################", $HEXs.PrideYellow, "`n",
  <##>"######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################", $HEXs.PrideGreen, "`n",
  <##>"#####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###################################################################", $HEXs.PrideGreen, "`n",
  <##>"####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################", $HEXs.PrideGreen, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#####################################################################", $HEXs.PrideGreen, "`n",
  <##>"##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################", $HEXs.PrideBlue, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#######################################################################", $HEXs.PrideBlue, "`n",
  <#"", $HEXs.PrideWhite,#> "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################", $HEXs.PrideBlue, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#########################################################################", $HEXs.PrideBlue, "`n",
  <#"", $HEXs.PrideWhite,#> "#", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###########################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "##", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "############################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#############################################################################", $HEXs.PridePurple
}


function Get-PrideLarge { 
  OUT <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################################", $HEXs.PrideRed, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################################", $HEXs.PrideRed, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "################################################################################", $HEXs.PrideOrange, "`n",
  <##>"#####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##############################################################################", $HEXs.PrideOrange, "`n",
  <##>"#######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "############################################################################", $HEXs.PrideOrange, "`n",
  <##>"#########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################", $HEXs.PrideOrange, "`n",
  <##>"###########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################", $HEXs.PrideYellow, "`n",
  <##>"#############", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################", $HEXs.PrideYellow, "`n",
  <##>"###############", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################", $HEXs.PrideYellow, "`n",
  <##>"#################", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################", $HEXs.PrideYellow, "`n",
  <##>"#################", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################", $HEXs.PrideGreen, "`n",
  <##>"###############", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################", $HEXs.PrideGreen, "`n",
  <##>"#############", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################", $HEXs.PrideGreen, "`n",
  <##>"###########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################", $HEXs.PrideGreen, "`n",
  <##>"#########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################", $HEXs.PrideBlue, "`n",
  <##>"#######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "############################################################################", $HEXs.PrideBlue, "`n",
  <##>"#####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##############################################################################", $HEXs.PrideBlue, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "################################################################################", $HEXs.PrideBlue, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################################", $HEXs.PridePurple
}


function Get-PrideLogo { 
  OUT <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################################################################", $HEXs.PrideRed, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#########################################################################################################       ####", $HEXs.PrideRed, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#################################################################################################              ###", $HEXs.PrideRed, "`n",
  <##>"#####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###########################################################################################          ###########", $HEXs.PrideOrange, "`n",
  <##>"#######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######                      ######             ####################    ##############         ################", $HEXs.PrideOrange, "`n",
  <##>"#########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "#  ", $HEXs.PrideBlack, "         #############               ###       ################      ###########        ####################", $HEXs.PrideOrange, "`n",
  <##>"###########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "## ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, "   ", $HEXs.PrideBlack, "  #####################       ###########      ############       ##########       #######################", $HEXs.PrideOrange, "`n",
  <##>"#############", $HEXs.PrideWhite, "#  ", $HEXs.PridePink, "   ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################            ##########      #########        #########      ##########################", $HEXs.PrideOrange, "`n",
  <##>"###########    ", $HEXs.PrideWhite, "   ", $HEXs.PridePink, " ##", $HEXs.PrideCyan, "## ", $HEXs.PrideBrown, "   ", $HEXs.PrideBlack, "      #########      ##      #########      #######        ########       ############################", $HEXs.PrideYellow, "`n",
  <##>"#########       #", $HEXs.PrideWhite, "###", $HEXs.PridePink, "   ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, "   ", $HEXs.PrideBlack, "     ######      ####      #########       ####          ######       ##############################", $HEXs.PrideYellow, "`n",
  <##>"########      ###  ", $HEXs.PrideWhite, "   ", $HEXs.PridePink, "   ", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "## ", $HEXs.PrideBlack, "    ####      #####      #########       ###          #####       ################################", $HEXs.PrideYellow, "`n",
  <##>"#######     ####     ", $HEXs.PrideWhite, " ##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "   ", $HEXs.PrideBlack, "  ###     ######       ########        #            ####      ##################################", $HEXs.PrideYellow, "`n",
  <##>"######     ###      ###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, "  #", $HEXs.PrideBlack, "#      #####        #########       #            ###      ####################################", $HEXs.PrideYellow, "`n",
  <##>"######    ####     ####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "## ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, " ##", $HEXs.PrideBlack, "                 ###########                    ##      ######################################", $HEXs.PrideGreen, "`n",
  <##>"######     ####      ", $HEXs.PrideWhite, "###", $HEXs.PridePink, "## ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, " ##", $HEXs.PrideBlack, "#             ###############                    ##      #######################################", $HEXs.PrideGreen, "`n",
  <##>"#######    ########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "## ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, " ##", $HEXs.PrideBlack, "#       ##      ##############            #              #########################################", $HEXs.PrideGreen, "`n",
  <##>"########     ####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "   ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, " ##", $HEXs.PrideBlack, "#        ###      #############            #             ###########################################", $HEXs.PrideGreen, "`n",
  <##>"##########     ", $HEXs.PrideWhite, "   ", $HEXs.PridePink, "   ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##        ###       ############           ##             ############################################", $HEXs.PrideGreen, "`n",
  <##>"#############", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##         ####       ###########          ####           ##############################################", $HEXs.PrideBlue, "`n",
  <##>"####     ##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##         #####        ##########          ####          ################################################", $HEXs.PrideBlue, "`n",
  <##>"####     ", $HEXs.PrideWhite, " ##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##         #######       ##########         #####         ##################################################", $HEXs.PrideBlue, "`n",
  <##>"####   ", $HEXs.PrideWhite, "  #", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##         ##########     ##########        ######         ###################################################", $HEXs.PrideBlue, "`n",
  <##>"#####", $HEXs.PrideWhite, "   ", $HEXs.PridePink, "   ", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "## ", $HEXs.PrideBlack, "          #############     ##  ####        #######        #####################################################", $HEXs.PrideBlue, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "#  ", $HEXs.PrideCyan, "   ", $HEXs.PrideBrown, "   ", $HEXs.PrideBlack, "       ####################        ##       ########      ########################################################", $HEXs.PridePurple, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###############################    ###     #########      ##########################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################################################################", $HEXs.PridePurple
}


function Get-PrideCollection {
  Get-RainbowLine
  Get-RainbowSlimLine
  Get-RainbowSlimShortLine
  Get-Trans   
  Get-PrideSmall
  Get-PrideMedium
  Get-PrideLarge
  Get-PrideLogo
}

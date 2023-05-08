
###########################
# Pride-related functions #
###########################
function Get-RainbowLine {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = (" " * $windowWidth)
  
  OUT $spaceLength, $colors.PrideRed, $True, "`n",
  $spaceLength, $colors.PrideOrange, $True, "`n",
  $spaceLength, $colors.PrideYellow, $True, "`n",
  $spaceLength, $colors.PrideGreen, $True, "`n",
  $spaceLength, $colors.PrideBlue, $True, "`n",
  $spaceLength, $colors.PridePurple, $True
}


function Get-TransLine {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = (" " * $windowWidth)
  
  OUT $spaceLength, $colors.PrideCyan, $True, "`n",
  $spaceLength, $colors.PridePink, $True, "`n",
  $spaceLength, $colors.PrideWhite, $True, "`n",
  $spaceLength, $colors.PridePink, $True, "`n",
  $spaceLength, $colors.PrideCyan, $True
}


function Get-RainbowSlimLine {
  param( [switch]$NoNewlineStart = $False )

  $windowWidth = $Host.UI.RawUI.WindowSize.Width
  $spaceLength = [math]::floor($windowWidth / 6)
  $spaces = " " * $spaceLength
  $restSpaceLength = $windowWidth - ($spaceLength * 6)
  $restSpaces = " " * $restSpaceLength

  OUT $spaces, $colors.PrideRed, $True,
  $spaces, $colors.PrideOrange, $True,
  $spaces, $colors.PrideYellow, $True,
  $spaces, $colors.PrideGreen, $True,
  $spaces, $colors.PrideBlue, $True,
  $spaces, $colors.PridePurple, $True,
  $restSpaces, $colors.PridePurple, $True -NoNewlineStart:$NoNewlineStart
}


function Get-TransSlimLine {
  param( [switch]$NoNewlineStart = $False )

  $windowWidth = $Host.UI.RawUI.WindowSize.Width
  $spaceLength = [math]::floor($windowWidth / 5)
  $spaces = " " * $spaceLength
  $restSpaceLength = $windowWidth - ($spaceLength * 5)
  $restSpaces = " " * $restSpaceLength

  OUT $spaces, $colors.PrideCyan, $True,
  $spaces, $colors.PridePink, $True,
  $spaces, $colors.PrideWhite, $True,
  $spaces, $colors.PridePink, $True,
  $spaces, $colors.PrideCyan, $True,
  $restSpaces, $colors.PrideCyan, $True -NoNewlineStart:$NoNewlineStart
}


function Get-RainbowSlimShortLine {
  $spaceLength = "   "
  OUT $spaceLength, $colors.PrideRed, $True,
  $spaceLength, $colors.PrideOrange, $True,
  $spaceLength, $colors.PrideYellow, $True,
  $spaceLength, $colors.PrideGreen, $True,
  $spaceLength, $colors.PrideBlue, $True,
  $spaceLength, $colors.PridePurple, $True
}


function Get-PrideSmall {
  OUT "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################", $colors.PrideRed, "`n",
  "##", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###################################", $colors.PrideRed, "`n",
  "#", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#################################", $colors.PrideOrange, "`n",
  "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "################################", $colors.PrideOrange, "`n",
  "#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##############################", $colors.PrideYellow, "`n",
  "##", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#############################", $colors.PrideYellow, "`n",
  "##", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#############################", $colors.PrideGreen, "`n",
  "#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##############################", $colors.PrideGreen, "`n",
  "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "################################", $colors.PrideBlue, "`n",
  "#", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#################################", $colors.PrideBlue, "`n",
  "##", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###################################", $colors.PridePurple, "`n",
  "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################", $colors.PridePurple
}


function Get-PrideMedium { 
  OUT <#"", $colors.PrideWhite, "", $colors.PridePink,#> "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#############################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "##", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "############################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###########################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite,#> "#", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##########################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite,#> "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#########################################################################", $colors.PrideOrange, "`n",
  <#"", $colors.PrideWhite,#> "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################", $colors.PrideOrange, "`n",
  <##>"#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#######################################################################", $colors.PrideOrange, "`n",
  <##>"##", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################", $colors.PrideOrange, "`n",
  <##>"###", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#####################################################################", $colors.PrideYellow, "`n",
  <##>"####", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################################################", $colors.PrideYellow, "`n",
  <##>"#####", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###################################################################", $colors.PrideYellow, "`n",
  <##>"######", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##################################################################", $colors.PrideYellow, "`n",
  <##>"######", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##################################################################", $colors.PrideGreen, "`n",
  <##>"#####", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###################################################################", $colors.PrideGreen, "`n",
  <##>"####", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################################################", $colors.PrideGreen, "`n",
  <##>"###", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#####################################################################", $colors.PrideGreen, "`n",
  <##>"##", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################", $colors.PrideBlue, "`n",
  <##>"#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#######################################################################", $colors.PrideBlue, "`n",
  <#"", $colors.PrideWhite,#> "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################", $colors.PrideBlue, "`n",
  <#"", $colors.PrideWhite,#> "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#########################################################################", $colors.PrideBlue, "`n",
  <#"", $colors.PrideWhite,#> "#", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##########################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###########################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "##", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "############################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#############################################################################", $colors.PridePurple
}


function Get-PrideLarge { 
  OUT <#"", $colors.PrideWhite, "", $colors.PridePink,#> "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite,#> "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################################################################", $colors.PrideRed, "`n",
  <##>"#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##################################################################################", $colors.PrideRed, "`n",
  <##>"###", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "################################################################################", $colors.PrideOrange, "`n",
  <##>"#####", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##############################################################################", $colors.PrideOrange, "`n",
  <##>"#######", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "############################################################################", $colors.PrideOrange, "`n",
  <##>"#########", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##########################################################################", $colors.PrideOrange, "`n",
  <##>"###########", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################", $colors.PrideYellow, "`n",
  <##>"#############", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################", $colors.PrideYellow, "`n",
  <##>"###############", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################################################", $colors.PrideYellow, "`n",
  <##>"#################", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##################################################################", $colors.PrideYellow, "`n",
  <##>"#################", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##################################################################", $colors.PrideGreen, "`n",
  <##>"###############", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################################################", $colors.PrideGreen, "`n",
  <##>"#############", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################", $colors.PrideGreen, "`n",
  <##>"###########", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################", $colors.PrideGreen, "`n",
  <##>"#########", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##########################################################################", $colors.PrideBlue, "`n",
  <##>"#######", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "############################################################################", $colors.PrideBlue, "`n",
  <##>"#####", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##############################################################################", $colors.PrideBlue, "`n",
  <##>"###", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "################################################################################", $colors.PrideBlue, "`n",
  <##>"#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##################################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite,#> "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "####################################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################################", $colors.PridePurple
}


function Get-PrideLogo { 
  OUT <#"", $colors.PrideWhite, "", $colors.PridePink,#> "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##########################################################################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################################################################", $colors.PrideRed, "`n",
  <#"", $colors.PrideWhite,#> "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################################################################", $colors.PrideRed, "`n",
  <##>"#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#########################################################################################################       ####", $colors.PrideRed, "`n",
  <##>"###", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "#################################################################################################              ###", $colors.PrideRed, "`n",
  <##>"#####", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###########################################################################################          ###########", $colors.PrideOrange, "`n",
  <##>"#######", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######                      ######             ####################    ##############         ################", $colors.PrideOrange, "`n",
  <##>"#########", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "#  ", $colors.PrideBlack, "         #############               ###       ################      ###########        ####################", $colors.PrideOrange, "`n",
  <##>"###########", $colors.PrideWhite, "###", $colors.PridePink, "## ", $colors.PrideCyan, "   ", $colors.PrideBrown, "   ", $colors.PrideBlack, "  #####################       ###########      ############       ##########       #######################", $colors.PrideOrange, "`n",
  <##>"#############", $colors.PrideWhite, "#  ", $colors.PridePink, "   ", $colors.PrideCyan, "   ", $colors.PrideBrown, "###", $colors.PrideBlack, "##################            ##########      #########        #########      ##########################", $colors.PrideOrange, "`n",
  <##>"###########    ", $colors.PrideWhite, "   ", $colors.PridePink, " ##", $colors.PrideCyan, "## ", $colors.PrideBrown, "   ", $colors.PrideBlack, "      #########      ##      #########      #######        ########       ############################", $colors.PrideYellow, "`n",
  <##>"#########       #", $colors.PrideWhite, "###", $colors.PridePink, "   ", $colors.PrideCyan, "   ", $colors.PrideBrown, "   ", $colors.PrideBlack, "     ######      ####      #########       ####          ######       ##############################", $colors.PrideYellow, "`n",
  <##>"########      ###  ", $colors.PrideWhite, "   ", $colors.PridePink, "   ", $colors.PrideCyan, "###", $colors.PrideBrown, "## ", $colors.PrideBlack, "    ####      #####      #########       ###          #####       ################################", $colors.PrideYellow, "`n",
  <##>"#######     ####     ", $colors.PrideWhite, " ##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "   ", $colors.PrideBlack, "  ###     ######       ########        #            ####      ##################################", $colors.PrideYellow, "`n",
  <##>"######     ###      ###", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "   ", $colors.PrideBrown, "  #", $colors.PrideBlack, "#      #####        #########       #            ###      ####################################", $colors.PrideYellow, "`n",
  <##>"######    ####     ####", $colors.PrideWhite, "###", $colors.PridePink, "## ", $colors.PrideCyan, "   ", $colors.PrideBrown, " ##", $colors.PrideBlack, "                 ###########                    ##      ######################################", $colors.PrideGreen, "`n",
  <##>"######     ####      ", $colors.PrideWhite, "###", $colors.PridePink, "## ", $colors.PrideCyan, "   ", $colors.PrideBrown, " ##", $colors.PrideBlack, "#             ###############                    ##      #######################################", $colors.PrideGreen, "`n",
  <##>"#######    ########", $colors.PrideWhite, "###", $colors.PridePink, "## ", $colors.PrideCyan, "   ", $colors.PrideBrown, " ##", $colors.PrideBlack, "#       ##      ##############            #              #########################################", $colors.PrideGreen, "`n",
  <##>"########     ####", $colors.PrideWhite, "###", $colors.PridePink, "   ", $colors.PrideCyan, "   ", $colors.PrideBrown, " ##", $colors.PrideBlack, "#        ###      #############            #             ###########################################", $colors.PrideGreen, "`n",
  <##>"##########     ", $colors.PrideWhite, "   ", $colors.PridePink, "   ", $colors.PrideCyan, "   ", $colors.PrideBrown, "###", $colors.PrideBlack, "##        ###       ############           ##             ############################################", $colors.PrideGreen, "`n",
  <##>"#############", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##         ####       ###########          ####           ##############################################", $colors.PrideBlue, "`n",
  <##>"####     ##", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##         #####        ##########          ####          ################################################", $colors.PrideBlue, "`n",
  <##>"####     ", $colors.PrideWhite, " ##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##         #######       ##########         #####         ##################################################", $colors.PrideBlue, "`n",
  <##>"####   ", $colors.PrideWhite, "  #", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##         ##########     ##########        ######         ###################################################", $colors.PrideBlue, "`n",
  <##>"#####", $colors.PrideWhite, "   ", $colors.PridePink, "   ", $colors.PrideCyan, "###", $colors.PrideBrown, "## ", $colors.PrideBlack, "          #############     ##  ####        #######        #####################################################", $colors.PrideBlue, "`n",
  <##>"###", $colors.PrideWhite, "###", $colors.PridePink, "#  ", $colors.PrideCyan, "   ", $colors.PrideBrown, "   ", $colors.PrideBlack, "       ####################        ##       ########      ########################################################", $colors.PridePurple, "`n",
  <##>"#", $colors.PrideWhite, "###", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "###############################    ###     #########      ##########################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite,#> "##", $colors.PridePink, "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "######################################################################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "###", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "########################################################################################################################", $colors.PridePurple, "`n",
  <#"", $colors.PrideWhite, "", $colors.PridePink,#> "#", $colors.PrideCyan, "###", $colors.PrideBrown, "###", $colors.PrideBlack, "##########################################################################################################################", $colors.PridePurple
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

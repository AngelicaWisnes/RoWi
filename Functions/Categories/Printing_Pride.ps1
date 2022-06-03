
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


function rainbow {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 1
  $spaceLength = (" " * $windowWidth) + "`n"
  OUT "`n", $spaceLength, $HEXs.PrideRed, $True,
  $spaceLength, $HEXs.PrideOrange, $True,
  $spaceLength, $HEXs.PrideYellow, $True,
  $spaceLength, $HEXs.PrideGreen, $True,
  $spaceLength, $HEXs.PrideBlue, $True,
  $spaceLength, $HEXs.PridePurple, $True
}


function rainbow2 {
  $spaceLength = "   "
  OUT $spaceLength, $HEXs.PrideRed, $True,
  $spaceLength, $HEXs.PrideOrange, $True,
  $spaceLength, $HEXs.PrideYellow, $True,
  $spaceLength, $HEXs.PrideGreen, $True,
  $spaceLength, $HEXs.PrideBlue, $True,
  $spaceLength, $HEXs.PridePurple, $True
}


function progress {
  OUT "`n", 
  "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################", $HEXs.PrideRed, "`n",
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
  "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################", $HEXs.PridePurple, "`n"
}


function progress4 { 
  OUT "`n", 
  " ", $HEXs.PrideWhite, " ", $HEXs.PridePink, "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#############################################################################", $HEXs.PrideRed, "`n",
  " ", $HEXs.PrideWhite, " ", $HEXs.PridePink, "##", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "############################################################################", $HEXs.PrideRed, "`n",
  " ", $HEXs.PrideWhite, " ", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###########################################################################", $HEXs.PrideRed, "`n",
  "  ", $HEXs.PrideWhite, "#", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################", $HEXs.PrideRed, "`n",
  "  ", $HEXs.PrideWhite, "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#########################################################################", $HEXs.PrideOrange, "`n",
  "  ", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################", $HEXs.PrideOrange, "`n",
  "  #", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#######################################################################", $HEXs.PrideOrange, "`n",
  "  ##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################", $HEXs.PrideOrange, "`n",
  "  ###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#####################################################################", $HEXs.PrideYellow, "`n",
  "  ####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################", $HEXs.PrideYellow, "`n",
  "  #####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###################################################################", $HEXs.PrideYellow, "`n",
  "  ######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################", $HEXs.PrideYellow, "`n",
  "  ######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################################################################", $HEXs.PrideGreen, "`n",
  "  #####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###################################################################", $HEXs.PrideGreen, "`n",
  "  ####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "####################################################################", $HEXs.PrideGreen, "`n",
  "  ###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#####################################################################", $HEXs.PrideGreen, "`n",
  "  ##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################", $HEXs.PrideBlue, "`n",
  "  #", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#######################################################################", $HEXs.PrideBlue, "`n",
  "  ", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################", $HEXs.PrideBlue, "`n",
  "  ", $HEXs.PrideWhite, "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#########################################################################", $HEXs.PrideBlue, "`n",
  "  ", $HEXs.PrideWhite, "#", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################", $HEXs.PridePurple, "`n",
  " ", $HEXs.PrideWhite, " ", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###########################################################################", $HEXs.PridePurple, "`n",
  " ", $HEXs.PrideWhite, " ", $HEXs.PridePink, "##", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "############################################################################", $HEXs.PridePurple, "`n",
  " ", $HEXs.PrideWhite, " ", $HEXs.PridePink, "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#############################################################################", $HEXs.PridePurple, "`n"
  
}


function progress5 { 
  OUT "`n", 
  " ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                             ", $HEXs.PrideRed, $True, "`n",
  "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                            ", $HEXs.PrideRed, $True, "`n",
  "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                           ", $HEXs.PrideRed, $True, "`n",
  " ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                          ", $HEXs.PrideRed, $True, "`n",
  "  ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                         ", $HEXs.PrideOrange, $True, "`n",
  "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                        ", $HEXs.PrideOrange, $True, "`n",
  " ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                       ", $HEXs.PrideOrange, $True, "`n",
  "  ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                      ", $HEXs.PrideOrange, $True, "`n",
  "   ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                     ", $HEXs.PrideYellow, $True, "`n",
  "    ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                    ", $HEXs.PrideYellow, $True, "`n",
  "     ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                   ", $HEXs.PrideYellow, $True, "`n",
  "      ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                  ", $HEXs.PrideYellow, $True, "`n",
  "      ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                  ", $HEXs.PrideGreen, $True, "`n",
  "     ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                   ", $HEXs.PrideGreen, $True, "`n",
  "    ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                    ", $HEXs.PrideGreen, $True, "`n",
  "   ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                     ", $HEXs.PrideGreen, $True, "`n",
  "  ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                      ", $HEXs.PrideBlue, $True, "`n",
  " ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                       ", $HEXs.PrideBlue, $True, "`n",
  "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                        ", $HEXs.PrideBlue, $True, "`n",
  "  ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                         ", $HEXs.PrideBlue, $True, "`n",
  " ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                          ", $HEXs.PridePurple, $True, "`n",
  "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                           ", $HEXs.PridePurple, $True, "`n",
  "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                            ", $HEXs.PridePurple, $True, "`n",
  " ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                             ", $HEXs.PridePurple, $True, "`n"
  
}


function progress3 {
  OUT "`n", 
  "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                    ", $HEXs.PrideRed, $True, "`n",
  "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                   ", $HEXs.PrideRed, $True, "`n",
  "  ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                 ", $HEXs.PrideOrange, $True, "`n",
  "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                ", $HEXs.PrideOrange, $True, "`n",
  "  ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                              ", $HEXs.PrideYellow, $True, "`n",
  "   ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                             ", $HEXs.PrideYellow, $True, "`n",
  "   ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                             ", $HEXs.PrideGreen, $True, "`n",
  "  ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                              ", $HEXs.PrideGreen, $True, "`n",
  "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                ", $HEXs.PrideBlue, $True, "`n",
  "  ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                 ", $HEXs.PrideBlue, $True, "`n",
  "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                   ", $HEXs.PridePurple, $True, "`n",
  "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                    ", $HEXs.PridePurple, $True, "`n"
}


function progress2 {
  OUT "`n", 
  "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###################", $HEXs.PrideRed, "`n",
  "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "#################", $HEXs.PrideOrange, "`n",
  "##", $HEXs.PrideWhite, "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###############", $HEXs.PrideYellow, "`n",
  "##", $HEXs.PrideWhite, "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###############", $HEXs.PrideGreen, "`n",
  "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "#################", $HEXs.PrideBlue, "`n",
  "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###################", $HEXs.PridePurple, "`n"
}


function trans {
  $spaceLength = (" " * 15) + "`n"
  OUT "`n", $spaceLength, $HEXs.PrideCyan, $True,
  $spaceLength, $HEXs.PridePink, $True,
  $spaceLength, $HEXs.PrideWhite, $True,
  $spaceLength, $HEXs.PridePink, $True,
  $spaceLength, $HEXs.PrideCyan, $True
}

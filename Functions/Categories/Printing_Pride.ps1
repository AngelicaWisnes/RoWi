
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
  $spaceLength = (" " * $windowWidth)
  OUT $spaceLength, $HEXs.PrideRed, $True, "`n",
  $spaceLength, $HEXs.PrideOrange, $True, "`n",
  $spaceLength, $HEXs.PrideYellow, $True, "`n",
  $spaceLength, $HEXs.PrideGreen, $True, "`n",
  $spaceLength, $HEXs.PrideBlue, $True, "`n",
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


function pride {
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


function pride4 { 
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


function pride5 { 
  OUT <#"", $HEXs.PrideWhite, $True, "", $HEXs.PridePink, $True,#> " ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                             ", $HEXs.PrideRed, $True, "`n",
  <#"", $HEXs.PrideWhite, $True, "", $HEXs.PridePink, $True,#> "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                            ", $HEXs.PrideRed, $True, "`n",
  <#"", $HEXs.PrideWhite, $True, "", $HEXs.PridePink, $True,#> "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                           ", $HEXs.PrideRed, $True, "`n",
  <#"", $HEXs.PrideWhite, $True,#> " ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                          ", $HEXs.PrideRed, $True, "`n",
  <#"", $HEXs.PrideWhite, $True,#> "  ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                         ", $HEXs.PrideOrange, $True, "`n",
  <#"", $HEXs.PrideWhite, $True,#> "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                        ", $HEXs.PrideOrange, $True, "`n",
  <##>" ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                       ", $HEXs.PrideOrange, $True, "`n",
  <##>"  ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                      ", $HEXs.PrideOrange, $True, "`n",
  <##>"   ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                     ", $HEXs.PrideYellow, $True, "`n",
  <##>"    ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                    ", $HEXs.PrideYellow, $True, "`n",
  <##>"     ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                   ", $HEXs.PrideYellow, $True, "`n",
  <##>"      ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                  ", $HEXs.PrideYellow, $True, "`n",
  <##>"      ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                  ", $HEXs.PrideGreen, $True, "`n",
  <##>"     ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                   ", $HEXs.PrideGreen, $True, "`n",
  <##>"    ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                    ", $HEXs.PrideGreen, $True, "`n",
  <##>"   ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                     ", $HEXs.PrideGreen, $True, "`n",
  <##>"  ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                      ", $HEXs.PrideBlue, $True, "`n",
  <##>" ", $HEXs.PrideWhite, $True, "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                       ", $HEXs.PrideBlue, $True, "`n",
  <#"", $HEXs.PrideWhite, $True,#> "   ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                        ", $HEXs.PrideBlue, $True, "`n",
  <#"", $HEXs.PrideWhite, $True,#> "  ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                         ", $HEXs.PrideBlue, $True, "`n",
  <#"", $HEXs.PrideWhite, $True,#> " ", $HEXs.PridePink, $True, "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                          ", $HEXs.PridePurple, $True, "`n",
  <#"", $HEXs.PrideWhite, $True, "", $HEXs.PridePink, $True,#> "   ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                           ", $HEXs.PridePurple, $True, "`n",
  <#"", $HEXs.PrideWhite, $True, "", $HEXs.PridePink, $True,#> "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                            ", $HEXs.PridePurple, $True, "`n",
  <#"", $HEXs.PrideWhite, $True, "", $HEXs.PridePink, $True,#> " ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                                                             ", $HEXs.PridePurple, $True
}


function pride6 { 
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


function pride7 { 
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


function pride8 { 
  OUT <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################################################################", $HEXs.PrideRed, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################################################################", $HEXs.PrideRed, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#########################################################################################################|||||||####", $HEXs.PrideRed, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "#################################################################################################||||||||||||||###", $HEXs.PrideRed, "`n",
  <##>"#####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###########################################################################################||||||||||###########", $HEXs.PrideOrange, "`n",
  <##>"#######", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######||||||||||||||||||||||######|||||||||||||####################||||##############|||||||||################", $HEXs.PrideOrange, "`n",
  <##>"#########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "#||", $HEXs.PrideBlack, "|||||||||#############|||||||||||||||###|||||||################||||||###########||||||||####################", $HEXs.PrideOrange, "`n",
  <##>"###########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "##|", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "|||", $HEXs.PrideBlack, "||#####################|||||||###########||||||############|||||||##########|||||||#######################", $HEXs.PrideOrange, "`n",
  <##>"#############", $HEXs.PrideWhite, "#||", $HEXs.PridePink, "|||", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##################||||||||||||##########||||||#########||||||||#########||||||##########################", $HEXs.PrideOrange, "`n",
  <##>"###########||||", $HEXs.PrideWhite, "|||", $HEXs.PridePink, "|##", $HEXs.PrideCyan, "##|", $HEXs.PrideBrown, "|||", $HEXs.PrideBlack, "||||||#########||||||##||||||#########||||||#######||||||||########|||||||############################", $HEXs.PrideYellow, "`n",
  <##>"#########|||||||#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "|||", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "|||", $HEXs.PrideBlack, "|||||######||||||####||||||#########|||||||####||||||||||######|||||||##############################", $HEXs.PrideYellow, "`n",
  <##>"########||||||###||", $HEXs.PrideWhite, "|||", $HEXs.PridePink, "|||", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "##|", $HEXs.PrideBlack, "||||####||||||#####||||||#########|||||||###||||||||||#####|||||||################################", $HEXs.PrideYellow, "`n",
  <##>"#######|||||####|||||", $HEXs.PrideWhite, "|##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "|||", $HEXs.PrideBlack, "||###|||||######|||||||########||||||||#||||||||||||####||||||##################################", $HEXs.PrideYellow, "`n",
  <##>"######|||||###||||||###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "||#", $HEXs.PrideBlack, "#||||||#####||||||||#########|||||||#||||||||||||###||||||####################################", $HEXs.PrideYellow, "`n",
  <##>"######||||####|||||####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "## ", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "|##", $HEXs.PrideBlack, "|||||||||||||||||###########||||||||||||||||||||##||||||######################################", $HEXs.PrideGreen, "`n",
  <##>"######|||||####||||||", $HEXs.PrideWhite, "###", $HEXs.PridePink, "##|", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "|##", $HEXs.PrideBlack, "#|||||||||||||###############||||||||||||||||||||##||||||#######################################", $HEXs.PrideGreen, "`n",
  <##>"#######||||########", $HEXs.PrideWhite, "###", $HEXs.PridePink, "##|", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "|##", $HEXs.PrideBlack, "#|||||||##||||||##############||||||||||||#||||||||||||||#########################################", $HEXs.PrideGreen, "`n",
  <##>"########|||||####", $HEXs.PrideWhite, "###", $HEXs.PridePink, "|||", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "|##", $HEXs.PrideBlack, "#||||||||###||||||#############||||||||||||#|||||||||||||###########################################", $HEXs.PrideGreen, "`n",
  <##>"##########|||||", $HEXs.PrideWhite, "|||", $HEXs.PridePink, "|||", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##||||||||###|||||||############|||||||||||##|||||||||||||############################################", $HEXs.PrideGreen, "`n",
  <##>"#############", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##|||||||||####|||||||###########||||||||||####|||||||||||##############################################", $HEXs.PrideBlue, "`n",
  <##>"####|||||##", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##|||||||||#####||||||||##########||||||||||####||||||||||################################################", $HEXs.PrideBlue, "`n",
  <##>"####|||||", $HEXs.PrideWhite, "|##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##|||||||||#######|||||||##########|||||||||#####|||||||||##################################################", $HEXs.PrideBlue, "`n",
  <##>"####|||", $HEXs.PrideWhite, "||#", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##|||||||||##########|||||##########||||||||######|||||||||###################################################", $HEXs.PrideBlue, "`n",
  <##>"#####", $HEXs.PrideWhite, "|||", $HEXs.PridePink, "|||", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "##|", $HEXs.PrideBlack, "||||||||||#############|||||##||####||||||||#######||||||||#####################################################", $HEXs.PrideBlue, "`n",
  <##>"###", $HEXs.PrideWhite, "###", $HEXs.PridePink, "#||", $HEXs.PrideCyan, "|||", $HEXs.PrideBrown, "|||", $HEXs.PrideBlack, "|||||||####################||||||||##|||||||########||||||########################################################", $HEXs.PridePurple, "`n",
  <##>"#", $HEXs.PrideWhite, "###", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "###############################||||###|||||#########||||||##########################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite,#> "##", $HEXs.PridePink, "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "######################################################################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "###", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "########################################################################################################################", $HEXs.PridePurple, "`n",
  <#"", $HEXs.PrideWhite, "", $HEXs.PridePink,#> "#", $HEXs.PrideCyan, "###", $HEXs.PrideBrown, "###", $HEXs.PrideBlack, "##########################################################################################################################", $HEXs.PridePurple
}


function pride3 {
  OUT "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                    ", $HEXs.PrideRed, $True, "`n",
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
  "  ", $HEXs.PrideCyan, $True, "   ", $HEXs.PrideBrown, $True, "   ", $HEXs.PrideBlack, $True, "                                    ", $HEXs.PridePurple, $True
}


function pride2 {
  OUT "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###################", $HEXs.PrideRed, "`n",
  "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "#################", $HEXs.PrideOrange, "`n",
  "##", $HEXs.PrideWhite, "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###############", $HEXs.PrideYellow, "`n",
  "##", $HEXs.PrideWhite, "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###############", $HEXs.PrideGreen, "`n",
  "##", $HEXs.PridePink, "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "#################", $HEXs.PrideBlue, "`n",
  "##", $HEXs.PrideCyan, "##", $HEXs.PrideBrown, "##", $HEXs.PrideBlack, "###################", $HEXs.PridePurple
}


function trans {
  $spaceLength = (" " * 15)
  OUT $spaceLength, $HEXs.PrideCyan, $True, "`n",
  $spaceLength, $HEXs.PridePink, $True, "`n",
  $spaceLength, $HEXs.PrideWhite, $True, "`n",
  $spaceLength, $HEXs.PridePink, $True, "`n",
  $spaceLength, $HEXs.PrideCyan, $True
}

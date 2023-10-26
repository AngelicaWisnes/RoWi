# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()

######################
###      SETUP     ###
######################
Clear-Host

#$PSDefaultParameterValues = @{"Import-Module:UseWindowsPowerShell" = $false;}

$global:AWI = $PSScriptRoot
. $global:AWI\Setup\Setup.ps1

# Set start-path for PS-profile-reload. For a different start path, set the `$startPath variable in function 'ReloadPsProfile' and 'ReloadAWI'. 
If ($startPath) { Push-Location $startPath }
Else { Push-Location $global:DEFAULT_START_PATH -ErrorAction SilentlyContinue }


############################
###      AFTER SETUP     ###
############################


#PRINT_UPGRADER_INFO


############################

function t {
  OUTnew $(PE -txt:"This is a function-name available for testing scripts in the profile. It is not currently in use." -fg:$global:colors.Red)
}

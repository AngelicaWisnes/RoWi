# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()

######################
###      SETUP     ###
######################
Clear-Host

#$PSDefaultParameterValues = @{"Import-Module:UseWindowsPowerShell" = $false;}

$global:ROWI = $PSScriptRoot
. $global:ROWI\Setup\Setup.ps1

# Set start-path for PS-profile-reload. For a different start path, set the `$startPath variable in function 'ReloadPsProfile' and 'ReloadRowi'. 
If ($startPath) { Push-Location $startPath }
Else { Push-Location $global:DEFAULT_START_PATH -ErrorAction SilentlyContinue }


############################
###      AFTER SETUP     ###
############################

Get-Logo
Get-FunctionListGeneratorCommandInfo
#PRINT_UPGRADER_INFO
dad

############################

function t {
  OUT "This is a function-name available for testing scripts in the profile. It is not currently in use.", $global:colors.Red
}

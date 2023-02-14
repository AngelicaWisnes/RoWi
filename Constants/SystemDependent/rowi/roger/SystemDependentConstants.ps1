# Suppress 'unused-variable'-warning for this file
#[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()


################################################################
# NOTE: All variables should be specified in 'Check_Constants' #
################################################################

# Define Paths
$global:MY_POWERSHELL = "C:\Users\roger\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Windows PowerShell.lnk" | Resolve-Path
if ($PSVersionTable.PSVersion.Major -eq 7) {
    $global:MY_POWERSHELL = "C:\Users\roger\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\PowerShell 7 (x64).lnk" | Resolve-Path
}

$global:MY_BROWSER = "C:\Users\roger\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Opera-nettleser.lnk" | Resolve-Path

$global:MY_DOTNET_IDE = "C:\Users\roger\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk" | Resolve-Path
$global:MY_JS_IDE = "C:\Users\roger\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk" | Resolve-Path

$global:DEFAULT_START_PATH = "C:\Users\roger\OneDrive\Development\Source" | Resolve-Path


# Define other variables
$global:GIT_BRANCH_URL = "https://github.com/RogerWisnes/{0}/branches"

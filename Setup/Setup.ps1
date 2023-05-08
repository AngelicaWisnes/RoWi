
# Timer-function for logging the time used for measuring execution-times
$sw = [Diagnostics.Stopwatch]::new()
$log = new-object -TypeName System.Text.StringBuilder
function logTime {
  param( 
    [Parameter(Mandatory)][String]$timed,
    [bool]$restart = $true 
  )
  $sw.Stop()
  $log.AppendFormat(" {1:0.000}s - {0}`n", $timed, $($sw.ElapsedMilliseconds / 1000)) > $null
  $sw.Reset()
  If ($restart) { $sw.Start() }
}


#################################################
###     Import relevant files and modules     ###
#################################################

$sw.Start()
. $global:ROWI\FunctionListGenerator\FunctionListGenerator.ps1
logTime "Import FunctionListGenerator"

. $global:ROWI\Constants\Constants.ps1
logTime "Import Constants"

. $global:ROWI\Functions\Functions.ps1
logTime "Import Functions"

#. $global:ROWI\Installer\Installer.ps1
#logTime "Import Installer"

. $global:ROWI\Logo\Logo.ps1
logTime "Import Logo"

. $global:ROWI\Upgrader.ps1
logTime "Import Upgrader"

. $global:ROWI\SystemDependent\SystemDependentSetup.ps1
logTime "Import SystemDependent"

# Import modules
if (!(Get-Module -ListAvailable -Name posh-git)) {
  Install-Module -Name posh-git
}
Import-Module -Name posh-git -ArgumentList @($false, $false, $true) # Arguments: [bool]$ForcePoshGitPrompt, [bool]$UseLegacyTabExpansion, [bool]$EnableProxyFunctionExpansion
logTime "Import Posh"


###############################
###      Initialization     ###
###############################

Initialize-FunctionListGenerator
logTime "Initialize ListGenerator"

Get-Logo
logTime "Get Logo"

Get-FunctionListInfo
logTime "Get FunctionListCommand"

Get-DadJoke
logTime "Get DadJoke" -restart $false

# To show time-log: Uncomment the following line
# Write-Host -ForegroundColor Cyan $log.ToString()


#######################################
###      SETTINGS AND SHORTCUTS     ###
#######################################

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineKeyHandler -Chord Ctrl+1 -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('. rr')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+2 -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('Get-Selfie')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

#function prompt {
#  # Your non-prompt logic here
#  #$prompt = Write-Prompt "Text before posh-git prompt " -ForegroundColor ([ConsoleColor]::Green)
#  if (Get-Module -ListAvailable -Name posh-git) { Get-Command $GitPromptScriptBlock } else { write-host "false" }
#
#  $prompt = Write-Prompt "`n"
#  
#  $prompt += & $GitPromptScriptBlock
#  #$prompt += "`n"
#  
#  $prompt.replace(">", "`n>")
#
#  #$prompt += Write-Prompt "Text after posh-git prompt" -ForegroundColor ([ConsoleColor]::Magenta)
#  if ($prompt) { "$prompt " } else { "FAIL > " }
#}
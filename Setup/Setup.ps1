
# Timer-function for logging the time used for measuring execution-times
$sw = [Diagnostics.Stopwatch]::new()
$log = new-object -TypeName System.Text.StringBuilder
function logTime {
  param( 
    [Parameter(Mandatory)][String]$timed,
    [bool]$restart = $true 
  )
  $sw.Stop()
  $log.AppendFormat("{0}: {1}s`n", $timed, $($sw.ElapsedMilliseconds / 1000)) > $null
  $sw.Reset()
  If ($restart) { $sw.Start() }
}


###################################
###      Pre-Initialization     ###
###################################

# Define elements for FunctionListGenerator
class FunctionListElement { [string]$category ; [string]$name ; [string]$value } 
class FunctionListObject {
  [System.Collections.Generic.List[FunctionListElement]]$list
  [int]$quantity
}$FunctionSubList_BREAK = [FunctionListElement]@{ category = '-'; name = '-'; value = '-' }

$global:FunctionLists = @{
  Program    = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  PowerShell = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  Git        = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  Jupyter    = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  React      = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  System     = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  Project    = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  Printing   = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
  Other      = [FunctionListObject]@{ list = new-object System.Collections.Generic.List[FunctionListElement] ; quantity = 1 };
}

foreach ($list in $global:FunctionLists.Values) { $list.list.Add( $FunctionSubList_BREAK ) }

function addToList {
    param(
        [Parameter(Mandatory)][String]$category,
        [Parameter(Mandatory)][String]$name,
        [Parameter(Mandatory)][String]$value
    )
    $global:FunctionLists[$category].list.Add(( [FunctionListElement]@{ category = $category; name = $name; value = $value } ))
    $global:FunctionLists[$category].quantity++
}



##################################################
###      Import relevant files and modules     ###
##################################################

$sw.Start()
. $global:ROWI\Constants\Constants.ps1
logTime "Constants"

. $global:ROWI\Functions\Functions.ps1
logTime "Functions"

#. $global:ROWI\Installer\Installer.ps1
#logTime "Installer"

. $global:ROWI\Logo\Logo.ps1
logTime "Logo"

. $global:ROWI\Upgrader.ps1
logTime "Upgrader"

. $global:ROWI\SystemDependent\SystemDependentSetup.ps1
logTime "SystemDependent"

# Import modules
if (!(Get-Module -ListAvailable -Name posh-git)) {
  Install-Module -Name posh-git
}
Import-Module -Name posh-git -ArgumentList @($false, $false, $true) # Arguments: [bool]$ForcePoshGitPrompt, [bool]$UseLegacyTabExpansion, [bool]$EnableProxyFunctionExpansion
logTime "Posh" -restart $false


# To show time-log: Uncomment the following line
# Write-Host -ForegroundColor Cyan $log.ToString()


####################################
###      Post-Initialization     ###
####################################

Initialize-FunctionListGenerator



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
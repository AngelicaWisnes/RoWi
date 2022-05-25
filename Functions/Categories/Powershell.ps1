
################################
# PowerShell-related functions #
################################
$global:FunctionSubList_POWERSHELL = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_POWERSHELL.Add( $FunctionSubList_BREAK )
function addToList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_POWERSHELL.Add(( [FunctionListElement]@{ category = "PowerShell"; name = $name; value = $value } ))
}


function cd. { Set-Location .. }
addToList -name 'cd.' -value 'cd ..'


function ep { code $global:ROWI }
addToList -name 'ep' -value 'Edit RoWi'


function epp { 
  code $global:ROWI
  code $profile 
}
addToList -name 'epp' -value 'Edit RoWi and PS-profile'

function getPath { (Resolve-Path .\).Path }
addToList -name 'getPath' -value 'Get current path'


function getRepo { Split-Path -Leaf (getPath) }
addToList -name 'getRepo' -value 'Get current repo'


function home { Push-Location $global:DEFAULT_START_PATH }
addToList -name 'home' -value 'Go back to start-path'

Set-Alias i Invoke-History
addToList -name 'i' -value 'Invoke-History'

function rc { [console]::ResetColor() }
addToList -name 'rc' -value 'Reset color scheme'


function rr { 
  $startPath = Get-Location
  Write-Host -ForegroundColor Cyan "`n`tReloading profile with startpath: `n`t$startpath`n"
  . $global:ROWI\RoWi.ps1
}
addToList -name '. rr' -value 'Reload RoWi'


function rrp { 
  $startPath = Get-Location
  Write-Host -ForegroundColor Cyan "`n`tReloading profile with startpath: `n`t$startpath`n"
  . $profile
}
addToList -name '. rrp' -value 'Reload PS-profile'


function see {
  param( [Parameter(Mandatory)][String]$commandName )
  $functionName = _see_getFunctionNameFromCommandName( $commandName )
  $codeBlock = _see_String $functionName
  Write-Host -ForegroundColor White "$codeBlock"
}
addToList -name 'see' -value 'See the code-block of function'


function _see_getFunctionNameFromCommandName {
  param( [Parameter(Mandatory)][String]$commandName )
  $command = Get-Command $commandName
  $commandType = $command.CommandType
  If ( $commandType -eq "Function" ) { Return $commandName }
  If ( $commandType -eq "Alias" ) { Return $command.Definition }
  Else { Write-Host -ForegroundColor Red "`n`tMISSING IMPLEMENTATION FOR COMMAND-TYPE '$commandType', in _see_getFunctionNameFromCommandName`n" }
}


function _see_String { Return (Get-Command $args).ScriptBlock }


function startNewPowershell {
  param (
    [scriptblock]$script = { param($currentPath); Set-Location $currentPath; },
    [array]$params = ($(getPath))
  )

  Start-Process $global:MY_POWERSHELL -ArgumentList `
    "-NoExit -Command & { $($script -replace '"', '\"') } $params"
}
Set-Alias snp startNewPowershell
addToList -name 'snp' -value 'Start new powershell'
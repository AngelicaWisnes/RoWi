
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


function Set-LocationOneBack { Set-Location .. }
Set-Alias cd. Set-LocationOneBack
addToList -name 'cd.' -value 'cd ..'


function Edit-RowiProfile { code $global:ROWI }
Set-Alias ep Edit-RowiProfile
addToList -name 'ep' -value 'Edit RoWi'


function Edit-RowiAndPsProfile { 
  Edit-RowiProfile
  code $profile 
}
Set-Alias epp Edit-RowiAndPsProfile
addToList -name 'epp' -value 'Edit RoWi and PS-profile'

function Get-FullPath { (Resolve-Path .\).Path }
Set-Alias pa Get-FullPath
addToList -name 'pa' -value 'Get current path'


function Get-CurrentRepo { Split-Path -Leaf (Get-FullPath) }
Set-Alias re Get-CurrentRepo
addToList -name 're' -value 'Get current repo'


function Push-LocationHome { Push-Location $global:DEFAULT_START_PATH }
Set-Alias home Push-LocationHome
addToList -name 'home' -value 'Push-Location default-start-path'

Set-Alias i Invoke-History
addToList -name 'i' -value 'Invoke-History'

function Reset-Color { [console]::ResetColor() }
Set-Alias rc Reset-Color
addToList -name 'rc' -value 'Reset color scheme'

function Push-LocationRowi { Push-Location $global:ROWI }
Set-Alias rowi Push-LocationRowi
addToList -name 'rowi' -value 'Push-Location $ROWI'


function ReloadRowi { 
  $startPath = Get-Location
  OUT "`tReloading profile with startpath: `n`t$startpath`n", $global:colors.Cyan
  . $global:ROWI\RoWi.ps1
}
Set-Alias rr ReloadRowi
addToList -name '. rr' -value 'Reload RoWi'


function ReloadPsProfile { 
  $startPath = Get-Location
  OUT "`tReloading profile with startpath: `n`t$startpath`n", $global:colors.Cyan
  . $profile
}
Set-Alias rrp ReloadPsProfile
addToList -name '. rrp' -value 'Reload PS-profile'


function Get-FunctionDefinition {
  param( [Parameter(Mandatory)][String]$commandName )
  $functionName = Get-FunctionNameFromCommandName( $commandName )
  $codeBlock = Get-FunctionDefinitionAsString $functionName
  Write-Host -ForegroundColor White "$codeBlock"
}
Set-Alias see Get-FunctionDefinition
addToList -name 'see' -value 'See the code-block of function'


function Get-FunctionNameFromCommandName {
  param( [Parameter(Mandatory)][String]$commandName )
  $command = Get-Command $commandName
  $commandType = $command.CommandType
  If ( $commandType -eq "Function" ) { Return $commandName }
  If ( $commandType -eq "Alias" ) { Return $command.Definition }
  Else { OUT "`tMISSING IMPLEMENTATION FOR COMMAND-TYPE '$commandType', in Get-FunctionNameFromCommandName`n", $global:colors.Red }
}


function Get-FunctionDefinitionAsString { Return (Get-Command $args).ScriptBlock }


function Start-NewPowershell {
  param (
    [scriptblock]$script = { param($currentPath); Set-Location $currentPath; },
    [array]$params = ($(Get-FullPath))
  )

  Start-Process $global:MY_POWERSHELL -ArgumentList `
    "-NoExit -Command & { $($script -replace '"', '\"') } $params"
}
Set-Alias snp Start-NewPowershell
addToList -name 'snp' -value 'Start new powershell'




$subDirUtils = @{
  current     = 0 ; 
  root        = Get-FullPath;
  directories = (Get-ChildItem -Directory).name;
  dirCount    = 0;
  initialized = $false
}

# TODO: Check if this function is completed - If not: Complete it
function _openAllSubDirs_continue {
  If ( $subDirUtils.dirCount -eq 0 ) { Return OUT "No subdirectories found", $global:colors.Red }
  If ( $subDirUtils.current -eq $subDirUtils.dirCount ) { Return OUT "Finished", $global:colors.Red }

  $currentDir = $subDirUtils.directories[$subDirUtils.current]
  Write-Host -ForegroundColor Cyan "Current directory: $($subDirUtils.current+1)/$($subDirUtils.dirCount) `n  $currentDir `n"
  Set-Location ("$($subDirUtils.root)\$currentDir" | Resolve-Path)
  $subDirUtils.current += 1
}

# TODO: Check if this function is completed - If not: Complete it
function _openAllSubDirs_init {
  $subDirUtils.current = 0
  $subDirUtils.root = Get-FullPath
  $subDirUtils.directories = (Get-ChildItem -Directory).name
  $subDirUtils.dirCount = $($subDirUtils.directories).Count
  $subDirUtils.initialized = $True
  
  Write-Host -ForegroundColor Cyan "
    Started 'openAllSubDirs -Init'. This will Set-Location for every subdirectory in current directory ($($subDirUtils.dirCount) times). 
    NOTE: This function does not handle recursion, and will reset if run again with 'init'-parameter!

    Run 'openAllSubDirs' to precede to the next subdirectory.`n"
}

# TODO: Check if this function is completed - If not: Complete it
function openAllSubDirs {
  param( [switch]$Init = $False )
  If ( $Init -or (-not $subDirUtils.initialized) ) { _openAllSubDirs_init }
  Else { _openAllSubDirs_continue }
}

# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()


# Import system-dependent paths
$constantsRoot = $PSScriptRoot
$global:SYSTEM_NAME = WhoAmI #Alternative to WhoAmI:   [System.Security.Principal.WindowsIdentity]::GetCurrent().name

. $constantsRoot\SystemDependent\$global:SYSTEM_NAME\SystemDependentConstants.ps1




# Specify all relevant SystemDependentPaths:
class SDP { [string]$variable ; [string]$value } 
$SystemDependentPaths = @(
    [SDP]@{variable = $global:MY_POWERSHELL        ; value = "MY_POWERSHELL = $global:MY_POWERSHELL" };
    [SDP]@{variable = $global:MY_BROWSER           ; value = "MY_BROWSER = $global:MY_BROWSER" };
    [SDP]@{variable = $global:MY_DOTNET_IDE        ; value = "MY_DOTNET_IDE = $global:MY_DOTNET_IDE" };
    [SDP]@{variable = $global:MY_JS_IDE            ; value = "MY_JS_IDE = $global:MY_JS_IDE" };
    [SDP]@{variable = $global:DEFAULT_START_PATH   ; value = "DEFAULT_START_PATH = $global:DEFAULT_START_PATH" };
)

# Check paths' validity
Foreach ($path in $SystemDependentPaths) {
    If ( ("" -eq $path.variable) -or (-not (Test-Path $path.variable)) ) {
        Write-Host -ForegroundColor red "Missing path: `"$($path.value)`""
    }
} 


# Git-related constants
$FIFTY_CHARS = "|--------1---------2---------3---------4---------|"

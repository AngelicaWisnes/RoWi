# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()


# Import system-dependent paths
$constantsRoot = $PSScriptRoot
$global:SYSTEM_NAME = WhoAmI #Alternative to WhoAmI:   [System.Security.Principal.WindowsIdentity]::GetCurrent().name
$global:SYSTEM_OS = [System.Environment]::OSVersion.VersionString


# Define dynamically defined paths
$global:SYSTEM_CONSTANTS_PATH = "$global:ROWI\Constants\SystemDependent\$global:SYSTEM_NAME\SystemDependentConstants.ps1" | Resolve-Path
$global:SYSTEM_PROJECTS_PATH = "$global:ROWI\Functions\Categories\SystemDependent\$global:SYSTEM_NAME\SystemDependentProjects.ps1" | Resolve-Path
$global:SYSTEM_FUNCTIONS_PATH = "$global:ROWI\Functions\Categories\SystemDependent\$global:SYSTEM_NAME\SystemDependentFunctions.ps1" | Resolve-Path

# Import SystemDependent Constants
. $global:SYSTEM_CONSTANTS_PATH

# Specify all relevant SystemDependentPaths:
class SDP { [string]$variable ; [string]$value } 
$SystemDependentPaths = @(
    [SDP]@{variable = $global:SYSTEM_CONSTANTS_PATH    ; value = "SYSTEM_CONSTANTS_PATH = $global:SYSTEM_CONSTANTS_PATH" };
    [SDP]@{variable = $global:SYSTEM_PROJECTS_PATH     ; value = "SYSTEM_PROJECTS_PATH = $global:SYSTEM_PROJECTS_PATH" };
    [SDP]@{variable = $global:SYSTEM_FUNCTIONS_PATH    ; value = "SYSTEM_FUNCTIONS_PATH = $global:SYSTEM_FUNCTIONS_PATH" };

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
$global:FIFTY_CHARS = "|--------1---------2---------3---------4---------|"


# Print-related constants
$global:COLOR_ESCAPE = "$([char]0x1b)"
IF ($PSVersionTable.PSVersion.Major -gt 5) { $global:COLOR_ESCAPE = "`e" }
$global:RGB_SEQUENCE = "$global:COLOR_ESCAPE[{0};2;{1};{2};{3}m"
$global:RESET_SEQUENCE = "$global:COLOR_ESCAPE[0m"


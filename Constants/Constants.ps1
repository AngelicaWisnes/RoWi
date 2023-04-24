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

# Colors
class COLOR { [string]$hex; [int]$r; [int]$g; [int]$b; } 
$global:colors = [ordered]@{
    # Light colors
    Red                = [COLOR]@{ hex = "#FF0000"; r = 255; g = 0; b = 0; };
    Orange             = [COLOR]@{ hex = "#FF8000"; r = 255; g = 128; b = 0; };
    Yellow             = [COLOR]@{ hex = "#FFFF00"; r = 255; g = 255; b = 0; };
    Chartreuse         = [COLOR]@{ hex = "#80FF00"; r = 128; g = 255; b = 0; };
    Lime               = [COLOR]@{ hex = "#00FF00"; r = 0; g = 255; b = 0; };
    SpringGreen        = [COLOR]@{ hex = "#00FF80"; r = 0; g = 255; b = 128; };
    Cyan               = [COLOR]@{ hex = "#00FFFF"; r = 0; g = 255; b = 255; };
    DarkCyan           = [COLOR]@{ hex = "#3A96DD"; r = 58; g = 150; b = 221; };
    DodgerBlue         = [COLOR]@{ hex = "#0080FF"; r = 0; g = 128; b = 255; };
    Blue               = [COLOR]@{ hex = "#0000FF"; r = 0; g = 0; b = 255; };
    ElectricIndigo     = [COLOR]@{ hex = "#8000FF"; r = 128; g = 0; b = 255; };
    Magenta            = [COLOR]@{ hex = "#FF00FF"; r = 255; g = 0; b = 255; };
    DeepPink           = [COLOR]@{ hex = "#FF0080"; r = 255; g = 0; b = 128; };
    MonaLisa           = [COLOR]@{ hex = "#FF8080"; r = 255; g = 128; b = 128; };
    MintGreen          = [COLOR]@{ hex = "#80FF80"; r = 128; g = 255; b = 128; };
    LightSlateBlue     = [COLOR]@{ hex = "#8080FF"; r = 128; g = 128; b = 255; };
    # Dark colors
    Maroon             = [COLOR]@{ hex = "#800000"; r = 128; g = 0; b = 0; };
    Olive              = [COLOR]@{ hex = "#808000"; r = 128; g = 128; b = 0; };
    Green              = [COLOR]@{ hex = "#008000"; r = 0; g = 128; b = 0; };
    Teal               = [COLOR]@{ hex = "#008080"; r = 0; g = 128; b = 128; };
    Navy               = [COLOR]@{ hex = "#000080"; r = 0; g = 0; b = 128; };
    Purple             = [COLOR]@{ hex = "#800080"; r = 128; g = 0; b = 128; };
    # Contrasts
    White              = [COLOR]@{ hex = "#FFFFFF"; r = 255; g = 255; b = 255; };
    Silver             = [COLOR]@{ hex = "#C0C0C0"; r = 192; g = 192; b = 192; };
    Gray               = [COLOR]@{ hex = "#808080"; r = 128; g = 128; b = 128; };
    Black              = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
    # SystemColors   Get their RGB values by foreach ($color in [System.ConsoleColor].GetEnumValues()) {[System.Drawing.Color]::FromName($color)}
    System_Black       = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
    System_DarkBlue    = [COLOR]@{ hex = "#00008B"; r = 0; g = 0; b = 139; };
    System_DarkGreen   = [COLOR]@{ hex = "#006400"; r = 0; g = 100; b = 0; };
    System_DarkCyan    = [COLOR]@{ hex = "#008B8B"; r = 0; g = 139; b = 139; };
    System_DarkRed     = [COLOR]@{ hex = "#8B0000"; r = 139; g = 0; b = 0; };
    System_DarkMagenta = [COLOR]@{ hex = "#8B008B"; r = 139; g = 0; b = 139; };
    System_DarkYellow  = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
    System_Gray        = [COLOR]@{ hex = "#808080"; r = 128; g = 128; b = 128; };
    System_DarkGray    = [COLOR]@{ hex = "#A9A9A9"; r = 169; g = 169; b = 169; };
    System_Blue        = [COLOR]@{ hex = "#0000FF"; r = 0; g = 0; b = 255; };
    System_Green       = [COLOR]@{ hex = "#008000"; r = 0; g = 128; b = 0; };
    System_Cyan        = [COLOR]@{ hex = "#00FFFF"; r = 0; g = 255; b = 255; };
    System_Red         = [COLOR]@{ hex = "#FF0000"; r = 255; g = 0; b = 0; };
    System_Magenta     = [COLOR]@{ hex = "#FF00FF"; r = 255; g = 0; b = 255; };
    System_Yellow      = [COLOR]@{ hex = "#FFFF00"; r = 255; g = 255; b = 0; };
    System_White       = [COLOR]@{ hex = "#FFFFFF"; r = 255; g = 255; b = 255; };
    # Colornames are taken from https://www.color-blindness.com/color-name-hue/
    # Hex-codes can visualize the corresponding color in VS-Code with this extention: https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
    # Pride-specific codes
    PrideWhite         = [COLOR]@{ hex = "#FFFFFF"; r = 255; g = 255; b = 255; };
    PridePink          = [COLOR]@{ hex = "#FFAFC7"; r = 255; g = 175; b = 199; };
    PrideCyan          = [COLOR]@{ hex = "#73D7EE"; r = 115; g = 215; b = 238; };
    PrideBrown         = [COLOR]@{ hex = "#613915"; r = 97; g = 57; b = 21; };
    PrideBlack         = [COLOR]@{ hex = "#000000"; r = 0; g = 0; b = 0; };
    PrideRed           = [COLOR]@{ hex = "#E50000"; r = 229; g = 0; b = 0; };
    PrideOrange        = [COLOR]@{ hex = "#FF8D00"; r = 255; g = 141; b = 0; };
    PrideYellow        = [COLOR]@{ hex = "#FFEE00"; r = 255; g = 238; b = 0; };
    PrideGreen         = [COLOR]@{ hex = "#028121"; r = 2; g = 129; b = 33; };
    PrideBlue          = [COLOR]@{ hex = "#004CFF"; r = 0; g = 76; b = 255; };
    PridePurple        = [COLOR]@{ hex = "#730088"; r = 115; g = 0; b = 136; };
    PrideBiPink        = [COLOR]@{ hex = "#B00B69"; r = 176; g = 11; b = 105; };
    PrideBiPurple      = [COLOR]@{ hex = "#A55EA7"; r = 165; g = 94; b = 167; };
    PrideBiBlue        = [COLOR]@{ hex = "#1D1CC9"; r = 29; g = 28; b = 201; };
    PrideNbYellow      = [COLOR]@{ hex = "#FFF433"; r = 255; g = 244; b = 51; };
    PrideNbPurple      = [COLOR]@{ hex = "#9B59D0"; r = 155; g = 89; b = 208; };
}


$global:colorChart = @{
    rainbow   = @( $colors.PrideRed, $colors.PrideOrange, $colors.PrideYellow, $colors.PrideGreen, $colors.PrideBlue, $colors.PridePurple );
    trans     = @( $colors.PrideCyan, $colors.PridePink, $colors.PrideWhite, $colors.PridePink, $colors.PrideCyan );
    bisexual  = @( $colors.PrideBiPink, $colors.PrideBiPurple, $colors.PrideBiBlue );
    nonbinary = @( $colors.PrideNbYellow, $colors.PrideWhite, $colors.PrideNbPurple, $colors.PrideBlack );
    norway    = @( $colors.Red, $colors.White, $colors.Blue, $colors.White, $colors.Red );
}
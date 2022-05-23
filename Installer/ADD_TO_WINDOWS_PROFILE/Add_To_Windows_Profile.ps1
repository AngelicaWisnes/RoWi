
# Run this script from a powershell, to add RoWi to that powershell's current user-profile
$RoWi_profile = "$PSScriptRoot\..\..\RoWi.ps1" | Convert-Path
"`n# Import RoWi profile `n. $RoWi_profile" | Out-File -FilePath $PROFILE.CurrentUserCurrentHost -Append -Encoding utf8

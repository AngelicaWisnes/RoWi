

Get-ChildItem D:\ "RoWi" -Recurse -Directory
Get-ChildItem -Exclude node* -Recurse "RoWi" -Directory -ErrorAction SilentlyContinue -Path "D:\"

Get-ChildItem -Path "D:\" -Recurse | Where-Object { $_.Name -match 'RoWi' } | Select-Object -First 1 Fullname
Get-ChildItem -Path "D:\" -Recurse -Exclude "*node*" -ErrorAction 'silentlycontinue'  | Where-Object { $_.Name -eq "RoWi.ps1" } | Select-Object -First 1


[string[]]$Paths = @('D:\')
[string[]]$Excludes = @('*node*')

$files = Get-ChildItem $Paths -Directory -Recurse -Exclude $Excludes | ForEach-Object { 
    $allowed = $true
    foreach ($exclude in $Excludes) { 
        If ((Split-Path $_.FullName -Parent) -ilike $exclude) { 
            $allowed = $false
            break
        }
    }
    If ($allowed) {
        $_
    }
} | Where-Object { $_.Name -match 'RoWi' } | Select-Object -First 1 Fullname

$files













function AddToPath {
    param ( 
        [string]$PathToAdd,
        [Parameter(Mandatory = $true)][ValidateSet('System', 'User')][string]$UserType,
        [Parameter(Mandatory = $true)][ValidateSet('Path', 'PSModulePath')][string]$PathType
    )

    # AddTo-Path "C:\XXX" "PSModulePath" 'System' 
    If ($UserType -eq "System" ) { $RegPropertyLocation = 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment' }
    If ($UserType -eq "User"   ) { $RegPropertyLocation = 'HKCU:\Environment' } # also note: Registry::HKEY_LOCAL_MACHINE\ format
    $PathOld = (Get-ItemProperty -Path $RegPropertyLocation -Name $PathType).$PathType
    "`n$UserType $PathType Before:`n$PathOld`n"
    $PathArray = $PathOld -Split ";" -replace "\\+$", ""
    If ($PathArray -notcontains $PathToAdd) {
        "$UserType $PathType Now:"   # ; sleep -Milliseconds 100   # Might need pause to prevent text being after Path output(!)
        $PathNew = "$PathOld;$PathToAdd"
        Set-ItemProperty -Path $RegPropertyLocation -Name $PathType -Value $PathNew
        Get-ItemProperty -Path $RegPropertyLocation -Name $PathType | Select-Object -ExpandProperty $PathType
        If ($PathType -eq "Path") { $env:Path += ";$PathToAdd" }                  # Add to Path also for this current session
        If ($PathType -eq "PSModulePath") { $env:PSModulePath += ";$PathToAdd" }  # Add to PSModulePath also for this current session
        "`n$PathToAdd has been added to the $UserType $PathType"
    }
    Else {
        "'$PathToAdd' is already in the $UserType $PathType. Nothing to do."
    }
}
# Add "C:\XXX" to User Path (but only if not already present)
AddToPath "C:\XXX" "User" "Path"
# Just show the current status by putting an empty path
AddToPath "" "User" "Path"
#https://stackoverflow.com/questions/714877/setting-windows-powershell-environment-variables
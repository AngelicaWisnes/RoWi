
$RoWi_profile = (Resolve-Path "$PSScriptRoot\..\..\RoWi.ps1").Path
$RoWi_import_statement = "`n# Import RoWi profile`n. $RoWi_profile`n"


function Confirm-Action {
    $response = Read-Host "Do you want to proceed? [Y/N] (Default: Y)"
    if ($response -eq 'Y' -or $response -eq 'y' -or $response -eq '') {
        Write-Host -ForegroundColor Cyan "Proceeding..."
        return $true
    }
    else {
        Write-Host -ForegroundColor Red "Cancelled"
        return $false
    }
}

function Add-RowiToPowershell5Profile {
    Write-Host -ForegroundColor Cyan "Starting - Adding RoWi to PowerShell 5 profile: "
    if (Confirm-Action) { Add-Content -Path $PROFILE.CurrentUserCurrentHost -Value $RoWi_import_statement -Encoding utf8 }
    Write-Host -ForegroundColor Cyan "  Finished - Adding RoWi to PowerShell 5 profile"
}

function Add-RowiToPowershell7Profile {
    Write-Host -ForegroundColor Cyan "Starting - Adding RoWi to PowerShell 7 profile: "
    if (Install-Powershell7 -and Confirm-Action) { 
        $profilePath = if ($IsWindows) { Join-Path $env:ProgramData 'PowerShell\Microsoft.PowerShell_profile.ps1' } else { Join-Path $env:HOME '.config/powershell/Microsoft.PowerShell_profile.ps1' }
        Add-Content -Path $profilePath -Value $RoWi_import_statement -Encoding utf8 
    }
    Write-Host -ForegroundColor Cyan "  Finished - Adding RoWi to PowerShell 7 profile"
}

function Add-RowiToPowershell7Profile_NOT_FINISHED {
    Write-Host -ForegroundColor Cyan "Starting - Adding RoWi to PowerShell 7 profile: "
    if (Install-Powershell7 -and Confirm-Action) { 
        $ps7Command = "Add-Content -Path `$PROFILE.CurrentUserCurrentHost -Value '$RoWi_import_statement' -Encoding utf8"
        $ps7ScriptBlock = [scriptblock]::Create($ps7Command)
        $ps7Process = Start-Process pwsh -ArgumentList "-NoExit", "-Command", $ps7ScriptBlock -PassThru
        $ps7Process.WaitForExit()
    }
    Write-Host -ForegroundColor Cyan "  Finished - Adding RoWi to PowerShell 7 profile"
}













function Install-PowerShell7 {
    Write-Host -ForegroundColor Cyan "Checking if PowerShell 7 is installed..."
    
    if (!(Get-Command "pwsh" -ErrorAction SilentlyContinue)) {
        Write-Host -ForegroundColor Red "PowerShell 7 is not installed..."
        Write-Host -ForegroundColor Cyan "Staring - Installing PowerShell 7..."  

        if (Confirm-Action) { winget install --id Microsoft.PowerShell -e }   
        
        if (!(Get-Command "pwsh" -ErrorAction SilentlyContinue)) { 
            Write-Host -ForegroundColor Red "Failed installation" 
            return $false
        }
        Write-Host -ForegroundColor Cyan "Installed Successfully" 
    }
    
    Write-Host -ForegroundColor Cyan "  Finished - PowerShell 7 is installed"
    return $true
}


function Install-RoWi {
    Write-Host -ForegroundColor Cyan "Starting - Installing the RoWi-package to PowerShell..."
    
    Add-RowiToPowershell5Profile
    Add-RowiToPowershell7Profile

    Write-Host -ForegroundColor Cyan "  Finished - The RoWi-package is installed PowerShell..."
}







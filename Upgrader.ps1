
function upgradeWinget {
  winget upgrade --all
}


function upgradeChoco {
  choco upgrade all
  # choco upgrade all --except="'skype,conemu'"
}




$upgraderJob_winget = Start-Job -ScriptBlock {
  class Software {
    [string]$Name
    [string]$Id
    [string]$Version
    [string]$AvailableVersion
  }
  
  $lines = (winget upgrade | Out-String).Split([Environment]::NewLine)
  
  # Find the line that starts with Name, it contains the header
  $fl = 0
  while (-not $lines[$fl].StartsWith("Name")) { $fl++ }
  
  # Line $fl has the header, we can find char where we find ID and Version
  $idStart = $lines[$fl].IndexOf("Id")
  $versionStart = $lines[$fl].IndexOf("Version")
  $availableStart = $lines[$fl].IndexOf("Available")
  $sourceStart = $lines[$fl].IndexOf("Source")
  
  # Now cycle in real package and split accordingly
  $upgradeList_winget = @()
  For ($i = $fl + 1; $i -le $lines.Length; $i++) {
    $line = $lines[$i]
    If ($line.Length -gt ($availableStart + 1) -and -not $line.StartsWith('-')) {
      $name = $line.Substring(0, $idStart).TrimEnd()
      $id = $line.Substring($idStart, $versionStart - $idStart).TrimEnd()
      $version = $line.Substring($versionStart, $availableStart - $versionStart).TrimEnd()
      $available = $line.Substring($availableStart, $sourceStart - $availableStart).TrimEnd()

      $upgradeList_winget += [Software]@{ 
        Name             = $name
        Id               = $id
        Version          = $version
        AvailableVersion = $available
      }
    }
  }

  Return $upgradeList_winget | Format-Table
}

$upgraderJob_choco = Start-Job -ScriptBlock {
  Return choco outdated -r | ConvertFrom-Csv -Delimiter '|' -Header 'Name', 'Version', 'AvailableVersion', 'Pinned?' | Format-Table
}






function upgradeSkip {
  #$toSkip = @(
  #  'Microsoft.dotnetRuntime',
  #  'Microsoft.dotnet',
  #  'Python.Python.3',
  #  "OpenWhisperSystems.Signal",
  #  "Spotify.Spotify"
  #)
    
  $skippedPackages = @()
    
  foreach ($package in $upgradeList_winget) {
    # If (-not ($toSkip -contains $package.Id)) {}
    If ($package.Version -ne "Unknown") {
      winget upgrade $package.id
    }
    Else {    
      #$skippedPackages += $package
    }
  }
    
  If ($skippedPackages.Count -gt 0) {
    Write-Host -ForegroundColor Cyan "The following packages were not upgraded"
    $skippedPackages | Format-Table
  }
}
  
  
  
  
  
  
function print_upgrader {
  Receive-Job -Job $upgraderJob_winget
  Receive-Job -Job $upgraderJob_choco
}
Set-Alias u print_upgrader
  
function PRINT_UPGRADER_INFO {
  Write-Host -ForegroundColor Red "Enter 'u' to list all available 'winget'- and 'choco'-upgrades "
}



function COPY_ZIPPED_PROFILE_DIRECTORY {
  $profileDirectory = "$PSScriptRoot\.." | Convert-Path
  $profileDirectoryZip = "$profileDirectory.zip"

  Compress-Archive -Path $profileDirectory -DestinationPath $profileDirectory
  Set-Clipboard -Path $profileDirectoryZip
  
  Write-Host -ForegroundColor Cyan "'$profileDirectoryZip' is copied to clipboard. Paste it where you want it, and press any key to clean up..."
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
  Remove-Item $profileDirectoryZip
}

function INSTALL_TERMINAL {
  # Install Windows Terminal
  #winget install --id Microsoft.WindowsTerminal

  #Desired path for shortcur placement
  $path = "$PSScriptRoot\InstallSources"
  $shortcutPath = "$path\Windows Terminal.lnk"

  # Create shortcut
  $WshShell = New-Object -comObject WScript.Shell
  $Shortcut = $WshShell.CreateShortcut($shortcutPath)
  $Shortcut.TargetPath = "%LocalAppData%\Microsoft\WindowsApps\wt.exe"
  $shortcut.IconLocation = "$PSScriptRoot\InstallSources\terminal.ico"
  $Shortcut.Save()

  # Make the shortcut rus as administrator
  $bytes = [System.IO.File]::ReadAllBytes($shortcutPath)
  $bytes[0x15] = $bytes[0x15] -bor 0x20 #set byte 21 (0x15) bit 6 (0x20) ON (Use –bor to set RunAsAdministrator option and –bxor to unset)
  [System.IO.File]::WriteAllBytes($shortcutPath, $bytes)

  # Pin to taskbar
  o $path
  Write-Host -ForegroundColor Cyan "This next step must be done manually:
  - Right-click on
  `t $shortcutPath
  - Select 'Pin to taskbar'"
}

function CREATE_PS7_ADMIN_SHORTCUT {
  #Desired path for shortcur placement
  $shortcutPath = "$PSScriptRoot\InstallSources\Powershell7.lnk"

  # Create shortcut
  $WshShell = New-Object -comObject WScript.Shell
  $Shortcut = $WshShell.CreateShortcut($shortcutPath)
  $Shortcut.TargetPath = "C:\Program Files\PowerShell\7\pwsh.exe"
  $Shortcut.Save()

  # Make the shortcut rus as administrator
  $bytes = [System.IO.File]::ReadAllBytes($shortcutPath)
  $bytes[0x15] = $bytes[0x15] -bor 0x20 #set byte 21 (0x15) bit 6 (0x20) ON (Use –bor to set RunAsAdministrator option and –bxor to unset)
  [System.IO.File]::WriteAllBytes($shortcutPath, $bytes) 
}
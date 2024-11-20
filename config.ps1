# copy ahk files to autostart
if (-not (Test-Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup")) {
    New-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\*.ahk" -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\"

# copy icons
$MyDocuments = [environment]::GetFolderPath('MyDocuments')
Copy-Item "$PSScriptRoot\config_files\virtual_desktop_icons" -Destination $MyDocuments -Recurse

# move initial greenshot settings
if (-not (Test-Path "$env:APPDATA\Greenshot")) {
    New-Item -Path "$env:APPDATA\Greenshot" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\Greenshot.ini" -Destination "$env:APPDATA\Greenshot\Greenshot.ini"

# move initial n++ settings
if (-not (Test-Path "$env:APPDATA\Notepad++")) {
    New-Item -Path "$env:APPDATA\Notepad++" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\notepad_config.xml" -Destination "$env:APPDATA\Notepad++\config.xml"
Copy-Item "$PSScriptRoot\config_files\notepad_themes" -Destination "$env:APPDATA\Notepad++\themes" -Recurse

# move initial brave settings
if (-not (Test-Path "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default")) {
    New-Item -Path "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\brave_Preferences" -Destination "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Preferences"
Copy-Item "$PSScriptRoot\config_files\brave_Secure_Preferences" -Destination "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Secure Preferences"

# Disable Search Bar on Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0

# Change Start Menu Layout to "More Pins"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_Layout" -Value 1

# Set File Explorer to open "This PC" by default
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1

# Show Hidden Files
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1

# Disable Windows snap suggestions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SnapAssist" -Value 0

# Show all open windows when I press Alt+Tab from all Desktops
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "VirtualDesktopAltTabFilter" -Value 0

# On the taskbar, show all the open windows from all Desktops
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "VirtualDesktopTaskbarFilter" -Value 0

# Always show full path
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DontPrettyPath" -Value 1

# Show File Extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0

# Disable Snipping tool on print screen key (so that greenshot can use it)
Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "PrintScreenKeyForSnippingEnabled" -Value 0

# Set Windows sound scheme to No Sounds
Set-ItemProperty -Path "HKCU:\AppEvents\Schemes" -Name "(Default)" -Type String -Value ".None"
Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" | Get-ChildItem | Get-ChildItem | Where-Object {$_.PSChildName -eq ".Current"} | Set-ItemProperty -Name "(Default)" -Value ""

# Restart Explorer to Apply Changes
Stop-Process -Name explorer -Force

# Install ubuntu
wsl --install

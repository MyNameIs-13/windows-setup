# copy ahk files to autostart
if (-not (Test-Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup")) {
    New-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\start_ahk_scripts.ahk" -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\"

# copy icons
$MyDocuments = [environment]::GetFolderPath('MyDocuments')
if (-not (Test-Path "$MyDocuments\AutoHotKey")) {
    New-Item -Path "$MyDocuments\AutoHotKey" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\virtual_desktop_icons" -Destination "$MyDocuments\AutoHotKey" -Recurse
Copy-Item "$PSScriptRoot\config_files\*.ahk" -Destination "$MyDocuments\AutoHotKey\"

# move initial greenshot settings
#if (-not (Test-Path "$env:APPDATA\Greenshot")) {
#    New-Item -Path "$env:APPDATA\Greenshot" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
#}
#Copy-Item "$PSScriptRoot\config_files\Greenshot.ini" -Destination "$env:APPDATA\Greenshot\Greenshot.ini"

# copy initial PowerToys settings
if (-not (Test-Path "$env:LOCALAPPDATA\Microsoft\PowerToys")) {
    New-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\PowerToys" -Destination "$env:LOCALAPPDATA\Microsoft\PowerToys" -Recurse

# copy initial n++ settings
if (-not (Test-Path "$env:APPDATA\Notepad++")) {
    New-Item -Path "$env:APPDATA\Notepad++" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\notepad_config.xml" -Destination "$env:APPDATA\Notepad++\config.xml"
Copy-Item "$PSScriptRoot\config_files\notepad_themes" -Destination "$env:APPDATA\Notepad++\themes" -Recurse

# copy initial brave settings
if (-not (Test-Path "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default")) {
    New-Item -Path "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\brave_Preferences" -Destination "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Preferences"
Copy-Item "$PSScriptRoot\config_files\brave_Secure_Preferences" -Destination "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Secure Preferences"

if (-not (Test-Path "$env:USERPROFILE\Documents")) {
    New-Item -Path "$env:USERPROFILE\Documents" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
# copy oh-my-posh settings
Copy-Item "$PSScriptRoot\config_files\skodo.omp.json" -Destination "$env:USERPROFILE\Documents\skodo.omp.json"
# copy pycharm bat
Copy-Item "$PSScriptRoot\config_files\pycharm.bat" -Destination "$env:USERPROFILE\Documents\pycharm.bat"

# copy powershell settings
if (-not (Test-Path "$env:USERPROFILE\Documents\WindowsPowerShell")) {
    New-Item -Path "$env:USERPROFILE\Documents\WindowsPowerShell" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\WindowsPowerShell" -Destination "$env:USERPROFILE\Documents\WindowsPowerShell" -Recurse

# copy terminal settings
if (-not (Test-Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe")) {
    New-Item -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe" -Type Directory -Force -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item "$PSScriptRoot\config_files\terminal_settings.json" -Destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\settings.json"

# Disable Search Bar on Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0

# Change Start Menu Layout to "More Pins"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_Layout" -Value 1

# Disable WebSearch
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0

# Use centered Taskbar layouyt
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 1

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
#Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "PrintScreenKeyForSnippingEnabled" -Value 0

# Set Windows sound scheme to No Sounds
Set-ItemProperty -Path "HKCU:\AppEvents\Schemes" -Name "(Default)" -Type String -Value ".None"
Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" | Get-ChildItem | Get-ChildItem | Where-Object {$_.PSChildName -eq ".Current"} | Set-ItemProperty -Name "(Default)" -Value ""

# Restart Explorer to Apply Changes
Stop-Process -Name explorer -Force

# Install ubuntu
#wsl --install
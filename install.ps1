#Requires -RunAsAdministrator

# Install tools/programs/apps - direct download links
Add-AppxPackage -Path https://cdn.winget.microsoft.com/cache/source.msix # force source update
$programs = @(
    '7zip.7zip' # https://7-zip.org/a/7z2408-x64.exe
    'Notepad++.Notepad++' # https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.1/npp.8.7.1.Installer.x64.exe
    'Greenshot.Greenshot' # https://github.com/greenshot/greenshot/releases/download/Greenshot-RELEASE-1.2.10.6/Greenshot-INSTALLER-1.2.10.6-RELEASE.exe
    'KeePassXCTeam.KeePassXC' # https://github.com/keepassxreboot/keepassxc/releases/download/2.7.9/KeePassXC-2.7.9-Win64.msi
    'Brave.Brave' # https://laptop-updates.brave.com/latest/winx64
    'AutoHotkey.AutoHotkey' # https://www.autohotkey.com/download/ahk-v2.exe
)
winget install  --accept-source-agreements --accept-package-agreements --scope machine --source winget --silent --exact ${programs}

# Install wsl2 requirements
wsl --install --no-distribution

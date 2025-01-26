# Windows Setup

## Download

with git installed:

```powershell
Set-Location "${env:SYSTEMDRIVE}\"
git clone https://github.com/MyNameIs-13/windows-setup
```

without git installed:

```powershell
Invoke-WebRequest -Uri "https://github.com/MyNameIs-13/windows-setup/archive/main.zip" -OutFile "${env:USERPROFILE}\windows-setup.zip"
Expand-Archive -Path "${env:USERPROFILE}\windows-setup.zip" -DestinationPath "${env:SYSTEMDRIVE}\"
Rename-Item -Path "${env:SYSTEMDRIVE}\windows-setup-main" -NewName "windows-setup"
Remove-Item -Path "${env:USERPROFILE}\windows-setup.zip"
```

## Install programs

Open an powershell and run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
. "${env:USERPROFILE}\windows-setup\install.ps1"
```

reboot/shutdown

## Apply Configuration

Open powershell and run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
. "${env:USERPROFILE}\windows-setup\config.ps1"
```

reboot/shutdown

## Manual Configuration Steps

- Set Start Menu pins
- Set Taskbar pins
- disable Desktop Icons
- install https://keepassxc.org/ portable

- Settings
  - System
    - Sound
      - More sound settings
        - Sounds
          - Play Windows Startup sound : disable
  - Personalization
    - Start
      - Show recently added apps : disable
      - Show recommended files in start, recent files in Explorer, and items in Jump Lists : disable
      - Show recommendations for tips, shortcuts, new apps, and more : disable
    - Taskbar
      - Other system tray icons
        - Autohotkey : enable
  - Apps
    - Startup
      - Microsoft Edge : disable
	  - Check others to be disabled
  - Time & language
    - <Language> ...: (click on the dots)
      - Add a keyboard
        - US
      - Delete Others
    - Country or region
      - Change to desired
    - Regional format
      - Change formats
        - Change to desired formats
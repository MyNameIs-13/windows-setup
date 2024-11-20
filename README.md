# Windows Setup

## Install programs

Open an elevated powershell
navigate to the `windows_setup` directory and run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
./install.ps1
```

## Apply Configuration

Open powershell
navigate to the `windows_setup` directory and run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
./config.ps1
```

## Manual Configuration Steps

Set Start Menu pins
Set Taskbar pins
Desktop Icons

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

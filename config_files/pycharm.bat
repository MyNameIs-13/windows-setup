@echo off
setlocal enabledelayedexpansion
 
set "jetbrainsDir=C:\Program Files (x86)\JetBrains"
pushd "%jetbrainsDir%"
 
for /F "tokens=* delims=" %%a in ('dir /AD /B /O-N') do (
	set lastvalue=%%a
	goto break
)
:break
	
start "" "%jetbrainsDir%\!lastvalue!\bin\pycharm64.exe" %*
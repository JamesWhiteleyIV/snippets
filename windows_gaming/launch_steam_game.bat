@echo off
cls

set STEAMUSER=%1
set GAMEID=%2

:: get current steam user to see if we need to set new one
for /f "tokens=3" %%a in ('reg query "HKCU\Software\Valve\Steam" /v AutoLoginUser ^|findstr /ri "REG_SZ"') do set CURSTEAMUSER=%%a

if "%CURSTEAMUSER%" == "%STEAMUSER%" goto :launch

:: update steam user if different
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %STEAMUSER% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f

:: kill old users' instances of steam and overlay
taskkill /F /IM "Steam.exe"
taskkill /F /IM "GameOverlayUI.exe"
timeout /t 2

:launch
:: To just open steam:
::start "" "steam://open/main"

:: To run a steam game:
start "" "steam://rungameid/%GAMEID%"

@echo on

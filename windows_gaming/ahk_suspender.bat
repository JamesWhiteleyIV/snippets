echo off

set PROGRAM1=AutoHotkey.exe
set PROGRAM2=ModernWarfare.exe 
set PROGRAM3=DOOMx64.exe 
set INITIAL_TIMEOUT=60
set CHECK_TIMEOUT=10

tasklist /FI "IMAGENAME eq %PROGRAM1%" 2>NUL | find /I /N "%PROGRAM1%">NUL

REM if AHK is running, kill it and sleep 
if "%ERRORLEVEL%"=="0" (
    taskkill /f /im "%PROGRAM1%"
    timeout /t %INITIAL_TIMEOUT% 
)

REM if COD is running, sleep and go back to loop
:loop
tasklist /FI "IMAGENAME eq %PROGRAM2%" 2>NUL | find /I /N "%PROGRAM2%">NUL
if "%ERRORLEVEL%"=="0" (
    timeout /t %CHECK_TIMEOUT% 
    goto loop
) else (
    start "" C:\Users\james\google_drive\programming\autohotkey\hotkeys.ahk
)

REM if Doom is running, sleep and go back to loop
tasklist /FI "IMAGENAME eq %PROGRAM3%" 2>NUL | find /I /N "%PROGRAM3%">NUL
if "%ERRORLEVEL%"=="0" (
    timeout /t %CHECK_TIMEOUT% 
    goto loop
) else (
    start "" C:\Users\james\google_drive\programming\autohotkey\hotkeys.ahk
)



echo on

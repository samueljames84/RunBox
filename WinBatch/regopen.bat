@echo off
Title Opening Registry
MODE 64,15
color 8F

setlocal enabledelayedexpansion
set /a ArgCount = 0
set Temppath=dummyvalue


:: Use PowerShell to get clipboard content and assign it to a variable in batch
for /f "delims=" %%A in ('powershell -command "Get-Clipboard"') do set "clipboardText=%%A"

:: Display the clipboard content
echo Clipboard Text: %clipboardText%


:: Check if the variable is not empty and its first character is H
if not "%clipboardText%"=="" if /i "%clipboardText:~0,1%"=="H" (
    echo Opening Registry....
    start "" regjump.exe %clipboardText%
    exit /b 
    
) else (
    echo No Valid Reg Path in the Clipboard.
    echo enter any key to exit
    timeout -t 5
)


:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\git_shell
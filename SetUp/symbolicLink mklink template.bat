:: Run as admin
@echo off
REM Get the Documents Folder Dynamically in Win 10 and Above especially when you have onedrive
for /f "tokens=*" %%i in ('powershell -command "[Environment]::GetFolderPath('MyDocuments')"') do set DocumentsPath=%%i

set "MainSource=%~dp0_Library"
set "DestLink=%DocumentsPath%\ExpressPCB"
mklink /D "%DestLink%" "%MainSource%" 
pause
exit

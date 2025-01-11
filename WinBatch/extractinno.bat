@echo off
Title Extracting Inno Setup File

@echo off
setlocal enabledelayedexpansion

:: Get the path from an argument
set "ArgumentPath=%~1"


for %%F in ("%ArgumentPath%") do set "FolderAndFile=%%~dpnF"
if not exist "%FolderAndFile%" (
     mkdir "%FolderAndFile%"
) 
cls
echo innoextract -e -d "%FolderAndFile%" "%~1"
innoextract -e -d "%FolderAndFile%" "%~1"
exit /b 

:: =====================================================================
:: =====================================================================

:: Display the results
echo Input Path: %inputPath%
echo Folder Path: %folderPath%
echo File Name: %fileName%
echo File Name (no extension): %fileNameWithoutExt%
echo File Extension: %fileExt%

for %%F in ("%ArgumentPath%") do (
     :: Extract the folder path
     set "folderPath=%%~dpF"

     :: Extract the file name with extension
     set "fileName=%%~nxF"

     :: Extract the file name without extension
     set "fileNameWithoutExt=%%~nF"
     
     :: Extract the file extension
     set "fileExt=%%~xF"

     set FolderAndFile=%%~dpnF"
)
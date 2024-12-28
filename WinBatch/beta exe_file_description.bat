@echo off
set "exe_path=%~1"
set "wmic_path=%exe_path:\=\\%"

:: Get the description of the file using wmic
:: for /f "tokens=2 delims==" %%I in ('wmic datafile where "name='%exe_path:\=\\%'" get Description /value 2^>nul') do set "description=%%I"
for /f "tokens=1* delims==" %%I in ('wmic datafile where "name='%wmic_path%'" get Description /value 2^>nul') do if "%%I"=="Description" set "description=%%J"

:: Check if the description was found
if defined description (
     echo %description% | clip
     start ShowTootip "File Discription: %description%"
echo Description: %description%
) else (
echo No description found or file does not exist.
)
exit /b 


@echo off
setlocal enabledelayedexpansion
set /a ArgCount = 0
set Temppath=dummyvalue

:Loop
  if "%~1"=="" goto EndLoop
  set /a ArgCount += 1
  set [File.!ArgCount!]=%~1
  shift
goto Loop
:EndLoop

for /l %%i in (1, 1, %ArgCount%) do (
set TempPath=![File.%%i]!
for %%F in ("!TempPath!") do (
set FileName=%%~nF
set FileExt=%%~xF
set FullName=%%~nxF
set FilePath=%%~dpnF
)
REM ============= Loop start here =============


exiftool "!Temppath!"
 
pause
 
 
REM ==========================================================================
)


exit


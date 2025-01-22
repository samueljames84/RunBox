@echo off
Title Opening Registry
MODE 64,15
color 8F

setlocal enabledelayedexpansion
set /a ArgCount = 0
set Temppath=dummyvalue


exiftool.exe "%~1"
pause
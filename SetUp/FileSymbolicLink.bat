:: Run as admin
@echo off
::set MainSource="%~dp0wizard"

set "MainSource=C:\Windows\SystemResources\shell32.dll.mun"
set "DestLink=D:\Library\RunBox\IconPacks\shell32.dll.mun"

mklink "%DestLink%" %MainSource%
pause
exit

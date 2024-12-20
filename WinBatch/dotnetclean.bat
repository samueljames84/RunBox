
@echo off

echo Cleaning in progress.......
echo dotnet clean --output  "%~1"
dotnet clean --output  "%~1"

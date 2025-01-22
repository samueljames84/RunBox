
@echo off

echo Creating new .net6 project
echo dotnet new console --framework net6.0 --output "%~1"
dotnet new console --framework net6.0 --output "%~1"

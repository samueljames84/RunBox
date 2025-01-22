@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM <document>
REM <head>Why we don't use ::</head>
REM <body>
REM I discovered, horrified, that using :: in the wrong place in a program
REM can crash them. Thus, I DO NOT INCLUDE THEM ANYMORE. Durr.
REM </body></document>

REM <document>
REM <head>Why a "!" ?</head> 
REM <body>
REM I got a good deal of help from
REM http://blog.crankybit.com/why-that-batch-for-loop-isnt-working/
REM
REM "The key is the setlocal EnableDelayedExpansion command.
REM making this statement before your FOR loop will enable you to display
REM variables as their value at the moment you're referencing them, or their
REM "intermediate values" while in the middle of the FOR loop. In addition to
REM calling the setlocal command, you then have to reference your variables with
REM the exclamation point (!) rather than percent (%) to indicate that you want
REM to use the intermediate value."
REM </body></document>

REM <document>
REM <head>Extra</head>
REM <body>
REM Extra documentation available by typing the following into DOS prompt:
REM help set       -- srsly crazy string and ! info
REM help for       -- info about loops, tokens, more
REM help setlocal  -- how to use in batch
REM help ren       -- weird
REM help shift     -- how/when to use it
REM aapt -?        -- Documentation is spread out weird, beware
REM
REM If you don't have AAPT or ADB, get them here:
REM http://qtadb.wordpress.com/download/
REM </body></document>

REM clear possible app name and version
set apkname=
set apkver=

REM Only execute on one variable
IF NOT "%~1"=="" (
  IF "%~2"=="" (
    
    REM ex: "%~dp0aapt" dump badging "%~1"

    "%~dp0aapt" dump badging "%~1">nul
    if ERRORLEVEL 1 (
      echo ERROR: Badly formatted apk (is it an apk?^)
      pause
      goto :eof
    )
    

    REM OKAY, WTF DID I DO HERE?
    REM I don't understand why I needed two quotes at the beginning (eg "")
    REM and then this weird ^" at the end... makes no sense!

    for /f "tokens=1,2,5,6 usebackq delims=^'" %%i in (`""%~dp0aapt^" dump badging "%~1"`) do (

      REM get app label
      if "%%i"=="application: label=" (
        set apkname=%%j
      )


      REM get app version
      if "%%k"==" versionName=" (
        set apkver=%%l
      )
    )


    if "!apkname!"=="" (
      echo ERROR: Could not find name.
      goto :eof
    )
    if "!apkver!"=="" (
      echo ERROR: Could not find version.
      goto :eof
    )

    REM if weve gotten this far... this should work.
    echo on
    ren "%~dpnx1" "!apkname!_!apkver!.apk"
    @echo off
    echo Success: !apkname!_!apkver!.apk


  ) else (
    REM More than one apk to format
    goto domulti
  )
) else (

  REM There were no arguments. Show help with app's name.

  echo.
  echo.  %~n0%
  echo.  ==============
  echo.
  echo.  Rename apk files with the form ApkName_1.0.apk (e.g. showing
  echo.  first the filename, then an underscore, than its version number^).
  echo.
  echo.  SYNTAX: %~n0 myfile.apk
  echo.          %~n0 myfile.apk myfile2.apk [etc]
)

goto :eof


REM Description of what "domulti" does
REM 1. call this app with each argument
REM 2. get next arg
REM 3. repeat while the arg exists
REM 4. when done, close

:domulti
  call "%~dpnx0" "%~dpnx1"
  shift /1
  if not "%~1"=="" goto domulti
  goto :eof

:setapkname
  set apkname=


@echo off

:checkini
if exist "%1" (
set _ini_location=%1
echo.Ini folder read-value [value=%_shortcut_folder%]
goto checkoutfolder
)

set _ini_location=ini

:checkoutfolder
if exist "%HOMEDRIVE%%HOMEPATH%\Desktop" (
set _shortcut_folder=%HOMEDRIVE%%HOMEPATH%\Desktop
echo.Shortcut default-value [value=%_shortcut_folder%]
goto createshortcut
)

if exist "%2" (
set _shortcut_folder=%2
echo.Shortcut read-value [value=%_shortcut_folder%]
goto createshortcut
)

goto error

:createshortcut
@for %%a in (%_ini_location%\*.ini) do shortcut.vbs "%_shortcut_folder%\%%~na.lnk" "%comspec%" "/k  %~dps0buildenv.bat %%~dfsa"
echo.Shortcuts created.
set _shortcut_folder=
set _ini_location=
goto eof

:error
echo.Could not locate scripts 
echo.Ini folder read-value [value=%_shortcut_folder%]
echo.Shortcut read-value [value=%_shortcut_folder%]

:eof
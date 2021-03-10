REM Try to detect if the script was started by double-clicking on it from, f.i., Windows explorer.
REM This is the case when the intern variable %cmdcmdline% contains the "/c" parameter.
REM Note: %cmdcmdline% is empty if the script has been fired from DOS otherwise, looks like this:
REM C:\WINDOWS\system32\cmd.exe /c ""C:\...\docker-up.bat" "
REM When "/c" is found, ERRORLEVEL is set to 0 so, it's Windows.
REM https://stackoverflow.com/a/12036163/1065340

echo %cmdcmdline% | find /i "/c" >nul 2>&1

if %errorlevel% EQU 0 (
    echo.
    pause
)

@ECHO OFF

SETLOCAL EnableDelayedExpansion

SET outputFile=%tmp%\test.log

REM Any statements... the objective here is just to create a log file
DIR *.* > %outputFile%

REM Open the log
IF EXIST %outputFile% (

    SET notepad=notepad.exe

    WHERE "notepad++.exe" /Q

    IF !errorlevel!==0 (
        FOR /F "tokens=*" %%g IN ("where notepad++.exe") do (        
            SET notepad=%%g
        )
    )

    REM Start notepad++.exe is present otherwise start notepad.exe
    START "!notepad!" %outputFile%
)

ENDLOCAL

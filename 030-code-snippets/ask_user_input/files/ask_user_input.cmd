@ECHO OFF

CHOICE /C 1230 /M "Press 1 ... or 2 ... or 3  ... or 0 to quit"

IF "%ERRORLEVEL%"=="1" SET ANSWER=You've choosen for 1
IF "%ERRORLEVEL%"=="2" SET ANSWER=You've choosen for 2
IF "%ERRORLEVEL%"=="3" SET ANSWER=You've choosen for 3
IF "%ERRORLEVEL%"=="4" SET ANSWER=You've choosen to cancel

ECHO Your choice: %ANSWER%

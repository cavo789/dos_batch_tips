@ECHO off
REM Call doIit with two parameters, we can imagine that the first
REM parameter can be any extension and the second is an action
REM like open/copy/print/...
CALL :doIt "PDF" "OPEN"
EXIT/B

:doIt
    ECHO Generate %~1 files and, when done, %~2 them
    GOTO:EOF

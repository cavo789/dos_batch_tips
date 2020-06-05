@ECHO off
cls

CALL :getBaseNameWithoutExtension C:\Folder\SubFolder\test.txt

REM Display test
ECHO Basename without extension is "%BaseNameWithoutExtension%"

GOTO END:

::--------------------------------------------------------
::-- getBaseNameWithoutExtension - Get basename of a file w/ extension
::--    %1 A filename
::--
::-- Return "test" when %1 is "C:\Folder\SubFolder\test.txt"
::--------------------------------------------------------
:getBaseNameWithoutExtension
    SET BaseNameWithoutExtension=%~n1
    GOTO:EOF

:END

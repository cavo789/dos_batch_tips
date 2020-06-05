@ECHO off
cls

CALL :getBaseNameWithExtension C:\Folder\SubFolder\test.txt

REM Display test.txt
ECHO Basename with extension is "%BaseNameWithExtension%"

GOTO END:

::--------------------------------------------------------
::-- getBaseNameWithExtension - Get basename + ext of a file
::--    %1 A filename
::--
::-- Return "test.txt" when %1 is "C:\Folder\SubFolder\test.txt"
::--------------------------------------------------------
:getBaseNameWithExtension
    SET BaseNameWithExtension=%~nx1
    GOTO:EOF

:END

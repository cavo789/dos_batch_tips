@ECHO off
cls

CALL :getFileExtension C:\file.xlsx

REM Display xlsx
ECHO File extension is "%FileExtension%"

GOTO END:

::--------------------------------------------------------
::-- getFileExtension - Get the file's extension
::--    %1 A filename
::--
::-- Return "xlsx" when %1 is "C:\file.xlsx"
::--------------------------------------------------------
:getFileExtension
    SET FileExtension=%~x1
    GOTO:EOF

:END

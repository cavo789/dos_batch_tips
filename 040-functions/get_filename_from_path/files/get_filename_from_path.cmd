@ECHO off
cls

CALL :getFileNameFromPATH notepad++.exe

REM If Notepad++.exe is in the PATH, return the full name
REM of the file f.i. C:\Program Files\Notepad++\notepad++.exe
ECHO File name is %FileNameFromPATH%

GOTO END:

::--------------------------------------------------------
::-- getFileNameFromPATH - Get the full name of a file
::--    that is present in the PATH. Return the first occurrence
::--    If the file isn't found, returns an empty string
::--
::--    %1 A filename
::--
::-- Return a number, the size in bytes
::--------------------------------------------------------
:getFileNameFromPATH
    SET FileNameFromPATH=%~$PATH:1
    GOTO:EOF

:END

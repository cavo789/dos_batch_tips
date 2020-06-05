@ECHO off
cls

CALL :getFileSize C:\Temp\test.bat

REM Display the filesize
ECHO File size is %FileSize%

GOTO END:

::--------------------------------------------------------
::-- getFileSize - Get the file size in bytes
::--    %1 A filename
::--
::-- Return a number, the size in bytes
::--------------------------------------------------------
:getFileSize
    SET FileSize=%~z1
    GOTO:EOF

:END

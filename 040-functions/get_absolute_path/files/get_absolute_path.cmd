@ECHO off
cls

CALL :getAbsolutePath %~dp0..\..\..\..\..\..\autoexec.bat

REM Display C:\autoexec.bat
ECHO %AbsolutePath%

GOTO END:

::--------------------------------------------------------
::-- getAbsolutePath - Make a path absolute, like reapath() does
::--    %1 A filename
::--
::-- Return "C:\Temp\test.cmd" when %1 is "C:\Folder\..\Temp\test.cmd"
::--------------------------------------------------------
:getAbsolutePath
    SET AbsolutePath=%~dpfn1
    GOTO:EOF

:END

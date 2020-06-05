@ECHO off
cls

CALL :getFolderName C:\Folder\SubFolder\test.txt

REM Display C:\Folder\SubFolder\
ECHO %FolderName%

GOTO END:

::--------------------------------------------------------
::-- getFolderName - Get the foldername of a file
::--    %1 A filename
::--
::-- Return "C:\Folder\SubFolder" when %1 is "C:\Folder\SubFolder\test.txt"
::--------------------------------------------------------
:getFolderName
    SET FolderName=%~dp1
    GOTO:EOF

:END

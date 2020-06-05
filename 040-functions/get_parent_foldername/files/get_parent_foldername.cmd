@ECHO off
cls

CALL :getParentFolderName C:\Folder\SubFolder\

REM Display C:\Folder\
ECHO %ParentFolderName%

GOTO END:

::--------------------------------------------------------
::-- getParentFolderName - Get the parent foldername of a folder
::--    %1 A foldername
::--
::-- Return "C:\Folder\" when %1 is "C:\Folder\SubFolder\"
::--------------------------------------------------------
:getParentFolderName
    SET Folder=%1
    FOR %%a IN ("%Folder:~0,-1%") DO SET ParentFolderName=%%~dpa
    GOTO:EOF

END:

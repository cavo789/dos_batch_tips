@ECHO off
cls

REM %~dfp0 is the current script filename and thus C:\Folder\SubFolder\test.cmd
CALL :getSymLinkTargetPath %~dfp0

REM Display C:\Folder\my_script.cmd
ECHO %SymLinkTargetPath%

GOTO END:

::--------------------------------------------------------
::-- getSymLinkTargetPath - When a file is a symlink, return the
::--    target path i.e. the original path of the file
::--
::--    %1 A filename that is a symlink to another file
::--
::-- Return "C:\Christophe\...\generate.cmd" f.i. when %1 is
::-- is a symbolic link to that file, no matter where the file is located
::--------------------------------------------------------
:getSymLinkTargetPath

    SET FILE=%1
    SET TargetPath=""
    SET fileDirInfo=""

    IF EXIST %tmp%\symlinks.tmp (
        DEL %tmp%\symlinks.tmp
    )

    REM When using "DIR filename", we get something like below when
    REM the file is a symlink.
    REM 16-10-19  13:18    <SYMLINK>      phan.bat [C:\Christophe\phan.bat]
    REM
    REM Using the findstr pipe will allow us to check if the file is a
    REM symlink
    REM Output that line in the .tmp file so we can read the file after
    REM and process the string as a DOS string variable
    dir %FILE% | findstr "<SYMLINK>" > %tmp%\symlinks.tmp

    IF EXIST %tmp%\symlinks.tmp (
        SET /p fileDirInfo=<%tmp%\symlinks.tmp

        REM Here, fileDirInfo, contains the following:
        REM 16-10-19  13:18    <SYMLINK>      phan.bat [C:\Christophe\phan.bat]
        REM Extract here the portion between brackets => we'll extract part2
        for /f "useback tokens=1,2,3 delims=[]" %%a in ('!fileDirInfo!') do (
            set "TargetPath=%%b"
        )
    )

    REM Done, we've our original file (C:\Christophe\phan.bat)
    SET SymLinkTargetPath=%TargetPath%

    GOTO:EOF

:END

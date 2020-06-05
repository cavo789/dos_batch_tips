@ECHO off
cls

call :fnFileCreateLink "git_check_status.cmd" "c:\master\git_check_status.cmd"

GOTO END:

::--------------------------------------------------------
::-- fnFileCompare: Compare two files
::      %1 = Full name of the first file
::           f.i. "C:\Christophe\Repository\push_wiki.cmd"
::      %2 = Full name of the second file
::           f.i. "C:\Christophe\Repository\master\push_wiki.cmd"
::
:: Return "0" when files are identical; "1" otherwise
::--------------------------------------------------------
:fnFileCompare

    SET current=%1
    SET master=%2

    SET FileCompare="0"

    REM /C - case insensitive
    REM /L - compare as ASCII text
    REM /W - compress whitespace and tabs for comparison
    fc /C /L /W "%current%" "%master%" > nul

    REM 0 = files are identical
    REM 1 = files are different
    REM 2 = at least one file didn't exists
    IF %ERRORLEVEL% NEQ 0 SET FileCompare="1"

    GOTO:EOF

::--------------------------------------------------------
::-- fnFileCreateLink: Create a file that is a symbolic
::      link to another one
::
::      %1 = Full name of the file to create
::           f.i. "C:\Christophe\Repository\push_wiki.cmd"
::      %2 = Full name of the master file
::           f.i. "C:\Christophe\Repository\master\push_wiki.cmd"
::
:: Note: if the file is already present, a file compare will be
::      made so the file will be "recreated" only if there is
::      a difference with the master one.
::--------------------------------------------------------
:fnFileCreateLink

    SET current=%1
    SET master=%2

    SET CreateFile="Y"

    IF EXIST "%current%" (

        REM The file already exists, check if different of the master
        call :fnFileCompare "%current%" "%master%"

        IF !FileCompare! EQU "0" (
            REM Files are identical, nothing to dy
            SET CreateFile="N"
        )
    )

    IF %CreateFile% EQU "Y" (
        IF EXIST "%current%" DEL "%current%"
        MKLINK "%current%" "%master%"
    )

    GOTO:EOF

:END

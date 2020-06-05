@ECHO off
cls

CALL :fnIsEmptyFolder C:\Folder

IF "%isEmpty%" EQU "1" (
    ECHO "The folder is empty"
) ELSE (
    ECHO "There is at least one file in the folder"
)

GOTO END:

::--------------------------------------------------------
::-- fnIsEmptyFolder: Check if a folder is empty or not
:: Return 1 when empty, 0 if there is at least one file
::--------------------------------------------------------
:fnIsEmptyFolder

    SET isEmpty=1

    for /f "delims=" %%a in ("dir /b %1") do (
        REM At least one file
        SET isEmpty=0
    )

    GOTO:EOF

:END

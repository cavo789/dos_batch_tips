call :fnIsAdminMode

IF %isAdmin% EQU "0" (
    END "Please start this script with admin privileges"
    GOTO END
)

REM ... Ok, the script can continue

GOTO END

::--------------------------------------------------------
::-- fnIsAdminMode: Detect if the CMD prompt has been started
::      with "Run as admin" or not
:: Return "1" when admin mode set; "0" otherwise
::--------------------------------------------------------
:fnIsAdminMode

    SET isAdmin="0"

    openfiles >nul 2>&1

    REM If not equal to 0, command prompt not run under admin privileges
    IF %ERRORLEVEL% EQU 0 SET isAdmin="1"

    GOTO:EOF

END:

REM Check parameters and make sure mandatory parameters have been set
call :checkParams %1 %2 %3

if  %errorlevel% == 0 (
    ECHO "Great, parameters have been set"
)

::--------------------------------------------------------
::-- checkParams - Make sure this script is called with the
::      required parameters. In case of errors, the help is
::      displayed and the script will be ended
::  return 0 when success, -1 otherwise
::--------------------------------------------------------
:checkParams

    SET bContinue=0

    IF "%1"=="" (
        ECHO "Please specify a value for all required parameters."
        SET bContinue=-1
    ) ELSE (
        IF "%2"=="" (
            ECHO "You have mention only the first parameter. Please also do this for the second and third one."
            SET bContinue=-1
        ) ELSE (
            IF "%3"=="" (
                ECHO "You forget to set the third parameter."
                SET bContinue=-1
            )
        )
    )

    exit /b %bContinue%

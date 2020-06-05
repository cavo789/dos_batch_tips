@echo off
cls

call :showhelp :show
exit/b

:showhelp
    ECHO You are in function %~0
    GOTO:EOF

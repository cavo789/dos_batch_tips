@echo off

SET folder=C:\Folder\php_MyProject
SET PREFIX=%folder:~0,4%%

IF %PREFIX% EQU "php_" (
    ECHO "That folder is a PHP project"
)

@echo off

SET folder=C:\Folder\SubFolder.wiki
SET SUFFIX=%folder:~-5%

IF %SUFFIX% EQU ".wiki" (
    ECHO "The foldername ends with .wiki"
)

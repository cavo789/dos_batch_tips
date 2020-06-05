@echo off

PUSHD %~dp0
powershell.exe -ExecutionPolicy Bypass -File %WRITING_DOC%\concat-md\concat-md.ps1 -o readme.md
POPD

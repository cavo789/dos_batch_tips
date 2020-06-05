@ECHO off
cls
for /f "tokens=*" %%l in (readme.md) do (
    ECHO %%l
)

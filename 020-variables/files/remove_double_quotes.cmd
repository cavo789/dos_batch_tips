@ECHO off
cls

SET INPUT="C:\Program Files\Windows Photo Viewer\readme.txt"

ECHO Not filtered: %INPUT%

SET FILTERED=%INPUT:"=%

ECHO Filtered    : %FILTERED%

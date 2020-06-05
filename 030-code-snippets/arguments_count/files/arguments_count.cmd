set argcount=0
for %%i in (%*) do set /a argcount+=1
ECHO The number of arguments is %argcount%

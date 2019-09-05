![Banner](images/banner.png)

# DOS Batch tips

> A few DOS tips when writing batch files

- [Using ANSI Colors in echo](#using-ansi-colors-in-echo)
- [Variables](#variables)
  - [Get the function name](#get-the-function-name)
  - [Remove double-quotes](#remove-double-quotes)
- [Functions](#functions)
  - [A few theory](#a-few-theory)
    - [Return a boolean or an integer](#return-a-boolean-or-an-integer)
    - [Access the variables inside the function](#access-the-variables-inside-the-function)
  - [Some helpers](#some-helpers)
    - [getAbsolutePath](#getabsolutepath)
    - [getBaseNameWithExtension](#getbasenamewithextension)
    - [getBaseNameWithoutExtension](#getbasenamewithoutextension)
    - [getFolderName](#getfoldername)
- [License](#license)

## Using ANSI Colors in echo

![ANSI Colors](./images/ansi_colors.png)

You can combine colors like `[30m[43m` where `30`is the font-color (black) and `43` the background-color (yellow).

```txt
@echo off
cls
echo.
echo [30m[43mSomething written in BLACK (with a YELLOW background for visibilty)[0m
echo [31mSomething written in RED[0m
echo [32mSomething written in GREEN[0m
echo [33mSomething written in YELLOW[0m
echo [34mSomething written in BLUE[0m
echo [35mSomething written in PURPLE[0m
echo [36mSomething written in CYAN[0m
echo [37mSomething written in WHITE[0m
echo.
echo [40mSomething with a BLACK background[0m
echo [41mSomething with a RED background[0m
echo [42mSomething with a GREEN background[0m
echo [43mSomething with a YELLOW background[0m
echo [44mSomething with a BLUE background[0m
echo [45mSomething with a PURPLE background[0m
echo [46mSomething with a CYAN background[0m
echo [47m[31mSomething with a WHITE background (written in RED for visibility)[0m
```

See also [https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011](https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011) for a few more like bold, underline, ...

## Variables

| Variable | Description                                                                                                                                                      |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `%~dp0`  | Return the parent folder name of the running script (return `c:\temp\` when the executed script is `c:\temp\a.cmd`). This is different to the current directory. |
| `%~dfp0` | Return the full name of the running script (return f.i. `c:\temp\a.cmd`).                                                                                        |
| `%cd%`   | Return the current directory.                                                                                                                                    |
| `%~0`    | In a function, display the name of the function; [see example below](#get-the-function-name).                                                                    |

### Get the function name

This is useful for, f.i., debugging purpose (saying which function is responsible for which action/echo);

```bash
call :showhelp :show
exit/b

:showhelp
echo You are in function %~0
goto:eof
```

### Remove double-quotes

Suppose your script is started with a parameter like this: `run.cmd "C:\Program Files\Windows Photo Viewer\readme.txt"`.

The parameter needs double-quotes here since the full name contains spaces.

The solution is to use `%THE_VARIABLE:"=%` i.e. the name of the variable followed by a `:`, the character to trim `"` and ended by `=`.

```bash
@echo off
cls

SET INPUT=%1

REM %INPUT% will contains quote so "C:\Program Files\Windows Photo Viewer\readme.txt"
echo Not filtered: %INPUT%

SET FILTERED=%INPUT:"=%

REM %FILTERED% is without the quote so C:\Program Files\Windows Photo Viewer\readme.txt
echo Filtered    : %FILTERED%
```

## Functions

### A few theory

#### Return a boolean or an integer

For this purpose, just use the `%errorlevel%` internal value.

Below an example, idea is to validate a list of mandatory parameters. If the check is successful, return 0, if anything goes wrong, return -1 (or any code in fact).

```bash
REM Check parameters and make sure mandatory parameters have been set
call :checkParams %1 %2 %3

if  %errorlevel% == 0 (
    echo "Great, parameters have been set"
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
    echo "Please specify a value for all required parameters."
    SET bContinue=-1
) ELSE (
    IF "%2"=="" (
        echo "You have mention only the first parameter. Please also do this for the second and third one."
        SET bContinue=-1
    ) ELSE (
        IF "%3"=="" (
            echo "You forget to set the third parameter."
            SET bContinue=-1
        )
    )
)

exit /b %bContinue%
```

#### Access the variables inside the function

A function parameter is retrieved by using the `%~` syntax; followed by a number to get the first parameter, the second one, ...

For instance (partial example; not executable as is)

```bash
@echo off
REM Call doIit with two parameters, we can imagine that the first
REM parameter can be any extension and the second is an action
REM like open/copy/print/...
CALL :doIt "PDF" "OPEN"
EXIT/B

:doIt
ECHO Generate %~1 files and, when done, %~2 them
goto:eof
```

### Some helpers

#### getAbsolutePath

Get the absolute path from a relative file.

```bash
@echo off
cls

CALL :getAbsolutePath %~dp0..\..\..\..\..\..\autoexec.bat

REM Display C:\autoexec.bat
echo %AbsolutePath%

GOTO END:

::--------------------------------------------------------
::-- getAbsolutePath - Make a path absolute, like reapath() does
::--    %1 A filename
::--
::-- Return "C:\Temp\test.cmd" when %1 is "C:\Folder\..\Temp\test.cmd"
::--------------------------------------------------------
:getAbsolutePath
SET AbsolutePath=%~dpfn1
goto:eof

:END
```

#### getBaseNameWithExtension

Remove any folder in a variable filename and return only the filename (with extension).

```bash
@echo off
cls

CALL :getBaseNameWithExtension C:\Folder\SubFolder\test.txt

REM Display test.txt
echo Basename with extension is "%BaseNameWithExtension%"

GOTO END:

::--------------------------------------------------------
::-- getBaseNameWithExtension - Get basename + ext of a file
::--    %1 A filename
::--
::-- Return "test.txt" when %1 is "C:\Folder\SubFolder\test.txt"
::--------------------------------------------------------
:getBaseNameWithExtension
SET BaseNameWithExtension=%~nx1
goto:eof

:END
```

#### getBaseNameWithoutExtension

Remove any folder in a variable filename and return only the filename but without the extension.

```bash
@echo off
cls

CALL :getBaseNameWithoutExtension C:\Folder\SubFolder\test.txt

REM Display test
echo Basename without extension is "%BaseNameWithoutExtension%"

GOTO END:

::--------------------------------------------------------
::-- getBaseNameWithoutExtension - Get basename of a file w/ extension
::--    %1 A filename
::--
::-- Return "test" when %1 is "C:\Folder\SubFolder\test.txt"
::--------------------------------------------------------
:getBaseNameWithoutExtension
SET BaseNameWithoutExtension=%~n1
goto:eof

:END
```

#### getFolderName

Return the folder of a file / sub-folder

```bash
@echo off
cls

CALL :getFolderName C:\Folder\SubFolder\test.txt

REM Display C:\Folder\SubFolder\
echo %FolderName%

GOTO END:

::--------------------------------------------------------
::-- getFolderName - Get the foldername of a file
::--    %1 A filename
::--
::-- Return "C:\Folder\SubFolder" when %1 is "C:\Folder\SubFolder\test.txt"
::--------------------------------------------------------
:getFolderName
SET FolderName=%~dp1
goto:eof

:END
```

## License

[MIT](LICENSE)

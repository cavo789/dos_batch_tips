# Retrieve the full path of a program in your path

Let's take a real life example: your batch will run an external program and redirect the output to a text file so, just before leaving the batch, you can open the file with [Notepad++](https://notepad-plus-plus.org/) but ... how can you make your code generic and open notepad.exe if notepad++ isn't installed?

Here is the solution:

First make sure that the folder where Notepad++ is well mentioned in your system environment variables (i.e. in `PATH`).
Then check the code below; mainly the `IF EXISTS` block. The `FOR /F ...` line is quite strange but allow to run the `where notepad++.exe` command and redirect the output into the `notepad` variable.

* If notepad++ is found in the `PATH`, `%%g` will be initialized to the full path of the program;
* If notepad++ is not found, the code won't reset the notepad variable and thus keep the default `notepad.exe` value.

```batch
<!-- concat-md::include "./files/which.cmd" -->
```

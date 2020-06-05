# Variables

<!-- concat-md::csv "./files/variables.csv" -->

## Get the function name

This is useful for, f.i., debugging purpose (saying which function is responsible for which action/ECHO);

```bash
<!-- concat-md::include "./files/function_name.cmd" -->
```

## Remove double-quotes

Suppose your script is started with a parameter like this: `run.cmd "C:\Program Files\Windows Photo Viewer\readme.txt"`.

The parameter needs double-quotes here since the full name contains spaces.

The solution is to use `%THE_VARIABLE:"=%` i.e. the name of the variable followed by a `:`, the character to trim `"` and ended by `=`.

```batch
<!-- concat-md::include "./files/remove_double_quotes.cmd" -->
```

# A few theory

## Return a boolean or an integer

For this purpose, just use the `%errorlevel%` internal value.

Below an example, idea is to validate a list of mandatory parameters. If the check is successful, return 0, if anything goes wrong, return -1 (or any code in fact).

```batch
<!-- concat-md::include "./files/return_value.cmd" -->
```

## Access the variables inside the function

A function parameter is retrieved by using the `%~` syntax; followed by a number to get the first parameter, the second one, ...

For instance (partial example; not executable as is)

```batch
<!-- concat-md::include "./files/access_variable.cmd" -->
```

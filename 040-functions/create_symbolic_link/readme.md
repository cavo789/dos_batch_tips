# CreateLink

Create a symbolic link only if the file doesn't exists yet or is different.

The example below will use the file `c:\master\git_check_status.cmd` as the master one.

If the file `git_check_status.cmd` didn't exists yet in the current folder or if the content of that file is different, the file will be (re) created: a symbolic link will be made to the master one.

<!-- concat-md::include "./files/create_symbolic_link.cmd" -->

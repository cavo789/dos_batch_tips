# getSymLinkTargetPath

Consider the following situation:

* You've a generic script called `C:\Folder\my_script.cmd`
* You've create a symbolic link `C:\Folder\SubFolder\test.cmd` to that file (called the `target path`).

By running `C:\Folder\SubFolder\test.cmd` and displaying the script fullname (`ECHO %~dfp0`), you'll obtain `C:\Folder\SubFolder\test.cmd` which is the symbolic link.
How can you retrieve the target file? The following function will return that info.

```batch
<!-- concat-md::include "./files/get_symlink_target_path.cmd" -->
```

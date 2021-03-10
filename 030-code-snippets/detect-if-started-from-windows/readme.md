# Detect if started from Windows

When you DOS script makes some echos like showing an error message, if the user has double-click on the script through f.i. Windows Explorer, he'll not be able to see the message: the DOS window is closed automatically at the end of the execution.

The snippet below will add a `pause` to the script in that situation.

Just add this code at the end of your batch.

```batch
<!-- concat-md::include "./files/pause.cmd" -->
```

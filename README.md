# Bash\_scratch

**Three core components**
- the shebang line `#!/bin/bash` at the first line of script file.
- shell commands
- exit statement (0 = successful, 1-255 = unsuccessful)

**Comments**

`# comments` the shell interpreter will ignore it, use it for script, which author, date,descriptions, usages and so forth.

**Permissions**

If a script want to be executing, permission of execute is necessary.
In linux, permission of execute is `x` in `rwx`, it can be checked by `ls -l`, and changed it by `chmod [octal_code] [file_name]`.

**PATH**

If you want to execute specific script in common enviroment, there are two ways for it.
1. Symlink the script to a path which in `PATH`, you can check the PATH by `echo $PATH`.
	- `ln -sf [path/to/script] [one path in PATH]/[script_name]` (you can change the `script_name`)
2. Add the path of the script to `PATH`.
	- it's depend, you can update `PATH` in `~/.profile` or `~/.bashrc`(mostly)
	- `PATH=$PATH:[path_to_script`

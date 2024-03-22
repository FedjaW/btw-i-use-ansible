## what is a shell?

"A `program` that `interprets` the commands you type in your terminal and `passes` them on to the `operating system`" - unknown.

"The `purpose` of the shell is to make it more `convenient` for ypu to `issue commands` to your computer". - unknown.

##  what it bash?

BASH - Bourne Again SHell

**Shebang #!**

`#!/bin/bash` is a comment read by the shell and tells the os where the path to the binary is that must execute the script.

in fact `#!/bin/bash` is not the best way to define bash as the interpreter of the script, because on some system bash isn't at that given path.

a better way to specify bash is to use `#!/usr/bin/env bash`. with this the system will look up the correct path of bash.

run a file command on a file to see the difference:
`file myscript.sh`
output:
`myscript.sh: Bourne-Again shell script, ASCII text executable`

## Permissions

To give the scipt execute permissions run:
`chmod +x myscript.sh` or  `chmod 744 myscript.sh`

`744` is a `octonumber`

see: https://chmod-calculator.com/

Definition:
`-rwxrwxrwx`

`owner|group|other`
`r: read`
`w: write`
`x: execute`

## PATH

In Linux the systems path is a variable that tell the shell which directories to search for executable files in the directories defined in its path variable.

`echo $PATH` to inspect the path variable.

One way to add a script to the path variable:

1. open `vim ~/.profile`
2. add `export PATH="$PATH:$HOME/myscripts"`

## Inspect processes

execute: `zsh`\
execute: `ps -o pid,ppid= -C zsh`\
execute: `zsh`\
execute: `ps -o pid,ppid= -C zsh`\
execute: `exit`\
execute: `ps -o pid,ppid= -C zsh`\
execute: `exit`\
execute: `ps -o pid,ppid= -C zsh`

# Bash\_scratch

#### Three core components
- the shebang line `#!/bin/bash` at the first line of script file.
- shell commands
- exit statement (0 = successful, 1-255 = unsuccessful)

#### Comments
`# comments` the shell interpreter will ignore it, use it for script, which author, date,descriptions, usages and so forth.

#### Permissions
If a script want to be executing, permission of execute is necessary.
In linux, permission of execute is `x` in `rwx`, it can be checked by `ls -l`, and changed it by `chmod [octal_code] [file_name]`.

#### PATH
If you want to execute specific script in common enviroment, there are two ways for it.
1. Symlink the script to a path which in `PATH`, you can check the PATH by `echo $PATH`.
	- `ln -sf [path/to/script] [one path in PATH]/[script_name]` (you can change the `script_name`)
2. Add the path of the script to `PATH`.
	- it's depend, you can update `PATH` in `~/.profile` or `~/.bashrc`(mostly)
	- `PATH=$PATH:[path_to_script`

#### Parameters
**Three types**
- Variable
- Positional parameters
- Special parameters

> Createing model: `name=value`
> Retrieving model: `${name}`

**Shell Variable**
- Bourne Shell Variable
  - **Bourne** shell(since 1979)
  - 10 in total

- Bash Shell Variable
  - **Bash** shell
  - Bourne Again Shell(BASH)
  - Around 95 in total

> Common shell parameter
> `HOME`, `PATH`, `USER`, `HOSTNAME`, `HOSTTYPE`, `PS1` and so forth.

**Operations for Variables**
```bash
# first character change to lowercase
${parameter,}

# all characters change to lowercase
${parameter,,}

# first character change to uppercase
${parameter^}

# all characters change to uppercase
${parameter^^}

# check the length of the parameter
${#parameter}

# Slice
# index always start from 0
# get second to forth
${parameter:1:3}

# second to end
${parameter:1}

# revert index by negative
# get last three characters
${parameter:-3}
```

#### Shell expansions
- `${parameter}`
- `$(command)` : _shell command_
- $(( expression )) : _mathematic_

**Command substitution**

> get string of the result of command 
`$(command)`

**Expression**
`$(( a + b ))` and so forth.
> it can not output decimal place

**decimal number calculation**

`bc`
> Maybe you need to install the package, it's not default installed.
```shell
# set the number of decimal places by scale
echo "scale=3; 10/3" | bc
3.333
```

#### Tilde expansion
`~`
- home directory
- check valid username `~[username]`
- `~+` is the same as `$PWD`, and `~-` is the same as `$OLDPWD`

#### Brace expansion
`{}`
- string list
  - it can store data of any type, `{1,a,ef,45}` 
- range list
  - `{1..10}` print 1 to 10, `{1..1000}`, `{a..z}` and so on.
  - it also can be reverted by `{100..1}`, `{z..a}`
  - it can set increment value, `{1..100..4}` which is 1 5 9 ... 
  - it can set different format like `{001..100}`
  - batch operation like `touch month{01..12}/day{01..31}`

## Bash Processes Command Lines
1. Tokenisating
2. Command Identification
3. Expansions
4. Quote Removal
5. Redirection
> done these five steps, result will be executed.

#### Quoting
> Removing Special Meanings (Removal)
1. Backslash `\`: Removes special meaning from **next** character.
2. Single Quotes `''`: Remove special meaning from **all** character inside.
3. Double Quotes `""`: Remove special meaning from **all except** dollar sign `$` and backticks `\``.

#### Tokenisation
##### Metacharacters
- `|`
- `&`
- `;`
- `()`
- `<>`
- space, tab and newline


#### Compound Commands
> Reserved word
example `if`
```bash
if [condition]
then
  [statements]
fi
```

#### Expansions
> Four stages of Expansions
- stage-1 Brace Expansion
- stage-2  
  - Parameter Expansion
  - Arithmetic Expansion
  - Command Substitution
  - Tilde Expansion
- stage-3 Word Splitting
- stage-4 Globbing

> Every stage is independent and sorted, you can not mix them.
> Same stage are all given the **same priority**, **left to right**

##### Word Splitting
> Only performed on the results of **unquoted**:
- Parameter Expansion
- Arithmetic Expansion
- Command Substitution

**Wrap that expansions in double quotes**, which will become a single word.

##### Globbing
- Only performed on **words**(not operators)
- Words that contain unquoted **Special Pattern Characters**:
  - `\*`: which can match any characters, even empty.
  - `?`: which can match exactly single character.
  - `[`: which can match single character by a range that customized, like `[a-k]`. 


#### Redirection
##### Data Streams
> Standard input
- `<`
> Standard output
- `1>`, `>`, `&>` -- which will fresh file, **Overwrite**
- `>>` or `&>>` -- which will not fresh file, **Append**
> Standard error output
- `2>` -- which usually follow `/dev/null`


### Positional Parameter
```shell
# $0 is always command 
$0 $1 $2 $3 ...
command $1 $2 $3 ...
```

> When the number of arguments greater than 9, it must be ${10} like this.

### Special Parameters
> Unmodifiable

- `$#` : count the number of command line arguments 
- `$0` : the name of script
- `$@` : signify all command line arguments
  - unquoted : `$@`   -- $1 $2 $3...$n
    > unquoted will ignore `" "` and `' '`, example like 
    > `test.sh`
    > ```bash
    > #!/bin/bash
    > touch $@
    > ```
    > `test.sh "A B" "C D"`
    > it will generate four files not two. If change to `"$@"`, it will generate two files
  - quoted   : `"$@"` -- "$1" "$2" "$3"..."$n" 
- `$\*` : Unquoted `$\*` is exactly the same as unquoted `$@`
  - `"$\*"` provides all positional parameters as **one word**, but separated by the first character of the IFS variable. The final word is **not subject to further word splitting**.


#### Read Command
> `read` command can get input of user, and store in a variable.
```bash
read var_name

# describe the prompt which need to be for variable
read -p "describe_things" var_name

# hide the input of user, useful to password, but not exactly save.
read -s -p "Enter your password: " passwd

# limit the length of input
read -N 6 "Enter your postcode"
```

#### Select Command
```bash
select var_name in v1 v2 v3 ...
do
   [commands]
   break
done
```
---

## Logic

### List Operators

- `&`
  - `<command1> & <command2>` : they will be executed **asynchronously**.
- `;`
  - `<command1> ; <command2>` : they will be executed **one after one**.
- `&&`
  - `<command1> && <command2>` : only if `command1` executed **successfully**, `command2` will be executed. 
- `||`
  - `<command1> || <command2>` : only if `command1` executed **failed**, `command2` will be executed. 


### Test Commands

> Comparison
> If it is true, exit code will be 0.

```bash
# example
[ 2 -eq -2 ] ; echo $?  # 1

a=hello
b=goodbye
[[ $a = $b ]] ; echo $?  # 1
```
#### Numbers
- `gt` >
- `lt` <
- `geq` >=
- `leq` <=

#### Variable
- `-z` Check specific variable wehter defined.
> You can regard it as the length of string is zero, true, or false
```bash
# if var is an empty string, $? will return 0, or return 1
[[ -z $var ]] ; echo $?
```
- `n` The function is opposite with `-z`.
> You can regard it as the length of string is not zero, true, or false
```bash
# if var is an empty string, $? will return 1, or return 0
[[ -n $var ]] ; echo $?
```

#### Files
- `-e` Check the specific file wether **exists**.
```bash
# if var exists, $? will return 0, or return 1
[[ -e var ]] ; echo $?
```
- `-f` Check the specific object wehter **a regular file**.
```bash
# if var is a regular file, $? will return 0, or return 1
[[ -f var ]] ; echo $?
```
- `-d` Check the specific object wether a **directory**.
```bash
# if var is a directory, $? will return 0, or return 1
[[ -d var ]] ; echo $?
```
- `-x` Check the specific file wether has **executable permission**.
```bash
# if var is executable, $? will return 0, or return 1
[[ -x var ]] ; echo $?
```
- `-r` Check the specific file wether **readable**.
```bash
# if var is readable, $? will return 0, or return 1
[[ -r var ]] ; echo $?
```
- `-w` Check the specific file wether **writable**.
```bash
# if var is writable, $? will return 0, or return 1
[[ -w var ]] ; echo $?
```
- `-nt` Check the specific file wether **newer than** another file.
```bash
# if var1 newer than var2, $? will return 0, or return 1
[[ var1 -nt var2 ]] ; echo $?
```

#### Universal
> They can check any types of data.
- `=`
- `==`
- `!=`


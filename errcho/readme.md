# `errcho`: *echo* to `stderr` instead of `stdout`

As Bash functions can only return numerical *exit codes*, we can use `echo` to mimick return a string.

As everything that the script *echo*ed is *returned* (whatever we print to `stdout`, even if it's not using `echo`), we cannot provide feedback on progress or warnings, as these messages are also *returned* to the calling funcion.

`errcho` solves the problem by *echo*ing to `stderr`, instead of `stdout`.

## Example issue

```console
#!/usr/bin/env bash

greetings() {
    local name
    name="$1"
    if [[ $name == "" ]]; then
        echo "[WARNING] using default name World"
        name="World!"
    fi
    echo "$name"
}

greeting_msg=$(greetings)

echo "Hello '$greeting_msg'"
```

As we call `greetings` without a parameter, the *warning* message is part of the *return* from the function, leading to:

```console
Hello '[WARNING] using default name World
World!'
```

If we use `errcho` to display the warning message:

```console
#!/usr/bin/env bash

errcho() {    
    # errcho outputs to 'stderr', instead of 'stdout'
    echo "$@" >&2 # https://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr#comment50764513_23550347
}

greetings() {
    local name
    name="$1"
    if [[ $name == "" ]]; then
        errcho "[WARNING] using default name World"
        name="World!"
    fi
    echo "$name"
}

greeting_msg=$(greetings)

echo "Hello '$greeting_msg'"
```

Now we get the expected result:

```console
[WARNING] using default name World
Hello 'World!'
```

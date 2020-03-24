# Lecture 5 - Command-line Environment

## Exercises

### Job Control

#### Job Control - Exercise 1

Task: Use `pgrep` and `pkill` to find the pid of a `sleep` job and to kill it respectively.

Commands:

```
sleep 10000
...^z typed to pause execution...
bg %1
pgrep -f "sleep 10000"
pkill -f "sleep 10000"
```

#### Job Control - Exercise 1

Task: Write a bash function `pidwait` that takes a pid and waits until said process completes.

Answer: See `pidwait.sh`.

### Terminal Multiplexer

#### Terminal Multiplexer - Exercise 1

Skipped (for now; will do this weekend).

### Aliases

#### Aliases - Exercise 1

Skipped; don't want this alias.

#### Aliases - Exercise 2

Task: Use `history | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10` to get your top 10 most used commands and consider writing aliases for them.

Answer: All of them already have aliases :).

### Dotfiles

#### Dotfiles - Exercise 1

Task: Create a folder for your dotfiles and set up version control.

Done.

#### Dotfiles - Exercise 2

Task: Add a configuration for at least one program.

Done.

#### Dotfiles - Exercise 3

Skipped (for now; will do this weekend).

#### Dotfiles - Exercise 4

Skipped (for now; will do this weekend).

#### Dotfiles - Exercise 5

Skipped (for now; will do this weekend).

#### Dotfiles - Exercise 6

Task: Publish your dotfiles on Github.

Done. See https://github.com/rbnsl/dotfiles.

### Remote Machines

Skipped these (for now; will do this weekend).

# Lecture 6 - Version Control (Git)

## Exercises

### Exercise 1

N/A (Pro Git added to technical reading list)

### Exercise 2

Cloned repository for class website with `git clone https://github.com/missing-semester/missing-semester.git ms-website/`

#### Exercise 2 - Task 1

Task: Explore the version history by visualizing it as a graph.

Command: `git log --all --graph --decorate`

#### Exercise 2 - Task 2

Task: Use `git log` with an argument to figure out who the last person to edit `README.md` was.

Answer: Anish

Command: `git log README.MD`

#### Exercise 2 - Task 3

Task: Find the commit message associated with the last modification to the `collections:` line of `_config.yml`.

Answer: Redo lectures as a collection

Command: `git blame _config.yml | rg collections: | sed -E 's/^(.{8}).*$/\1/' | xargs git show`

### Exercise 3

Task: Add a file, commit it, make some other commits after that and then purge that original file from history.

Commands:

```
touch ex3.txt

echo "Content" >> ex3.txt

git add .
git commit -m "Added file that will be deleted"

...did some more commits here...

git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch 6-git/ex3.txt" \
  --prune-empty --tag-name-filter cat -- --all
```

### Exercise 4

Just used the ms-website/ repository I cloned (class website on GitHub); modified `404.html`.

#### Exercise 4 - Task 1

Task: Run `git stash` and record the output

Answer: `Saved working directory and index state WIP on master: d1107eb Merge branch 'J16053/patch-1'

#### Exercise 4 - Task 2

Task: Run `git log --all --oneline` and record the output.

Answer: The top line is `694812a (refs/stash) WIP on master: d1107eb Merge branch 'J16053/patch-1'`

#### Exercise 4 - Task 3

Task: Run `git stash pop` to undo what you did with `git stash` and note a scenario this may be useful.

Answer: Let's say I'm working on a quick bug fix but realize I may be going down a dead-end. I `git stash` my work and go down a different path instead. I later realize that the 2nd approach is a no-go but I can actually tweak my first approach to get it to work. I run `git stash pop` to restore the initial approach, and go on from there.

### Exercise 5

Done. `git config --global alias.graph 'log --all --graph --decorate --oneline'`

### Exercise 6

Skipped.

### Exercise 7

Submitted a pull request [here](https://github.com/missing-semester/missing-semester/pull/27).

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

IP.

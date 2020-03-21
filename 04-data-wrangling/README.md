# Lecture 4 - Data Wrangling

## Exercises

### Exercise 1

Take [this short, interactive regex tutorial](https://regexone.com/). Done.

### Exercise 2

Various regex exercises.

Directory: `usr/share/dict/words`

#### Exercise 2 - Task 1
Task: Find the number of words in the directory that contain at least three `a`s and don't have a `'s` ending

Answer: 7047

Command: `cat words | rg --pcre2 ".*a.*a.*a.*(?<!'s)" | wc -l`

Notes: I wasn't able to figure out how to do it without the lookbehind, which is an advanced regex feature that even with ripgrep (`rg`), requires that `--pcre2` flag to work. A lot of other people online were using `[^'s]`; this is inaccurate because it means neither `'` nor `s`, meaning that words with "`s'`" endings would also get removed when they shouldn't be.

#### Exercise 2 - Task 2
Task: What are the three most common last two letters of those words?

Answer: an,ia,al

Command: `cat words | rg --pcre2 ".*a.*a.*a.*(?<!'s)" | sed -E 's/.*(..)$/\1/' | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -nk1,1 | tail -n3 | awk '{print $2}' | paste -sd "," -`

#### Exercise 2 - Task 3
Task: How many of those two-letter combinations are there?

Answer: 150

Command: `cat words | rg --pcre2 ".*a.*a.*a.*(?<!'s)" | sed -E 's/.*(..)$/\1/' | tr "[:upper:]" "[:lower:]" | sort | uniq -c | wc -l`

### Exercise 3

It's a bad idea to do in-place substitution of the form: `sed s/REGEX/SUBSTITUTION/ input.txt > input.txt` because you risk corruption of the data, not to mention that you lose the original copy should you want it. According to `man sed`, it's better to pass in the `-i` flag which saves backups with the specified extension (ex: `input-1.txt`).

### Exercise 4

N/A (Skipped because I only had one entry for system startup/shutdown)

### Exercise 5

N/A (Skipped because of lack of entries available)

### Exercise 6

N/A (Skipped)

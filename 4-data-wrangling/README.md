# Lecture 4 - Data Wrangling

## Exercises

1. Take [this short, interactive regex tutorial](https://regexone.com/). Done.
2. Various regex exercises.

Directory: `usr/share/dict/words`

#### Exercise 2 - Task 1
Task: Find the number of words in the directory that contain at least three `a`s and don't have a `'s` ending

Answer: 7047

Command: `cat words | rg --pcre2 ".*a.*a.*a.*(?<!'s)" | wc -l`.

Notes: I wasn't able to figure out how to do it without the lookbehind, which is an advanced regex feature that even with ripgrep (`rg`), requires that `--pcre2` flag to work. A lot of other people online were using `[^'s]`; this is inaccurate because it means neither `'` nor `s`, meaning that words with "`s'`" endings would also get removed when they shouldn't be.

#### Exercise 2 - Task 2
Task: What are the three most common last two letters of those words?

Answer: ?

Command: ?

Notes: ?

#### Exercise 2 - Task 3
Task: How many of those two-letter combinations are there?

Answer: ?

Command: ?

Notes: ?

#### Exercise 2 - Task 4
Task: Which combinations do not occur?

Answer: ?

Command: ?

Notes: ?

3. In-place substitution question.

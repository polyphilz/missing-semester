# Lecture 4 - Data Wrangling

## Exercises

1. Take [this short, interactive regex tutorial](https://regexone.com/). Done.
2. Various regex exercises.

Directory: `/usr/share/dict/words`

Number of words in the directory that contain at least three `a`s and don't have a `'s` ending: 7047. Command used: `cat words | rg --pcre2 ".*a.*a.*a.*(?<!'s)" | wc -l`. I wasn't able to figure out how to do it without the look-around, which is an advanced regex feature that even with ripgrep (`rg`), requires that `--pcre2` flag to work. A lot of other people online were using `[^'s]`; this is inaccurate because it means neither `'` nor `s`, but anything with the ending "`s'`" would also get removed when it shouldn't.

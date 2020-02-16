# Lecture 2 - Shell Tools and Scripting

## Exercises

1. `ls -ahltG`
2. See [`marco.sh`](./marco.sh)
3. See [`failure.sh`](./failure.sh) and [`rare-failure-out.txt`](./rare-failure-out.txt)
4. `find . -name '*.html' -print0 | xargs -0  tar cf html.tar`
I needed to use `-print0` in combination with the `-0` flag on the `xargs` command to get the zipping functionality to work for html files with spaces in the name; `-d` for `xargs` wasn't working for my setup as recommended on the website.

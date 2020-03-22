# Lecture 7 - Debugging and Profiling

## Debugging - Exercises

### Exercise 1

Task: Use `log show` to get super user accesses and commands in the last day.

Command: `log show --last 1d | rg sudo`

### Exercise 2

Task: Do [this](https://github.com/spiside/pdb-tutorial) hands-on `pdb` tutorial.

Done.

### Exercise 3

Task: Use `shellcheck` to analyze the script (see `broken.sh`).

Answer: *Corrections made in `fixed.sh`*

```
In tst.sh line 3:
for f in $(ls *.m3u)
         ^---------^ SC2045: Iterating over ls output is fragile. Use globs.
              ^-- SC2035: Use ./*glob* or -- *glob* so names with dashes won't become options.


In tst.sh line 5:
  grep -qi hq.*mp3 $f \
           ^-----^ SC2062: Quote the grep pattern so the shell won't interpret it.
                   ^-- SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
  grep -qi hq.*mp3 "$f" \


In tst.sh line 6:
    && echo -e 'Playlist $f contains a HQ file in mp3 format'
            ^-- SC2039: In POSIX sh, echo flags are undefined.
               ^-- SC2016: Expressions don't expand in single quotes, use double quotes for that.
```

Command: `shellcheck broken.sh`

### Exercise 4

Skipped.

## Profiling - Exercises

### Exercise 1

#### Exercise 1 - Task 1

Task: Use `cProfile` and `line_profiler` to compare the runtime of insertion sort and quicksort.

Answer: `cProfile` says that insertion sort is the fastest, followed by inplace quicksort and then regular quicksort. `line_profiler` says that regular quicksort is the fastest, followed by inplace quicksort and then insertion sort last.

Results from `cProfile`:

```
         589287 function calls (524610 primitive calls) in 0.291 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
     1000    0.034    0.000    0.034    0.000 sorts.py:11(insertionsort)
32318/1000    0.034    0.000    0.036    0.000 sorts.py:32(quicksort_inplace)
34316/1000    0.033    0.000    0.052    0.000 sorts.py:23(quicksort)
```

Command: `python3 -m cProfile -s tottime sorts.py 1000`

Results from `line_profiler`:

```
Total time: 0.257346 s
File: sorts.py
Function: insertionsort at line 10

Total time: 0.114077 s
File: sorts.py
Function: quicksort at line 22

Total time: 0.236884 s
File: sorts.py
Function: quicksort_inplace at line 31
```

Command: `kernprof -l -v sorts.py`

#### Exercise 1 - Task 2

Task: Figure out what the bottleneck of each algorithm is.

Answer: According to `line_profiler`, the main bottleneck for insertion sort is the while loop, for quicksort it's the left and right list comprehension calls, and for inplace quicksort it's the for loop.

#### Exercise 1 - Task 3

Task: Use `memory_profiler` to check the memory consumption of the three algorithms.

Answer: Couldn't get this one working; either I suck or `memory_profiler` is buggy.

### Exercise 2

Task: Use `pycallgraph` to figure out how many times `fib0` is being called. Then memoize the functions and figure out how many times we're calling each `fibN` function after that.

Answer: 21 times pre-memoization; 1 time each after.

#### Exercise 2 - Task 1

Task: Spin up a web server in Python, then locate that processes PID using `lsof` and kill it.

Command:

```
python -m http.server 4444
lsof | rg "LISTEN"
kill <PID>
```

#### Exercise 2 - Task 2

Skipped.

#### Exercise 2 - Task 3

Skipped.

#!/usr/bin/env bash

# Say you have a command that fails rarely. In order to debug it you need to
# capture its output but it can be time consuming to get a failure run.

# Write a bash script that runs the following script until it fails and captures
# its standard output and error streams to files and prints everything at the end.

# Bonus points if you can also report how many runs it took for the script to fail.

function script_that_rarely_fails() {
    n=$(( RANDOM % 100 ))

    if [[ n -eq 42 ]]; then
        echo "Something went wrong"
        >&2 echo "The error was using magic numbers"
        exit 1
    fi

    echo "Everything went according to plan"
}

touch rare-failure-out.txt
rm rare-failure-out.txt
number_of_runs_until_failure=1

while true; do
    out=$(script_that_rarely_fails >&2)
    
    if [[ $? -ne 1 ]]
    then
        echo $out >> rare-failure-out.txt
    else
        echo $out >> rare-failure-out.txt
        echo $(head -n $number_of_runs_until_failure rare-failure-out.txt) > rare-failure-out.txt
        cat rare-failure-out.txt
        echo "Runs until failure: $number_of_runs_until_failure"
        exit 1
    fi

    ((number_of_runs_until_failure++))
done

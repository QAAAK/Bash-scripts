#!/bin/bash

# Help information
usage() {

    echo -e "" "\nParameters:\n"
    echo -e "-c - Count (in seconds)"
    echo -e "-f - Format (1 - Every line, 2 - One Line)\n"
    exit 1
}

countdown_by_line() {

        if [[ ! $1 ]]; then
                echo "Please set countdown. Exit."
                exit 1
        else
              secs=$1
        fi

        # bash while loop
        while [ "$secs" -gt 0 ]; do
                echo "$secs"
                (( secs=secs-1 )) || true
                sleep 1
        done
        echo Finish!
}

countdown_one_line() {

        # secs=$((5 * 60))
        if [[ ! $1 ]]; then
                echo "Please set countdown. Exit."
                exit 1
        else
              secs=$1
        fi

        # bash while loop
        while [ "$secs" -gt 0 ]; do
           echo -ne "$secs\033[0K\r"
           sleep 1
           : $((secs--))
        done
        echo Finish!
}

if [[ -z "$1" ]]; then
        usage
        exit 1
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in
                -c|--count) COUNT=$2; ;;
                -f|--format) FORMAT="$2"; shift ;;
                -h|--help) usage ;;
    esac
    shift
done

if [[ "$FORMAT" -eq "1" ]]; then
        countdown_by_line "$COUNT"
elif [[ "$FORMAT" -eq "2" ]]; then
        countdown_one_line "$COUNT"
else
        echo "Unknown format. Exit. Bye!"
fi

#!/bin/bash

for pid in $(ps axo pid=,stat= | awk '$2~/^Z/ { print $1 }'); do
    echo "Zombie process pid is: $pid"
    ppid=$(ps -o ppid= -p $pid)
    echo "Parent process pid is: $ppid"
done

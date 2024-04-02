#! /bin/bash

#Create a report file for a single shipping container

# Exercise: Add a variable callled 'directory'
# That detemrines where we save our output file

input_file="$PWD/shipments.csv"

if [[ ! $input_file ]]; then
    echo "Error: Input file not configured "
    exit 1
fi

if [[ ! -e $input_file ]]; then
    echo "Error: Input file does not exist "
    exit 1
fi

if [[ ! $1 ]]; then
    echo "Error: missing parameter: container name"
    exit 1
fi

container="$1"

if [[ $2 ]]; then
    directory="$2"
else
    directory="$PWD/reports"
fi

if output=$(grep -i -- "$container" "$input_file"); then
    mkdir -p -- "$directory"
    echo "$output" >"$directory/${container}_report.csv"
    echo "Wrote report $directory/${container}_report.csv"
    exit 0
else
    echo "Container $container not found in $input_file"
    exit 1
fi

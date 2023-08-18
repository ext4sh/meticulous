#!/bin/bash

IFS=$'\n' read -d '' -r -a lines < input.txt
for i in "${!lines[@]}"; do
    lines[$i]=${lines[$i],,}
done

awk -F: '{ line[tolower($1)]++ } END { for (i in line) if (line[i] > 1) print i, line[i] " times" }' input.txt | sort -k2,2nr > output.txt

echo "Done!"

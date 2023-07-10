#!/bin/bash
declare -i curr
((curr = 0))
((max = 0))

while read line; do
    if [ "$line" == "" ]; then 
        if [[ $curr -ge $max ]]; then 
            ((max = curr))
        fi
        ((curr = 0))
    else
        ((curr = curr + line))
    fi
done < Data/1.txt

echo $max
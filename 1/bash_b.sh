#!/bin/bash
declare -i curr
((curr = 0))
maxes=(0 0 0)

while read line; do
    if [ "$line" == "" ]; then 
        if [[ $curr -ge ${maxes[2]} ]]; then 
            ((maxes[2] = curr))
            if [[ ${maxes[2]} -ge ${maxes[1]} ]]; then 
                ((temp = maxes[1] ))
                ((maxes[1] = maxes[2]))
                ((maxes[2] = temp))
                if [[ ${maxes[1]} -ge ${maxes[0]} ]]; then 
                    ((temp = maxes[0] ))
                    ((maxes[0] = maxes[1]))
                    ((maxes[1] = temp))
                fi
            fi
        fi
        ((curr = 0))
    else
        ((curr = curr + line))
    fi
done < Data/1.txt

echo $((maxes[2] + maxes[1] + maxes[0]))
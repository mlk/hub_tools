#!/bin/bash

CODEZ=$1
PATTERN=$2


for i in ${CODEZ}/*; do 
 if [ -d "$i/.git" ]; then 
    cd $i > /dev/null
    hub pr list -f '%U    %rs%n' 2> /dev/null | grep --color -E "$2"
   fi
done


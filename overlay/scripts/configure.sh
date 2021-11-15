#!/bin/bash

BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${BASEPATH}/functions.sh

if [ $# -gt 0 ]; then
    configure "${BASEPATH}/conf.d/$@.sh"
    exit
fi

for script in $(find ${BASEPATH}/conf.d -type f -print | sort); do
    configure "$script"
done

#!/bin/bash

BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${BASEPATH}/functions.sh

for script in $(find ${BASEPATH}/conf.d -type f -print | sort); do
    configure "$script"
done

#!/bin/bash

BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for script in $(find ${BASEPATH}/conf.d -type f -print | sort); do
    $script
done


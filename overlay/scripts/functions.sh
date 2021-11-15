#!/bin/bash

function pkg-install {
	apt-get -y install "$@"
	if [ $? -ne 0 ]; then
		exit 1
	fi
}

function config-install {
    install -d "$(dirname $1)"
    install -t "$(dirname $1)" -m 644 "/scripts/$1"
}

function configure {
    echo -e " [\e[1;34m*\e[0m] Running $(basename $@)"
    source $@
}

#!/bin/bash

function pkg-install {
	apt-get -y install "$@"
	if [ $? -ne 0 ]; then
		exit 1
	fi
}

function configure {
    echo -e " [\e[1;34m*\e[0m] Running $(basename $@)"
    source $@
}

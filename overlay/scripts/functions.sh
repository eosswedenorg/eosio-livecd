#!/bin/bash

function pkg-install {
	apt-get -y install "$@"
	if [ $? -ne 0 ]; then
		exit 1
	fi
}

#!/usr/bin/env bash
	path="$1"
	mimetype=$(file --mime-type -b "$path")
	if [[ $mimetype == "image/"* ]]; then
		echo -e "\n"
		/usr/bin/kitten icat "$path"
	else
		/bin/cat "$path"
	fi


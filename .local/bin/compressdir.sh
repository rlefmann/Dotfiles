#!/bin/sh

# Create a compressed archive dir.tar.gz from
# the specified directory dir

SCRIPTNAME=$(basename $0)

if [ $# -ne 1 ]; then
	echo "Usage: $SCRIPTNAME <dirpath>" 1>&2
	exit 1
fi

if [ ! -d "$1" ]; then
	echo "not a directory"
	exit 1
fi

DIRNAME=$(basename "$1")
ARCHIVENAME="$DIRNAME".tar.gz

tar cfvz "$ARCHIVENAME" "$DIRNAME"


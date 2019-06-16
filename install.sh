#!/bin/sh

command -v rsync >/dev/null 2>&1 || { echo >&2 "Error: rsync is not installed.  Aborting."; exit 1; }

rsync --exclude ".git/" --exclude "README.md" --exclude "install.sh" -avh . $HOME


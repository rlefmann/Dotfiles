#!/bin/sh

command -v rsync >/dev/null 2>&1 || { echo >&2 "Error: rsync is not installed.  Aborting."; exit 1; }

rsync --exclude ".git/" --exclude "README.md" --exclude "install.sh" -avh . $HOME

# Remove .bash_profile and add a symbolic link with the same name to .profile
# This ensures that .profile is read by every bash instance
rm -f "$HOME/.bash_profile"
ln -s "$HOME/.profile" "$HOME/.bash_profile"

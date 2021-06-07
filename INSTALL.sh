#!/bin/sh

findparams='-type f -not -path */.git/* -not -name INSTALL.sh -not -name README.md'

echo This will overwrite the following files:
find . $findparams -printf "  $HOME/%P\n"
read -p "Are you sure? ([y]es, [n]o, show [d]ifferences) " ynd

if [ $ynd = "d" ]; then
	find . $findparams -exec diff -q {} $HOME/{} \;
	exit 0
elif [ $ynd != "y" ]; then
	exit 1
fi

# Create directories:
find .config -type d -links 2 -exec mkdir -p "$HOME/{}" \;

# Copy files:
find . $findparams -exec cp "{}" "$HOME/{}" \;

# Remove .bash_profile and add a symbolic link with the same name to .profile
# This ensures that .profile is read by every bash instance
# The same is done for .zprofile
rm -rf $HOME/.bash_profile $HOME/.zprofile
ln -s $HOME/.profile $HOME/.bash_profile
ln -s $HOME/.profile $HOME/.zprofile

#!/bin/sh

echo This will overwrite the following files:
find . \
  -not -path "*/.git/*" \
	-not -name "INSTALL.sh" \
	-not -name "README.md" \
	-type f \
	-printf "  $HOME/%P\n"
read -p "Are you sure? " yn

if [ $yn != "y" ] && [ $yn != "Y" ]; then
	exit 1
fi

# Create directories:
find .config -type d -links 2 -exec mkdir -p "$HOME/{}" \;

# Copy files:
find . \
	-type f \
  -not -path "*/.git/*" \
	-not -name "INSTALL.sh" \
	-not -name "README.md" \
	-exec cp "{}" "$HOME/{}" \;

# Remove .bash_profile and add a symbolic link with the same name to .profile
# This ensures that .profile is read by every bash instance
rm -rf $HOME/.bash_profile
ln -s $HOME/.profile $HOME/.bash_profile

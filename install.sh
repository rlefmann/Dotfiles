#!/bin/sh

echo This will overwrite the following files:
find . \
  -not -path "*/.git/*" \
	-not -name "install.sh" \
	-not -name "README.md" \
	-type f \
	-printf "  $HOME/%P\n"
read -p "Are you sure? " yn

if [ $yn != "y" ] && [ $yn != "Y" ]; then
	exit 1
fi

cp .bashrc  ~
cp .profile ~
cp .xinitrc ~

# Create directories:
find .config -type d -links 2 -exec mkdir -p "$HOME/{}" \;

# Copy files:
find .config -type f -exec cp "{}" "$HOME/{}" \;

# Remove .bash_profile and add a symbolic link with the same name to .profile
# This ensures that .profile is read by every bash instance
rm -rf $HOME/.bash_profile
ln -s $HOME/.profile $HOME/.bash_profile

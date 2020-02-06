#!/bin/sh

# The nvim config directory should be a real directory and not a symlink
# to allow for the installation of plugins without messing up the dotfiles
# repository:
rm -rf $HOME/.config/nvim/*
mkdir -p $HOME/.config/nvim

rm -rf $HOME/.config/newsboat
rm -rf $HOME/.config/zathura
rm -rf $HOME/.config/fontconfig
rm -f $HOME/.bashrc
rm -f $HOME/.profile
rm -f $HOME/.xinitrc

if [ ! -d $HOME/.local/bin ]; then
	mkdir -p $HOME/.local/bin
fi

# Remove .bash_profile and add a symbolic link with the same name to .profile
# This ensures that .profile is read by every bash instance
rm -rf $HOME/.bash_profile
ln -s $HOME/.profile $HOME/.bash_profile

stow applications system

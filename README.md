# dotfiles

This repository contains my personal dotfiles.

## Installation

First, make sure that the dotfiles on your system can be overwritten.

```
git clone https://github.com/rlefmann/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sh ./install.sh
```

This will delete existing dotfiles and create symlinks to the repository directory.

## Update after adding or removing dotfiles

```
cd ~/.dotfiles
stow -R applications system
```

This will prune obsolete syslinks and add symlinks for new files.

## Remove dotfiles

```
cd ~/.dotfiles
stow -D applications system
```
